import chisel3._
import chisel3.util._

class RegFile extends Module{
  var io = IO(new Bundle{
    val R_Addr_A = Input(UInt(4.W))
    val R_Addr_B = Input(UInt(4.W))
    val R_Addr_C = Input(UInt(4.W))

    val W_Addr = Input(UInt(4.W))
    val W_Data = Input(UInt(32.W))
    val Write_Reg = Input(UInt(1.W))

    // PC_Reg
    val PC_New = Input(UInt(32.W))
    val Write_PC = Input(UInt(1.W))

    val M = Input(UInt(5.W))

    val R_Data_A = Output(UInt(32.W))
    val R_Data_B = Output(UInt(32.W))
    val R_Data_C = Output(UInt(32.W))
    val R_PC = Output(UInt(32.W))

    val err = Output(UInt(2.W))
  })

  val reg = RegInit(VecInit(Seq.fill(13)(0.U(32.W))))

  val reg_fiq = RegInit(VecInit(Seq.fill(5)(0.U(32.W))))

  val r13 = RegInit(VecInit(Seq.fill(8)(0.U(32.W))))
  val r14 = RegInit(VecInit(Seq.fill(7)(0.U(32.W))))
  val reg_pc = RegInit(0.U(32.W))

  val reg_data_a = WireInit(0.U(32.W))
  val reg_data_b = WireInit(0.U(32.W))
  val reg_data_c = WireInit(0.U(32.W))

  val err1 = WireInit(0.U(1.W))
  val err2 = WireInit(0.U(1.W))

  // write
  when( io.M(4) === 0.U ) {
    err1 := 1.U
    err2 := 1.U
  }.otherwise {

    // write
    when(io.Write_Reg.asBool() && io.W_Addr === 15.U) {
      err1 := 1.U
    }.otherwise {
      err1 := 0.U
      switch(io.M(3, 0)) {

          is("b0000".U) { //user
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(0) := io.W_Data
                }
                .otherwise {
                  r14(0) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }
          }

          is("b0001".U) { //fiq
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 8.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr < 13.U) {
                  reg_fiq(io.W_Addr-8.U) := io.W_Data
                }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(1) := io.W_Data
                }
                .elsewhen(io.W_Addr === 14.U) {
                  r14(1) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b0010".U) { //irq
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(2) := io.W_Data
                }
                .otherwise {
                  r14(2) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b0011".U) { //svc
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(3) := io.W_Data
                }
                .otherwise {
                  r14(3) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b0110".U) { //mon
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(4) := io.W_Data
                }
                .otherwise {
                  r14(4) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b0111".U) { //abt
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(5) := io.W_Data
                }
                .otherwise {
                  r14(5) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b1010".U) { //hyp
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(6) := io.W_Data
                }
                .otherwise {
                  r14(6) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b1011".U) { //und
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(7) := io.W_Data
                }
                .otherwise {
                  err1 := 1.U
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }

          }

          is("b1111".U) { //sys
            when(io.Write_Reg.asBool()) {
              when(io.W_Addr < 13.U) {
                reg(io.W_Addr) := io.W_Data
              }
                .elsewhen(io.W_Addr === 13.U) {
                  r13(0) := io.W_Data
                }
                .otherwise {
                  r14(0) := io.W_Data
                }
            }
            when(io.Write_PC.asBool()) {
              reg_pc := io.PC_New
            }
          }

