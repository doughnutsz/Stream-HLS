# solver type
option solver gurobi;
option gurobi_options 'opttol=1e-8 lim:time=1200 tech:logfile=MultiHeadSelfAttention1_parallel.log';
param b0_0 := 1;
param b7_0 := 1;
param b14_0 := 1;
param b21_0 := 1;
param b2_0 := 1;
param b9_0 := 1;
param b16_0 := 1;
param b10000_0 := 1;
param b23_0 := 1;
param b4_0 := 1;
param b11_0 := 1;
param b18_0 := 1;
param b25_0 := 1;
param b6_0 := 1;
param b13_0 := 1;
param b20_0 := 1;
param b1_0 := 1;
param b8_0 := 1;
param b15_0 := 1;
param b22_0 := 1;
param b3_0 := 1;
param b10_0 := 1;
param b17_0 := 1;
param b24_0 := 1;
param b5_0 := 1;
param b12_0 := 1;
param b19_0 := 1;
var x0_0 >= 1, <= 64, integer;
var u0_0 >= 1, <= 64, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 64;
var x0_1 >= 1, <= 128, integer;
var u0_1 >= 1, <= 128, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 128;
var x0_2 >= 1, <= 128, integer;
var u0_2 >= 1, <= 128, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 128;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2;
var x7_0 >= 1, <= 128, integer;
var u7_0 >= 1, <= 128, integer;
subject to c_uf7_0:
	u7_0 * x7_0 == 128;
var x7_1 >= 1, <= 128, integer;
var u7_1 >= 1, <= 128, integer;
subject to c_uf7_1:
	u7_1 * x7_1 == 128;
var DSP_7, integer;
subject to c_DSP7:
	DSP_7 == 0;
var x14_0 >= 1, <= 8, integer;
var u14_0 >= 1, <= 8, integer;
subject to c_uf14_0:
	u14_0 * x14_0 == 8;
var x14_1 >= 1, <= 64, integer;
var u14_1 >= 1, <= 64, integer;
subject to c_uf14_1:
	u14_1 * x14_1 == 64;
var x14_2 >= 1, <= 64, integer;
var u14_2 >= 1, <= 64, integer;
subject to c_uf14_2:
	u14_2 * x14_2 == 64;
var DSP_14, integer;
subject to c_DSP14:
	DSP_14 == 0;
var x21_0 >= 1, <= 128, integer;
var u21_0 >= 1, <= 128, integer;
subject to c_uf21_0:
	u21_0 * x21_0 == 128;
var x21_1 >= 1, <= 64, integer;
var u21_1 >= 1, <= 64, integer;
subject to c_uf21_1:
	u21_1 * x21_1 == 64;
var DSP_21, integer;
subject to c_DSP21:
	DSP_21 == 0;
var x2_0 >= 1, <= 64, integer;
var u2_0 >= 1, <= 64, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 64;
var x2_1 >= 1, <= 128, integer;
var u2_1 >= 1, <= 128, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 128;
var x2_2 >= 1, <= 128, integer;
var u2_2 >= 1, <= 128, integer;
subject to c_uf2_2:
	u2_2 * x2_2 == 128;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == u2_0 * u2_1 * u2_2;
var x9_0 >= 1, <= 8, integer;
var u9_0 >= 1, <= 8, integer;
subject to c_uf9_0:
	u9_0 * x9_0 == 8;
var x9_1 >= 1, <= 16, integer;
var u9_1 >= 1, <= 16, integer;
subject to c_uf9_1:
	u9_1 * x9_1 == 16;
var x9_2 >= 1, <= 64, integer;
var u9_2 >= 1, <= 64, integer;
subject to c_uf9_2:
	u9_2 * x9_2 == 64;
var DSP_9, integer;
subject to c_DSP9:
	DSP_9 == 0;
var x16_0 >= 1, <= 8, integer;
var u16_0 >= 1, <= 8, integer;
subject to c_uf16_0:
	u16_0 * x16_0 == 8;
var x16_1 >= 1, <= 64, integer;
var u16_1 >= 1, <= 64, integer;
subject to c_uf16_1:
	u16_1 * x16_1 == 64;
var x16_2 >= 1, <= 64, integer;
var u16_2 >= 1, <= 64, integer;
subject to c_uf16_2:
	u16_2 * x16_2 == 64;
var DSP_16, integer;
subject to c_DSP16:
	DSP_16 == 0;
var x23_0 >= 1, <= 128, integer;
var u23_0 >= 1, <= 128, integer;
subject to c_uf23_0:
	u23_0 * x23_0 == 128;
var x23_1 >= 1, <= 128, integer;
var u23_1 >= 1, <= 128, integer;
subject to c_uf23_1:
	u23_1 * x23_1 == 128;
var DSP_23, integer;
subject to c_DSP23:
	DSP_23 == 0;
var x4_0 >= 1, <= 128, integer;
var u4_0 >= 1, <= 128, integer;
subject to c_uf4_0:
	u4_0 * x4_0 == 128;
var x4_1 >= 1, <= 128, integer;
var u4_1 >= 1, <= 128, integer;
subject to c_uf4_1:
	u4_1 * x4_1 == 128;
var DSP_4, integer;
subject to c_DSP4:
	DSP_4 == 0;
var x11_0 >= 1, <= 64, integer;
var u11_0 >= 1, <= 64, integer;
subject to c_uf11_0:
	u11_0 * x11_0 == 64;
var x11_1 >= 1, <= 128, integer;
var u11_1 >= 1, <= 128, integer;
subject to c_uf11_1:
	u11_1 * x11_1 == 128;
var DSP_11, integer;
subject to c_DSP11:
	DSP_11 == 0;
var x18_0 >= 1, <= 8, integer;
var u18_0 >= 1, <= 8, integer;
subject to c_uf18_0:
	u18_0 * x18_0 == 8;
var x18_1 >= 1, <= 64, integer;
var u18_1 >= 1, <= 64, integer;
subject to c_uf18_1:
	u18_1 * x18_1 == 64;
var x18_2 >= 1, <= 64, integer;
var u18_2 >= 1, <= 64, integer;
subject to c_uf18_2:
	u18_2 * x18_2 == 64;
var DSP_18, integer;
subject to c_DSP18:
	DSP_18 == 0;
var x25_0 >= 1, <= 128, integer;
var u25_0 >= 1, <= 128, integer;
subject to c_uf25_0:
	u25_0 * x25_0 == 128;
