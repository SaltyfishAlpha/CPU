import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class CPU extends Module{
  var io = IO(new Bundle{
    val Write_PC = Output(UInt(1.W))//
    val Write_IR = Output(UInt(1.W))//
    val Write_Reg = Output(UInt(1.W))//
    val A = Output(UInt(32.W))//
    val B = Output(UInt(32.W))//
    val C = Output(UInt(32.W))//
    val F = Output(UInt(32.W))//
    val W_Rdata_s = Output(UInt(1.W))//
    val W_Data = Output(UInt(32.W))//
    val PC_s = Output(UInt(2.W))//
    val M_R_Data = Output(UInt(32.W))//

    val IR = Output(UInt(32.W))//
    val Reg_C_s = Output(UInt(1.W))//
    val PC = Output(UInt(8.W))//
    val nzcv = Output(UInt(4.W))//
    val Mem_W_s = Output(UInt(1.W))//
    val Mem_Write = Output(UInt(1.W))//
    val ALU_OP = Output(UInt(4.W))
    val rd_s = Output(UInt(2.W))//
    val ALU_A_s = Output(UInt(2.W))//
    val ALU_B_s = Output(UInt(3.W))//
    val M_W_Data = Output(UInt(32.W))//
  })
  val negClock = (~clock.asUInt).asBool.asClock


  // modules
  val controller = Module(new Controller)
  val alu = Module(new ALU)
  val barrelShifter = Module(new BarrelShifter)
  val regFile = withClock(negClock)(Module(new RegFile))
  val ram = withClock(negClock)(Module(new MyMem(64, 32)))


  // mems
  val inst_addr = SyncReadMem(64, UInt(32.W))
  loadMemoryFromFile(inst_addr, "mem.hex")

  // regs
  val nzcv = withClock(negClock)(RegEnable(alu.io.nzcv, 0.U, controller.io.S))
  val IR = withClock(negClock)(
    RegEnable(inst_addr.read(regFile.io.R_PC(7, 2)), 0.U, controller.io.Write_IR)
  )
  val A = withClock(negClock)(RegEnable(regFile.io.R_Data_A, 0.U, controller.io.LA))
  val B = withClock(negClock)(RegEnable(regFile.io.R_Data_B, 0.U, controller.io.LB))
  val C = withClock(negClock)(RegEnable(regFile.io.R_Data_C, 0.U, controller.io.LC))
  val F = withClock(negClock)(RegEnable(alu.io.F, 0.U, controller.io.LF))


  // const
  val rn = IR(19, 16)
  val rd = IR(15, 12)
  val rs = IR(11, 8)
  val imm5 = IR(11, 7)
  val rm = IR(3, 0)
  val imm12 = IR(11, 0)
  val imm24 = IR(23, 0)
  val rt = IR(15, 12)
  val Reg_list = IR(15, 0)


  // FSM
  val state = withClock(negClock)( RegInit(0xf.U) )
  when(controller.io.done === false.B) {
    when(state === 0xf.U) { state := 0.U }
      .otherwise { state := state + 1.U }
  } .otherwise { state := 0.U }


  // cond judgement
  val cond = WireInit(false.B)
  switch(inst_addr.read(regFile.io.R_PC(7, 2))(31, 28)) {
    is("b0000".U) { cond := nzcv(2) === 1.U }
    is("b0001".U) { cond := nzcv(2) === 0.U }
    is("b0010".U) { cond := nzcv(1) === 1.U }
    is("b0011".U) { cond := nzcv(1) === 0.U }
    is("b0100".U) { cond := nzcv(3) === 1.U }
    is("b0101".U) { cond := nzcv(3) === 0.U }
    is("b0110".U) { cond := nzcv(0) === 1.U }
    is("b0111".U) { cond := nzcv(0) === 0.U }
    is("b1000".U) { cond := nzcv(2, 1) === "b01".U }
    is("b1001".U) { cond := nzcv(2, 1) === "b10".U }
    is("b1010".U) { cond := nzcv(3) === nzcv(0) }
    is("b1011".U) { cond := nzcv(3) =/= nzcv(0) }
    is("b1100".U) { cond := nzcv(3) === nzcv(0) && nzcv(2) === 0.U }
    is("b1101".U) { cond := nzcv(3) === nzcv(0) || nzcv(2) === 0.U }
    is("b1110".U) { cond := true.B }
    is("b1111".U) { cond := false.B }
  }
  controller.io.isSatisfy := cond


  // controller
  controller.io.ir := IR
  controller.io.state := state
  // alu
  alu.io.a := MuxLookup(
    controller.io.ALU_A_s, 0.U, Array(
      0.U -> A,
      1.U -> regFile.io.R_PC,
      2.U -> F
    )
  )
  val shift_out = MuxLookup(
    controller.io.ALU_B_s, 0.U, Array(
      "b000".U -> barrelShifter.io.shift_out,
      "b001".U -> Cat(Fill(8, imm24(23)), (imm24<<2.U)),
      "b010".U -> imm12,
      "b011".U -> (PopCount(Reg_list) << 2.U),
      "b100".U -> 4.U
    )
  )
  alu.io.b := shift_out
  alu.io.alu_op := controller.io.aluop
  alu.io.cv_f := nzcv(1, 0)
  alu.io.shift_cout := barrelShifter.io.shift_carryout
  // shift
  barrelShifter.io.shift_data := MuxLookup(
    controller.io.rm_imm_s, 0.U, Array(
      0.U -> B,
      1.U -> imm12(7, 0)
    )
  )
  barrelShifter.io.shift_num := MuxLookup(
    controller.io.rs_imm_s, 0.U, Array(
      0.U -> imm5,
      1.U -> C(7,0),
      2.U -> (imm12(11,8) << 1.U)
    )
  )
  barrelShifter.io.carry_flag := nzcv(1)
  barrelShifter.io.shift_op := controller.io.shiftop
  // regfile
  regFile.io.R_Addr_A := rn
  regFile.io.R_Addr_B := rm
  regFile.io.R_Addr_C := Mux(controller.io.Reg_C_s, rt, rs)
  regFile.io.W_Addr := MuxLookup(
    controller.io.rd_s, 0.U, Array(
      0.U -> rd,
      1.U -> "b1110".U,
      2.U -> rn
    )
  )
  val W_Rdata_s = Mux(controller.io.W_Rdata_s, ram.io.M_R_Data, F)
  regFile.io.W_Data := W_Rdata_s
  regFile.io.Write_Reg := controller.io.Write_Reg
  regFile.io.PC_New := MuxLookup(
    controller.io.PC_s, regFile.io.R_PC, Array(
      0.U -> (regFile.io.R_PC + 4.U),
      1.U -> B,
      2.U -> W_Rdata_s
    )
  )
  regFile.io.Write_PC := controller.io.Write_PC
  regFile.io.M := "b10000".U    // In this case, M=usr
  // ram
  val M_W_Data = Mux(controller.io.Mem_W_s, C, B)
  ram.io.M_W_Data := M_W_Data
  ram.io.M_Addr := F
  ram.io.Mem_Write := controller.io.Mem_Write


  // output
  io.Write_PC := controller.io.Write_PC
  io.Write_IR := controller.io.Write_IR
  io.Write_Reg := controller.io.Write_Reg
  io.A := A
  io.B := B
  io.C := C
  io.F := F
  io.W_Rdata_s := controller.io.W_Rdata_s
  io.W_Data := W_Rdata_s
  io.PC_s := controller.io.PC_s
  io.M_R_Data := ram.io.M_R_Data

  io.IR := IR
  io.Reg_C_s := controller.io.Reg_C_s
  io.PC := regFile.io.R_PC
  io.nzcv := nzcv
  io.Mem_W_s := controller.io.Mem_W_s
  io.Mem_Write := controller.io.Mem_Write
  io.ALU_OP := controller.io.aluop
  io.rd_s := controller.io.rd_s
  io.ALU_A_s := controller.io.ALU_A_s
  io.ALU_B_s := controller.io.ALU_B_s
  io.M_W_Data := M_W_Data
}