          is("b0100".U, "b0101".U, "b1000".U,
            "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
            err1 := 1.U
          }
        } // switch(io.M(3, 0))
      }// end write

    // read A
    err2 := 0.U
    when(io.R_Addr_A < 8.U) {
      // reg 0~7
      reg_data_a := reg(io.R_Addr_A)
    } .elsewhen(io.R_Addr_A < 13.U) {
      when(io.M(3, 0) === "b0100".U
        || io.M(3, 0) === "b0101".U
        || io.M(3, 0) === "b1000".U
        || io.M(3, 0) === "b1001".U
        || io.M(3, 0) === "b1100".U
        || io.M(3, 0) === "b1101".U
        || io.M(3, 0) === "b1110".U) {
        err2 := 1.U
      }.elsewhen(io.M(3, 0) === "b0001".U) {
        reg_data_a := reg_fiq(io.R_Addr_A - 8.U)
      }.otherwise {
        reg_data_a := reg(io.R_Addr_A)
      }
    } .elsewhen(io.R_Addr_A === 13.U) {

      switch(io.M(3, 0)) {
        is("b0000".U, "b1111".U) { //user
          reg_data_a := r13(0)
        }
        is("b0001".U) { //fiq
          reg_data_a := r13(1)
        }
        is("b0010".U) { //irq
          reg_data_a := r13(2)
        }
        is("b0011".U) { //svc
          reg_data_a := r13(3)
        }
        is("b0110".U) { //mon
          reg_data_a := r13(4)
        }
        is("b0111".U) { //abt
          reg_data_a := r13(5)
        }
        is("b1010".U) { //hyp
          reg_data_a := r13(6)
        }
        is("b1011".U) { //und
          reg_data_a := r13(7)
        }
        is("b0100".U, "b0101".U, "b1000".U,
          "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
          err2 := 1.U
        }
      }
    } .elsewhen(io.R_Addr_A === 14.U) {

      switch(io.M(3, 0)) {
        is("b0000".U, "b1111".U) { //user
          reg_data_a := r14(0)
        }
        is("b0001".U) { //fiq
          reg_data_a := r14(1)
        }
        is("b0010".U) { //irq
          reg_data_a := r14(2)
        }
        is("b0011".U) { //svc
          reg_data_a := r14(3)
        }
        is("b0110".U) { //mon
          reg_data_a := r14(4)
        }
        is("b0111".U) { //abt
          reg_data_a := r14(5)
        }
        is("b1010".U) { //hyp
          reg_data_a := r14(6)
        }
        is("b0100".U, "b0101".U, "b1000".U,
          "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
          err2 := 1.U
        }
      }
    } .otherwise {
      reg_data_a := reg_pc
    }

    // read B
    when(io.R_Addr_B < 8.U) {
      // reg 0~7
      reg_data_b := reg(io.R_Addr_B)
    }.elsewhen(io.R_Addr_B < 13.U) {
      when(io.M(3, 0) === "b0100".U
        || io.M(3, 0) === "b0101".U
        || io.M(3, 0) === "b1000".U
        || io.M(3, 0) === "b1001".U
        || io.M(3, 0) === "b1100".U
        || io.M(3, 0) === "b1101".U
        || io.M(3, 0) === "b1110".U) {
        err2 := 1.U
      }.elsewhen(io.M(3, 0) === "b0001".U) {
        reg_data_b := reg_fiq(io.R_Addr_B - 8.U)
      }.otherwise {
        reg_data_b := reg(io.R_Addr_B)
      }
    }.elsewhen(io.R_Addr_B === 13.U) {

      switch(io.M(3, 0)) {
        is("b0000".U, "b1111".U) { //user
          reg_data_b := r13(0)
        }
        is("b0001".U) { //fiq
          reg_data_b := r13(1)
        }
        is("b0010".U) { //irq
          reg_data_b := r13(2)
        }
        is("b0011".U) { //svc
          reg_data_b := r13(3)
        }
        is("b0110".U) { //mon
          reg_data_b := r13(4)
        }
        is("b0111".U) { //abt
          reg_data_b := r13(5)
        }
        is("b1010".U) { //hyp
          reg_data_b := r13(6)
        }
        is("b1011".U) { //und
          reg_data_b := r13(7)
        }
        is("b0100".U, "b0101".U, "b1000".U,
          "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
          err2 := 1.U
        }
      }
    }.elsewhen(io.R_Addr_B === 14.U) {

      switch(io.M(3, 0)) {
        is("b0000".U, "b1111".U) { //user
          reg_data_b := r14(0)
        }
        is("b0001".U) { //fiq
          reg_data_b := r14(1)
        }
        is("b0010".U) { //irq
          reg_data_b := r14(2)
        }
        is("b0011".U) { //svc
          reg_data_b := r14(3)
        }
        is("b0110".U) { //mon
          reg_data_b := r14(4)
        }
        is("b0111".U) { //abt
          reg_data_b := r14(5)
        }
        is("b1010".U) { //hyp
          reg_data_b := r14(6)
        }
        is("b0100".U, "b0101".U, "b1000".U,
          "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
          err2 := 1.U
        }
      }
    }.otherwise {
      reg_data_b := reg_pc
    }

    // read C

    when(io.R_Addr_C < 8.U) {
      // reg 0~7
      reg_data_c := reg(io.R_Addr_C)
    }.elsewhen(io.R_Addr_C < 13.U) {
      when(io.M(3, 0) === "b0100".U
        || io.M(3, 0) === "b0101".U
        || io.M(3, 0) === "b1000".U
        || io.M(3, 0) === "b1001".U
        || io.M(3, 0) === "b1100".U
        || io.M(3, 0) === "b1101".U
        || io.M(3, 0) === "b1110".U) {
        err2 := 1.U
      }.elsewhen(io.M(3, 0) === "b0001".U) {
        reg_data_c := reg_fiq(io.R_Addr_C - 8.U)
      }.otherwise {
        reg_data_c := reg(io.R_Addr_C)
      }
    }.elsewhen(io.R_Addr_C === 13.U) {

      switch(io.M(3, 0)) {
        is("b0000".U, "b1111".U) { //user
          reg_data_c := r13(0)
        }
        is("b0001".U) { //fiq
          reg_data_c := r13(1)
        }
        is("b0010".U) { //irq
          reg_data_c := r13(2)
        }
        is("b0011".U) { //svc
          reg_data_c := r13(3)
        }
        is("b0110".U) { //mon
          reg_data_c := r13(4)
        }
        is("b0111".U) { //abt
          reg_data_c := r13(5)
        }
        is("b1010".U) { //hyp
          reg_data_c := r13(6)
        }
        is("b1011".U) { //und
          reg_data_c := r13(7)
        }
        is("b0100".U, "b0101".U, "b1000".U,
          "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
          err2 := 1.U
        }
      }
    }.elsewhen(io.R_Addr_C === 14.U) {

      switch(io.M(3, 0)) {
        is("b0000".U, "b1111".U) { //user
          reg_data_c := r14(0)
        }
        is("b0001".U) { //fiq
          reg_data_c := r14(1)
        }
        is("b0010".U) { //irq
          reg_data_c := r14(2)
        }
        is("b0011".U) { //svc
          reg_data_c := r14(3)
        }
        is("b0110".U) { //mon
          reg_data_c := r14(4)
        }
        is("b0111".U) { //abt
          reg_data_c := r14(5)
        }
        is("b1010".U) { //hyp
          reg_data_c := r14(6)
        }
        is("b0100".U, "b0101".U, "b1000".U,
          "b1001".U, "b1100".U, "b1101".U, "b1110".U) {
          err2 := 1.U
        }
      }
    }.otherwise {
      reg_data_c := reg_pc
    }

  } // M(4) === 1

  io.R_Data_A := reg_data_a
  io.R_Data_B := reg_data_b
  io.R_Data_C := reg_data_c
  io.R_PC := reg_pc
  io.err := Cat(err1, err2)
}