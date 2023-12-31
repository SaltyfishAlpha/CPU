import chisel3.iotesters.PeekPokeTester

class CPUTester(c: CPU) extends PeekPokeTester(c) {

  for (i <- 0 to 80) {
    println(i+":")

    println("Write_PC " + peek(c.io.Write_PC))
    println("Write_IR " + peek(c.io.Write_IR))
    println("Write_Reg " + peek(c.io.Write_Reg))
    println("A " + peek(c.io.A))
    println("B " + peek(c.io.B))
    println("C " + peek(c.io.C))
    println("F " + peek(c.io.F).toInt.toHexString)

    println("IR " + peek(c.io.IR).toInt.toHexString)
    println("PC " + peek(c.io.PC).toInt.toHexString)
    println("nzcv " + peek(c.io.nzcv).toInt.toBinaryString)
    println("ALU_OP " + peek(c.io.ALU_OP).toInt.toBinaryString)
    println("rd_s " + peek(c.io.rd_s))
    println("ALU_A_s " + peek(c.io.ALU_A_s))
    println("ALU_B_s " + peek(c.io.ALU_B_s))

    println("----------------------------------------")
    println("PC_s " + peek(c.io.PC_s).toInt.toBinaryString)

    step(1)

    println("----------------------------------------")
  }
}

object CPUTester extends App {
  chisel3.iotesters.Driver.execute(args, ()=>new CPU)(c =>new CPUTester(c))
}