import chisel3._
import chisel3.util._

class Top extends Module{
  var io = IO(new Bundle{
    val swb = Input(UInt(1.W))

    // 数码管
    val which = Output(UInt(3.W))
    val seg = Output(UInt(8.W))
    val enable = Output(UInt(1.W))
  })

  val data = RegInit(0.U(32.W))

  val cpu = Module(new CPU)
  val display = Module(new Display)
  val counter = Module(new Counter(10))
  counter.io.swb := io.swb


  // InsBus
  switch(counter.io.cnt) {
    is (0.U) {
      data := cpu.io.A
    }
    is(1.U) {
      data := cpu.io.B
    }
    is(2.U) {
      data := cpu.io.C
    }
    is(3.U) {
      data := cpu.io.F
    }
    is(4.U) {
      data := cpu.io.IR
    }
    is(5.U) {
      data := cpu.io.W_Data
    }
    is(6.U) {
      data := cpu.io.M_R_Data
    }
    is(7.U) {
      data := cpu.io.M_W_Data
    }
    is(8.U) {
      data := Cat(
        //7*1
        cpu.io.Write_PC,
        cpu.io.Write_IR,
        cpu.io.Write_Reg,
        cpu.io.W_Rdata_s,
        cpu.io.Reg_C_s,
        cpu.io.Mem_W_s,
        cpu.io.Mem_Write,

        //3*2
        cpu.io.PC_s,
        cpu.io.rd_s,
        cpu.io.ALU_A_s,

        //3*1
        cpu.io.ALU_B_s,

        //4*1
        cpu.io.nzcv,

        //8*1
        cpu.io.PC
      )
    }
    is(9.U) {
      data := "h88888888".U
    }
  }

  // 数码管
  display.io.data := data
  display.io.clk := clock
  io.which := display.io.which
  io.seg := display.io.seg
  io.enable := 1.U
}

object Main extends App {
  // Driver.emitVerilog(new CPU)
  Driver.emitVerilog(new Top)
}