var x25_1 >= 1, <= 64, integer;
var u25_1 >= 1, <= 64, integer;
subject to c_uf25_1:
	u25_1 * x25_1 == 64;
var DSP_25, integer;
subject to c_DSP25:
	DSP_25 == 0;
var x6_0 >= 1, <= 8, integer;
var u6_0 >= 1, <= 8, integer;
subject to c_uf6_0:
	u6_0 * x6_0 == 8;
var x6_1 >= 1, <= 16, integer;
var u6_1 >= 1, <= 16, integer;
subject to c_uf6_1:
	u6_1 * x6_1 == 16;
var x6_2 >= 1, <= 64, integer;
var u6_2 >= 1, <= 64, integer;
subject to c_uf6_2:
	u6_2 * x6_2 == 64;
var DSP_6, integer;
subject to c_DSP6:
	DSP_6 == 0;
var x13_0 >= 1, <= 8, integer;
var u13_0 >= 1, <= 8, integer;
subject to c_uf13_0:
	u13_0 * x13_0 == 8;
var x13_1 >= 1, <= 16, integer;
var u13_1 >= 1, <= 16, integer;
subject to c_uf13_1:
	u13_1 * x13_1 == 16;
var x13_2 >= 1, <= 64, integer;
var u13_2 >= 1, <= 64, integer;
subject to c_uf13_2:
	u13_2 * x13_2 == 64;
var x13_3 >= 1, <= 64, integer;
var u13_3 >= 1, <= 64, integer;
subject to c_uf13_3:
	u13_3 * x13_3 == 64;
var DSP_13, integer;
subject to c_DSP13:
	DSP_13 == u13_0 * u13_1 * u13_2 * u13_3;
var x20_0 >= 1, <= 8, integer;
var u20_0 >= 1, <= 8, integer;
subject to c_uf20_0:
	u20_0 * x20_0 == 8;
var x20_1 >= 1, <= 64, integer;
var u20_1 >= 1, <= 64, integer;
subject to c_uf20_1:
	u20_1 * x20_1 == 64;
var x20_2 >= 1, <= 16, integer;
var u20_2 >= 1, <= 16, integer;
subject to c_uf20_2:
	u20_2 * x20_2 == 16;
var DSP_20, integer;
subject to c_DSP20:
	DSP_20 == 0;
var x1_0 >= 1, <= 64, integer;
var u1_0 >= 1, <= 64, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 64;
var x1_1 >= 1, <= 128, integer;
var u1_1 >= 1, <= 128, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 128;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == 0;
var x8_0 >= 1, <= 64, integer;
var u8_0 >= 1, <= 64, integer;
subject to c_uf8_0:
	u8_0 * x8_0 == 64;
var x8_1 >= 1, <= 128, integer;
var u8_1 >= 1, <= 128, integer;
subject to c_uf8_1:
	u8_1 * x8_1 == 128;
var DSP_8, integer;
subject to c_DSP8:
	DSP_8 == 0;
var x15_0 >= 1, <= 8, integer;
var u15_0 >= 1, <= 8, integer;
subject to c_uf15_0:
	u15_0 * x15_0 == 8;
var x15_1 >= 1, <= 64, integer;
var u15_1 >= 1, <= 64, integer;
subject to c_uf15_1:
	u15_1 * x15_1 == 64;
var x15_2 >= 1, <= 64, integer;
var u15_2 >= 1, <= 64, integer;
subject to c_uf15_2:
	u15_2 * x15_2 == 64;
var DSP_15, integer;
subject to c_DSP15:
	DSP_15 == u15_0 * u15_1 * u15_2;
var x22_0 >= 1, <= 128, integer;
var u22_0 >= 1, <= 128, integer;
subject to c_uf22_0:
	u22_0 * x22_0 == 128;
var x22_1 >= 1, <= 128, integer;
var u22_1 >= 1, <= 128, integer;
subject to c_uf22_1:
	u22_1 * x22_1 == 128;
var x22_2 >= 1, <= 64, integer;
var u22_2 >= 1, <= 64, integer;
subject to c_uf22_2:
	u22_2 * x22_2 == 64;
var DSP_22, integer;
subject to c_DSP22:
	DSP_22 == u22_0 * u22_1 * u22_2;
var x3_0 >= 1, <= 64, integer;
var u3_0 >= 1, <= 64, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 64;
var x3_1 >= 1, <= 128, integer;
var u3_1 >= 1, <= 128, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 128;
var x3_2 >= 1, <= 128, integer;
var u3_2 >= 1, <= 128, integer;
subject to c_uf3_2:
	u3_2 * x3_2 == 128;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == u3_0 * u3_1 * u3_2;
var x10_0 >= 1, <= 128, integer;
var u10_0 >= 1, <= 128, integer;
subject to c_uf10_0:
	u10_0 * x10_0 == 128;
var x10_1 >= 1, <= 128, integer;
var u10_1 >= 1, <= 128, integer;
subject to c_uf10_1:
	u10_1 * x10_1 == 128;
var DSP_10, integer;
subject to c_DSP10:
	DSP_10 == 0;
var x17_0 >= 1, <= 8, integer;
var u17_0 >= 1, <= 8, integer;
subject to c_uf17_0:
	u17_0 * x17_0 == 8;
var x17_1 >= 1, <= 64, integer;
var u17_1 >= 1, <= 64, integer;
subject to c_uf17_1:
	u17_1 * x17_1 == 64;
var x17_2 >= 1, <= 64, integer;
var u17_2 >= 1, <= 64, integer;
subject to c_uf17_2:
	u17_2 * x17_2 == 64;
var DSP_17, integer;
subject to c_DSP17:
	DSP_17 == u17_0 * u17_1 * u17_2;
var x24_0 >= 1, <= 128, integer;
var u24_0 >= 1, <= 128, integer;
subject to c_uf24_0:
	u24_0 * x24_0 == 128;
var x24_1 >= 1, <= 64, integer;
var u24_1 >= 1, <= 64, integer;
subject to c_uf24_1:
	u24_1 * x24_1 == 64;
var DSP_24, integer;
subject to c_DSP24:
	DSP_24 == 0;
var x5_0 >= 1, <= 64, integer;
var u5_0 >= 1, <= 64, integer;
subject to c_uf5_0:
	u5_0 * x5_0 == 64;
