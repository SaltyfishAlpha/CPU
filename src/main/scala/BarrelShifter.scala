import chisel3._
import chisel3.util._

class BarrelShifter extends Module {
  var io = IO (new Bundle{

    val shift_data = Input(UInt(32.W))
    val shift_num = Input(UInt(8.W))
    val carry_flag = Input(UInt(1.W))
    val shift_op = Input(UInt(3.W))

    val shift_out = Output(UInt(32.W))
    val shift_carryout = Output(UInt(1.W))
  })

  io.shift_out := 0.U
  io.shift_carryout := 0.U

  when(io.shift_num === 0.U){ // 0

    switch(io.shift_op){
      is(0.U){
        io.shift_out := io.shift_data
      }
      is(1.U) {
        io.shift_out := io.shift_data
      }
      is(2.U) {
        io.shift_out := 0.U
        io.shift_carryout := io.shift_data(31)
      }
      is(3.U) {
        io.shift_out := io.shift_data
      }
      is(4.U) {
        io.shift_out := Fill(32, io.shift_data(31))
        io.shift_carryout := io.shift_data(31)
      }
      is(5.U) {
        io.shift_out := io.shift_data
      }
      is(6.U) {
        io.shift_out := Cat(io.carry_flag, io.shift_data(31, 1))
        io.shift_carryout := io.shift_data(0)
      }
      is(7.U) {
        io.shift_out := io.shift_data
      }
    }

  }.elsewhen(io.shift_num <= 32.U){ // 1<=<=32
    switch(io.shift_op(2, 1)){
      is(0.U){
        io.shift_out := (io.shift_data << io.shift_num)(31, 0)
        io.shift_carryout := io.shift_data(32.U - io.shift_num)
      }
      is(1.U){
        io.shift_out := (io.shift_data >> io.shift_num) (31, 0)
        io.shift_carryout := io.shift_data(io.shift_num - 1.U)
      }
      is(2.U){
        io.shift_out := (Cat(Fill(32, io.shift_data(31)), io.shift_data) >> io.shift_num)(31, 0)
        io.shift_carryout := io.shift_data(io.shift_num - 1.U)
      }
      is(3.U){
        io.shift_out := (Cat(io.shift_data, io.shift_data) >> io.shift_num)(31, 0)
        io.shift_carryout := io.shift_data(io.shift_num - 1.U)
      }
    }
  }.otherwise{  // >32
    switch(io.shift_op(2, 1)) {
      is(0.U){
        io.shift_out := 0.U
        io.shift_carryout := 0.U
      }
      is(1.U){
        io.shift_out := 0.U
        io.shift_carryout := 0.U
      }
      is(2.U) {
        io.shift_out := Fill(32, io.shift_data(31))
        io.shift_carryout := io.shift_data(31)
      }
      is(3.U) {
        io.shift_out := (Fill(2, io.shift_data pad 32) >> io.shift_num(4, 0)) (31, 0)
        io.shift_carryout := io.shift_data(io.shift_num(4,0) - 1.U)
      }
    }
  }
}