import chisel3._
import chisel3.util._

class ALU extends Module{
  var io = IO(new Bundle{
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))
    val alu_op = Input(UInt(4.W))
    val cv_f = Input(UInt(2.W))
    val shift_cout = Input(UInt(1.W))

    val F = Output(UInt(32.W))
    val nzcv = Output(UInt(4.W))

    //val cout = Output(UInt(1.W))
  })

  val Cout = Wire(UInt(1.W))
  val reg_F = Wire(UInt(32.W))
  val nzcv = Wire(UInt(4.W))

  Cout := 0.U
  reg_F := 0.U
  switch(io.alu_op){
    is(0.U){
      reg_F := io.a & io.b
    }
    is(1.U) {
      reg_F := io.a ^ io.b
    }
    is (2.U) {
      reg_F := io.a -& io.b
      Cout := (io.a -& io.b)(32)
    }
    is(3.U) {
      reg_F := io.b -& io.a
      Cout := (io.b -& io.a) (32)
    }
    is(4.U) {
      reg_F := io.a +& io.b
      Cout := (io.a +& io.b) (32)
    }
    is(5.U) {
      reg_F := io.a +& io.b + io.cv_f(1)
      Cout := (io.a +& io.b + io.cv_f(1)) (32)
    }
    is(6.U) {
      reg_F := io.a -& io.b + io.cv_f(1) - 1.U
      Cout := (io.a -& io.b + io.cv_f(1) - 1.U) (32)
    }
    is(7.U) {
      reg_F := io.b -& io.a + io.cv_f(1) - 1.U
      Cout := (io.b -& io.a + io.cv_f(1) - 1.U) (32)
    }
    is(8.U) {
      reg_F := io.a
    }
    is(10.U) {
      reg_F := io.a -& io.b + 4.U
      Cout := (io.a -& io.b + 4.U) (32)
    }
    is(12.U) {
      reg_F := io.a | io.b
    }
    is(13.U) {
      reg_F := io.b
    }
    is(14.U) {
      reg_F := io.a & (~io.b).asUInt
    }
    is(15.U) {
      reg_F := ~io.b
    }
  }

  io.F := reg_F

  nzcv := 0.U
  switch(io.alu_op) {
    is("h0".U, "h1".U, "hC".U, "hE".U, "hF".U, "h8".U, "hD".U){
      nzcv := Cat(
        io.F(31),
        ~io.F.orR(),
        io.shift_cout,
        io.cv_f(0)
      )
    }
    is("h2".U, "h3".U, "h4".U, "h5".U, "h6".U, "h7".U, "hA".U){
      nzcv := Cat(
        io.F(31),
        ~io.F.orR(),
        io.alu_op(1) ^ Cout,
        io.a(31) ^ io.b(31) ^ io.F(31) ^ Cout
      )
    }
  }

  io.nzcv := nzcv
}

//object ALU extends App {
//  Driver.emitVerilog(new ALU)
//}
