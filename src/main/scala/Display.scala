import chisel3._
import chisel3.util._

// empty for display
/*
module Display(*clk, data, which, seg,
    *count, digit);
 */
class Display extends BlackBox with HasBlackBoxResource {
  var io = IO(new Bundle{
    val data = Input(UInt(32.W))
    val clk = Input(Clock())

    val which = Output(UInt(3.W))
    val seg = Output(UInt(8.W))
    val count = Output(UInt(15.W))
    val digit = Output(UInt(4.W))
  })

  addResource("/Display.v")
}