var x5_1 >= 1, <= 128, integer;
var u5_1 >= 1, <= 128, integer;
subject to c_uf5_1:
	u5_1 * x5_1 == 128;
var DSP_5, integer;
subject to c_DSP5:
	DSP_5 == 0;
var x12_0 >= 1, <= 8, integer;
var u12_0 >= 1, <= 8, integer;
subject to c_uf12_0:
	u12_0 * x12_0 == 8;
var x12_1 >= 1, <= 16, integer;
var u12_1 >= 1, <= 16, integer;
subject to c_uf12_1:
	u12_1 * x12_1 == 16;
var x12_2 >= 1, <= 64, integer;
var u12_2 >= 1, <= 64, integer;
subject to c_uf12_2:
	u12_2 * x12_2 == 64;
var DSP_12, integer;
subject to c_DSP12:
	DSP_12 == 0;
var x19_0 >= 1, <= 8, integer;
var u19_0 >= 1, <= 8, integer;
subject to c_uf19_0:
	u19_0 * x19_0 == 8;
var x19_1 >= 1, <= 64, integer;
var u19_1 >= 1, <= 64, integer;
subject to c_uf19_1:
	u19_1 * x19_1 == 64;
var x19_2 >= 1, <= 64, integer;
var u19_2 >= 1, <= 64, integer;
subject to c_uf19_2:
	u19_2 * x19_2 == 64;
var x19_3 >= 1, <= 16, integer;
var u19_3 >= 1, <= 16, integer;
subject to c_uf19_3:
	u19_3 * x19_3 == 16;
var DSP_19, integer;
subject to c_DSP19:
	DSP_19 == u19_0 * u19_1 * u19_2 * u19_3;
subject to c_u0_0_u1_0:
	u0_0 == u1_0;
subject to c_u0_1_u1_1:
	u0_1 == u1_1;
subject to c_u0_1_u10_0:
	u0_1 == u10_0;
subject to c_u0_2_u10_1:
	u0_2 == u10_1;
subject to c_u14_0_u13_0:
	u14_0 == u13_0;
subject to c_u14_2_u13_3:
	u14_2 == u13_3;
subject to c_u14_1_u13_2:
	u14_1 == u13_2;
subject to c_u21_1_u20_1:
	u21_1 == u20_1;
subject to c_u21_0_u20_0:
	u21_0 == u20_0;
subject to c_u2_0_u1_0:
	u2_0 == u1_0;
subject to c_u2_1_u1_1:
	u2_1 == u1_1;
subject to c_u2_1_u7_0:
	u2_1 == u7_0;
subject to c_u2_2_u7_1:
	u2_2 == u7_1;
subject to c_u9_2_u8_0:
	u9_2 == u8_0;
subject to c_u9_0_u8_1:
	u9_0 == u8_1;
subject to c_u16_0_u14_0:
	u16_0 == u14_0;
subject to c_u16_2_u14_2:
	u16_2 == u14_2;
subject to c_u16_1_u14_1:
	u16_1 == u14_1;
subject to c_u16_0_u15_0:
	u16_0 == u15_0;
subject to c_u16_2_u15_2:
	u16_2 == u15_2;
subject to c_u11_0_u0_0:
	u11_0 == u0_0;
subject to c_u11_1_u0_2:
	u11_1 == u0_2;
subject to c_u18_0_u16_0:
	u18_0 == u16_0;
subject to c_u18_2_u16_2:
	u18_2 == u16_2;
subject to c_u18_1_u16_1:
	u18_1 == u16_1;
subject to c_u18_0_u17_0:
	u18_0 == u17_0;
subject to c_u18_2_u17_2:
	u18_2 == u17_2;
subject to c_u25_1_u24_1:
	u25_1 == u24_1;
subject to c_u25_0_u24_0:
	u25_0 == u24_0;
subject to c_u6_2_u5_0:
	u6_2 == u5_0;
subject to c_u6_0_u5_1:
	u6_0 == u5_1;
subject to c_u13_0_u6_0:
	u13_0 == u6_0;
subject to c_u13_3_u6_2:
	u13_3 == u6_2;
subject to c_u13_1_u6_1:
	u13_1 == u6_1;
subject to c_u13_0_u9_0:
	u13_0 == u9_0;
subject to c_u13_1_u9_1:
	u13_1 == u9_1;
subject to c_u13_2_u9_2:
	u13_2 == u9_2;
subject to c_u20_1_u19_0:
	u20_1 == u19_0;
subject to c_u20_2_u19_2:
	u20_2 == u19_2;
subject to c_u20_0_u19_3:
	u20_0 == u19_3;
subject to c_u8_0_u2_0:
	u8_0 == u2_0;
subject to c_u8_1_u2_2:
	u8_1 == u2_2;
subject to c_u15_0_u14_0:
	u15_0 == u14_0;
subject to c_u15_2_u14_2:
	u15_2 == u14_2;
subject to c_u15_1_u14_1:
	u15_1 == u14_1;
subject to c_u22_2_u21_1:
	u22_2 == u21_1;
subject to c_u22_1_u21_0:
	u22_1 == u21_0;
subject to c_u22_1_u23_1:
	u22_1 == u23_1;
subject to c_u22_0_u23_0:
	u22_0 == u23_0;
subject to c_u3_0_u1_0:
	u3_0 == u1_0;
subject to c_u3_1_u1_1:
	u3_1 == u1_1;
subject to c_u3_1_u4_0:
	u3_1 == u4_0;
subject to c_u3_2_u4_1:
	u3_2 == u4_1;
subject to c_u17_0_u16_0:
	u17_0 == u16_0;
subject to c_u17_2_u16_2:
	u17_2 == u16_2;
subject to c_u17_1_u16_1:
	u17_1 == u16_1;
subject to c_u24_1_u22_2:
	u24_1 == u22_2;
subject to c_u24_0_u22_0:
	u24_0 == u22_0;
subject to c_u5_0_u3_0:
	u5_0 == u3_0;
subject to c_u5_1_u3_2:
	u5_1 == u3_2;
subject to c_u12_2_u11_0:
	u12_2 == u11_0;
subject to c_u12_0_u11_1:
	u12_0 == u11_1;
subject to c_u19_0_u18_0:
	u19_0 == u18_0;
subject to c_u19_2_u18_2:
	u19_2 == u18_2;
subject to c_u19_1_u18_1:
	u19_1 == u18_1;
subject to c_u19_0_u12_0:
	u19_0 == u12_0;
