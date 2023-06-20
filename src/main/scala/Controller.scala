import chisel3._
import chisel3.util._

class Controller extends Module {
  var io = IO(new Bundle{
    val ir = Input(UInt(32.W))
    val state = Input(UInt())
    val isSatisfy = Input(Bool())

    val done = Output(Bool())
    val err = Output(Bool())
    // todo: output enable
    val aluop = Output(UInt(4.W))
    val shiftop = Output(UInt(3.W))
    val rm_imm_s = Output(Bool())
    val rs_imm_s = Output(UInt(2.W))
    val Write_PC = Output(Bool())
    val Write_IR = Output(Bool())
    val Write_Reg = Output(Bool())
    val LA = Output(Bool())
    val LB = Output(Bool())
    val LC = Output(Bool())
    val LF = Output(Bool())
    val S = Output(Bool())
    val PC_s = Output(UInt(2.W))
    val ALU_A_s = Output(UInt(2.W))
    val ALU_B_s = Output(UInt(3.W))
    val rd_s = Output(UInt(2.W))
    val W_Rdata_s = Output(Bool())
    val Reg_C_s = Output(Bool())
    val Mem_W_s = Output(Bool())
    val Mem_Write = Output(Bool())
  })

  // param
  val and :: eor :: sub :: rsb :: add :: adc :: sbc :: rsc :: tst :: teq :: cmp :: cmn :: orr :: mov :: bic :: mvn :: Nil = Enum(16)

  // undefined
  val und_ins = Wire(Bool())

  val cond = io.ir(31, 28)
  val OP = io.ir(24, 21)
  val s = io.ir(20)
  val rn = io.ir(19, 16)
  val rd = io.ir(15, 12)
  val imm5 = io.ir(11, 7)
  val itype = io.ir(6, 5)
  val rm = io.ir(3, 0)
  val rs = io.ir(11, 8)
  val imm12 = io.ir(11, 0)
  val rt = io.ir(15, 12)
  val P = io.ir(24)
  val U = io.ir(23)
  val W = io.ir(21)
  val swp_flag = (~(rt.andR | rn.andR | rm.andR)).asBool & (rn =/= rt) & (rn =/= rm)
  val type0 = Cat(io.ir(6,5), 0.U(1.W))
  val Reg_list = io.ir(15, 0)

  // enable init
  io.done := false.B
  io.err := false.B

  // output init
  // opr
  io.aluop := OP
  switch(OP) {
    is(tst) { io.aluop := 0.U }
    is(teq) { io.aluop := 1.U }
    is(cmp) { io.aluop := 2.U }
    is(cmn) { io.aluop := 4.U }
  }
  io.shiftop := 0.U
  // enables
  io.rm_imm_s := false.B
  io.rs_imm_s := 0.U
  io.Write_PC := false.B
  io.Write_IR := false.B
  io.Write_Reg := false.B
  io.LA := false.B
  io.LB := false.B
  io.LC := false.B
  io.LF := false.B
  io.S := s
  io.PC_s := 0.U
  io.ALU_A_s := 0.U
  io.ALU_B_s := 0.U
  io.rd_s := 0.U
  io.W_Rdata_s := false.B
  io.Reg_C_s := false.B
  io.Mem_W_s := false.B
  io.Mem_Write := false.B

  und_ins := false.B;

  // read instr
  when(io.state === 0.U) {
    io.Write_PC := 1.U
    io.Write_IR := io.isSatisfy
    when(io.isSatisfy === false.B) {
      io.done := true.B
    }
  }

