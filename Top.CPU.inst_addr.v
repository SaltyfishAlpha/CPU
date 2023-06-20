module BindsTo_0_CPU(
  input         clock,
  input         reset,
  output        io_Write_PC,
  output        io_Write_IR,
  output        io_Write_Reg,
  output [31:0] io_A,
  output [31:0] io_B,
  output [31:0] io_C,
  output [31:0] io_F,
  output        io_W_Rdata_s,
  output [31:0] io_W_Data,
  output [1:0]  io_PC_s,
  output [31:0] io_M_R_Data,
  output [31:0] io_IR,
  output        io_Reg_C_s,
  output [7:0]  io_PC,
  output [3:0]  io_nzcv,
  output        io_Mem_W_s,
  output        io_Mem_Write,
  output [1:0]  io_rd_s,
  output [1:0]  io_ALU_A_s,
  output [2:0]  io_ALU_B_s,
  output [31:0] io_M_W_Data
);

initial begin
  $readmemh("mem.hex", CPU.inst_addr);
end
                      endmodule

bind CPU BindsTo_0_CPU BindsTo_0_CPU_Inst(.*);