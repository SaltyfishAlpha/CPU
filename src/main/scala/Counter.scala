import chisel3._
import chisel3.util._

class Counter(max: Int) extends Module {
  var io = IO(new Bundle{
    val swb = Input(UInt(1.W))
    val cnt = Output(UInt(log2Up(max).W))
  })
  val cnt = RegInit(0.U(log2Up(max).W))

  val sZero :: sOne :: fsm = Enum(2)
  val state = RegInit(sZero)
  switch(state) {
    is(sZero) {
      when(io.swb.asBool()) {
        state := sOne
        cnt := cnt + 1.U
      }
    }
    is(sOne) {
      when(!io.swb.asBool()) {
        state := sZero
      }
    }
  }

  when(cnt === max.U) {
    cnt := 0.U
  }

  io.cnt := cnt
}