subject to c_u19_1_u12_2:
	u19_1 == u12_2;
subject to c_u19_3_u12_1:
	u19_3 == u12_1;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_7 + DSP_14 + DSP_21 + DSP_2 + DSP_9 + DSP_16 + DSP_23 + DSP_4 + DSP_11 + DSP_18 + DSP_25 + DSP_6 + DSP_13 + DSP_20 + DSP_1 + DSP_8 + DSP_15 + DSP_22 + DSP_3 + DSP_10 + DSP_17 + DSP_24 + DSP_5 + DSP_12 + DSP_19;
subject to totalDSPConst:
	totalDSPs <= 512;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
# node: 10 info
# start time
var st10, integer;
subject to cst_st10:
	st10 == ( + fw10000*b10000_0*b10_0);
# relative last reads
var rlr10000_10, integer;
subject to cst_rlr10000_10:
	rlr10000_10 == st10 + (0) * 1 * b10_0;
# epilogues
var ep10000_10, integer;
subject to cep10000_10:
	ep10000_10 ==  + ((0 + (x10_1 - 1) * 1 * 1 + (x10_0 - 1) * 1 * 1 * x10_1)) * 1 * b10_0 - (0) * 1 * b10_0;
# inputs last read/write dependencies
var lt10000_10, integer;
subject to clt10000_10:
	lt10000_10 == max(rlr10000_10, lw10000);
# curr last write times
var lw10000_10, integer;
subject to clw10000_10:
	lw10000_10 == lt10000_10 + ep10000_10;
# node last write time
var lw10, integer;
subject to clw10:
	lw10 == (lw10000_10);
# node first write time
var fw10, integer;
subject to cfw10:
	fw10 == st10 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x10_1)) * 1 * b10_0;
# node: 1 info
# start time
var st1, integer;
subject to cst_st1:
	st1 == ( + fw10000*b10000_0*b1_0);
# relative last reads
var rlr10000_1, integer;
subject to cst_rlr10000_1:
	rlr10000_1 == st1 + (0) * 1 * b1_0;
# epilogues
var ep10000_1, integer;
subject to cep10000_1:
	ep10000_1 ==  + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 - (0) * 1 * b1_0;
# inputs last read/write dependencies
var lt10000_1, integer;
subject to clt10000_1:
	lt10000_1 == max(rlr10000_1, lw10000);
# curr last write times
var lw10000_1, integer;
subject to clw10000_1:
	lw10000_1 == lt10000_1 + ep10000_1;
# node last write time
var lw1, integer;
subject to clw1:
	lw1 == (lw10000_1);
# node first write time
var fw1, integer;
subject to cfw1:
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == ( + fw10000*b10000_0*b4_0);
# relative last reads
var rlr10000_4, integer;
subject to cst_rlr10000_4:
	rlr10000_4 == st4 + (0) * 1 * b4_0;
# epilogues
var ep10000_4, integer;
subject to cep10000_4:
	ep10000_4 ==  + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0 - (0) * 1 * b4_0;
# inputs last read/write dependencies
var lt10000_4, integer;
subject to clt10000_4:
	lt10000_4 == max(rlr10000_4, lw10000);
# curr last write times
var lw10000_4, integer;
subject to clw10000_4:
	lw10000_4 == lt10000_4 + ep10000_4;
# node last write time
var lw4, integer;
subject to clw4:
	lw4 == (lw10000_4);
# node first write time
var fw4, integer;
subject to cfw4:
	fw4 == st4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_1)) * 1 * b4_0;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == max( + fw1*b1_0*b3_0,  + fw4*b4_0*b3_0);
# relative last reads
var rlr1_3, integer;
subject to cst_rlr1_3:
	rlr1_3 == st3 + ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
var rlr4_3, integer;
subject to cst_rlr4_3:
	rlr4_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
# epilogues
var ep1_3, integer;
subject to cep1_3:
	ep1_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0 - ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
var ep4_3, integer;
subject to cep4_3:
	ep4_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
# inputs last read/write dependencies
var lt1_3, integer;
subject to clt1_3:
	lt1_3 == max(rlr1_3, lw1);
var lt4_3, integer;
subject to clt4_3:
	lt4_3 == max(rlr4_3, lw4);
# curr last write times
var lw1_3, integer;
subject to clw1_3:
	lw1_3 == lt1_3 + ep1_3;
var lw4_3, integer;
subject to clw4_3:
	lw4_3 == lt4_3 + ep4_3;
# node last write time
var lw3, integer;
subject to clw3:
	lw3 == max(lw1_3, lw4_3);
# node first write time
var fw3, integer;
subject to cfw3:
	fw3 == st3 + ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
# node: 5 info
# start time
var st5, integer;
subject to cst_st5:
	st5 == ( + fw3*b3_0*b5_0);
# relative last reads
var rlr3_5, integer;
subject to cst_rlr3_5:
	rlr3_5 == st5 + ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0;
# epilogues
var ep3_5, integer;
subject to cep3_5:
	ep3_5 ==  + ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0 - ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0;
# inputs last read/write dependencies
var lt3_5, integer;
subject to clt3_5:
	lt3_5 == max(rlr3_5, lw3);
# curr last write times
var lw3_5, integer;
subject to clw3_5:
	lw3_5 == lt3_5 + ep3_5;
# node last write time
var lw5, integer;
subject to clw5:
	lw5 == (lw3_5);
# node first write time
var fw5, integer;
subject to cfw5:
	fw5 == st5 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x5_1)) * 1 * b5_0;
# node: 6 info
# start time
var st6, integer;
subject to cst_st6:
	st6 == ( + lw5*b5_0*b6_0);
# relative last reads
var rlr5_6, integer;
subject to cst_rlr5_6:
	rlr5_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0;
# epilogues
var ep5_6, integer;
subject to cep5_6:
	ep5_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0;
# inputs last read/write dependencies
var lt5_6, integer;
subject to clt5_6:
	lt5_6 == max(rlr5_6, lw5);
# curr last write times
var lw5_6, integer;
subject to clw5_6:
	lw5_6 == lt5_6 + ep5_6;
# node last write time
var lw6, integer;
subject to clw6:
	lw6 == (lw5_6);
# node first write time
var fw6, integer;
subject to cfw6:
	fw6 == st6 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0;
# node: 23 info
# start time
var st23, integer;
subject to cst_st23:
	st23 == ( + fw10000*b10000_0*b23_0);
