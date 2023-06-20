import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class MyMem(l: Int, w: Int) extends Module{
  var io = IO(new Bundle{
    val M_W_Data = Input(UInt(w.W))
    val M_Addr = Input(UInt(w.W))
    val Mem_Write = Input(Bool())

    val M_R_Data = Output(UInt(w.W))
  })

  // mem
  val mem = SyncReadMem(l, UInt(w.W))

  // write
  when(io.Mem_Write){
    mem.write(io.M_Addr, io.M_W_Data)
  }

  // read
  io.M_R_Data := mem.read(io.M_Addr)
}
