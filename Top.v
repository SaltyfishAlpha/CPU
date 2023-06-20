module Controller(
  input  [31:0] io_ir,
  input  [3:0]  io_state,
  input         io_isSatisfy,
  output        io_done,
  output [3:0]  io_aluop,
  output [2:0]  io_shiftop,
  output        io_rm_imm_s,
  output [1:0]  io_rs_imm_s,
  output        io_Write_PC,
  output        io_Write_IR,
  output        io_Write_Reg,
  output        io_LA,
  output        io_LB,
  output        io_LC,
  output        io_LF,
  output        io_S,
  output [1:0]  io_PC_s,
  output [1:0]  io_ALU_A_s,
  output [2:0]  io_ALU_B_s,
  output [1:0]  io_rd_s,
  output        io_W_Rdata_s,
  output        io_Reg_C_s,
  output        io_Mem_W_s,
  output        io_Mem_Write
);
  wire [3:0] OP = io_ir[24:21]; // @[Controller.scala 42:17]
  wire  s = io_ir[20]; // @[Controller.scala 43:16]
  wire [3:0] rn = io_ir[19:16]; // @[Controller.scala 44:17]
  wire [3:0] rd = io_ir[15:12]; // @[Controller.scala 45:17]
  wire [1:0] itype = io_ir[6:5]; // @[Controller.scala 47:20]
  wire  P = io_ir[24]; // @[Controller.scala 52:16]
  wire  U = io_ir[23]; // @[Controller.scala 53:16]
  wire  W = io_ir[21]; // @[Controller.scala 54:16]
  wire  _T = rd == 4'hf; // @[Controller.scala 55:24]
  wire  _T_1 = rn == 4'hf; // @[Controller.scala 55:34]
  wire [2:0] type0 = {itype,1'h0}; // @[Cat.scala 30:58]
  wire [15:0] Reg_list = io_ir[15:0]; // @[Controller.scala 57:23]
  wire  _T_11 = 4'h8 == OP; // @[Conditional.scala 37:30]
  wire  _T_12 = 4'h9 == OP; // @[Conditional.scala 37:30]
  wire  _T_13 = 4'ha == OP; // @[Conditional.scala 37:30]
  wire  _T_14 = 4'hb == OP; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_0 = _T_14 ? 4'h4 : OP; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_1 = _T_13 ? 4'h2 : _GEN_0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_2 = _T_12 ? 4'h1 : _GEN_1; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_3 = _T_11 ? 4'h0 : _GEN_2; // @[Conditional.scala 40:58]
  wire  _T_15 = io_state == 4'h0; // @[Controller.scala 96:17]
  wire  _T_16 = ~io_isSatisfy; // @[Controller.scala 99:23]
  wire  _GEN_7 = _T_15 & _T_16; // @[Controller.scala 96:26]
  wire  _T_18 = 3'h0 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_20 = OP[3:2] == 2'h2; // @[Controller.scala 108:21]
  wire  _T_22 = _T_20 & s; // @[Controller.scala 108:33]
  wire  _T_24 = rn == 4'he; // @[Controller.scala 111:36]
  wire  _T_25 = _T & _T_24; // @[Controller.scala 111:30]
  wire  _T_27 = _T_25 & s; // @[Controller.scala 111:45]
  wire  _T_28 = OP == 4'hd; // @[Controller.scala 111:64]
  wire  _T_29 = OP == 4'h2; // @[Controller.scala 111:78]
  wire  _T_30 = _T_28 | _T_29; // @[Controller.scala 111:72]
  wire  _T_31 = _T_27 & _T_30; // @[Controller.scala 111:57]
  wire  _T_33 = io_ir[24:4] == 21'h12fff1; // @[Controller.scala 114:32]
  wire  _T_34 = 4'h1 == io_state; // @[Conditional.scala 37:30]
  wire  _T_35 = 4'h2 == io_state; // @[Conditional.scala 37:30]
  wire  _GEN_8 = _T_35 | _T_15; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_35 | _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_34 ? _T_15 : _GEN_8; // @[Conditional.scala 40:58]
  wire  _GEN_13 = _T_34 ? 1'h0 : _T_35; // @[Conditional.scala 40:58]
  wire  _GEN_14 = _T_34 ? _GEN_7 : _GEN_10; // @[Conditional.scala 40:58]
  wire  _T_37 = io_ir[24:20] == 5'h10; // @[Controller.scala 130:33]
  wire  _T_39 = io_ir[11:4] == 8'h9; // @[Controller.scala 130:64]
  wire  _T_40 = _T_37 & _T_39; // @[Controller.scala 130:48]
  wire  _T_43 = 4'h3 == io_state; // @[Conditional.scala 37:30]
  wire  _T_44 = 4'h4 == io_state; // @[Conditional.scala 37:30]
  wire  _GEN_17 = _T_44 | _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_43 ? 1'h0 : _T_44; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_43 ? _GEN_7 : _GEN_17; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_24 = _T_35 ? 4'hc : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_35 ? 1'h0 : s; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_35 ? 1'h0 : _T_43; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_35 ? 1'h0 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_35 ? _GEN_7 : _GEN_22; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_34 = _T_34 ? _GEN_3 : _GEN_24; // @[Conditional.scala 40:58]
  wire  _GEN_35 = _T_34 ? s : _GEN_25; // @[Conditional.scala 40:58]
  wire  _GEN_37 = _T_34 ? 1'h0 : _GEN_27; // @[Conditional.scala 40:58]
  wire  _GEN_40 = _T_34 ? 1'h0 : _GEN_30; // @[Conditional.scala 40:58]
  wire  _GEN_41 = _T_34 ? _GEN_7 : _GEN_31; // @[Conditional.scala 40:58]
  wire  _T_46 = ~io_ir[4]; // @[Controller.scala 156:27]
  wire  _T_47 = rd != 4'hf; // @[Controller.scala 156:41]
  wire  _T_48 = _T_46 & _T_47; // @[Controller.scala 156:35]
  wire  _GEN_43 = _T_43 | _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_35 ? _GEN_7 : _GEN_43; // @[Conditional.scala 39:67]
  wire  _GEN_50 = _T_34 ? _GEN_7 : _GEN_46; // @[Conditional.scala 40:58]
  wire  _T_56 = ~io_ir[7]; // @[Controller.scala 176:47]
  wire  _T_57 = io_ir[4] & _T_56; // @[Controller.scala 176:35]
  wire [2:0] _T_58 = {itype,1'h1}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_60 = _T_57 ? _T_58 : 3'h0; // @[Controller.scala 176:56]
  wire  _GEN_62 = _T_57 & _T_34; // @[Controller.scala 176:56]
  wire  _GEN_63 = _T_57 & _GEN_13; // @[Controller.scala 176:56]
  wire  _GEN_64 = _T_57 & _GEN_37; // @[Controller.scala 176:56]
  wire  _GEN_65 = _T_57 ? _GEN_50 : _GEN_7; // @[Controller.scala 176:56]
  wire  _GEN_66 = _T_57 ? 1'h0 : 1'h1; // @[Controller.scala 176:56]
  wire [2:0] _GEN_67 = _T_48 ? type0 : _GEN_60; // @[Controller.scala 156:51]
  wire  _GEN_68 = _T_48 ? 1'h0 : _T_57; // @[Controller.scala 156:51]
  wire  _GEN_69 = _T_48 ? _T_34 : _GEN_62; // @[Controller.scala 156:51]
  wire  _GEN_70 = _T_48 ? _GEN_13 : _GEN_63; // @[Controller.scala 156:51]
  wire  _GEN_71 = _T_48 ? _GEN_37 : _GEN_64; // @[Controller.scala 156:51]
  wire  _GEN_72 = _T_48 ? _GEN_50 : _GEN_65; // @[Controller.scala 156:51]
  wire  _GEN_73 = _T_48 ? 1'h0 : _GEN_66; // @[Controller.scala 156:51]
  wire  _GEN_74 = _T_40 ? _T_34 : _GEN_69; // @[Controller.scala 130:83]
  wire [3:0] _GEN_76 = _T_40 ? _GEN_34 : _GEN_3; // @[Controller.scala 130:83]
  wire  _GEN_77 = _T_40 ? _GEN_35 : s; // @[Controller.scala 130:83]
  wire  _GEN_78 = _T_40 ? _GEN_13 : _GEN_70; // @[Controller.scala 130:83]
  wire  _GEN_79 = _T_40 & _GEN_37; // @[Controller.scala 130:83]
  wire  _GEN_81 = _T_40 ? _GEN_37 : _GEN_71; // @[Controller.scala 130:83]
  wire  _GEN_83 = _T_40 & _GEN_40; // @[Controller.scala 130:83]
  wire  _GEN_84 = _T_40 ? _GEN_41 : _GEN_72; // @[Controller.scala 130:83]
  wire [2:0] _GEN_85 = _T_40 ? 3'h0 : _GEN_67; // @[Controller.scala 130:83]
  wire  _GEN_86 = _T_40 ? 1'h0 : _GEN_68; // @[Controller.scala 130:83]
  wire  _GEN_87 = _T_40 ? 1'h0 : _GEN_73; // @[Controller.scala 130:83]
  wire  _GEN_88 = _T_33 ? _T_34 : _GEN_74; // @[Controller.scala 114:48]
  wire  _GEN_89 = _T_33 ? _GEN_12 : _T_15; // @[Controller.scala 114:48]
  wire  _GEN_90 = _T_33 & _GEN_13; // @[Controller.scala 114:48]
  wire  _GEN_91 = _T_33 ? _GEN_14 : _GEN_84; // @[Controller.scala 114:48]
  wire [3:0] _GEN_93 = _T_33 ? _GEN_3 : _GEN_76; // @[Controller.scala 114:48]
  wire  _GEN_94 = _T_33 ? s : _GEN_77; // @[Controller.scala 114:48]
  wire  _GEN_95 = _T_33 ? 1'h0 : _GEN_78; // @[Controller.scala 114:48]
  wire  _GEN_96 = _T_33 ? 1'h0 : _GEN_79; // @[Controller.scala 114:48]
  wire  _GEN_98 = _T_33 ? 1'h0 : _GEN_81; // @[Controller.scala 114:48]
  wire  _GEN_100 = _T_33 ? 1'h0 : _GEN_83; // @[Controller.scala 114:48]
  wire [2:0] _GEN_101 = _T_33 ? 3'h0 : _GEN_85; // @[Controller.scala 114:48]
  wire  _GEN_102 = _T_33 ? 1'h0 : _GEN_86; // @[Controller.scala 114:48]
  wire  _GEN_103 = _T_33 ? 1'h0 : _GEN_87; // @[Controller.scala 114:48]
  wire  _GEN_104 = _T_31 | _GEN_91; // @[Controller.scala 111:88]
  wire  _GEN_105 = _T_31 ? 1'h0 : _GEN_88; // @[Controller.scala 111:88]
  wire  _GEN_106 = _T_31 ? _T_15 : _GEN_89; // @[Controller.scala 111:88]
  wire  _GEN_107 = _T_31 ? 1'h0 : _GEN_90; // @[Controller.scala 111:88]
  wire [3:0] _GEN_109 = _T_31 ? _GEN_3 : _GEN_93; // @[Controller.scala 111:88]
  wire  _GEN_110 = _T_31 ? s : _GEN_94; // @[Controller.scala 111:88]
  wire  _GEN_111 = _T_31 ? 1'h0 : _GEN_95; // @[Controller.scala 111:88]
  wire  _GEN_112 = _T_31 ? 1'h0 : _GEN_96; // @[Controller.scala 111:88]
  wire  _GEN_114 = _T_31 ? 1'h0 : _GEN_98; // @[Controller.scala 111:88]
  wire  _GEN_116 = _T_31 ? 1'h0 : _GEN_100; // @[Controller.scala 111:88]
  wire [2:0] _GEN_117 = _T_31 ? 3'h0 : _GEN_101; // @[Controller.scala 111:88]
  wire  _GEN_118 = _T_31 ? 1'h0 : _GEN_102; // @[Controller.scala 111:88]
  wire  _GEN_119 = _T_31 ? 1'h0 : _GEN_103; // @[Controller.scala 111:88]
  wire  _GEN_120 = _T_22 | _GEN_104; // @[Controller.scala 108:46]
  wire  _GEN_121 = _T_22 ? 1'h0 : _GEN_105; // @[Controller.scala 108:46]
  wire  _GEN_122 = _T_22 ? _T_15 : _GEN_106; // @[Controller.scala 108:46]
  wire  _GEN_123 = _T_22 ? 1'h0 : _GEN_107; // @[Controller.scala 108:46]
  wire [3:0] _GEN_125 = _T_22 ? _GEN_3 : _GEN_109; // @[Controller.scala 108:46]
  wire  _GEN_126 = _T_22 ? s : _GEN_110; // @[Controller.scala 108:46]
  wire  _GEN_127 = _T_22 ? 1'h0 : _GEN_111; // @[Controller.scala 108:46]
  wire  _GEN_128 = _T_22 ? 1'h0 : _GEN_112; // @[Controller.scala 108:46]
  wire  _GEN_130 = _T_22 ? 1'h0 : _GEN_114; // @[Controller.scala 108:46]
  wire  _GEN_132 = _T_22 ? 1'h0 : _GEN_116; // @[Controller.scala 108:46]
  wire [2:0] _GEN_133 = _T_22 ? 3'h0 : _GEN_117; // @[Controller.scala 108:46]
  wire  _GEN_134 = _T_22 ? 1'h0 : _GEN_118; // @[Controller.scala 108:46]
  wire  _GEN_135 = _T_22 ? 1'h0 : _GEN_119; // @[Controller.scala 108:46]
  wire  _T_62 = 3'h1 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_64 = io_ir[27:25] == 3'h1; // @[Controller.scala 204:26]
  wire  _T_66 = _T_64 & _T_47; // @[Controller.scala 204:34]
  wire [2:0] _GEN_145 = _T_66 ? 3'h7 : 3'h0; // @[Controller.scala 204:50]
  wire [1:0] _GEN_147 = _T_66 ? 2'h2 : 2'h0; // @[Controller.scala 204:50]
  wire  _GEN_148 = _T_66 & _T_34; // @[Controller.scala 204:50]
  wire  _GEN_149 = _T_66 & _GEN_13; // @[Controller.scala 204:50]
  wire  _GEN_150 = _T_66 & _GEN_37; // @[Controller.scala 204:50]
  wire  _GEN_151 = _T_66 ? _GEN_50 : _GEN_7; // @[Controller.scala 204:50]
  wire  _GEN_152 = _T_66 ? 1'h0 : 1'h1; // @[Controller.scala 204:50]
  wire  _T_70 = 3'h2 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_153 = U ? 3'h4 : 3'h2; // @[Controller.scala 248:25]
  wire [1:0] _GEN_155 = P ? 2'h2 : 2'h0; // @[Controller.scala 245:23]
  wire [3:0] _GEN_156 = P ? {{1'd0}, _GEN_153} : 4'hc; // @[Controller.scala 245:23]
  wire [1:0] _GEN_158 = P ? 2'h0 : 2'h2; // @[Controller.scala 263:23]
  wire [3:0] _GEN_159 = P ? _GEN_3 : {{1'd0}, _GEN_153}; // @[Controller.scala 263:23]
  wire  _GEN_160 = P & s; // @[Controller.scala 263:23]
  wire  _GEN_161 = P ? 1'h0 : 1'h1; // @[Controller.scala 263:23]
  wire  _T_78 = ~W; // @[Controller.scala 282:22]
  wire  _T_80 = _T_78 & P; // @[Controller.scala 282:30]
  wire  _GEN_162 = _T_80 | _GEN_7; // @[Controller.scala 282:44]
  wire [1:0] _GEN_164 = _T_44 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_168 = _T_43 ? 2'h0 : _GEN_164; // @[Conditional.scala 39:67]
  wire  _GEN_169 = _T_43 | _T_44; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_171 = _T_43 ? _GEN_158 : 2'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_172 = _T_43 ? _GEN_159 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_173 = _T_43 ? _GEN_160 : s; // @[Conditional.scala 39:67]
  wire  _GEN_174 = _T_43 & _GEN_161; // @[Conditional.scala 39:67]
  wire  _GEN_175 = _T_43 ? _GEN_162 : _GEN_17; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_177 = _T_35 ? _GEN_155 : _GEN_171; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_178 = _T_35 ? _GEN_156 : _GEN_172; // @[Conditional.scala 39:67]
  wire  _GEN_179 = _T_35 ? 1'h0 : _GEN_173; // @[Conditional.scala 39:67]
  wire  _GEN_180 = _T_35 | _GEN_174; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_182 = _T_35 ? 2'h0 : _GEN_168; // @[Conditional.scala 39:67]
  wire  _GEN_183 = _T_35 ? 1'h0 : _GEN_169; // @[Conditional.scala 39:67]
  wire  _GEN_184 = _T_35 ? _GEN_7 : _GEN_175; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_187 = _T_34 ? 2'h0 : _GEN_177; // @[Conditional.scala 40:58]
  wire [3:0] _GEN_188 = _T_34 ? _GEN_3 : _GEN_178; // @[Conditional.scala 40:58]
  wire  _GEN_189 = _T_34 ? s : _GEN_179; // @[Conditional.scala 40:58]
  wire  _GEN_190 = _T_34 ? 1'h0 : _GEN_180; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_192 = _T_34 ? 2'h0 : _GEN_182; // @[Conditional.scala 40:58]
  wire  _GEN_193 = _T_34 ? 1'h0 : _GEN_183; // @[Conditional.scala 40:58]
  wire  _GEN_194 = _T_34 ? _GEN_7 : _GEN_184; // @[Conditional.scala 40:58]
  wire  _GEN_231 = s ? _T_34 : _T_34; // @[Controller.scala 235:34]
  wire [1:0] _GEN_233 = s ? _GEN_187 : _GEN_187; // @[Controller.scala 235:34]
  wire [3:0] _GEN_234 = s ? _GEN_188 : _GEN_188; // @[Controller.scala 235:34]
  wire  _GEN_235 = s ? _GEN_189 : _GEN_189; // @[Controller.scala 235:34]
  wire  _GEN_236 = s ? _GEN_190 : _GEN_190; // @[Controller.scala 235:34]
  wire  _GEN_237 = s & _GEN_37; // @[Controller.scala 235:34]
  wire [1:0] _GEN_238 = s ? _GEN_192 : _GEN_192; // @[Controller.scala 235:34]
  wire  _GEN_239 = s ? _GEN_193 : _GEN_40; // @[Controller.scala 235:34]
  wire  _GEN_240 = s ? _GEN_194 : _GEN_194; // @[Controller.scala 235:34]
  wire  _GEN_241 = s ? 1'h0 : _T_34; // @[Controller.scala 235:34]
  wire  _GEN_242 = s ? 1'h0 : _GEN_37; // @[Controller.scala 235:34]
  wire  _GEN_244 = io_ir[22] ? 1'h0 : _GEN_231; // @[Controller.scala 232:30]
  wire [1:0] _GEN_246 = io_ir[22] ? 2'h0 : _GEN_233; // @[Controller.scala 232:30]
  wire [3:0] _GEN_247 = io_ir[22] ? _GEN_3 : _GEN_234; // @[Controller.scala 232:30]
  wire  _GEN_248 = io_ir[22] ? s : _GEN_235; // @[Controller.scala 232:30]
  wire  _GEN_249 = io_ir[22] ? 1'h0 : _GEN_236; // @[Controller.scala 232:30]
  wire  _GEN_250 = io_ir[22] ? 1'h0 : _GEN_237; // @[Controller.scala 232:30]
  wire [1:0] _GEN_251 = io_ir[22] ? 2'h0 : _GEN_238; // @[Controller.scala 232:30]
  wire  _GEN_252 = io_ir[22] ? 1'h0 : _GEN_239; // @[Controller.scala 232:30]
  wire  _GEN_253 = io_ir[22] ? _GEN_7 : _GEN_240; // @[Controller.scala 232:30]
  wire  _GEN_254 = io_ir[22] ? 1'h0 : _GEN_241; // @[Controller.scala 232:30]
  wire  _GEN_255 = io_ir[22] ? 1'h0 : _GEN_242; // @[Controller.scala 232:30]
  wire  _T_89 = 3'h3 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_94 = io_ir[22] | io_ir[4]; // @[Controller.scala 357:29]
  wire  _T_98 = rn == rd; // @[Controller.scala 362:32]
  wire  _T_99 = W & _T_98; // @[Controller.scala 362:26]
  wire [2:0] _GEN_256 = P ? type0 : 3'h0; // @[Controller.scala 373:25]
  wire [2:0] _GEN_257 = P ? 3'h0 : type0; // @[Controller.scala 394:25]
  wire [2:0] _GEN_267 = _T_43 ? _GEN_257 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_273 = _T_35 ? _GEN_256 : _GEN_267; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_283 = _T_34 ? 3'h0 : _GEN_273; // @[Conditional.scala 40:58]
  wire  _GEN_292 = _T_99 ? 1'h0 : _T_34; // @[Controller.scala 362:40]
  wire [2:0] _GEN_294 = _T_99 ? 3'h0 : _GEN_283; // @[Controller.scala 362:40]
  wire [3:0] _GEN_295 = _T_99 ? _GEN_3 : _GEN_188; // @[Controller.scala 362:40]
  wire  _GEN_296 = _T_99 ? s : _GEN_189; // @[Controller.scala 362:40]
  wire  _GEN_297 = _T_99 ? 1'h0 : _GEN_190; // @[Controller.scala 362:40]
  wire  _GEN_298 = _T_99 ? 1'h0 : _GEN_37; // @[Controller.scala 362:40]
  wire [1:0] _GEN_299 = _T_99 ? 2'h0 : _GEN_192; // @[Controller.scala 362:40]
  wire  _GEN_300 = _T_99 ? 1'h0 : _GEN_193; // @[Controller.scala 362:40]
  wire  _GEN_301 = _T_99 ? _GEN_7 : _GEN_194; // @[Controller.scala 362:40]
  wire  _GEN_340 = s & _T_99; // @[Controller.scala 360:32]
  wire  _GEN_341 = s ? _GEN_292 : _T_34; // @[Controller.scala 360:32]
  wire [2:0] _GEN_343 = s ? _GEN_294 : _GEN_283; // @[Controller.scala 360:32]
  wire [3:0] _GEN_344 = s ? _GEN_295 : _GEN_188; // @[Controller.scala 360:32]
  wire  _GEN_345 = s ? _GEN_296 : _GEN_189; // @[Controller.scala 360:32]
  wire  _GEN_346 = s ? _GEN_297 : _GEN_190; // @[Controller.scala 360:32]
  wire  _GEN_347 = s & _GEN_298; // @[Controller.scala 360:32]
  wire [1:0] _GEN_348 = s ? _GEN_299 : _GEN_192; // @[Controller.scala 360:32]
  wire  _GEN_349 = s ? _GEN_300 : _GEN_40; // @[Controller.scala 360:32]
  wire  _GEN_350 = s ? _GEN_301 : _GEN_194; // @[Controller.scala 360:32]
  wire  _GEN_354 = _T_94 | _GEN_340; // @[Controller.scala 357:49]
  wire  _GEN_355 = _T_94 ? 1'h0 : _GEN_341; // @[Controller.scala 357:49]
  wire [2:0] _GEN_357 = _T_94 ? 3'h0 : _GEN_343; // @[Controller.scala 357:49]
  wire [3:0] _GEN_358 = _T_94 ? _GEN_3 : _GEN_344; // @[Controller.scala 357:49]
  wire  _GEN_359 = _T_94 ? s : _GEN_345; // @[Controller.scala 357:49]
  wire  _GEN_360 = _T_94 ? 1'h0 : _GEN_346; // @[Controller.scala 357:49]
  wire  _GEN_361 = _T_94 ? 1'h0 : _GEN_347; // @[Controller.scala 357:49]
  wire [1:0] _GEN_362 = _T_94 ? 2'h0 : _GEN_348; // @[Controller.scala 357:49]
  wire  _GEN_363 = _T_94 ? 1'h0 : _GEN_349; // @[Controller.scala 357:49]
  wire  _GEN_364 = _T_94 ? _GEN_7 : _GEN_350; // @[Controller.scala 357:49]
  wire  _GEN_365 = _T_94 ? 1'h0 : _GEN_241; // @[Controller.scala 357:49]
  wire  _GEN_366 = _T_94 ? 1'h0 : _GEN_242; // @[Controller.scala 357:49]
  wire  _T_114 = 3'h5 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_116 = ~P; // @[Controller.scala 499:22]
  wire [1:0] _GEN_369 = _T_35 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_372 = _T_34 ? 4'h4 : _GEN_3; // @[Conditional.scala 40:58]
  wire  _GEN_373 = _T_34 ? 1'h0 : s; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_375 = _T_34 ? 2'h0 : _GEN_369; // @[Conditional.scala 40:58]
  wire  _GEN_377 = _T_43 | _T_15; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_378 = _T_43 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_381 = _T_35 ? 4'h4 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_383 = _T_35 ? _T_15 : _GEN_377; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_384 = _T_35 ? 2'h0 : _GEN_378; // @[Conditional.scala 39:67]
  wire  _GEN_386 = _T_34 | _T_35; // @[Conditional.scala 40:58]
  wire [3:0] _GEN_387 = _T_34 ? 4'h8 : _GEN_381; // @[Conditional.scala 40:58]
  wire  _GEN_388 = _T_34 ? 1'h0 : _GEN_25; // @[Conditional.scala 40:58]
  wire  _GEN_390 = _T_34 ? _T_15 : _GEN_383; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_391 = _T_34 ? 2'h0 : _GEN_384; // @[Conditional.scala 40:58]
  wire  _GEN_393 = _T_116 ? _T_34 : _GEN_386; // @[Controller.scala 499:31]
  wire  _GEN_394 = _T_116 ? _T_34 : _GEN_13; // @[Controller.scala 499:31]
  wire [3:0] _GEN_395 = _T_116 ? _GEN_372 : _GEN_387; // @[Controller.scala 499:31]
  wire  _GEN_396 = _T_116 ? _GEN_373 : _GEN_388; // @[Controller.scala 499:31]
  wire  _GEN_397 = _T_116 ? _GEN_12 : _GEN_390; // @[Controller.scala 499:31]
  wire [1:0] _GEN_398 = _T_116 ? _GEN_375 : _GEN_391; // @[Controller.scala 499:31]
  wire  _GEN_399 = _T_116 ? _GEN_14 : _GEN_50; // @[Controller.scala 499:31]
  wire  _GEN_400 = _T_116 ? 1'h0 : _GEN_13; // @[Controller.scala 499:31]
  wire  _T_122 = 3'h4 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_126 = ~io_ir[22]; // @[Controller.scala 549:37]
  wire  _T_127 = io_ir[15] & _T_126; // @[Controller.scala 549:24]
  wire [1:0] _T_145 = Reg_list[0] + Reg_list[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_147 = Reg_list[2] + Reg_list[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_149 = _T_145 + _T_147; // @[Bitwise.scala 47:55]
  wire [1:0] _T_151 = Reg_list[4] + Reg_list[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_153 = Reg_list[6] + Reg_list[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_155 = _T_151 + _T_153; // @[Bitwise.scala 47:55]
  wire [3:0] _T_157 = _T_149 + _T_155; // @[Bitwise.scala 47:55]
  wire [1:0] _T_159 = Reg_list[8] + Reg_list[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_161 = Reg_list[10] + Reg_list[11]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_163 = _T_159 + _T_161; // @[Bitwise.scala 47:55]
  wire [1:0] _T_165 = Reg_list[12] + Reg_list[13]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_167 = Reg_list[14] + Reg_list[15]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_169 = _T_165 + _T_167; // @[Bitwise.scala 47:55]
  wire [3:0] _T_171 = _T_163 + _T_169; // @[Bitwise.scala 47:55]
  wire [4:0] _T_173 = _T_157 + _T_171; // @[Bitwise.scala 47:55]
  wire  _T_175 = _T_173 <= 5'h1; // @[Controller.scala 552:55]
  wire  _T_176 = _T_1 | _T_175; // @[Controller.scala 552:33]
  wire  _T_177 = io_state == 4'h1; // @[Controller.scala 556:25]
  wire  _T_178 = io_state == 4'h2; // @[Controller.scala 561:32]
  wire  _T_179 = io_state >= 4'h3; // @[Controller.scala 568:32]
  wire [1:0] _T_196 = io_ir[1] + io_ir[2]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_671 = {{1'd0}, io_ir[0]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_198 = _GEN_671 + _T_196; // @[Bitwise.scala 47:55]
  wire [1:0] _T_200 = io_ir[3] + io_ir[4]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_202 = io_ir[5] + io_ir[6]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_204 = _T_200 + _T_202; // @[Bitwise.scala 47:55]
  wire [2:0] _GEN_672 = {{1'd0}, _T_198[1:0]}; // @[Bitwise.scala 47:55]
  wire [3:0] _T_206 = _GEN_672 + _T_204; // @[Bitwise.scala 47:55]
  wire [1:0] _T_208 = io_ir[7] + io_ir[8]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_210 = io_ir[9] + io_ir[10]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_212 = _T_208 + _T_210; // @[Bitwise.scala 47:55]
  wire [1:0] _T_214 = io_ir[11] + io_ir[12]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_216 = io_ir[13] + io_ir[14]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_218 = _T_214 + _T_216; // @[Bitwise.scala 47:55]
  wire [3:0] _T_220 = _T_212 + _T_218; // @[Bitwise.scala 47:55]
  wire [3:0] _GEN_673 = {{1'd0}, _T_206[2:0]}; // @[Bitwise.scala 47:55]
  wire [4:0] _T_222 = _GEN_673 + _T_220; // @[Bitwise.scala 47:55]
  wire [3:0] _T_225 = _T_222[3:0] + 4'h2; // @[Controller.scala 568:77]
  wire  _T_226 = io_state <= _T_225; // @[Controller.scala 568:51]
  wire  _T_227 = _T_179 & _T_226; // @[Controller.scala 568:39]
  wire [3:0] _T_273 = _T_222[3:0] + 4'h3; // @[Controller.scala 577:59]
  wire  _T_274 = io_state == _T_273; // @[Controller.scala 577:32]
  wire [3:0] _T_320 = _T_222[3:0] + 4'h4; // @[Controller.scala 580:59]
  wire  _T_321 = io_state == _T_320; // @[Controller.scala 580:32]
  wire [3:0] _T_370 = _T_222[3:0] + 4'h5; // @[Controller.scala 595:59]
  wire  _T_371 = io_state == _T_370; // @[Controller.scala 595:32]
  wire [1:0] _GEN_403 = _T_371 ? 2'h2 : 2'h0; // @[Controller.scala 595:66]
  wire  _GEN_405 = _T_371 | _GEN_7; // @[Controller.scala 595:66]
  wire [1:0] _GEN_407 = _T_321 ? 2'h3 : 2'h0; // @[Controller.scala 580:66]
  wire [3:0] _GEN_408 = _T_321 ? {{1'd0}, _GEN_153} : _GEN_3; // @[Controller.scala 580:66]
  wire  _GEN_409 = _T_321 ? 1'h0 : s; // @[Controller.scala 580:66]
  wire  _GEN_411 = _T_321 ? _GEN_162 : _GEN_405; // @[Controller.scala 580:66]
  wire [1:0] _GEN_413 = _T_321 ? 2'h0 : _GEN_403; // @[Controller.scala 580:66]
  wire  _GEN_414 = _T_321 ? 1'h0 : _T_371; // @[Controller.scala 580:66]
  wire [1:0] _GEN_416 = _T_274 ? 2'h0 : _GEN_407; // @[Controller.scala 577:66]
  wire [3:0] _GEN_417 = _T_274 ? _GEN_3 : _GEN_408; // @[Controller.scala 577:66]
  wire  _GEN_418 = _T_274 ? s : _GEN_409; // @[Controller.scala 577:66]
  wire  _GEN_419 = _T_274 ? 1'h0 : _T_321; // @[Controller.scala 577:66]
  wire  _GEN_420 = _T_274 ? _GEN_7 : _GEN_411; // @[Controller.scala 577:66]
  wire [1:0] _GEN_422 = _T_274 ? 2'h0 : _GEN_413; // @[Controller.scala 577:66]
  wire  _GEN_423 = _T_274 ? 1'h0 : _GEN_414; // @[Controller.scala 577:66]
  wire [2:0] _GEN_425 = _T_227 ? 3'h4 : {{1'd0}, _GEN_416}; // @[Controller.scala 568:84]
  wire [3:0] _GEN_426 = _T_227 ? 4'h4 : _GEN_417; // @[Controller.scala 568:84]
  wire  _GEN_427 = _T_227 ? 1'h0 : _GEN_418; // @[Controller.scala 568:84]
  wire  _GEN_428 = _T_227 | _GEN_419; // @[Controller.scala 568:84]
  wire [1:0] _GEN_429 = _T_227 ? 2'h2 : 2'h0; // @[Controller.scala 568:84]
  wire [1:0] _GEN_430 = _T_227 ? 2'h0 : _GEN_422; // @[Controller.scala 568:84]
  wire  _GEN_431 = _T_227 | _GEN_423; // @[Controller.scala 568:84]
  wire  _GEN_432 = _T_227 ? _GEN_7 : _GEN_420; // @[Controller.scala 568:84]
  wire  _GEN_433 = _T_178 ? 1'h0 : _T_227; // @[Controller.scala 561:41]
  wire [2:0] _GEN_434 = _T_178 ? 3'h3 : _GEN_425; // @[Controller.scala 561:41]
  wire [3:0] _GEN_435 = _T_178 ? 4'ha : _GEN_426; // @[Controller.scala 561:41]
  wire  _GEN_436 = _T_178 ? 1'h0 : _GEN_427; // @[Controller.scala 561:41]
  wire  _GEN_437 = _T_178 | _GEN_428; // @[Controller.scala 561:41]
  wire [1:0] _GEN_438 = _T_178 ? 2'h0 : _GEN_429; // @[Controller.scala 561:41]
  wire [1:0] _GEN_439 = _T_178 ? 2'h0 : _GEN_430; // @[Controller.scala 561:41]
  wire  _GEN_440 = _T_178 ? 1'h0 : _GEN_431; // @[Controller.scala 561:41]
  wire  _GEN_441 = _T_178 ? _GEN_7 : _GEN_432; // @[Controller.scala 561:41]
  wire  _GEN_443 = _T_177 ? 1'h0 : _GEN_433; // @[Controller.scala 556:34]
  wire [2:0] _GEN_444 = _T_177 ? 3'h0 : _GEN_434; // @[Controller.scala 556:34]
  wire [3:0] _GEN_445 = _T_177 ? _GEN_3 : _GEN_435; // @[Controller.scala 556:34]
  wire  _GEN_446 = _T_177 ? s : _GEN_436; // @[Controller.scala 556:34]
  wire  _GEN_447 = _T_177 ? 1'h0 : _GEN_437; // @[Controller.scala 556:34]
  wire [1:0] _GEN_448 = _T_177 ? 2'h0 : _GEN_438; // @[Controller.scala 556:34]
  wire [1:0] _GEN_449 = _T_177 ? 2'h0 : _GEN_439; // @[Controller.scala 556:34]
  wire  _GEN_450 = _T_177 ? 1'h0 : _GEN_440; // @[Controller.scala 556:34]
  wire  _GEN_451 = _T_177 ? _GEN_7 : _GEN_441; // @[Controller.scala 556:34]
  wire  _GEN_453 = _T_176 ? 1'h0 : _T_177; // @[Controller.scala 552:63]
  wire  _GEN_454 = _T_176 ? 1'h0 : _GEN_443; // @[Controller.scala 552:63]
  wire [2:0] _GEN_455 = _T_176 ? 3'h0 : _GEN_444; // @[Controller.scala 552:63]
  wire [3:0] _GEN_456 = _T_176 ? _GEN_3 : _GEN_445; // @[Controller.scala 552:63]
  wire  _GEN_457 = _T_176 ? s : _GEN_446; // @[Controller.scala 552:63]
  wire  _GEN_458 = _T_176 ? 1'h0 : _GEN_447; // @[Controller.scala 552:63]
  wire [1:0] _GEN_459 = _T_176 ? 2'h0 : _GEN_448; // @[Controller.scala 552:63]
  wire [1:0] _GEN_460 = _T_176 ? 2'h0 : _GEN_449; // @[Controller.scala 552:63]
  wire  _GEN_461 = _T_176 ? 1'h0 : _GEN_450; // @[Controller.scala 552:63]
  wire  _GEN_462 = _T_176 ? _GEN_7 : _GEN_451; // @[Controller.scala 552:63]
  wire  _GEN_463 = _T_127 | _T_176; // @[Controller.scala 549:50]
  wire  _GEN_464 = _T_127 ? 1'h0 : _GEN_453; // @[Controller.scala 549:50]
  wire  _GEN_465 = _T_127 ? 1'h0 : _GEN_454; // @[Controller.scala 549:50]
  wire [2:0] _GEN_466 = _T_127 ? 3'h0 : _GEN_455; // @[Controller.scala 549:50]
  wire [3:0] _GEN_467 = _T_127 ? _GEN_3 : _GEN_456; // @[Controller.scala 549:50]
  wire  _GEN_468 = _T_127 ? s : _GEN_457; // @[Controller.scala 549:50]
  wire  _GEN_469 = _T_127 ? 1'h0 : _GEN_458; // @[Controller.scala 549:50]
  wire [1:0] _GEN_470 = _T_127 ? 2'h0 : _GEN_459; // @[Controller.scala 549:50]
  wire [1:0] _GEN_471 = _T_127 ? 2'h0 : _GEN_460; // @[Controller.scala 549:50]
  wire  _GEN_472 = _T_127 ? 1'h0 : _GEN_461; // @[Controller.scala 549:50]
  wire  _GEN_473 = _T_127 ? _GEN_7 : _GEN_462; // @[Controller.scala 549:50]
  wire [4:0] _T_471 = _T_173 + 5'h1; // @[Controller.scala 622:72]
  wire [4:0] _GEN_683 = {{1'd0}, io_state}; // @[Controller.scala 622:50]
  wire  _T_472 = _GEN_683 <= _T_471; // @[Controller.scala 622:50]
  wire  _T_473 = _T_179 & _T_472; // @[Controller.scala 622:38]
  wire [4:0] _T_521 = _T_173 + 5'h2; // @[Controller.scala 635:54]
  wire  _T_522 = _GEN_683 == _T_521; // @[Controller.scala 635:31]
  wire [4:0] _T_570 = _T_173 + 5'h3; // @[Controller.scala 639:54]
  wire  _T_571 = _GEN_683 == _T_570; // @[Controller.scala 639:31]
  wire [4:0] _T_622 = _T_173 + 5'h4; // @[Controller.scala 654:54]
  wire  _T_623 = _GEN_683 == _T_622; // @[Controller.scala 654:31]
  wire [1:0] _GEN_476 = _T_623 ? 2'h2 : 2'h0; // @[Controller.scala 654:61]
  wire  _GEN_478 = _T_623 | _GEN_7; // @[Controller.scala 654:61]
  wire [1:0] _GEN_480 = _T_571 ? 2'h3 : 2'h0; // @[Controller.scala 639:61]
  wire [3:0] _GEN_481 = _T_571 ? {{1'd0}, _GEN_153} : _GEN_3; // @[Controller.scala 639:61]
  wire  _GEN_482 = _T_571 ? 1'h0 : s; // @[Controller.scala 639:61]
  wire  _GEN_484 = _T_571 ? _GEN_162 : _GEN_478; // @[Controller.scala 639:61]
  wire [1:0] _GEN_486 = _T_571 ? 2'h0 : _GEN_476; // @[Controller.scala 639:61]
  wire  _GEN_487 = _T_571 ? 1'h0 : _T_623; // @[Controller.scala 639:61]
  wire [1:0] _GEN_490 = _T_522 ? 2'h0 : _GEN_480; // @[Controller.scala 635:61]
  wire [3:0] _GEN_491 = _T_522 ? _GEN_3 : _GEN_481; // @[Controller.scala 635:61]
  wire  _GEN_492 = _T_522 ? s : _GEN_482; // @[Controller.scala 635:61]
  wire  _GEN_493 = _T_522 ? 1'h0 : _T_571; // @[Controller.scala 635:61]
  wire  _GEN_494 = _T_522 ? _GEN_7 : _GEN_484; // @[Controller.scala 635:61]
  wire [1:0] _GEN_496 = _T_522 ? 2'h0 : _GEN_486; // @[Controller.scala 635:61]
  wire  _GEN_497 = _T_522 ? 1'h0 : _GEN_487; // @[Controller.scala 635:61]
  wire [1:0] _GEN_499 = _T_473 ? 2'h2 : 2'h0; // @[Controller.scala 622:79]
  wire [2:0] _GEN_500 = _T_473 ? 3'h4 : {{1'd0}, _GEN_490}; // @[Controller.scala 622:79]
  wire [3:0] _GEN_501 = _T_473 ? 4'h4 : _GEN_491; // @[Controller.scala 622:79]
  wire  _GEN_502 = _T_473 ? 1'h0 : _GEN_492; // @[Controller.scala 622:79]
  wire  _GEN_503 = _T_473 | _GEN_493; // @[Controller.scala 622:79]
  wire  _GEN_504 = _T_473 | _T_522; // @[Controller.scala 622:79]
  wire  _GEN_505 = _T_473 ? _GEN_7 : _GEN_494; // @[Controller.scala 622:79]
  wire [1:0] _GEN_507 = _T_473 ? 2'h0 : _GEN_496; // @[Controller.scala 622:79]
  wire  _GEN_508 = _T_473 ? 1'h0 : _GEN_497; // @[Controller.scala 622:79]
  wire  _GEN_509 = _T_178 | _T_473; // @[Controller.scala 614:40]
  wire [1:0] _GEN_510 = _T_178 ? 2'h0 : _GEN_499; // @[Controller.scala 614:40]
  wire [3:0] _GEN_511 = _T_178 ? 4'h8 : _GEN_501; // @[Controller.scala 614:40]
  wire  _GEN_512 = _T_178 ? 1'h0 : _GEN_502; // @[Controller.scala 614:40]
  wire  _GEN_513 = _T_178 | _GEN_503; // @[Controller.scala 614:40]
  wire [2:0] _GEN_514 = _T_178 ? 3'h0 : _GEN_500; // @[Controller.scala 614:40]
  wire  _GEN_515 = _T_178 ? 1'h0 : _GEN_504; // @[Controller.scala 614:40]
  wire  _GEN_516 = _T_178 ? _GEN_7 : _GEN_505; // @[Controller.scala 614:40]
  wire [1:0] _GEN_518 = _T_178 ? 2'h0 : _GEN_507; // @[Controller.scala 614:40]
  wire  _GEN_519 = _T_178 ? 1'h0 : _GEN_508; // @[Controller.scala 614:40]
  wire  _GEN_521 = _T_177 | _GEN_509; // @[Controller.scala 609:34]
  wire [1:0] _GEN_522 = _T_177 ? 2'h0 : _GEN_510; // @[Controller.scala 609:34]
  wire [3:0] _GEN_523 = _T_177 ? _GEN_3 : _GEN_511; // @[Controller.scala 609:34]
  wire  _GEN_524 = _T_177 ? s : _GEN_512; // @[Controller.scala 609:34]
  wire  _GEN_525 = _T_177 ? 1'h0 : _GEN_513; // @[Controller.scala 609:34]
  wire  _GEN_526 = _T_177 ? 1'h0 : _GEN_509; // @[Controller.scala 609:34]
  wire [2:0] _GEN_527 = _T_177 ? 3'h0 : _GEN_514; // @[Controller.scala 609:34]
  wire  _GEN_528 = _T_177 ? 1'h0 : _GEN_515; // @[Controller.scala 609:34]
  wire  _GEN_529 = _T_177 ? _GEN_7 : _GEN_516; // @[Controller.scala 609:34]
  wire [1:0] _GEN_531 = _T_177 ? 2'h0 : _GEN_518; // @[Controller.scala 609:34]
  wire  _GEN_532 = _T_177 ? 1'h0 : _GEN_519; // @[Controller.scala 609:34]
  wire  _GEN_535 = _T_176 ? 1'h0 : _GEN_521; // @[Controller.scala 605:56]
  wire [1:0] _GEN_536 = _T_176 ? 2'h0 : _GEN_522; // @[Controller.scala 605:56]
  wire [3:0] _GEN_537 = _T_176 ? _GEN_3 : _GEN_523; // @[Controller.scala 605:56]
  wire  _GEN_538 = _T_176 ? s : _GEN_524; // @[Controller.scala 605:56]
  wire  _GEN_539 = _T_176 ? 1'h0 : _GEN_525; // @[Controller.scala 605:56]
  wire  _GEN_540 = _T_176 ? 1'h0 : _GEN_526; // @[Controller.scala 605:56]
  wire [2:0] _GEN_541 = _T_176 ? 3'h0 : _GEN_527; // @[Controller.scala 605:56]
  wire  _GEN_542 = _T_176 ? 1'h0 : _GEN_528; // @[Controller.scala 605:56]
  wire  _GEN_543 = _T_176 ? _GEN_7 : _GEN_529; // @[Controller.scala 605:56]
  wire [1:0] _GEN_545 = _T_176 ? 2'h0 : _GEN_531; // @[Controller.scala 605:56]
  wire  _GEN_546 = _T_176 ? 1'h0 : _GEN_532; // @[Controller.scala 605:56]
  wire  _GEN_547 = s ? _GEN_463 : _T_176; // @[Controller.scala 547:23]
  wire  _GEN_548 = s ? _GEN_464 : _GEN_453; // @[Controller.scala 547:23]
  wire  _GEN_549 = s ? _GEN_464 : _GEN_535; // @[Controller.scala 547:23]
  wire [1:0] _GEN_550 = s ? {{1'd0}, _GEN_465} : _GEN_536; // @[Controller.scala 547:23]
  wire [2:0] _GEN_551 = s ? _GEN_466 : _GEN_541; // @[Controller.scala 547:23]
  wire [3:0] _GEN_552 = s ? _GEN_467 : _GEN_537; // @[Controller.scala 547:23]
  wire  _GEN_553 = s ? _GEN_468 : _GEN_538; // @[Controller.scala 547:23]
  wire  _GEN_554 = s ? _GEN_469 : _GEN_539; // @[Controller.scala 547:23]
  wire [1:0] _GEN_555 = s ? _GEN_470 : 2'h0; // @[Controller.scala 547:23]
  wire [1:0] _GEN_556 = s ? _GEN_471 : _GEN_545; // @[Controller.scala 547:23]
  wire  _GEN_557 = s ? _GEN_472 : _GEN_546; // @[Controller.scala 547:23]
  wire  _GEN_558 = s ? _GEN_473 : _GEN_543; // @[Controller.scala 547:23]
  wire  _GEN_559 = s ? 1'h0 : _GEN_540; // @[Controller.scala 547:23]
  wire  _GEN_560 = s ? 1'h0 : _GEN_542; // @[Controller.scala 547:23]
  wire  _T_624 = 3'h6 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_625 = 3'h7 == io_ir[27:25]; // @[Conditional.scala 37:30]
  wire  _T_626 = _T_624 | _T_625; // @[Conditional.scala 37:55]
  wire  _GEN_562 = _T_122 ? _GEN_547 : _T_626; // @[Conditional.scala 39:67]
  wire  _GEN_563 = _T_122 & _GEN_548; // @[Conditional.scala 39:67]
  wire  _GEN_564 = _T_122 & _GEN_549; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_565 = _T_122 ? _GEN_550 : 2'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_566 = _T_122 ? _GEN_551 : 3'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_567 = _T_122 ? _GEN_552 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_568 = _T_122 ? _GEN_553 : s; // @[Conditional.scala 39:67]
  wire  _GEN_569 = _T_122 & _GEN_554; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_570 = _T_122 ? _GEN_555 : 2'h0; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_571 = _T_122 ? _GEN_556 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_572 = _T_122 & _GEN_557; // @[Conditional.scala 39:67]
  wire  _GEN_573 = _T_122 ? _GEN_558 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_574 = _T_122 & _GEN_559; // @[Conditional.scala 39:67]
  wire  _GEN_575 = _T_122 & _GEN_560; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_576 = _T_114 ? {{1'd0}, _GEN_393} : _GEN_565; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_577 = _T_114 ? {{2'd0}, _GEN_394} : _GEN_566; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_578 = _T_114 ? _GEN_395 : _GEN_567; // @[Conditional.scala 39:67]
  wire  _GEN_579 = _T_114 ? _GEN_396 : _GEN_568; // @[Conditional.scala 39:67]
  wire  _GEN_580 = _T_114 ? _GEN_393 : _GEN_569; // @[Conditional.scala 39:67]
  wire  _GEN_581 = _T_114 ? _GEN_397 : _T_15; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_582 = _T_114 ? _GEN_398 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_583 = _T_114 ? _GEN_399 : _GEN_573; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_584 = _T_114 ? {{1'd0}, _GEN_400} : _GEN_571; // @[Conditional.scala 39:67]
  wire  _GEN_585 = _T_114 ? _GEN_400 : _GEN_572; // @[Conditional.scala 39:67]
  wire  _GEN_586 = _T_114 ? 1'h0 : _GEN_562; // @[Conditional.scala 39:67]
  wire  _GEN_587 = _T_114 ? 1'h0 : _GEN_563; // @[Conditional.scala 39:67]
  wire  _GEN_588 = _T_114 ? 1'h0 : _GEN_564; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_589 = _T_114 ? 2'h0 : _GEN_570; // @[Conditional.scala 39:67]
  wire  _GEN_590 = _T_114 ? 1'h0 : _GEN_574; // @[Conditional.scala 39:67]
  wire  _GEN_591 = _T_114 ? 1'h0 : _GEN_575; // @[Conditional.scala 39:67]
  wire  _GEN_592 = _T_89 ? _GEN_354 : _GEN_586; // @[Conditional.scala 39:67]
  wire  _GEN_593 = _T_89 ? _GEN_355 : _GEN_587; // @[Conditional.scala 39:67]
  wire  _GEN_594 = _T_89 ? _GEN_355 : _GEN_588; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_596 = _T_89 ? _GEN_357 : 3'h0; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_597 = _T_89 ? 2'h0 : _GEN_576; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_598 = _T_89 ? 3'h0 : _GEN_577; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_599 = _T_89 ? _GEN_358 : _GEN_578; // @[Conditional.scala 39:67]
  wire  _GEN_600 = _T_89 ? _GEN_359 : _GEN_579; // @[Conditional.scala 39:67]
  wire  _GEN_601 = _T_89 ? _GEN_360 : _GEN_580; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_602 = _T_89 ? {{1'd0}, _GEN_361} : _GEN_589; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_603 = _T_89 ? _GEN_362 : _GEN_584; // @[Conditional.scala 39:67]
  wire  _GEN_604 = _T_89 ? _GEN_363 : _GEN_585; // @[Conditional.scala 39:67]
  wire  _GEN_605 = _T_89 ? _GEN_364 : _GEN_583; // @[Conditional.scala 39:67]
  wire  _GEN_606 = _T_89 ? _GEN_365 : _GEN_590; // @[Conditional.scala 39:67]
  wire  _GEN_607 = _T_89 ? _GEN_366 : _GEN_591; // @[Conditional.scala 39:67]
  wire  _GEN_608 = _T_89 ? 1'h0 : _GEN_591; // @[Conditional.scala 39:67]
  wire  _GEN_609 = _T_89 ? _T_15 : _GEN_581; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_610 = _T_89 ? 2'h0 : _GEN_582; // @[Conditional.scala 39:67]
  wire  _GEN_611 = _T_70 ? io_ir[22] : _GEN_592; // @[Conditional.scala 39:67]
  wire  _GEN_612 = _T_70 ? _GEN_244 : _GEN_593; // @[Conditional.scala 39:67]
  wire  _GEN_613 = _T_70 ? _GEN_244 : _GEN_594; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_614 = _T_70 ? 2'h0 : _GEN_597; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_615 = _T_70 ? {{1'd0}, _GEN_246} : _GEN_598; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_616 = _T_70 ? _GEN_247 : _GEN_599; // @[Conditional.scala 39:67]
  wire  _GEN_617 = _T_70 ? _GEN_248 : _GEN_600; // @[Conditional.scala 39:67]
  wire  _GEN_618 = _T_70 ? _GEN_249 : _GEN_601; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_619 = _T_70 ? {{1'd0}, _GEN_250} : _GEN_602; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_620 = _T_70 ? _GEN_251 : _GEN_603; // @[Conditional.scala 39:67]
  wire  _GEN_621 = _T_70 ? _GEN_252 : _GEN_604; // @[Conditional.scala 39:67]
  wire  _GEN_622 = _T_70 ? _GEN_253 : _GEN_605; // @[Conditional.scala 39:67]
  wire  _GEN_623 = _T_70 ? _GEN_254 : _GEN_606; // @[Conditional.scala 39:67]
  wire  _GEN_624 = _T_70 ? _GEN_255 : _GEN_607; // @[Conditional.scala 39:67]
  wire  _GEN_625 = _T_70 ? _GEN_255 : _GEN_608; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_627 = _T_70 ? 3'h0 : _GEN_596; // @[Conditional.scala 39:67]
  wire  _GEN_628 = _T_70 ? _T_15 : _GEN_609; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_629 = _T_70 ? 2'h0 : _GEN_610; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_630 = _T_62 ? _GEN_145 : _GEN_627; // @[Conditional.scala 39:67]
  wire  _GEN_631 = _T_62 & _T_66; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_632 = _T_62 ? _GEN_147 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_633 = _T_62 ? _GEN_148 : _GEN_612; // @[Conditional.scala 39:67]
  wire  _GEN_634 = _T_62 ? _GEN_148 : _GEN_613; // @[Conditional.scala 39:67]
  wire  _GEN_635 = _T_62 ? _GEN_149 : _GEN_618; // @[Conditional.scala 39:67]
  wire  _GEN_636 = _T_62 ? _GEN_150 : _GEN_621; // @[Conditional.scala 39:67]
  wire  _GEN_637 = _T_62 ? _GEN_151 : _GEN_622; // @[Conditional.scala 39:67]
  wire  _GEN_638 = _T_62 ? _GEN_152 : _GEN_611; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_639 = _T_62 ? 2'h0 : _GEN_614; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_640 = _T_62 ? 3'h0 : _GEN_615; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_641 = _T_62 ? _GEN_3 : _GEN_616; // @[Conditional.scala 39:67]
  wire  _GEN_642 = _T_62 ? s : _GEN_617; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_643 = _T_62 ? 2'h0 : _GEN_619; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_644 = _T_62 ? 2'h0 : _GEN_620; // @[Conditional.scala 39:67]
  wire  _GEN_645 = _T_62 ? 1'h0 : _GEN_623; // @[Conditional.scala 39:67]
  wire  _GEN_646 = _T_62 ? 1'h0 : _GEN_624; // @[Conditional.scala 39:67]
  wire  _GEN_647 = _T_62 ? 1'h0 : _GEN_625; // @[Conditional.scala 39:67]
  wire  _GEN_648 = _T_62 ? _T_15 : _GEN_628; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_649 = _T_62 ? 2'h0 : _GEN_629; // @[Conditional.scala 39:67]
  wire  _GEN_650 = _T_18 ? _GEN_120 : _GEN_637; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_659 = _T_18 ? {{1'd0}, _GEN_128} : _GEN_643; // @[Conditional.scala 40:58]
  wire  und_ins = _T_18 ? _GEN_135 : _GEN_638; // @[Conditional.scala 40:58]
  assign io_done = und_ins | _GEN_650; // @[Controller.scala 60:11 Controller.scala 100:15 Controller.scala 110:17 Controller.scala 113:17 Controller.scala 127:21 Controller.scala 153:21 Controller.scala 173:21 Controller.scala 193:21 Controller.scala 222:21 Controller.scala 283:25 Controller.scala 290:23 Controller.scala 341:25 Controller.scala 348:23 Controller.scala 418:27 Controller.scala 425:25 Controller.scala 483:25 Controller.scala 490:23 Controller.scala 513:21 Controller.scala 538:21 Controller.scala 593:23 Controller.scala 600:21 Controller.scala 652:23 Controller.scala 659:21 Controller.scala 674:13]
  assign io_aluop = _T_18 ? _GEN_125 : _GEN_641; // @[Controller.scala 65:12 Controller.scala 67:24 Controller.scala 68:24 Controller.scala 69:24 Controller.scala 70:24 Controller.scala 141:22 Controller.scala 249:28 Controller.scala 251:28 Controller.scala 257:26 Controller.scala 271:28 Controller.scala 273:28 Controller.scala 308:28 Controller.scala 310:28 Controller.scala 316:26 Controller.scala 329:28 Controller.scala 331:28 Controller.scala 380:30 Controller.scala 382:30 Controller.scala 388:28 Controller.scala 405:30 Controller.scala 407:30 Controller.scala 447:28 Controller.scala 449:28 Controller.scala 455:26 Controller.scala 471:28 Controller.scala 473:28 Controller.scala 506:22 Controller.scala 522:22 Controller.scala 529:22 Controller.scala 565:22 Controller.scala 571:22 Controller.scala 585:24 Controller.scala 587:24 Controller.scala 618:22 Controller.scala 629:22 Controller.scala 644:24 Controller.scala 646:24]
  assign io_shiftop = _T_18 ? _GEN_133 : _GEN_630; // @[Controller.scala 72:14 Controller.scala 159:20 Controller.scala 179:20 Controller.scala 207:20 Controller.scala 376:30 Controller.scala 401:30 Controller.scala 443:28 Controller.scala 467:28]
  assign io_rm_imm_s = _T_18 ? 1'h0 : _GEN_631; // @[Controller.scala 74:15 Controller.scala 208:21 Controller.scala 374:31 Controller.scala 399:31 Controller.scala 441:29 Controller.scala 465:29]
  assign io_rs_imm_s = _T_18 ? {{1'd0}, _GEN_134} : _GEN_632; // @[Controller.scala 75:15 Controller.scala 160:21 Controller.scala 180:21 Controller.scala 209:21 Controller.scala 375:31 Controller.scala 400:31 Controller.scala 442:29 Controller.scala 466:29]
  assign io_Write_PC = _T_18 ? _GEN_122 : _GEN_648; // @[Controller.scala 76:15 Controller.scala 97:17 Controller.scala 125:25 Controller.scala 511:25 Controller.scala 536:25]
  assign io_Write_IR = _T_15 & io_isSatisfy; // @[Controller.scala 77:15 Controller.scala 98:17]
  assign io_Write_Reg = _T_18 ? _GEN_130 : _GEN_636; // @[Controller.scala 78:16 Controller.scala 148:26 Controller.scala 172:26 Controller.scala 192:26 Controller.scala 221:26 Controller.scala 266:30 Controller.scala 279:30 Controller.scala 289:28 Controller.scala 347:28 Controller.scala 397:32 Controller.scala 414:32 Controller.scala 424:30 Controller.scala 489:28 Controller.scala 533:26 Controller.scala 576:26 Controller.scala 599:26 Controller.scala 658:26]
  assign io_LA = _T_18 ? _GEN_121 : _GEN_633; // @[Controller.scala 79:9 Controller.scala 120:19 Controller.scala 135:19 Controller.scala 164:19 Controller.scala 184:19 Controller.scala 213:19 Controller.scala 240:21 Controller.scala 298:21 Controller.scala 368:23 Controller.scala 434:21 Controller.scala 558:19 Controller.scala 611:19]
  assign io_LB = _T_18 ? _GEN_121 : _GEN_633; // @[Controller.scala 80:9 Controller.scala 121:19 Controller.scala 136:19 Controller.scala 165:19 Controller.scala 185:19 Controller.scala 214:19 Controller.scala 241:21 Controller.scala 299:21 Controller.scala 369:23 Controller.scala 435:21 Controller.scala 559:19 Controller.scala 612:19]
  assign io_LC = _T_18 ? _GEN_121 : _GEN_634; // @[Controller.scala 81:9 Controller.scala 122:19 Controller.scala 137:19 Controller.scala 166:19 Controller.scala 186:19 Controller.scala 215:19 Controller.scala 242:21 Controller.scala 300:21 Controller.scala 370:23 Controller.scala 436:21 Controller.scala 560:19 Controller.scala 613:19 Controller.scala 616:19 Controller.scala 626:19]
  assign io_LF = _T_18 ? _GEN_127 : _GEN_635; // @[Controller.scala 82:9 Controller.scala 143:19 Controller.scala 169:19 Controller.scala 189:19 Controller.scala 218:19 Controller.scala 254:23 Controller.scala 259:23 Controller.scala 276:23 Controller.scala 313:23 Controller.scala 318:23 Controller.scala 334:23 Controller.scala 385:25 Controller.scala 390:25 Controller.scala 410:25 Controller.scala 452:23 Controller.scala 457:23 Controller.scala 476:23 Controller.scala 508:19 Controller.scala 524:19 Controller.scala 531:19 Controller.scala 567:19 Controller.scala 573:19 Controller.scala 590:19 Controller.scala 620:19 Controller.scala 631:19 Controller.scala 649:19]
  assign io_S = _T_18 ? _GEN_126 : _GEN_642; // @[Controller.scala 83:8 Controller.scala 142:18 Controller.scala 253:22 Controller.scala 258:22 Controller.scala 275:22 Controller.scala 312:22 Controller.scala 317:22 Controller.scala 333:22 Controller.scala 384:24 Controller.scala 389:24 Controller.scala 409:24 Controller.scala 451:22 Controller.scala 456:22 Controller.scala 475:22 Controller.scala 507:18 Controller.scala 523:18 Controller.scala 530:18 Controller.scala 566:18 Controller.scala 572:18 Controller.scala 589:18 Controller.scala 619:18 Controller.scala 630:18 Controller.scala 648:18]
  assign io_PC_s = _T_18 ? {{1'd0}, _GEN_123} : _GEN_649; // @[Controller.scala 84:11 Controller.scala 126:21 Controller.scala 512:21 Controller.scala 537:21]
  assign io_ALU_A_s = _T_18 ? 2'h0 : _GEN_639; // @[Controller.scala 85:14 Controller.scala 140:24 Controller.scala 246:28 Controller.scala 256:28 Controller.scala 268:28 Controller.scala 305:28 Controller.scala 315:28 Controller.scala 326:28 Controller.scala 377:30 Controller.scala 387:30 Controller.scala 402:30 Controller.scala 444:28 Controller.scala 454:28 Controller.scala 468:28 Controller.scala 504:24 Controller.scala 521:24 Controller.scala 527:24 Controller.scala 563:24 Controller.scala 569:24 Controller.scala 582:24 Controller.scala 617:24 Controller.scala 627:24 Controller.scala 641:24]
  assign io_ALU_B_s = _T_18 ? 3'h0 : _GEN_640; // @[Controller.scala 86:14 Controller.scala 247:28 Controller.scala 269:28 Controller.scala 306:28 Controller.scala 327:28 Controller.scala 378:30 Controller.scala 403:30 Controller.scala 445:28 Controller.scala 469:28 Controller.scala 505:24 Controller.scala 528:24 Controller.scala 564:24 Controller.scala 570:24 Controller.scala 583:24 Controller.scala 628:24 Controller.scala 642:24]
  assign io_rd_s = _T_18 ? 2'h0 : _GEN_644; // @[Controller.scala 87:11 Controller.scala 147:21 Controller.scala 265:25 Controller.scala 278:25 Controller.scala 288:23 Controller.scala 346:23 Controller.scala 396:27 Controller.scala 413:27 Controller.scala 423:25 Controller.scala 488:23 Controller.scala 532:21 Controller.scala 575:21 Controller.scala 598:21 Controller.scala 657:21]
  assign io_W_Rdata_s = _GEN_659[0]; // @[Controller.scala 88:16 Controller.scala 146:26 Controller.scala 264:30 Controller.scala 277:30 Controller.scala 287:28 Controller.scala 345:28 Controller.scala 395:32 Controller.scala 412:32 Controller.scala 422:30 Controller.scala 487:28 Controller.scala 574:26 Controller.scala 597:26 Controller.scala 656:26]
  assign io_Reg_C_s = _T_18 ? 1'h0 : _GEN_645; // @[Controller.scala 89:14 Controller.scala 301:26 Controller.scala 437:26 Controller.scala 621:24 Controller.scala 633:24]
  assign io_Mem_W_s = _T_18 ? 1'h0 : _GEN_646; // @[Controller.scala 90:14 Controller.scala 151:24 Controller.scala 323:28 Controller.scala 336:28 Controller.scala 462:28 Controller.scala 478:28 Controller.scala 632:24 Controller.scala 637:24]
  assign io_Mem_Write = _T_18 ? _GEN_132 : _GEN_647; // @[Controller.scala 91:16 Controller.scala 152:26 Controller.scala 324:30 Controller.scala 337:30 Controller.scala 463:30 Controller.scala 479:30 Controller.scala 634:26 Controller.scala 638:26]
endmodule
module ALU(
  input  [31:0] io_a,
  input  [31:0] io_b,
  input  [3:0]  io_alu_op,
  input  [1:0]  io_cv_f,
  input         io_shift_cout,
  output [31:0] io_F,
  output [3:0]  io_nzcv
);
  wire  _T = 4'h0 == io_alu_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_1 = io_a & io_b; // @[ALU.scala 26:21]
  wire  _T_2 = 4'h1 == io_alu_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_3 = io_a ^ io_b; // @[ALU.scala 29:21]
  wire  _T_4 = 4'h2 == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _T_5 = io_a - io_b; // @[ALU.scala 32:21]
  wire  _T_10 = 4'h3 == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _T_11 = io_b - io_a; // @[ALU.scala 36:21]
  wire  _T_16 = 4'h4 == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _T_17 = io_a + io_b; // @[ALU.scala 40:21]
  wire  _T_20 = 4'h5 == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _GEN_26 = {{32'd0}, io_cv_f[1]}; // @[ALU.scala 44:29]
  wire [32:0] _T_24 = _T_17 + _GEN_26; // @[ALU.scala 44:29]
  wire  _T_30 = 4'h6 == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _T_35 = _T_5 + _GEN_26; // @[ALU.scala 48:29]
  wire [32:0] _T_37 = _T_35 - 33'h1; // @[ALU.scala 48:42]
  wire  _T_46 = 4'h7 == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _T_51 = _T_11 + _GEN_26; // @[ALU.scala 52:29]
  wire [32:0] _T_53 = _T_51 - 33'h1; // @[ALU.scala 52:42]
  wire  _T_62 = 4'h8 == io_alu_op; // @[Conditional.scala 37:30]
  wire  _T_63 = 4'ha == io_alu_op; // @[Conditional.scala 37:30]
  wire [32:0] _T_67 = _T_5 + 33'h4; // @[ALU.scala 59:29]
  wire  _T_73 = 4'hc == io_alu_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_74 = io_a | io_b; // @[ALU.scala 63:21]
  wire  _T_75 = 4'hd == io_alu_op; // @[Conditional.scala 37:30]
  wire  _T_76 = 4'he == io_alu_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_77 = ~io_b; // @[ALU.scala 69:24]
  wire [31:0] _T_78 = io_a & _T_77; // @[ALU.scala 69:21]
  wire  _T_79 = 4'hf == io_alu_op; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_0 = _T_79 ? _T_77 : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_1 = _T_76 ? _T_78 : _GEN_0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_75 ? io_b : _GEN_1; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_73 ? _T_74 : _GEN_2; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_4 = _T_63 ? _T_67 : {{1'd0}, _GEN_3}; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_63 & _T_67[32]; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_6 = _T_62 ? {{1'd0}, io_a} : _GEN_4; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_62 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_8 = _T_46 ? _T_53 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _GEN_9 = _T_46 ? _T_53[32] : _GEN_7; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_10 = _T_30 ? _T_37 : _GEN_8; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_30 ? _T_37[32] : _GEN_9; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_12 = _T_20 ? _T_24 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_20 ? _T_24[32] : _GEN_11; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_14 = _T_16 ? _T_17 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_16 ? _T_17[32] : _GEN_13; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_16 = _T_10 ? _T_11 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_10 ? _T_11[32] : _GEN_15; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_18 = _T_4 ? _T_5 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_4 ? _T_5[32] : _GEN_17; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_20 = _T_2 ? {{1'd0}, _T_3} : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_2 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire [32:0] _GEN_22 = _T ? {{1'd0}, _T_1} : _GEN_20; // @[Conditional.scala 40:58]
  wire  Cout = _T ? 1'h0 : _GEN_21; // @[Conditional.scala 40:58]
  wire  _T_88 = _T | _T_2; // @[Conditional.scala 37:55]
  wire  _T_89 = _T_88 | _T_73; // @[Conditional.scala 37:55]
  wire  _T_90 = _T_89 | _T_76; // @[Conditional.scala 37:55]
  wire  _T_91 = _T_90 | _T_79; // @[Conditional.scala 37:55]
  wire  _T_92 = _T_91 | _T_62; // @[Conditional.scala 37:55]
  wire  _T_93 = _T_92 | _T_75; // @[Conditional.scala 37:55]
  wire  _T_95 = io_F != 32'h0; // @[ALU.scala 83:18]
  wire  _T_96 = ~_T_95; // @[ALU.scala 83:9]
  wire [3:0] _T_100 = {io_F[31],_T_96,io_shift_cout,io_cv_f[0]}; // @[Cat.scala 30:58]
  wire  _T_108 = _T_4 | _T_10; // @[Conditional.scala 37:55]
  wire  _T_109 = _T_108 | _T_16; // @[Conditional.scala 37:55]
  wire  _T_110 = _T_109 | _T_20; // @[Conditional.scala 37:55]
  wire  _T_111 = _T_110 | _T_30; // @[Conditional.scala 37:55]
  wire  _T_112 = _T_111 | _T_46; // @[Conditional.scala 37:55]
  wire  _T_113 = _T_112 | _T_63; // @[Conditional.scala 37:55]
  wire  _T_118 = io_alu_op[1] ^ Cout; // @[ALU.scala 92:22]
  wire  _T_121 = io_a[31] ^ io_b[31]; // @[ALU.scala 93:18]
  wire  _T_123 = _T_121 ^ io_F[31]; // @[ALU.scala 93:29]
  wire  _T_124 = _T_123 ^ Cout; // @[ALU.scala 93:40]
  wire [3:0] _T_127 = {io_F[31],_T_96,_T_118,_T_124}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_24 = _T_113 ? _T_127 : 4'h0; // @[Conditional.scala 39:67]
  assign io_F = _GEN_22[31:0]; // @[ALU.scala 76:8]
  assign io_nzcv = _T_93 ? _T_100 : _GEN_24; // @[ALU.scala 98:11]
endmodule
module BarrelShifter(
  input  [31:0] io_shift_data,
  input  [7:0]  io_shift_num,
  input         io_carry_flag,
  input  [2:0]  io_shift_op,
  output [31:0] io_shift_out,
  output        io_shift_carryout
);
  wire  _T = io_shift_num == 8'h0; // @[BarrelShifter.scala 19:21]
  wire  _T_1 = 3'h0 == io_shift_op; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h1 == io_shift_op; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h2 == io_shift_op; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h3 == io_shift_op; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h4 == io_shift_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_9 = io_shift_data[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  _T_11 = 3'h5 == io_shift_op; // @[Conditional.scala 37:30]
  wire  _T_12 = 3'h6 == io_shift_op; // @[Conditional.scala 37:30]
  wire [31:0] _T_14 = {io_carry_flag,io_shift_data[31:1]}; // @[Cat.scala 30:58]
  wire  _T_16 = 3'h7 == io_shift_op; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_0 = _T_16 ? io_shift_data : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_1 = _T_12 ? _T_14 : _GEN_0; // @[Conditional.scala 39:67]
  wire  _GEN_2 = _T_12 & io_shift_data[0]; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_11 ? io_shift_data : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_11 ? 1'h0 : _GEN_2; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5 = _T_6 ? _T_9 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_6 ? io_shift_data[31] : _GEN_4; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_7 = _T_5 ? io_shift_data : _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_5 ? 1'h0 : _GEN_6; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_9 = _T_3 ? 32'h0 : _GEN_7; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_3 ? io_shift_data[31] : _GEN_8; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_11 = _T_2 ? io_shift_data : _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_2 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_13 = _T_1 ? io_shift_data : _GEN_11; // @[Conditional.scala 40:58]
  wire  _GEN_14 = _T_1 ? 1'h0 : _GEN_12; // @[Conditional.scala 40:58]
  wire  _T_17 = io_shift_num <= 8'h20; // @[BarrelShifter.scala 51:27]
  wire  _T_19 = 2'h0 == io_shift_op[2:1]; // @[Conditional.scala 37:30]
  wire [286:0] _GEN_35 = {{255'd0}, io_shift_data}; // @[BarrelShifter.scala 54:40]
  wire [286:0] _T_20 = _GEN_35 << io_shift_num; // @[BarrelShifter.scala 54:40]
  wire [7:0] _T_23 = 8'h20 - io_shift_num; // @[BarrelShifter.scala 55:49]
  wire [31:0] _T_24 = io_shift_data >> _T_23; // @[BarrelShifter.scala 55:43]
  wire  _T_26 = 2'h1 == io_shift_op[2:1]; // @[Conditional.scala 37:30]
  wire [31:0] _T_27 = io_shift_data >> io_shift_num; // @[BarrelShifter.scala 58:40]
  wire [7:0] _T_30 = io_shift_num - 8'h1; // @[BarrelShifter.scala 59:57]
  wire [31:0] _T_31 = io_shift_data >> _T_30; // @[BarrelShifter.scala 59:43]
  wire  _T_33 = 2'h2 == io_shift_op[2:1]; // @[Conditional.scala 37:30]
  wire [63:0] _T_37 = {_T_9,io_shift_data}; // @[Cat.scala 30:58]
  wire [63:0] _T_38 = _T_37 >> io_shift_num; // @[BarrelShifter.scala 62:74]
  wire  _T_44 = 2'h3 == io_shift_op[2:1]; // @[Conditional.scala 37:30]
  wire [63:0] _T_45 = {io_shift_data,io_shift_data}; // @[Cat.scala 30:58]
  wire [63:0] _T_46 = _T_45 >> io_shift_num; // @[BarrelShifter.scala 66:60]
  wire [31:0] _GEN_15 = _T_44 ? _T_46[31:0] : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_44 & _T_31[0]; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_17 = _T_33 ? _T_38[31:0] : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_33 ? _T_31[0] : _GEN_16; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_19 = _T_26 ? _T_27 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_26 ? _T_31[0] : _GEN_18; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_21 = _T_19 ? _T_20[31:0] : _GEN_19; // @[Conditional.scala 40:58]
  wire  _GEN_22 = _T_19 ? _T_24[0] : _GEN_20; // @[Conditional.scala 40:58]
  wire [63:0] _T_63 = _T_45 >> io_shift_num[4:0]; // @[BarrelShifter.scala 85:56]
  wire [4:0] _T_67 = io_shift_num[4:0] - 5'h1; // @[BarrelShifter.scala 86:62]
  wire [31:0] _T_68 = io_shift_data >> _T_67; // @[BarrelShifter.scala 86:43]
  wire [31:0] _GEN_23 = _T_44 ? _T_63[31:0] : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_44 & _T_68[0]; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_25 = _T_33 ? _T_9 : _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_33 ? io_shift_data[31] : _GEN_24; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_27 = _T_26 ? 32'h0 : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_26 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_29 = _T_19 ? 32'h0 : _GEN_27; // @[Conditional.scala 40:58]
  wire  _GEN_30 = _T_19 ? 1'h0 : _GEN_28; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_31 = _T_17 ? _GEN_21 : _GEN_29; // @[BarrelShifter.scala 51:35]
  wire  _GEN_32 = _T_17 ? _GEN_22 : _GEN_30; // @[BarrelShifter.scala 51:35]
  assign io_shift_out = _T ? _GEN_13 : _GEN_31; // @[BarrelShifter.scala 16:16 BarrelShifter.scala 23:22 BarrelShifter.scala 26:22 BarrelShifter.scala 29:22 BarrelShifter.scala 33:22 BarrelShifter.scala 36:22 BarrelShifter.scala 40:22 BarrelShifter.scala 43:22 BarrelShifter.scala 47:22 BarrelShifter.scala 54:22 BarrelShifter.scala 58:22 BarrelShifter.scala 62:22 BarrelShifter.scala 66:22 BarrelShifter.scala 73:22 BarrelShifter.scala 77:22 BarrelShifter.scala 81:22 BarrelShifter.scala 85:22]
  assign io_shift_carryout = _T ? _GEN_14 : _GEN_32; // @[BarrelShifter.scala 17:21 BarrelShifter.scala 30:27 BarrelShifter.scala 37:27 BarrelShifter.scala 44:27 BarrelShifter.scala 55:27 BarrelShifter.scala 59:27 BarrelShifter.scala 63:27 BarrelShifter.scala 67:27 BarrelShifter.scala 74:27 BarrelShifter.scala 78:27 BarrelShifter.scala 82:27 BarrelShifter.scala 86:27]
endmodule
module RegFile(
  input         clock,
  input         reset,
  input  [3:0]  io_R_Addr_A,
  input  [3:0]  io_R_Addr_B,
  input  [3:0]  io_R_Addr_C,
  input  [3:0]  io_W_Addr,
  input  [31:0] io_W_Data,
  input         io_Write_Reg,
  input  [31:0] io_PC_New,
  input         io_Write_PC,
  output [31:0] io_R_Data_A,
  output [31:0] io_R_Data_B,
  output [31:0] io_R_Data_C,
  output [31:0] io_R_PC
);
  reg [31:0] reg_0; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_0;
  reg [31:0] reg_1; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_1;
  reg [31:0] reg_2; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_2;
  reg [31:0] reg_3; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_3;
  reg [31:0] reg_4; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_4;
  reg [31:0] reg_5; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_5;
  reg [31:0] reg_6; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_6;
  reg [31:0] reg_7; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_7;
  reg [31:0] reg_8; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_8;
  reg [31:0] reg_9; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_9;
  reg [31:0] reg_10; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_10;
  reg [31:0] reg_11; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_11;
  reg [31:0] reg_12; // @[RegFile.scala 28:20]
  reg [31:0] _RAND_12;
  reg [31:0] r13_0; // @[RegFile.scala 32:20]
  reg [31:0] _RAND_13;
  reg [31:0] r14_0; // @[RegFile.scala 33:20]
  reg [31:0] _RAND_14;
  reg [31:0] reg_pc; // @[RegFile.scala 34:23]
  reg [31:0] _RAND_15;
  wire  _T_7 = io_W_Addr == 4'hf; // @[RegFile.scala 50:45]
  wire  err1 = io_Write_Reg & _T_7; // @[RegFile.scala 50:32]
  wire  _T_12 = io_W_Addr < 4'hd; // @[RegFile.scala 58:30]
  wire  _T_13 = io_W_Addr == 4'hd; // @[RegFile.scala 61:37]
  wire  _T_73 = io_R_Addr_A < 4'h8; // @[RegFile.scala 228:22]
  wire [31:0] _GEN_699 = 4'h1 == io_R_Addr_A ? reg_1 : reg_0; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_700 = 4'h2 == io_R_Addr_A ? reg_2 : _GEN_699; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_701 = 4'h3 == io_R_Addr_A ? reg_3 : _GEN_700; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_702 = 4'h4 == io_R_Addr_A ? reg_4 : _GEN_701; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_703 = 4'h5 == io_R_Addr_A ? reg_5 : _GEN_702; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_704 = 4'h6 == io_R_Addr_A ? reg_6 : _GEN_703; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_705 = 4'h7 == io_R_Addr_A ? reg_7 : _GEN_704; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_706 = 4'h8 == io_R_Addr_A ? reg_8 : _GEN_705; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_707 = 4'h9 == io_R_Addr_A ? reg_9 : _GEN_706; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_708 = 4'ha == io_R_Addr_A ? reg_10 : _GEN_707; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_709 = 4'hb == io_R_Addr_A ? reg_11 : _GEN_708; // @[RegFile.scala 230:18]
  wire [31:0] _GEN_710 = 4'hc == io_R_Addr_A ? reg_12 : _GEN_709; // @[RegFile.scala 230:18]
  wire  _T_74 = io_R_Addr_A < 4'hd; // @[RegFile.scala 231:29]
  wire  _T_100 = io_R_Addr_A == 4'hd; // @[RegFile.scala 245:29]
  wire  _T_125 = io_R_Addr_A == 4'he; // @[RegFile.scala 277:29]
  wire [31:0] _GEN_751 = _T_125 ? r14_0 : reg_pc; // @[RegFile.scala 277:39]
  wire [31:0] _GEN_753 = _T_100 ? r13_0 : _GEN_751; // @[RegFile.scala 245:39]
  wire [31:0] _GEN_756 = _T_74 ? _GEN_710 : _GEN_753; // @[RegFile.scala 231:37]
  wire  _T_149 = io_R_Addr_B < 4'h8; // @[RegFile.scala 311:22]
  wire [31:0] _GEN_760 = 4'h1 == io_R_Addr_B ? reg_1 : reg_0; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_761 = 4'h2 == io_R_Addr_B ? reg_2 : _GEN_760; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_762 = 4'h3 == io_R_Addr_B ? reg_3 : _GEN_761; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_763 = 4'h4 == io_R_Addr_B ? reg_4 : _GEN_762; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_764 = 4'h5 == io_R_Addr_B ? reg_5 : _GEN_763; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_765 = 4'h6 == io_R_Addr_B ? reg_6 : _GEN_764; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_766 = 4'h7 == io_R_Addr_B ? reg_7 : _GEN_765; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_767 = 4'h8 == io_R_Addr_B ? reg_8 : _GEN_766; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_768 = 4'h9 == io_R_Addr_B ? reg_9 : _GEN_767; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_769 = 4'ha == io_R_Addr_B ? reg_10 : _GEN_768; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_770 = 4'hb == io_R_Addr_B ? reg_11 : _GEN_769; // @[RegFile.scala 313:18]
  wire [31:0] _GEN_771 = 4'hc == io_R_Addr_B ? reg_12 : _GEN_770; // @[RegFile.scala 313:18]
  wire  _T_150 = io_R_Addr_B < 4'hd; // @[RegFile.scala 314:28]
  wire  _T_176 = io_R_Addr_B == 4'hd; // @[RegFile.scala 328:28]
  wire  _T_201 = io_R_Addr_B == 4'he; // @[RegFile.scala 360:28]
  wire [31:0] _GEN_812 = _T_201 ? r14_0 : reg_pc; // @[RegFile.scala 360:38]
  wire [31:0] _GEN_814 = _T_176 ? r13_0 : _GEN_812; // @[RegFile.scala 328:38]
  wire [31:0] _GEN_817 = _T_150 ? _GEN_771 : _GEN_814; // @[RegFile.scala 314:36]
  wire  _T_225 = io_R_Addr_C < 4'h8; // @[RegFile.scala 395:22]
  wire [31:0] _GEN_821 = 4'h1 == io_R_Addr_C ? reg_1 : reg_0; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_822 = 4'h2 == io_R_Addr_C ? reg_2 : _GEN_821; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_823 = 4'h3 == io_R_Addr_C ? reg_3 : _GEN_822; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_824 = 4'h4 == io_R_Addr_C ? reg_4 : _GEN_823; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_825 = 4'h5 == io_R_Addr_C ? reg_5 : _GEN_824; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_826 = 4'h6 == io_R_Addr_C ? reg_6 : _GEN_825; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_827 = 4'h7 == io_R_Addr_C ? reg_7 : _GEN_826; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_828 = 4'h8 == io_R_Addr_C ? reg_8 : _GEN_827; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_829 = 4'h9 == io_R_Addr_C ? reg_9 : _GEN_828; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_830 = 4'ha == io_R_Addr_C ? reg_10 : _GEN_829; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_831 = 4'hb == io_R_Addr_C ? reg_11 : _GEN_830; // @[RegFile.scala 397:18]
  wire [31:0] _GEN_832 = 4'hc == io_R_Addr_C ? reg_12 : _GEN_831; // @[RegFile.scala 397:18]
  wire  _T_226 = io_R_Addr_C < 4'hd; // @[RegFile.scala 398:28]
  wire  _T_252 = io_R_Addr_C == 4'hd; // @[RegFile.scala 412:28]
  wire  _T_277 = io_R_Addr_C == 4'he; // @[RegFile.scala 444:28]
  wire [31:0] _GEN_873 = _T_277 ? r14_0 : reg_pc; // @[RegFile.scala 444:38]
  wire [31:0] _GEN_875 = _T_252 ? r13_0 : _GEN_873; // @[RegFile.scala 412:38]
  wire [31:0] _GEN_878 = _T_226 ? _GEN_832 : _GEN_875; // @[RegFile.scala 398:36]
  assign io_R_Data_A = _T_73 ? _GEN_710 : _GEN_756; // @[RegFile.scala 479:15]
  assign io_R_Data_B = _T_149 ? _GEN_771 : _GEN_817; // @[RegFile.scala 480:15]
  assign io_R_Data_C = _T_225 ? _GEN_832 : _GEN_878; // @[RegFile.scala 481:15]
  assign io_R_PC = reg_pc; // @[RegFile.scala 482:11]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_0 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reg_1 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reg_2 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  reg_3 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reg_4 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  reg_5 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  reg_6 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_7 = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  reg_8 = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  reg_9 = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  reg_10 = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  reg_11 = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  reg_12 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  r13_0 = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  r14_0 = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  reg_pc = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_0 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h0 == io_W_Addr) begin
            reg_0 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_1 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h1 == io_W_Addr) begin
            reg_1 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_2 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h2 == io_W_Addr) begin
            reg_2 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_3 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h3 == io_W_Addr) begin
            reg_3 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_4 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h4 == io_W_Addr) begin
            reg_4 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_5 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h5 == io_W_Addr) begin
            reg_5 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_6 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h6 == io_W_Addr) begin
            reg_6 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_7 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h7 == io_W_Addr) begin
            reg_7 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_8 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h8 == io_W_Addr) begin
            reg_8 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_9 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'h9 == io_W_Addr) begin
            reg_9 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_10 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'ha == io_W_Addr) begin
            reg_10 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_11 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'hb == io_W_Addr) begin
            reg_11 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_12 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (_T_12) begin
          if (4'hc == io_W_Addr) begin
            reg_12 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      r13_0 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (!(_T_12)) begin
          if (_T_13) begin
            r13_0 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      r14_0 <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_Reg) begin
        if (!(_T_12)) begin
          if (!(_T_13)) begin
            r14_0 <= io_W_Data;
          end
        end
      end
    end
    if (reset) begin
      reg_pc <= 32'h0;
    end else if (!(err1)) begin
      if (io_Write_PC) begin
        reg_pc <= io_PC_New;
      end
    end
  end
endmodule
module MyMem(
  input         clock,
  input  [31:0] io_M_W_Data,
  input  [31:0] io_M_Addr,
  input         io_Mem_Write,
  output [31:0] io_M_R_Data
);
  reg [31:0] mem [0:63]; // @[MyMem.scala 15:24]
  reg [31:0] _RAND_0;
  wire [31:0] mem__T_3_data; // @[MyMem.scala 15:24]
  wire [5:0] mem__T_3_addr; // @[MyMem.scala 15:24]
  wire [31:0] mem__T_1_data; // @[MyMem.scala 15:24]
  wire [5:0] mem__T_1_addr; // @[MyMem.scala 15:24]
  wire  mem__T_1_mask; // @[MyMem.scala 15:24]
  wire  mem__T_1_en; // @[MyMem.scala 15:24]
  reg  mem__T_3_en_pipe_0;
  reg [31:0] _RAND_1;
  reg [5:0] mem__T_3_addr_pipe_0;
  reg [31:0] _RAND_2;
  assign mem__T_3_addr = mem__T_3_addr_pipe_0;
  assign mem__T_3_data = mem[mem__T_3_addr]; // @[MyMem.scala 15:24]
  assign mem__T_1_data = io_M_W_Data;
  assign mem__T_1_addr = io_M_Addr[5:0];
  assign mem__T_1_mask = 1'h1;
  assign mem__T_1_en = io_Mem_Write;
  assign io_M_R_Data = mem__T_3_data; // @[MyMem.scala 23:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_3_en_pipe_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem__T_3_addr_pipe_0 = _RAND_2[5:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(mem__T_1_en & mem__T_1_mask) begin
      mem[mem__T_1_addr] <= mem__T_1_data; // @[MyMem.scala 15:24]
    end
    mem__T_3_en_pipe_0 <= 1'h1;
    mem__T_3_addr_pipe_0 <= io_M_Addr[5:0];
  end
endmodule
module CPU(
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
  wire [31:0] controller_io_ir; // @[CPU.scala 35:26]
  wire [3:0] controller_io_state; // @[CPU.scala 35:26]
  wire  controller_io_isSatisfy; // @[CPU.scala 35:26]
  wire  controller_io_done; // @[CPU.scala 35:26]
  wire [3:0] controller_io_aluop; // @[CPU.scala 35:26]
  wire [2:0] controller_io_shiftop; // @[CPU.scala 35:26]
  wire  controller_io_rm_imm_s; // @[CPU.scala 35:26]
  wire [1:0] controller_io_rs_imm_s; // @[CPU.scala 35:26]
  wire  controller_io_Write_PC; // @[CPU.scala 35:26]
  wire  controller_io_Write_IR; // @[CPU.scala 35:26]
  wire  controller_io_Write_Reg; // @[CPU.scala 35:26]
  wire  controller_io_LA; // @[CPU.scala 35:26]
  wire  controller_io_LB; // @[CPU.scala 35:26]
  wire  controller_io_LC; // @[CPU.scala 35:26]
  wire  controller_io_LF; // @[CPU.scala 35:26]
  wire  controller_io_S; // @[CPU.scala 35:26]
  wire [1:0] controller_io_PC_s; // @[CPU.scala 35:26]
  wire [1:0] controller_io_ALU_A_s; // @[CPU.scala 35:26]
  wire [2:0] controller_io_ALU_B_s; // @[CPU.scala 35:26]
  wire [1:0] controller_io_rd_s; // @[CPU.scala 35:26]
  wire  controller_io_W_Rdata_s; // @[CPU.scala 35:26]
  wire  controller_io_Reg_C_s; // @[CPU.scala 35:26]
  wire  controller_io_Mem_W_s; // @[CPU.scala 35:26]
  wire  controller_io_Mem_Write; // @[CPU.scala 35:26]
  wire [31:0] alu_io_a; // @[CPU.scala 36:19]
  wire [31:0] alu_io_b; // @[CPU.scala 36:19]
  wire [3:0] alu_io_alu_op; // @[CPU.scala 36:19]
  wire [1:0] alu_io_cv_f; // @[CPU.scala 36:19]
  wire  alu_io_shift_cout; // @[CPU.scala 36:19]
  wire [31:0] alu_io_F; // @[CPU.scala 36:19]
  wire [3:0] alu_io_nzcv; // @[CPU.scala 36:19]
  wire [31:0] barrelShifter_io_shift_data; // @[CPU.scala 37:29]
  wire [7:0] barrelShifter_io_shift_num; // @[CPU.scala 37:29]
  wire  barrelShifter_io_carry_flag; // @[CPU.scala 37:29]
  wire [2:0] barrelShifter_io_shift_op; // @[CPU.scala 37:29]
  wire [31:0] barrelShifter_io_shift_out; // @[CPU.scala 37:29]
  wire  barrelShifter_io_shift_carryout; // @[CPU.scala 37:29]
  wire  regFile_clock; // @[CPU.scala 38:43]
  wire  regFile_reset; // @[CPU.scala 38:43]
  wire [3:0] regFile_io_R_Addr_A; // @[CPU.scala 38:43]
  wire [3:0] regFile_io_R_Addr_B; // @[CPU.scala 38:43]
  wire [3:0] regFile_io_R_Addr_C; // @[CPU.scala 38:43]
  wire [3:0] regFile_io_W_Addr; // @[CPU.scala 38:43]
  wire [31:0] regFile_io_W_Data; // @[CPU.scala 38:43]
  wire  regFile_io_Write_Reg; // @[CPU.scala 38:43]
  wire [31:0] regFile_io_PC_New; // @[CPU.scala 38:43]
  wire  regFile_io_Write_PC; // @[CPU.scala 38:43]
  wire [31:0] regFile_io_R_Data_A; // @[CPU.scala 38:43]
  wire [31:0] regFile_io_R_Data_B; // @[CPU.scala 38:43]
  wire [31:0] regFile_io_R_Data_C; // @[CPU.scala 38:43]
  wire [31:0] regFile_io_R_PC; // @[CPU.scala 38:43]
  wire  ram_clock; // @[CPU.scala 39:39]
  wire [31:0] ram_io_M_W_Data; // @[CPU.scala 39:39]
  wire [31:0] ram_io_M_Addr; // @[CPU.scala 39:39]
  wire  ram_io_Mem_Write; // @[CPU.scala 39:39]
  wire [31:0] ram_io_M_R_Data; // @[CPU.scala 39:39]
  reg [31:0] inst_addr [0:63]; // @[CPU.scala 43:30]
  reg [31:0] _RAND_0;
  wire [31:0] inst_addr__T_4_data; // @[CPU.scala 43:30]
  wire [5:0] inst_addr__T_4_addr; // @[CPU.scala 43:30]
  wire [31:0] inst_addr__T_10_data; // @[CPU.scala 43:30]
  wire [5:0] inst_addr__T_10_addr; // @[CPU.scala 43:30]
  reg  inst_addr__T_4_en_pipe_0;
  reg [31:0] _RAND_1;
  reg [5:0] inst_addr__T_4_addr_pipe_0;
  reg [31:0] _RAND_2;
  reg  inst_addr__T_10_en_pipe_0;
  reg [31:0] _RAND_3;
  reg [5:0] inst_addr__T_10_addr_pipe_0;
  reg [31:0] _RAND_4;
  wire  _T_1 = ~clock; // @[CPU.scala 31:19]
  wire  negClock = ~clock; // @[CPU.scala 31:41]
  reg [3:0] nzcv; // @[Reg.scala 27:20]
  reg [31:0] _RAND_5;
  reg [31:0] IR; // @[Reg.scala 27:20]
  reg [31:0] _RAND_6;
  reg [31:0] A; // @[Reg.scala 27:20]
  reg [31:0] _RAND_7;
  reg [31:0] B; // @[Reg.scala 27:20]
  reg [31:0] _RAND_8;
  reg [31:0] C; // @[Reg.scala 27:20]
  reg [31:0] _RAND_9;
  reg [31:0] F; // @[Reg.scala 27:20]
  reg [31:0] _RAND_10;
  wire [3:0] rn = IR[19:16]; // @[CPU.scala 58:14]
  wire [3:0] rd = IR[15:12]; // @[CPU.scala 59:14]
  wire [3:0] rs = IR[11:8]; // @[CPU.scala 60:14]
  wire [4:0] imm5 = IR[11:7]; // @[CPU.scala 61:16]
  wire [11:0] imm12 = IR[11:0]; // @[CPU.scala 63:17]
  wire [23:0] imm24 = IR[23:0]; // @[CPU.scala 64:17]
  wire [15:0] Reg_list = IR[15:0]; // @[CPU.scala 66:20]
  reg [3:0] state; // @[CPU.scala 70:43]
  reg [31:0] _RAND_11;
  wire  _T_5 = ~controller_io_done; // @[CPU.scala 71:27]
  wire  _T_6 = state == 4'hf; // @[CPU.scala 72:16]
  wire [3:0] _T_8 = state + 4'h1; // @[CPU.scala 73:35]
  wire  _T_12 = 4'h0 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_15 = 4'h1 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_17 = ~nzcv[2]; // @[CPU.scala 81:37]
  wire  _T_18 = 4'h2 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_21 = 4'h3 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_23 = ~nzcv[1]; // @[CPU.scala 83:37]
  wire  _T_24 = 4'h4 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_27 = 4'h5 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_29 = ~nzcv[3]; // @[CPU.scala 85:37]
  wire  _T_30 = 4'h6 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_33 = 4'h7 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_35 = ~nzcv[0]; // @[CPU.scala 87:37]
  wire  _T_36 = 4'h8 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_38 = nzcv[2:1] == 2'h1; // @[CPU.scala 88:40]
  wire  _T_39 = 4'h9 == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_41 = nzcv[2:1] == 2'h2; // @[CPU.scala 89:40]
  wire  _T_42 = 4'ha == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_45 = nzcv[3] == nzcv[0]; // @[CPU.scala 90:37]
  wire  _T_46 = 4'hb == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_49 = nzcv[3] != nzcv[0]; // @[CPU.scala 91:37]
  wire  _T_50 = 4'hc == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_56 = _T_45 & _T_17; // @[CPU.scala 92:49]
  wire  _T_57 = 4'hd == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _T_63 = _T_45 | _T_17; // @[CPU.scala 93:49]
  wire  _T_64 = 4'he == inst_addr__T_10_data[31:28]; // @[Conditional.scala 37:30]
  wire  _GEN_10 = _T_57 ? _T_63 : _T_64; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_50 ? _T_56 : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_46 ? _T_49 : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_13 = _T_42 ? _T_45 : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_14 = _T_39 ? _T_41 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_15 = _T_36 ? _T_38 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_16 = _T_33 ? _T_35 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_30 ? nzcv[0] : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_27 ? _T_29 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_24 ? nzcv[3] : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_21 ? _T_23 : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_18 ? nzcv[1] : _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_22 = _T_15 ? _T_17 : _GEN_21; // @[Conditional.scala 39:67]
  wire  _T_66 = 2'h2 == controller_io_ALU_A_s; // @[Mux.scala 68:19]
  wire [31:0] _T_67 = _T_66 ? F : 32'h0; // @[Mux.scala 68:16]
  wire  _T_68 = 2'h1 == controller_io_ALU_A_s; // @[Mux.scala 68:19]
  wire [31:0] _T_69 = _T_68 ? regFile_io_R_PC : _T_67; // @[Mux.scala 68:16]
  wire  _T_70 = 2'h0 == controller_io_ALU_A_s; // @[Mux.scala 68:19]
  wire [7:0] _T_74 = imm24[23] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [25:0] _GEN_24 = {imm24, 2'h0}; // @[CPU.scala 114:49]
  wire [26:0] _T_75 = {{1'd0}, _GEN_24}; // @[CPU.scala 114:49]
  wire [34:0] _T_76 = {_T_74,_T_75}; // @[Cat.scala 30:58]
  wire [1:0] _T_93 = Reg_list[0] + Reg_list[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_95 = Reg_list[2] + Reg_list[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_97 = _T_93 + _T_95; // @[Bitwise.scala 47:55]
  wire [1:0] _T_99 = Reg_list[4] + Reg_list[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_101 = Reg_list[6] + Reg_list[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_103 = _T_99 + _T_101; // @[Bitwise.scala 47:55]
  wire [3:0] _T_105 = _T_97 + _T_103; // @[Bitwise.scala 47:55]
  wire [1:0] _T_107 = Reg_list[8] + Reg_list[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_109 = Reg_list[10] + Reg_list[11]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_111 = _T_107 + _T_109; // @[Bitwise.scala 47:55]
  wire [1:0] _T_113 = Reg_list[12] + Reg_list[13]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_115 = Reg_list[14] + Reg_list[15]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_117 = _T_113 + _T_115; // @[Bitwise.scala 47:55]
  wire [3:0] _T_119 = _T_111 + _T_117; // @[Bitwise.scala 47:55]
  wire [4:0] _T_121 = _T_105 + _T_119; // @[Bitwise.scala 47:55]
  wire [6:0] _GEN_25 = {_T_121, 2'h0}; // @[CPU.scala 116:39]
  wire [7:0] _T_123 = {{1'd0}, _GEN_25}; // @[CPU.scala 116:39]
  wire  _T_124 = 3'h4 == controller_io_ALU_B_s; // @[Mux.scala 68:19]
  wire [2:0] _T_125 = _T_124 ? 3'h4 : 3'h0; // @[Mux.scala 68:16]
  wire  _T_126 = 3'h3 == controller_io_ALU_B_s; // @[Mux.scala 68:19]
  wire [7:0] _T_127 = _T_126 ? _T_123 : {{5'd0}, _T_125}; // @[Mux.scala 68:16]
  wire  _T_128 = 3'h2 == controller_io_ALU_B_s; // @[Mux.scala 68:19]
  wire [11:0] _T_129 = _T_128 ? imm12 : {{4'd0}, _T_127}; // @[Mux.scala 68:16]
  wire  _T_130 = 3'h1 == controller_io_ALU_B_s; // @[Mux.scala 68:19]
  wire [34:0] _T_131 = _T_130 ? _T_76 : {{23'd0}, _T_129}; // @[Mux.scala 68:16]
  wire  _T_132 = 3'h0 == controller_io_ALU_B_s; // @[Mux.scala 68:19]
  wire [34:0] shift_out = _T_132 ? {{3'd0}, barrelShifter_io_shift_out} : _T_131; // @[Mux.scala 68:16]
  wire  _T_135 = controller_io_rm_imm_s; // @[Mux.scala 68:19]
  wire [7:0] _T_136 = _T_135 ? imm12[7:0] : 8'h0; // @[Mux.scala 68:16]
  wire  _T_137 = ~controller_io_rm_imm_s; // @[Mux.scala 68:19]
  wire [4:0] _T_141 = {imm12[11:8], 1'h0}; // @[CPU.scala 135:27]
  wire  _T_142 = 2'h2 == controller_io_rs_imm_s; // @[Mux.scala 68:19]
  wire [4:0] _T_143 = _T_142 ? _T_141 : 5'h0; // @[Mux.scala 68:16]
  wire  _T_144 = 2'h1 == controller_io_rs_imm_s; // @[Mux.scala 68:19]
  wire [7:0] _T_145 = _T_144 ? C[7:0] : {{3'd0}, _T_143}; // @[Mux.scala 68:16]
  wire  _T_146 = 2'h0 == controller_io_rs_imm_s; // @[Mux.scala 68:19]
  wire  _T_150 = 2'h2 == controller_io_rd_s; // @[Mux.scala 68:19]
  wire [3:0] _T_151 = _T_150 ? rn : 4'h0; // @[Mux.scala 68:16]
  wire  _T_152 = 2'h1 == controller_io_rd_s; // @[Mux.scala 68:19]
  wire [3:0] _T_153 = _T_152 ? 4'he : _T_151; // @[Mux.scala 68:16]
  wire  _T_154 = 2'h0 == controller_io_rd_s; // @[Mux.scala 68:19]
  wire [31:0] W_Rdata_s = controller_io_W_Rdata_s ? ram_io_M_R_Data : F; // @[CPU.scala 151:22]
  wire [31:0] _T_157 = regFile_io_R_PC + 32'h4; // @[CPU.scala 156:31]
  wire  _T_158 = 2'h2 == controller_io_PC_s; // @[Mux.scala 68:19]
  wire [31:0] _T_159 = _T_158 ? W_Rdata_s : regFile_io_R_PC; // @[Mux.scala 68:16]
  wire  _T_160 = 2'h1 == controller_io_PC_s; // @[Mux.scala 68:19]
  wire [31:0] _T_161 = _T_160 ? B : _T_159; // @[Mux.scala 68:16]
  wire  _T_162 = 2'h0 == controller_io_PC_s; // @[Mux.scala 68:19]
  Controller controller ( // @[CPU.scala 35:26]
    .io_ir(controller_io_ir),
    .io_state(controller_io_state),
    .io_isSatisfy(controller_io_isSatisfy),
    .io_done(controller_io_done),
    .io_aluop(controller_io_aluop),
    .io_shiftop(controller_io_shiftop),
    .io_rm_imm_s(controller_io_rm_imm_s),
    .io_rs_imm_s(controller_io_rs_imm_s),
    .io_Write_PC(controller_io_Write_PC),
    .io_Write_IR(controller_io_Write_IR),
    .io_Write_Reg(controller_io_Write_Reg),
    .io_LA(controller_io_LA),
    .io_LB(controller_io_LB),
    .io_LC(controller_io_LC),
    .io_LF(controller_io_LF),
    .io_S(controller_io_S),
    .io_PC_s(controller_io_PC_s),
    .io_ALU_A_s(controller_io_ALU_A_s),
    .io_ALU_B_s(controller_io_ALU_B_s),
    .io_rd_s(controller_io_rd_s),
    .io_W_Rdata_s(controller_io_W_Rdata_s),
    .io_Reg_C_s(controller_io_Reg_C_s),
    .io_Mem_W_s(controller_io_Mem_W_s),
    .io_Mem_Write(controller_io_Mem_Write)
  );
  ALU alu ( // @[CPU.scala 36:19]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_alu_op(alu_io_alu_op),
    .io_cv_f(alu_io_cv_f),
    .io_shift_cout(alu_io_shift_cout),
    .io_F(alu_io_F),
    .io_nzcv(alu_io_nzcv)
  );
  BarrelShifter barrelShifter ( // @[CPU.scala 37:29]
    .io_shift_data(barrelShifter_io_shift_data),
    .io_shift_num(barrelShifter_io_shift_num),
    .io_carry_flag(barrelShifter_io_carry_flag),
    .io_shift_op(barrelShifter_io_shift_op),
    .io_shift_out(barrelShifter_io_shift_out),
    .io_shift_carryout(barrelShifter_io_shift_carryout)
  );
  RegFile regFile ( // @[CPU.scala 38:43]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_R_Addr_A(regFile_io_R_Addr_A),
    .io_R_Addr_B(regFile_io_R_Addr_B),
    .io_R_Addr_C(regFile_io_R_Addr_C),
    .io_W_Addr(regFile_io_W_Addr),
    .io_W_Data(regFile_io_W_Data),
    .io_Write_Reg(regFile_io_Write_Reg),
    .io_PC_New(regFile_io_PC_New),
    .io_Write_PC(regFile_io_Write_PC),
    .io_R_Data_A(regFile_io_R_Data_A),
    .io_R_Data_B(regFile_io_R_Data_B),
    .io_R_Data_C(regFile_io_R_Data_C),
    .io_R_PC(regFile_io_R_PC)
  );
  MyMem ram ( // @[CPU.scala 39:39]
    .clock(ram_clock),
    .io_M_W_Data(ram_io_M_W_Data),
    .io_M_Addr(ram_io_M_Addr),
    .io_Mem_Write(ram_io_Mem_Write),
    .io_M_R_Data(ram_io_M_R_Data)
  );
  assign inst_addr__T_4_addr = inst_addr__T_4_addr_pipe_0;
  assign inst_addr__T_4_data = inst_addr[inst_addr__T_4_addr]; // @[CPU.scala 43:30]
  assign inst_addr__T_10_addr = inst_addr__T_10_addr_pipe_0;
  assign inst_addr__T_10_data = inst_addr[inst_addr__T_10_addr]; // @[CPU.scala 43:30]
  assign io_Write_PC = controller_io_Write_PC; // @[CPU.scala 171:15]
  assign io_Write_IR = controller_io_Write_IR; // @[CPU.scala 172:15]
  assign io_Write_Reg = controller_io_Write_Reg; // @[CPU.scala 173:16]
  assign io_A = A; // @[CPU.scala 174:8]
  assign io_B = B; // @[CPU.scala 175:8]
  assign io_C = C; // @[CPU.scala 176:8]
  assign io_F = F; // @[CPU.scala 177:8]
  assign io_W_Rdata_s = controller_io_W_Rdata_s; // @[CPU.scala 178:16]
  assign io_W_Data = controller_io_W_Rdata_s ? ram_io_M_R_Data : F; // @[CPU.scala 179:13]
  assign io_PC_s = controller_io_PC_s; // @[CPU.scala 180:11]
  assign io_M_R_Data = ram_io_M_R_Data; // @[CPU.scala 181:15]
  assign io_IR = IR; // @[CPU.scala 183:9]
  assign io_Reg_C_s = controller_io_Reg_C_s; // @[CPU.scala 184:14]
  assign io_PC = regFile_io_R_PC[7:0]; // @[CPU.scala 185:9]
  assign io_nzcv = nzcv; // @[CPU.scala 186:11]
  assign io_Mem_W_s = controller_io_Mem_W_s; // @[CPU.scala 187:14]
  assign io_Mem_Write = controller_io_Mem_Write; // @[CPU.scala 188:16]
  assign io_rd_s = controller_io_rd_s; // @[CPU.scala 190:11]
  assign io_ALU_A_s = controller_io_ALU_A_s; // @[CPU.scala 191:14]
  assign io_ALU_B_s = controller_io_ALU_B_s; // @[CPU.scala 192:14]
  assign io_M_W_Data = controller_io_Mem_W_s ? C : B; // @[CPU.scala 193:15]
  assign controller_io_ir = IR; // @[CPU.scala 101:20]
  assign controller_io_state = state; // @[CPU.scala 102:23]
  assign controller_io_isSatisfy = _T_12 ? nzcv[2] : _GEN_22; // @[CPU.scala 97:27]
  assign alu_io_a = _T_70 ? A : _T_69; // @[CPU.scala 104:12]
  assign alu_io_b = shift_out[31:0]; // @[CPU.scala 120:12]
  assign alu_io_alu_op = controller_io_aluop; // @[CPU.scala 121:17]
  assign alu_io_cv_f = nzcv[1:0]; // @[CPU.scala 122:15]
  assign alu_io_shift_cout = barrelShifter_io_shift_carryout; // @[CPU.scala 123:21]
  assign barrelShifter_io_shift_data = _T_137 ? B : {{24'd0}, _T_136}; // @[CPU.scala 125:31]
  assign barrelShifter_io_shift_num = _T_146 ? {{3'd0}, imm5} : _T_145; // @[CPU.scala 131:30]
  assign barrelShifter_io_carry_flag = nzcv[1]; // @[CPU.scala 138:31]
  assign barrelShifter_io_shift_op = controller_io_shiftop; // @[CPU.scala 139:29]
  assign regFile_clock = ~clock;
  assign regFile_reset = reset;
  assign regFile_io_R_Addr_A = IR[19:16]; // @[CPU.scala 141:23]
  assign regFile_io_R_Addr_B = IR[3:0]; // @[CPU.scala 142:23]
  assign regFile_io_R_Addr_C = controller_io_Reg_C_s ? rd : rs; // @[CPU.scala 143:23]
  assign regFile_io_W_Addr = _T_154 ? rd : _T_153; // @[CPU.scala 144:21]
  assign regFile_io_W_Data = controller_io_W_Rdata_s ? ram_io_M_R_Data : F; // @[CPU.scala 152:21]
  assign regFile_io_Write_Reg = controller_io_Write_Reg; // @[CPU.scala 153:24]
  assign regFile_io_PC_New = _T_162 ? _T_157 : _T_161; // @[CPU.scala 154:21]
  assign regFile_io_Write_PC = controller_io_Write_PC; // @[CPU.scala 161:23]
  assign ram_clock = ~clock;
  assign ram_io_M_W_Data = controller_io_Mem_W_s ? C : B; // @[CPU.scala 165:19]
  assign ram_io_M_Addr = F; // @[CPU.scala 166:17]
  assign ram_io_Mem_Write = controller_io_Mem_Write; // @[CPU.scala 167:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    inst_addr[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  inst_addr__T_4_en_pipe_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  inst_addr__T_4_addr_pipe_0 = _RAND_2[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  inst_addr__T_10_en_pipe_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  inst_addr__T_10_addr_pipe_0 = _RAND_4[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  nzcv = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  IR = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  A = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  B = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  C = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  F = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  state = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge _T_1) begin
    inst_addr__T_4_en_pipe_0 <= 1'h1;
    inst_addr__T_4_addr_pipe_0 <= regFile_io_R_PC[7:2];
  end
  always @(posedge clock) begin
    inst_addr__T_10_en_pipe_0 <= 1'h1;
    inst_addr__T_10_addr_pipe_0 <= regFile_io_R_PC[7:2];
  end
  always @(posedge negClock) begin
    if (reset) begin
      nzcv <= 4'h0;
    end else if (controller_io_S) begin
      nzcv <= alu_io_nzcv;
    end
    if (reset) begin
      IR <= 32'h0;
    end else if (controller_io_Write_IR) begin
      IR <= inst_addr__T_4_data;
    end
    if (reset) begin
      A <= 32'h0;
    end else if (controller_io_LA) begin
      A <= regFile_io_R_Data_A;
    end
    if (reset) begin
      B <= 32'h0;
    end else if (controller_io_LB) begin
      B <= regFile_io_R_Data_B;
    end
    if (reset) begin
      C <= 32'h0;
    end else if (controller_io_LC) begin
      C <= regFile_io_R_Data_C;
    end
    if (reset) begin
      F <= 32'h0;
    end else if (controller_io_LF) begin
      F <= alu_io_F;
    end
    if (reset) begin
      state <= 4'hf;
    end else if (_T_5) begin
      if (_T_6) begin
        state <= 4'h0;
      end else begin
        state <= _T_8;
      end
    end else begin
      state <= 4'h0;
    end
  end
endmodule
module Counter(
  input        clock,
  input        reset,
  input        io_swb,
  output [3:0] io_cnt
);
  reg [3:0] cnt; // @[Counter.scala 9:20]
  reg [31:0] _RAND_0;
  reg  state; // @[Counter.scala 12:22]
  reg [31:0] _RAND_1;
  wire  _T = ~state; // @[Conditional.scala 37:30]
  wire [3:0] _T_3 = cnt + 4'h1; // @[Counter.scala 17:20]
  wire  _GEN_0 = io_swb | state; // @[Counter.scala 15:29]
  wire  _T_6 = ~io_swb; // @[Counter.scala 21:12]
  wire  _T_7 = cnt == 4'ha; // @[Counter.scala 27:12]
  assign io_cnt = cnt; // @[Counter.scala 31:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cnt = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cnt <= 4'h0;
    end else if (_T_7) begin
      cnt <= 4'h0;
    end else if (_T) begin
      if (io_swb) begin
        cnt <= _T_3;
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else if (_T) begin
      state <= _GEN_0;
    end else if (state) begin
      if (_T_6) begin
        state <= 1'h0;
      end
    end
  end
endmodule
module Top(
  input        clock,
  input        reset,
  input        io_swb,
  output [2:0] io_which,
  output [7:0] io_seg,
  output       io_enable
);
  wire  cpu_clock; // @[Main.scala 16:19]
  wire  cpu_reset; // @[Main.scala 16:19]
  wire  cpu_io_Write_PC; // @[Main.scala 16:19]
  wire  cpu_io_Write_IR; // @[Main.scala 16:19]
  wire  cpu_io_Write_Reg; // @[Main.scala 16:19]
  wire [31:0] cpu_io_A; // @[Main.scala 16:19]
  wire [31:0] cpu_io_B; // @[Main.scala 16:19]
  wire [31:0] cpu_io_C; // @[Main.scala 16:19]
  wire [31:0] cpu_io_F; // @[Main.scala 16:19]
  wire  cpu_io_W_Rdata_s; // @[Main.scala 16:19]
  wire [31:0] cpu_io_W_Data; // @[Main.scala 16:19]
  wire [1:0] cpu_io_PC_s; // @[Main.scala 16:19]
  wire [31:0] cpu_io_M_R_Data; // @[Main.scala 16:19]
  wire [31:0] cpu_io_IR; // @[Main.scala 16:19]
  wire  cpu_io_Reg_C_s; // @[Main.scala 16:19]
  wire [7:0] cpu_io_PC; // @[Main.scala 16:19]
  wire [3:0] cpu_io_nzcv; // @[Main.scala 16:19]
  wire  cpu_io_Mem_W_s; // @[Main.scala 16:19]
  wire  cpu_io_Mem_Write; // @[Main.scala 16:19]
  wire [1:0] cpu_io_rd_s; // @[Main.scala 16:19]
  wire [1:0] cpu_io_ALU_A_s; // @[Main.scala 16:19]
  wire [2:0] cpu_io_ALU_B_s; // @[Main.scala 16:19]
  wire [31:0] cpu_io_M_W_Data; // @[Main.scala 16:19]
  wire [31:0] display_data; // @[Main.scala 17:23]
  wire  display_clk; // @[Main.scala 17:23]
  wire [2:0] display_which; // @[Main.scala 17:23]
  wire [7:0] display_seg; // @[Main.scala 17:23]
  wire [14:0] display_count; // @[Main.scala 17:23]
  wire [3:0] display_digit; // @[Main.scala 17:23]
  wire  counter_clock; // @[Main.scala 18:23]
  wire  counter_reset; // @[Main.scala 18:23]
  wire  counter_io_swb; // @[Main.scala 18:23]
  wire [3:0] counter_io_cnt; // @[Main.scala 18:23]
  reg [31:0] data; // @[Main.scala 14:21]
  reg [31:0] _RAND_0;
  wire  _T = 4'h0 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h1 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h2 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_3 = 4'h3 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h4 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_5 = 4'h5 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h6 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h7 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h8 == counter_io_cnt; // @[Conditional.scala 37:30]
  wire [20:0] _T_13 = {cpu_io_PC_s,cpu_io_rd_s,cpu_io_ALU_A_s,cpu_io_ALU_B_s,cpu_io_nzcv,cpu_io_PC}; // @[Cat.scala 30:58]
  wire [27:0] _T_20 = {cpu_io_Write_PC,cpu_io_Write_IR,cpu_io_Write_Reg,cpu_io_W_Rdata_s,cpu_io_Reg_C_s,cpu_io_Mem_W_s,cpu_io_Mem_Write,_T_13}; // @[Cat.scala 30:58]
  wire  _T_21 = 4'h9 == counter_io_cnt; // @[Conditional.scala 37:30]
  CPU cpu ( // @[Main.scala 16:19]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_Write_PC(cpu_io_Write_PC),
    .io_Write_IR(cpu_io_Write_IR),
    .io_Write_Reg(cpu_io_Write_Reg),
    .io_A(cpu_io_A),
    .io_B(cpu_io_B),
    .io_C(cpu_io_C),
    .io_F(cpu_io_F),
    .io_W_Rdata_s(cpu_io_W_Rdata_s),
    .io_W_Data(cpu_io_W_Data),
    .io_PC_s(cpu_io_PC_s),
    .io_M_R_Data(cpu_io_M_R_Data),
    .io_IR(cpu_io_IR),
    .io_Reg_C_s(cpu_io_Reg_C_s),
    .io_PC(cpu_io_PC),
    .io_nzcv(cpu_io_nzcv),
    .io_Mem_W_s(cpu_io_Mem_W_s),
    .io_Mem_Write(cpu_io_Mem_Write),
    .io_rd_s(cpu_io_rd_s),
    .io_ALU_A_s(cpu_io_ALU_A_s),
    .io_ALU_B_s(cpu_io_ALU_B_s),
    .io_M_W_Data(cpu_io_M_W_Data)
  );
  Display display ( // @[Main.scala 17:23]
    .data(display_data),
    .clk(display_clk),
    .which(display_which),
    .seg(display_seg),
    .count(display_count),
    .digit(display_digit)
  );
  Counter counter ( // @[Main.scala 18:23]
    .clock(counter_clock),
    .reset(counter_reset),
    .io_swb(counter_io_swb),
    .io_cnt(counter_io_cnt)
  );
  assign io_which = display_which; // @[Main.scala 82:12]
  assign io_seg = display_seg; // @[Main.scala 83:10]
  assign io_enable = 1'h1; // @[Main.scala 84:13]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign display_data = data; // @[Main.scala 80:19]
  assign display_clk = clock; // @[Main.scala 81:18]
  assign counter_clock = clock;
  assign counter_reset = reset;
  assign counter_io_swb = io_swb; // @[Main.scala 19:18]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  data = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      data <= 32'h0;
    end else if (_T) begin
      data <= cpu_io_A;
    end else if (_T_1) begin
      data <= cpu_io_B;
    end else if (_T_2) begin
      data <= cpu_io_C;
    end else if (_T_3) begin
      data <= cpu_io_F;
    end else if (_T_4) begin
      data <= cpu_io_IR;
    end else if (_T_5) begin
      data <= cpu_io_W_Data;
    end else if (_T_6) begin
      data <= cpu_io_M_R_Data;
    end else if (_T_7) begin
      data <= cpu_io_M_W_Data;
    end else if (_T_8) begin
      data <= {{4'd0}, _T_20};
    end else if (_T_21) begin
      data <= 32'h88888888;
    end
  end
endmodule