# relative last reads
var rlr10000_23, integer;
subject to cst_rlr10000_23:
	rlr10000_23 == st23 + (0) * 1 * b23_0;
# epilogues
var ep10000_23, integer;
subject to cep10000_23:
	ep10000_23 ==  + ((0 + (x23_1 - 1) * 1 * 1 + (x23_0 - 1) * 1 * 1 * x23_1)) * 1 * b23_0 - (0) * 1 * b23_0;
# inputs last read/write dependencies
var lt10000_23, integer;
subject to clt10000_23:
	lt10000_23 == max(rlr10000_23, lw10000);
# curr last write times
var lw10000_23, integer;
subject to clw10000_23:
	lw10000_23 == lt10000_23 + ep10000_23;
# node last write time
var lw23, integer;
subject to clw23:
	lw23 == (lw10000_23);
# node first write time
var fw23, integer;
subject to cfw23:
	fw23 == st23 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x23_1)) * 1 * b23_0;
# node: 7 info
# start time
var st7, integer;
subject to cst_st7:
	st7 == ( + fw10000*b10000_0*b7_0);
# relative last reads
var rlr10000_7, integer;
subject to cst_rlr10000_7:
	rlr10000_7 == st7 + (0) * 1 * b7_0;
# epilogues
var ep10000_7, integer;
subject to cep10000_7:
	ep10000_7 ==  + ((0 + (x7_1 - 1) * 1 * 1 + (x7_0 - 1) * 1 * 1 * x7_1)) * 1 * b7_0 - (0) * 1 * b7_0;
# inputs last read/write dependencies
var lt10000_7, integer;
subject to clt10000_7:
	lt10000_7 == max(rlr10000_7, lw10000);
# curr last write times
var lw10000_7, integer;
subject to clw10000_7:
	lw10000_7 == lt10000_7 + ep10000_7;
# node last write time
var lw7, integer;
subject to clw7:
	lw7 == (lw10000_7);
# node first write time
var fw7, integer;
subject to cfw7:
	fw7 == st7 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x7_1)) * 1 * b7_0;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == max( + fw1*b1_0*b2_0,  + fw7*b7_0*b2_0);