  // inst type
  switch(io.ir(27, 25)) {

    is("b000".U){
      when(OP(3, 2) === "b10".U && s.asBool) {
        // exception
        io.done := true.B
      }.elsewhen(rd === 15.U && rn === 14.U && s.asBool && (OP === mov || OP === sub)) {
        // special
        io.done := true.B
      } .elsewhen(io.ir(24, 4) === 0x12fff1.U) {
        // bx
        // it needs first, for it's also a data instruction.
        // state trans
        switch(io.state) {
          is(1.U) {
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          }
          is(2.U) {
            io.Write_PC := 1.U
            io.PC_s := 1.U
            io.done := true.B
          }
        }
      } .elsewhen(io.ir(24, 20) === "b10000".U && io.ir(11, 4) === "b00001001".U) {
        // swp
        // state trans
        switch(io.state) {
          is(1.U) {
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          }
          is(2.U) {
            io.ALU_A_s := 0.U
            io.aluop := "b1100".U
            io.S := 0.U
            io.LF := 1.U
          }
          is(3.U) {
            io.W_Rdata_s := true.B
            io.rd_s := "b00".U
            io.Write_Reg := true.B
          }
          is(4.U) {
            io.Mem_W_s := false.B
            io.Mem_Write := true.B
            io.done := true.B
          }
        } // end state
      }.elsewhen(io.ir(4) === 0.U && rd =/= 15.U) {
        // dp0
        // operator
        io.shiftop := Cat(itype, 0.U)
        io.rs_imm_s := 0.U
        // state trans
        switch(io.state) {
          is(1.U) {
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          }
          is(2.U) {
            io.LF := 1.U
          }
          is(3.U) {
            io.Write_Reg := 1.U
            io.done := true.B
          }
        }
      }.elsewhen(io.ir(4) === 1.U && io.ir(7) === 0.U) {
        // dp1
        // operator
        io.shiftop := Cat(itype, 1.U)
        io.rs_imm_s := 1.U
        // state trans
        switch(io.state) {
          is(1.U) {
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          }
          is(2.U) {
            io.LF := 1.U
          }
          is(3.U) {
            io.Write_Reg := 1.U
            io.done := true.B
          }
        }
      }.otherwise {
        und_ins := true.B;
      } // End when

    } // ir(27, 25) === 000


    is ("b001".U) {
      when(io.ir(27, 25) === 1.U && rd =/= 15.U) {
        // dp2
        // operator
        io.shiftop := "b111".U
        io.rm_imm_s := true.B
        io.rs_imm_s := 2.U
        // state trans
        switch(io.state) {
          is(1.U) {
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          }
          is(2.U) {
            io.LF := 1.U
          }
          is(3.U) {
            io.Write_Reg := 1.U
            io.done := true.B
          }
        }
      }.otherwise {
        und_ins := true.B;
      } // End when
    } // ir(27,25) === 001


    is("b010".U) {
      when(io.ir(22).asBool) {
        und_ins := true.B;
      }.otherwise {
        when(io.ir(20).asBool()) {
          // LDR0
          // state trans
          switch(io.state) {
            is(1.U) {
              io.LA := 1.U
              io.LB := 1.U
              io.LC := 1.U
            }
            is(2.U) {
              when(P) {
                io.ALU_A_s := 0.U
                io.ALU_B_s := "b010".U
                when(U) { // add
                  io.aluop := "b0100".U
                } .otherwise { // sub
                  io.aluop := "b0010".U
                }
                io.S := 0.U
                io.LF := 1.U
              } .otherwise {
                io.ALU_A_s := 0.U
                io.aluop := "b1100".U
                io.S := 0.U
                io.LF := 1.U
              }
            }
            is(3.U) {
              when(P) {
                io.W_Rdata_s := true.B
                io.rd_s := "b00".U
                io.Write_Reg := true.B
              } .otherwise {
                io.ALU_A_s := 0.U
                io.ALU_B_s := "b010".U
                when(U) { // add
                  io.aluop := "b0100".U
                }.otherwise { // sub
                  io.aluop := "b0010".U
                }
                io.S := 0.U
                io.LF := 1.U
                io.W_Rdata_s := true.B
                io.rd_s := "b00".U
                io.Write_Reg := true.B
              }
              // write back?
              when(W =/= 1.U && P =/= 0.U) {
                io.done := 1.U
              }
            }
            is(4.U) {
              io.W_Rdata_s := false.B
              io.rd_s := "b10".U
              io.Write_Reg := true.B
              io.done := true.B
            }
          } // end state
        }.otherwise {
          // STR0
          // state trans
          switch(io.state) {
            is(1.U) {
              io.LA := 1.U
              io.LB := 1.U
              io.LC := 1.U
              io.Reg_C_s := true.B
            }
            is(2.U) {
              when(P) {
                io.ALU_A_s := 0.U
                io.ALU_B_s := "b010".U
                when(U) { // add
                  io.aluop := "b0100".U
                }.otherwise { // sub
                  io.aluop := "b0010".U
                }
                io.S := 0.U
                io.LF := 1.U
              }.otherwise {
                io.ALU_A_s := 0.U
                io.aluop := "b1100".U
                io.S := 0.U
                io.LF := 1.U
              }
            }
            is(3.U) {
              when(P) {
                io.Mem_W_s := true.B
                io.Mem_Write := true.B
              }.otherwise {
                io.ALU_A_s := 0.U
                io.ALU_B_s := "b010".U
                when(U) { // add
                  io.aluop := "b0100".U
                }.otherwise { // sub
                  io.aluop := "b0010".U
                }
                io.S := 0.U
                io.LF := 1.U

                io.Mem_W_s := true.B
                io.Mem_Write := true.B
              }
              // write back?
              when(W =/= 1.U && P =/= 0.U) {
                io.done := 1.U
              }
            }
            is(4.U) {
              io.W_Rdata_s := false.B
              io.rd_s := "b10".U
              io.Write_Reg := true.B
              io.done := true.B
            }
          } // state end
        }
      }
    } // ir(27,25) === 010


    is("b011".U) {
      when(io.ir(22).asBool || io.ir(4).asBool) {
        und_ins := true.B
      }.otherwise {
        when(io.ir(20).asBool) {
          //LDR1
          when(W === 1.U && rn === rt) {
            und_ins := true.B
          } .otherwise {
            // state trans
            switch(io.state) {
              is(1.U) {
                io.LA := 1.U
                io.LB := 1.U
                io.LC := 1.U
              }
              is(2.U) {
                when(P) {
                  io.rm_imm_s := false.B
                  io.rs_imm_s := false.B
                  io.shiftop := type0
                  io.ALU_A_s := 0.U
                  io.ALU_B_s := "b000".U
                  when(U) { // add
                    io.aluop := "b0100".U
                  }.otherwise { // sub
                    io.aluop := "b0010".U
                  }
                  io.S := 0.U
                  io.LF := 1.U
                }.otherwise {
                  io.ALU_A_s := 0.U
                  io.aluop := "b1100".U
                  io.S := 0.U
                  io.LF := 1.U
                }
              }
              is(3.U) {
                when(P) {
                  io.W_Rdata_s := true.B
                  io.rd_s := "b00".U
                  io.Write_Reg := true.B
                }.otherwise {
                  io.rm_imm_s := false.B
                  io.rs_imm_s := false.B
                  io.shiftop := type0
                  io.ALU_A_s := 0.U
                  io.ALU_B_s := "b000".U
                  when(U) { // add
                    io.aluop := "b0100".U
                  }.otherwise { // sub
                    io.aluop := "b0010".U
                  }
                  io.S := 0.U
                  io.LF := 1.U

                  io.W_Rdata_s := true.B
                  io.rd_s := "b00".U
                  io.Write_Reg := true.B
                }
                // write back?
                when(W =/= 1.U && P =/= 0.U) {
                  io.done := 1.U
                }
              }
              is(4.U) {
                io.W_Rdata_s := false.B
                io.rd_s := "b10".U
                io.Write_Reg := true.B
                io.done := true.B
              }
            } // state end
          }
        }.otherwise {
          //STR1
          // state trans
          switch(io.state) {
            is(1.U) {
              io.LA := 1.U
              io.LB := 1.U
              io.LC := 1.U
              io.Reg_C_s := true.B
            }
            is(2.U) {
              when(P) {
                io.rm_imm_s := false.B
                io.rs_imm_s := false.B
                io.shiftop := type0
                io.ALU_A_s := 0.U
                io.ALU_B_s := "b000".U
                when(U) { // add
                  io.aluop := "b0100".U
                }.otherwise { // sub
                  io.aluop := "b0010".U
                }
                io.S := 0.U
                io.LF := 1.U
              }.otherwise {
                io.ALU_A_s := 0.U
                io.aluop := "b1100".U
                io.S := 0.U
                io.LF := 1.U
              }
            }
            is(3.U) {
              when(P) {
                io.Mem_W_s := true.B
                io.Mem_Write := false.B
              }.otherwise {
                io.rm_imm_s := false.B
                io.rs_imm_s := false.B
                io.shiftop := type0
                io.ALU_A_s := 0.U
                io.ALU_B_s := "b000".U
                when(U) { // add
                  io.aluop := "b0100".U
                }.otherwise { // sub
                  io.aluop := "b0010".U
                }
                io.S := 0.U
                io.LF := 1.U

                io.Mem_W_s := true.B
                io.Mem_Write := false.B
              }
              // write back?
              when(W =/= 1.U && P =/= 0.U) {
                io.done := 1.U
              }
            }
            is(4.U) {
              io.W_Rdata_s := false.B
              io.rd_s := "b10".U
              io.Write_Reg := true.B
              io.done := true.B
            }
          } // state end
        }
      }
    } // ir(27, 25) === 011


    is ("b101".U) {
      when(io.ir(24) === 0.U) {
        // b
        // state trans
        switch(io.state) {
          is(1.U) {
            io.ALU_A_s := 1.U
            io.ALU_B_s := "b001".U
            io.aluop := "b0100".U
            io.S := false.B
            io.LF := true.B
          }
          is(2.U) {
            io.Write_PC := 1.U
            io.PC_s := 2.U
            io.done := true.B
          }
        }
      }.otherwise {
        // bl
        // state trans
        switch(io.state) {
          is(1.U) {
            io.ALU_A_s := 1.U
            io.aluop := "b1000".U
            io.S := false.B
            io.LF := true.B
          }
          is(2.U) {
            io.ALU_A_s := 1.U
            io.ALU_B_s := "b001".U
            io.aluop := "b0100".U
            io.S := false.B
            io.LF := true.B
            io.rd_s := 1.U
            io.Write_Reg := 1.U
          }
          is(3.U) {
            io.Write_PC := 1.U
            io.PC_s := 2.U
            io.done := true.B
          }
        }
      } // End When
    } // ir(27,25) === 101


    is("b100".U) {

      when(io.ir(20)) {
        // ldm
        when(io.ir(15) && io.ir(22) === false.B) {
          // interrupt
          und_ins := true.B
        } .elsewhen(rn === 15.U || PopCount(Reg_list) <= 1.U) {
          und_ins := true.B
        } .otherwise {
          // todo
          when(io.state === 1.U) {
            // reg[rn]->A
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          } .elsewhen(io.state === 2.U) {
            // A-4*BitCount(I[15:0])+4->F
            io.ALU_A_s := "b00".U
            io.ALU_B_s := "b011".U
            io.aluop := "b1010".U
            io.S := 0.U
            io.LF := 1.U
          } .elsewhen(io.state >= 3.U && io.state <= PopCount(io.ir(14, 0)) + 2.U) {
            io.ALU_A_s := "b01".U
            io.ALU_B_s := "b100".U
            io.aluop := "b0100".U
            io.S := 0.U
            io.LF := 1.U
            io.W_Rdata_s := "b10".U
            io.rd_s := "b00".U
            io.Write_Reg := 1.U
          } .elsewhen(io.state === PopCount(io.ir(14, 0)) + 3.U) {
            // if I(15)==1 do sth
            // pass
          } .elsewhen(io.state === PopCount(io.ir(14, 0)) + 4.U) {
            // rn write back
            io.ALU_A_s := "b00".U
            io.ALU_B_s := "b011".U
            when(U) { // add
              io.aluop := "b0100".U
            }.otherwise { // sub
              io.aluop := "b0010".U
            }
            io.S := 0.U
            io.LF := 1.U
            // write back?
            when(W =/= 1.U && P =/= 0.U) {
              io.done := 1.U
            }
          } .elsewhen(io.state === PopCount(io.ir(14, 0)) + 5.U) {
            // F -> Reg[rn]
            io.W_Rdata_s := "b00".U
            io.rd_s := "b10".U
            io.Write_Reg := 1.U
            io.done := 1.U
          }
        }
      } .otherwise {
        // stm
        when(rn === 15.U || PopCount(Reg_list) <= 1.U) {
          und_ins := true.B
        }.otherwise {
          // todo
          when(io.state === 1.U) {
            // reg[rn]->A
            io.LA := 1.U
            io.LB := 1.U
            io.LC := 1.U
          }.elsewhen(io.state === 2.U) {
            // r[first_num]->C
            io.LC := 1.U
            io.ALU_A_s := "b00".U
            io.aluop := "b1000".U
            io.S := 0.U
            io.LF := 1.U
            io.Reg_C_s := 1.U
          }.elsewhen(io.state >= 3.U && io.state <= PopCount(Reg_list) + 1.U) {
            //...
            // c->Mem[F]
            // F+4->F
            io.LC := 1.U
            io.ALU_A_s := "b10".U
            io.ALU_B_s := "b100".U
            io.aluop := "b0100".U
            io.S := 0.U
            io.LF := 1.U
            io.Mem_W_s := 1.U
            io.Reg_C_s := 1.U
            io.Mem_Write := 1.U
          }.elsewhen(io.state === PopCount(Reg_list) + 2.U) {
            // C->Mem[F]
            io.Mem_W_s := 1.U
            io.Mem_Write := 1.U
          }.elsewhen(io.state === PopCount(Reg_list) + 3.U) {
            // rn write back
            io.ALU_A_s := "b00".U
            io.ALU_B_s := "b011".U
            when(U) { // add
              io.aluop := "b0100".U
            }.otherwise { // sub
              io.aluop := "b0010".U
            }
            io.S := 0.U
            io.LF := 1.U

            when(W =/= 1.U && P =/= 0.U) {
              io.done := 1.U
            }
          }.elsewhen(io.state === PopCount(Reg_list) + 4.U) {
            // F -> Reg[rn]
            io.W_Rdata_s := "b00".U
            io.rd_s := "b10".U
            io.Write_Reg := 1.U
            io.done := 1.U
          }
        }
      }
    } // ir(27,25) === 100


    is ("b110".U,"b111".U) {
      und_ins := true.B
    } // all undefined instruction
  }


  // if und jump
  when(und_ins) {
    io.done := true.B
  }
}