# relative last reads
var rlr1_2, integer;
subject to cst_rlr1_2:
	rlr1_2 == st2 + ((0 + 0 * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
var rlr7_2, integer;
subject to cst_rlr7_2:
	rlr7_2 == st2 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
# epilogues
var ep1_2, integer;
subject to cep1_2:
	ep1_2 ==  + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0 - ((0 + 0 * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
var ep7_2, integer;
subject to cep7_2:
	ep7_2 ==  + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0 - ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
# inputs last read/write dependencies
var lt1_2, integer;
subject to clt1_2:
	lt1_2 == max(rlr1_2, lw1);
var lt7_2, integer;
subject to clt7_2:
	lt7_2 == max(rlr7_2, lw7);
# curr last write times
var lw1_2, integer;
subject to clw1_2:
	lw1_2 == lt1_2 + ep1_2;
var lw7_2, integer;
subject to clw7_2:
	lw7_2 == lt7_2 + ep7_2;
# node last write time
var lw2, integer;
subject to clw2:
	lw2 == max(lw1_2, lw7_2);
# node first write time
var fw2, integer;
subject to cfw2:
	fw2 == st2 + ((0 + 0 * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
# node: 8 info
# start time
var st8, integer;
subject to cst_st8:
	st8 == ( + fw2*b2_0*b8_0);
# relative last reads
var rlr2_8, integer;
subject to cst_rlr2_8:
	rlr2_8 == st8 + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0;
# epilogues
var ep2_8, integer;
subject to cep2_8:
	ep2_8 ==  + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 - ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0;
# inputs last read/write dependencies
var lt2_8, integer;
subject to clt2_8:
	lt2_8 == max(rlr2_8, lw2);
# curr last write times
var lw2_8, integer;
subject to clw2_8:
	lw2_8 == lt2_8 + ep2_8;
# node last write time
var lw8, integer;
subject to clw8:
	lw8 == (lw2_8);
# node first write time
var fw8, integer;
subject to cfw8:
	fw8 == st8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_1)) * 1 * b8_0;
# node: 9 info
# start time
var st9, integer;
subject to cst_st9:
	st9 == ( + lw8*b8_0*b9_0);
# relative last reads
var rlr8_9, integer;
subject to cst_rlr8_9:
	rlr8_9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0;
# epilogues
var ep8_9, integer;
subject to cep8_9:
	ep8_9 ==  + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0 - ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0;
# inputs last read/write dependencies
var lt8_9, integer;
subject to clt8_9:
	lt8_9 == max(rlr8_9, lw8);
# curr last write times
var lw8_9, integer;
subject to clw8_9:
	lw8_9 == lt8_9 + ep8_9;
# node last write time
var lw9, integer;
subject to clw9:
	lw9 == (lw8_9);
# node first write time
var fw9, integer;
subject to cfw9:
	fw9 == st9 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0;
# node: 13 info
# start time
var st13, integer;
subject to cst_st13:
	st13 == max( + fw6*b6_0*b13_0,  + fw9*b9_0*b13_0);
# relative last reads
var rlr6_13, integer;
subject to cst_rlr6_13:
	rlr6_13 == st13 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0;
var rlr9_13, integer;
subject to cst_rlr9_13:
	rlr9_13 == st13 + ((0 + 0 * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0;
# epilogues
var ep6_13, integer;
subject to cep6_13:
	ep6_13 ==  + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0 - ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0;
var ep9_13, integer;
subject to cep9_13:
	ep9_13 ==  + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0 - ((0 + 0 * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0;
# inputs last read/write dependencies
var lt6_13, integer;
subject to clt6_13:
	lt6_13 == max(rlr6_13, lw6);
var lt9_13, integer;
subject to clt9_13:
	lt9_13 == max(rlr9_13, lw9);
# curr last write times
var lw6_13, integer;
subject to clw6_13:
	lw6_13 == lt6_13 + ep6_13;
var lw9_13, integer;
subject to clw9_13:
	lw9_13 == lt9_13 + ep9_13;
# node last write time
var lw13, integer;
subject to clw13:
	lw13 == max(lw6_13, lw9_13);
# node first write time
var fw13, integer;
subject to cfw13:
	fw13 == st13 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + 0 * 1 * 1 * x13_3 * x13_2 * x13_1)) * 1 * b13_0;
# node: 14 info
# start time
var st14, integer;
subject to cst_st14:
	st14 == ( + fw13*b13_0*b14_0);
# relative last reads
var rlr13_14, integer;
subject to cst_rlr13_14:
	rlr13_14 == st14 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0;
# epilogues
var ep13_14, integer;
subject to cep13_14:
	ep13_14 ==  + ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 - ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0;
# inputs last read/write dependencies
var lt13_14, integer;
subject to clt13_14:
	lt13_14 == max(rlr13_14, lw13);
# curr last write times
var lw13_14, integer;
subject to clw13_14:
	lw13_14 == lt13_14 + ep13_14;
# node last write time
var lw14, integer;
subject to clw14:
	lw14 == (lw13_14);
# node first write time
var fw14, integer;
subject to cfw14:
	fw14 == st14 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_2 + 0 * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_2 + 0 * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0;
# node: 15 info
# start time
var st15, integer;
subject to cst_st15:
	st15 == ( + fw14*b14_0*b15_0);
# relative last reads
var rlr14_15, integer;
subject to cst_rlr14_15:
	rlr14_15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 1 * b15_0;
# epilogues
var ep14_15, integer;
subject to cep14_15:
	ep14_15 ==  + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 1 * b15_0 - ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 1 * b15_0;
# inputs last read/write dependencies
var lt14_15, integer;
subject to clt14_15:
	lt14_15 == max(rlr14_15, lw14);
# curr last write times
var lw14_15, integer;
subject to clw14_15:
	lw14_15 == lt14_15 + ep14_15;
# node last write time
var lw15, integer;
subject to clw15:
	lw15 == (lw14_15);
# node first write time
var fw15, integer;
subject to cfw15:
	fw15 == st15 + ((0 + 0 * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 1 * b15_0;
# node: 16 info
# start time
var st16, integer;
subject to cst_st16:
	st16 == max( + fw14*b14_0*b16_0,  + fw15*b15_0*b16_0);
# relative last reads
var rlr14_16, integer;
subject to cst_rlr14_16:
	rlr14_16 == st16 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0;
var rlr15_16, integer;
subject to cst_rlr15_16:
	rlr15_16 == st16 + ((0 + (x16_2 - 1) * 1 * 1 + 0 * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0;
# epilogues
var ep14_16, integer;
subject to cep14_16:
	ep14_16 ==  + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 - ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0;
var ep15_16, integer;
subject to cep15_16:
	ep15_16 ==  + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 - ((0 + (x16_2 - 1) * 1 * 1 + 0 * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0;
# inputs last read/write dependencies
var lt14_16, integer;
subject to clt14_16:
	lt14_16 == max(rlr14_16, lw14);
var lt15_16, integer;
subject to clt15_16:
	lt15_16 == max(rlr15_16, lw15);
# curr last write times
var lw14_16, integer;
subject to clw14_16:
	lw14_16 == lt14_16 + ep14_16;
var lw15_16, integer;
subject to clw15_16:
	lw15_16 == lt15_16 + ep15_16;
# node last write time
var lw16, integer;
subject to clw16:
	lw16 == max(lw14_16, lw15_16);
# node first write time
var fw16, integer;
subject to cfw16:
	fw16 == st16 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_2 + 0 * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_2 + 0 * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0;
# node: 17 info
# start time
var st17, integer;
subject to cst_st17:
	st17 == ( + fw16*b16_0*b17_0);
# relative last reads
var rlr16_17, integer;
subject to cst_rlr16_17:
	rlr16_17 == st17 + ((0 + (x17_2 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + (x17_0 - 1) * 1 * 1 * x17_2 * x17_1)) * 1 * b17_0;
# epilogues
var ep16_17, integer;
subject to cep16_17:
	ep16_17 ==  + ((0 + (x17_2 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + (x17_0 - 1) * 1 * 1 * x17_2 * x17_1)) * 1 * b17_0 - ((0 + (x17_2 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + (x17_0 - 1) * 1 * 1 * x17_2 * x17_1)) * 1 * b17_0;
# inputs last read/write dependencies
var lt16_17, integer;
subject to clt16_17:
	lt16_17 == max(rlr16_17, lw16);
# curr last write times
var lw16_17, integer;
subject to clw16_17:
	lw16_17 == lt16_17 + ep16_17;
# node last write time
var lw17, integer;
subject to clw17:
	lw17 == (lw16_17);
# node first write time
var fw17, integer;
subject to cfw17:
	fw17 == st17 + ((0 + 0 * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + 0 * 1 * 1 * x17_2 * x17_1)) * 1 * b17_0;
# node: 18 info
# start time
var st18, integer;
subject to cst_st18:
	st18 == max( + fw16*b16_0*b18_0,  + fw17*b17_0*b18_0);
# relative last reads
var rlr16_18, integer;
subject to cst_rlr16_18:
	rlr16_18 == st18 + ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0;
var rlr17_18, integer;
subject to cst_rlr17_18:
	rlr17_18 == st18 + ((0 + (x18_2 - 1) * 1 * 1 + 0 * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0;
# epilogues
var ep16_18, integer;
subject to cep16_18:
	ep16_18 ==  + ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 - ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0;
var ep17_18, integer;
subject to cep17_18:
	ep17_18 ==  + ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 - ((0 + (x18_2 - 1) * 1 * 1 + 0 * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0;
# inputs last read/write dependencies
var lt16_18, integer;
subject to clt16_18:
	lt16_18 == max(rlr16_18, lw16);
var lt17_18, integer;
subject to clt17_18:
	lt17_18 == max(rlr17_18, lw17);
# curr last write times
var lw16_18, integer;
subject to clw16_18:
	lw16_18 == lt16_18 + ep16_18;
var lw17_18, integer;
subject to clw17_18:
	lw17_18 == lt17_18 + ep17_18;
# node last write time
var lw18, integer;
subject to clw18:
	lw18 == max(lw16_18, lw17_18);
# node first write time
var fw18, integer;
subject to cfw18:
	fw18 == st18 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_2 + 0 * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == max( + fw1*b1_0*b0_0,  + fw10*b10_0*b0_0);
# relative last reads
var rlr1_0, integer;
subject to cst_rlr1_0:
	rlr1_0 == st0 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
var rlr10_0, integer;
subject to cst_rlr10_0:
	rlr10_0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
# epilogues
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0 - ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
var ep10_0, integer;
subject to cep10_0:
	ep10_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0 - ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
# inputs last read/write dependencies
var lt1_0, integer;
subject to clt1_0:
	lt1_0 == max(rlr1_0, lw1);
var lt10_0, integer;
subject to clt10_0:
	lt10_0 == max(rlr10_0, lw10);
# curr last write times
var lw1_0, integer;
subject to clw1_0:
	lw1_0 == lt1_0 + ep1_0;
var lw10_0, integer;
subject to clw10_0:
	lw10_0 == lt10_0 + ep10_0;
# node last write time
var lw0, integer;
subject to clw0:
	lw0 == max(lw1_0, lw10_0);
# node first write time
var fw0, integer;
subject to cfw0:
	fw0 == st0 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
# node: 11 info
# start time
var st11, integer;
subject to cst_st11:
	st11 == ( + fw0*b0_0*b11_0);
# relative last reads
var rlr0_11, integer;
subject to cst_rlr0_11:
	rlr0_11 == st11 + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0;
# epilogues
var ep0_11, integer;
subject to cep0_11:
	ep0_11 ==  + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 - ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0;
# inputs last read/write dependencies
var lt0_11, integer;
subject to clt0_11:
	lt0_11 == max(rlr0_11, lw0);
# curr last write times
var lw0_11, integer;
subject to clw0_11:
	lw0_11 == lt0_11 + ep0_11;
# node last write time
var lw11, integer;
subject to clw11:
	lw11 == (lw0_11);
# node first write time
var fw11, integer;
subject to cfw11:
	fw11 == st11 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_1)) * 1 * b11_0;
# node: 12 info
# start time
var st12, integer;
subject to cst_st12:
	st12 == ( + lw11*b11_0*b12_0);
# relative last reads
var rlr11_12, integer;
subject to cst_rlr11_12:
	rlr11_12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0;
# epilogues
var ep11_12, integer;
subject to cep11_12:
	ep11_12 ==  + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0 - ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0;
# inputs last read/write dependencies
var lt11_12, integer;
subject to clt11_12:
	lt11_12 == max(rlr11_12, lw11);
# curr last write times
var lw11_12, integer;
subject to clw11_12:
	lw11_12 == lt11_12 + ep11_12;
# node last write time
var lw12, integer;
subject to clw12:
	lw12 == (lw11_12);
# node first write time
var fw12, integer;
subject to cfw12:
	fw12 == st12 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0;
# node: 19 info
# start time
var st19, integer;
subject to cst_st19:
	st19 == max( + fw18*b18_0*b19_0,  + lw12*b12_0*b19_0);
# relative last reads
var rlr18_19, integer;
subject to cst_rlr18_19:
	rlr18_19 == st19 + ((0 + 0 * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0;
var rlr12_19, integer;
subject to cst_rlr12_19:
	rlr12_19 == st19 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0;
# epilogues
var ep18_19, integer;
subject to cep18_19:
	ep18_19 ==  + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0 - ((0 + 0 * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0;
var ep12_19, integer;
subject to cep12_19:
	ep12_19 ==  + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0 - ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0;
# inputs last read/write dependencies
var lt18_19, integer;
subject to clt18_19:
	lt18_19 == max(rlr18_19, lw18);
var lt12_19, integer;
subject to clt12_19:
	lt12_19 == max(rlr12_19, lw12);
# curr last write times
var lw18_19, integer;
subject to clw18_19:
	lw18_19 == lt18_19 + ep18_19;
var lw12_19, integer;
subject to clw12_19:
	lw12_19 == lt12_19 + ep12_19;
# node last write time
var lw19, integer;
subject to clw19:
	lw19 == max(lw18_19, lw12_19);
# node first write time
var fw19, integer;
subject to cfw19:
	fw19 == st19 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + 0 * 1 * 1 * x19_3 * x19_2 * x19_1)) * 1 * b19_0;
# node: 20 info
# start time
var st20, integer;
subject to cst_st20:
	st20 == ( + fw19*b19_0*b20_0);
# relative last reads
var rlr19_20, integer;
subject to cst_rlr19_20:
	rlr19_20 == st20 + ((0 + (x20_2 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_2 + (x20_0 - 1) * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0;
# epilogues
var ep19_20, integer;
subject to cep19_20:
	ep19_20 ==  + ((0 + (x20_2 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_2 + (x20_0 - 1) * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0 - ((0 + (x20_2 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_2 + (x20_0 - 1) * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0;
# inputs last read/write dependencies
var lt19_20, integer;
subject to clt19_20:
	lt19_20 == max(rlr19_20, lw19);
# curr last write times
var lw19_20, integer;
subject to clw19_20:
	lw19_20 == lt19_20 + ep19_20;
# node last write time
var lw20, integer;
subject to clw20:
	lw20 == (lw19_20);
# node first write time
var fw20, integer;
subject to cfw20:
	fw20 == st20 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_2 + 0 * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0;
# node: 21 info
# start time
var st21, integer;
subject to cst_st21:
	st21 == ( + lw20*b20_0*b21_0);
# relative last reads
var rlr20_21, integer;
subject to cst_rlr20_21:
	rlr20_21 == st21 + ((0 + (x21_1 - 1) * 1 * 1 + (x21_0 - 1) * 1 * 1 * x21_1)) * 1 * b21_0;
# epilogues
var ep20_21, integer;
subject to cep20_21:
	ep20_21 ==  + ((0 + (x21_1 - 1) * 1 * 1 + (x21_0 - 1) * 1 * 1 * x21_1)) * 1 * b21_0 - ((0 + (x21_1 - 1) * 1 * 1 + (x21_0 - 1) * 1 * 1 * x21_1)) * 1 * b21_0;
# inputs last read/write dependencies
var lt20_21, integer;
subject to clt20_21:
	lt20_21 == max(rlr20_21, lw20);
# curr last write times
var lw20_21, integer;
subject to clw20_21:
	lw20_21 == lt20_21 + ep20_21;
# node last write time
var lw21, integer;
subject to clw21:
	lw21 == (lw20_21);
# node first write time
var fw21, integer;
subject to cfw21:
	fw21 == st21 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x21_1)) * 1 * b21_0;
# node: 22 info
# start time
var st22, integer;
subject to cst_st22:
	st22 == max( + fw21*b21_0*b22_0,  + fw23*b23_0*b22_0);
# relative last reads
var rlr21_22, integer;
subject to cst_rlr21_22:
	rlr21_22 == st22 + ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0;
var rlr23_22, integer;
subject to cst_rlr23_22:
	rlr23_22 == st22 + ((0 + 0 * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0;
# epilogues
var ep21_22, integer;
subject to cep21_22:
	ep21_22 ==  + ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0 - ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0;
var ep23_22, integer;
subject to cep23_22:
	ep23_22 ==  + ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0 - ((0 + 0 * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0;
# inputs last read/write dependencies
var lt21_22, integer;
subject to clt21_22:
	lt21_22 == max(rlr21_22, lw21);
var lt23_22, integer;
subject to clt23_22:
	lt23_22 == max(rlr23_22, lw23);
# curr last write times
var lw21_22, integer;
subject to clw21_22:
	lw21_22 == lt21_22 + ep21_22;
var lw23_22, integer;
subject to clw23_22:
	lw23_22 == lt23_22 + ep23_22;
# node last write time
var lw22, integer;
subject to clw22:
	lw22 == max(lw21_22, lw23_22);
# node first write time
var fw22, integer;
subject to cfw22:
	fw22 == st22 + ((0 + 0 * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_1)) * 1 * b22_0;
# node: 24 info
# start time
var st24, integer;
subject to cst_st24:
	st24 == ( + fw22*b22_0*b24_0);
# relative last reads
var rlr22_24, integer;
subject to cst_rlr22_24:
	rlr22_24 == st24 + ((0 + (x24_1 - 1) * 1 * 1 + (x24_0 - 1) * 1 * 1 * x24_1)) * 1 * b24_0;
# epilogues
var ep22_24, integer;
subject to cep22_24:
	ep22_24 ==  + ((0 + (x24_1 - 1) * 1 * 1 + (x24_0 - 1) * 1 * 1 * x24_1)) * 1 * b24_0 - ((0 + (x24_1 - 1) * 1 * 1 + (x24_0 - 1) * 1 * 1 * x24_1)) * 1 * b24_0;
# inputs last read/write dependencies
var lt22_24, integer;
subject to clt22_24:
	lt22_24 == max(rlr22_24, lw22);
# curr last write times
var lw22_24, integer;
subject to clw22_24:
	lw22_24 == lt22_24 + ep22_24;
# node last write time
var lw24, integer;
subject to clw24:
	lw24 == (lw22_24);
# node first write time
var fw24, integer;
subject to cfw24:
	fw24 == st24 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x24_1)) * 1 * b24_0;
# node: 25 info
# start time
var st25, integer;
subject to cst_st25:
	st25 == ( + fw24*b24_0*b25_0);
# relative last reads
var rlr24_25, integer;
subject to cst_rlr24_25:
	rlr24_25 == st25 + ((0 + (x25_1 - 1) * 1 * 1 + (x25_0 - 1) * 1 * 1 * x25_1)) * 1 * b25_0;
# epilogues
var ep24_25, integer;
subject to cep24_25:
	ep24_25 == 0;
# inputs last read/write dependencies
var lt24_25, integer;
subject to clt24_25:
	lt24_25 == max(rlr24_25, lw24);
# curr last write times
var lw24_25, integer;
subject to clw24_25:
	lw24_25 == lt24_25 + ep24_25;
# node last write time
var lw25, integer;
subject to clw25:
	lw25 == (lw24_25);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw25);
minimize obj: latency;
solve obj;
display x0_0;
display u0_0;
display x0_1;
display u0_1;
display x0_2;
display u0_2;
display x7_0;
display u7_0;
display x7_1;
display u7_1;
display x14_0;
display u14_0;
display x14_1;
display u14_1;
display x14_2;
display u14_2;
display x21_0;
display u21_0;
display x21_1;
display u21_1;
display x2_0;
display u2_0;
display x2_1;
display u2_1;
display x2_2;
display u2_2;
display x9_0;
display u9_0;
display x9_1;
display u9_1;
display x9_2;
display u9_2;
display x16_0;
display u16_0;
display x16_1;
display u16_1;
display x16_2;
display u16_2;
display x23_0;
display u23_0;
display x23_1;
display u23_1;
display x4_0;
display u4_0;
display x4_1;
display u4_1;
display x11_0;
display u11_0;
display x11_1;
display u11_1;
display x18_0;
display u18_0;
display x18_1;
display u18_1;
display x18_2;
display u18_2;
display x25_0;
display u25_0;
display x25_1;
display u25_1;
display x6_0;
display u6_0;
display x6_1;
display u6_1;
display x6_2;
display u6_2;
display x13_0;
display u13_0;
display x13_1;
display u13_1;
display x13_2;
display u13_2;
display x13_3;
display u13_3;
display x20_0;
display u20_0;
display x20_1;
display u20_1;
display x20_2;
display u20_2;
display x1_0;
display u1_0;
display x1_1;
display u1_1;
display x8_0;
display u8_0;
display x8_1;
display u8_1;
display x15_0;
display u15_0;
display x15_1;
display u15_1;
display x15_2;
display u15_2;
display x22_0;
display u22_0;
display x22_1;
display u22_1;
display x22_2;
display u22_2;
display x3_0;
display u3_0;
display x3_1;
display u3_1;
display x3_2;
display u3_2;
display x10_0;
display u10_0;
display x10_1;
display u10_1;
display x17_0;
display u17_0;
display x17_1;
display u17_1;
display x17_2;
display u17_2;
display x24_0;
display u24_0;
display x24_1;
display u24_1;
display x5_0;
display u5_0;
display x5_1;
display u5_1;
display x12_0;
display u12_0;
display x12_1;
display u12_1;
display x12_2;
display u12_2;
display x19_0;
display u19_0;
display x19_1;
display u19_1;
display x19_2;
display u19_2;
display x19_3;
display u19_3;
display DSP_0;
display DSP_7;
display DSP_14;
display DSP_21;
display DSP_2;
display DSP_9;
display DSP_16;
display DSP_23;
display DSP_4;
display DSP_11;
display DSP_18;
display DSP_25;
display DSP_6;
display DSP_13;
display DSP_20;
display DSP_1;
display DSP_8;
display DSP_15;
display DSP_22;
display DSP_3;
display DSP_10;
display DSP_17;
display DSP_24;
display DSP_5;
display DSP_12;
display DSP_19;
display latency;
display totalDSPs;
