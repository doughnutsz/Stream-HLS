# solver type
option solver gurobi;
option gurobi_options 'lim:time=300';
param b0_0 := 1;
param b7_0 := 1;
param b14_0 := 1;
param b2_0 := 1;
param b9_0 := 1;
param b16_0 := 1;
param b10000_0 := 1;
param b4_0 := 1;
param b11_0 := 1;
param b18_0 := 1;
param b6_0 := 1;
param b13_0 := 1;
param b1_0 := 1;
param b8_0 := 1;
param b15_0 := 1;
param b3_0 := 1;
param b10_0 := 1;
param b17_0 := 1;
param b5_0 := 1;
param b12_0 := 1;
var x0_0 >= 16, <= 32, integer;
var u0_0 >= 1, <= 32, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 32;
var x0_1 >= 16, <= 256, integer;
var u0_1 >= 1, <= 256, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 256;
var x0_2 >= 16, <= 784, integer;
var u0_2 >= 1, <= 784, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 784;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2;
var x7_0 >= 16, <= 64, integer;
var u7_0 >= 1, <= 64, integer;
subject to c_uf7_0:
	u7_0 * x7_0 == 64;
var x7_1 >= 16, <= 128, integer;
var u7_1 >= 1, <= 128, integer;
subject to c_uf7_1:
	u7_1 * x7_1 == 128;
var DSP_7, integer;
subject to c_DSP7:
	DSP_7 == 0;
var x14_0 >= 16, <= 32, integer;
var u14_0 >= 1, <= 32, integer;
subject to c_uf14_0:
	u14_0 * x14_0 == 32;
var x14_1 >= 16, <= 256, integer;
var u14_1 >= 1, <= 256, integer;
subject to c_uf14_1:
	u14_1 * x14_1 == 256;
var DSP_14, integer;
subject to c_DSP14:
	DSP_14 == 0;
var x2_0 >= 16, <= 32, integer;
var u2_0 >= 1, <= 32, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 32;
var x2_1 >= 16, <= 256, integer;
var u2_1 >= 1, <= 256, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 256;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == 0;
var x9_0 >= 16, <= 32, integer;
var u9_0 >= 1, <= 32, integer;
subject to c_uf9_0:
	u9_0 * x9_0 == 32;
var x9_1 >= 16, <= 128, integer;
var u9_1 >= 1, <= 128, integer;
subject to c_uf9_1:
	u9_1 * x9_1 == 128;
var x9_2 >= 16, <= 64, integer;
var u9_2 >= 1, <= 64, integer;
subject to c_uf9_2:
	u9_2 * x9_2 == 64;
var DSP_9, integer;
subject to c_DSP9:
	DSP_9 == u9_0 * u9_1 * u9_2;
var x16_0 >= 16, <= 784, integer;
var u16_0 >= 1, <= 784, integer;
subject to c_uf16_0:
	u16_0 * x16_0 == 784;
var x16_1 >= 16, <= 256, integer;
var u16_1 >= 1, <= 256, integer;
subject to c_uf16_1:
	u16_1 * x16_1 == 256;
var DSP_16, integer;
subject to c_DSP16:
	DSP_16 == 0;
var x4_0 >= 16, <= 128, integer;
var u4_0 >= 1, <= 128, integer;
subject to c_uf4_0:
	u4_0 * x4_0 == 128;
var x4_1 >= 16, <= 256, integer;
var u4_1 >= 1, <= 256, integer;
subject to c_uf4_1:
	u4_1 * x4_1 == 256;
var DSP_4, integer;
subject to c_DSP4:
	DSP_4 == 0;
var x11_0 >= 16, <= 32, integer;
var u11_0 >= 1, <= 32, integer;
subject to c_uf11_0:
	u11_0 * x11_0 == 32;
var x11_1 >= 16, <= 128, integer;
var u11_1 >= 1, <= 128, integer;
subject to c_uf11_1:
	u11_1 * x11_1 == 128;
var DSP_11, integer;
subject to c_DSP11:
	DSP_11 == 0;
var x18_0 >= 16, <= 32, integer;
var u18_0 >= 1, <= 32, integer;
subject to c_uf18_0:
	u18_0 * x18_0 == 32;
var x18_1 >= 16, <= 784, integer;
var u18_1 >= 1, <= 784, integer;
subject to c_uf18_1:
	u18_1 * x18_1 == 784;
var DSP_18, integer;
subject to c_DSP18:
	DSP_18 == 0;
var x6_0 >= 16, <= 32, integer;
var u6_0 >= 1, <= 32, integer;
subject to c_uf6_0:
	u6_0 * x6_0 == 32;
var x6_1 >= 16, <= 64, integer;
var u6_1 >= 1, <= 64, integer;
subject to c_uf6_1:
	u6_1 * x6_1 == 64;
var x6_2 >= 16, <= 128, integer;
var u6_2 >= 1, <= 128, integer;
subject to c_uf6_2:
	u6_2 * x6_2 == 128;
var DSP_6, integer;
subject to c_DSP6:
	DSP_6 == u6_0 * u6_1 * u6_2;
var x13_0 >= 16, <= 256, integer;
var u13_0 >= 1, <= 256, integer;
subject to c_uf13_0:
	u13_0 * x13_0 == 256;
var x13_1 >= 16, <= 128, integer;
var u13_1 >= 1, <= 128, integer;
subject to c_uf13_1:
	u13_1 * x13_1 == 128;
var DSP_13, integer;
subject to c_DSP13:
	DSP_13 == 0;
var x1_0 >= 16, <= 256, integer;
var u1_0 >= 1, <= 256, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 256;
var x1_1 >= 16, <= 784, integer;
var u1_1 >= 1, <= 784, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 784;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == 0;
var x8_0 >= 16, <= 32, integer;
var u8_0 >= 1, <= 32, integer;
subject to c_uf8_0:
	u8_0 * x8_0 == 32;
var x8_1 >= 16, <= 64, integer;
var u8_1 >= 1, <= 64, integer;
subject to c_uf8_1:
	u8_1 * x8_1 == 64;
var DSP_8, integer;
subject to c_DSP8:
	DSP_8 == 0;
var x15_0 >= 16, <= 32, integer;
var u15_0 >= 1, <= 32, integer;
subject to c_uf15_0:
	u15_0 * x15_0 == 32;
var x15_1 >= 16, <= 784, integer;
var u15_1 >= 1, <= 784, integer;
subject to c_uf15_1:
	u15_1 * x15_1 == 784;
var x15_2 >= 16, <= 256, integer;
var u15_2 >= 1, <= 256, integer;
subject to c_uf15_2:
	u15_2 * x15_2 == 256;
var DSP_15, integer;
subject to c_DSP15:
	DSP_15 == u15_0 * u15_1 * u15_2;
var x3_0 >= 16, <= 32, integer;
var u3_0 >= 1, <= 32, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 32;
var x3_1 >= 16, <= 128, integer;
var u3_1 >= 1, <= 128, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 128;
var x3_2 >= 16, <= 256, integer;
var u3_2 >= 1, <= 256, integer;
subject to c_uf3_2:
	u3_2 * x3_2 == 256;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == u3_0 * u3_1 * u3_2;
var x10_0 >= 16, <= 128, integer;
var u10_0 >= 1, <= 128, integer;
subject to c_uf10_0:
	u10_0 * x10_0 == 128;
var x10_1 >= 16, <= 64, integer;
var u10_1 >= 1, <= 64, integer;
subject to c_uf10_1:
	u10_1 * x10_1 == 64;
var DSP_10, integer;
subject to c_DSP10:
	DSP_10 == 0;
var x17_0 >= 16, <= 32, integer;
var u17_0 >= 1, <= 32, integer;
subject to c_uf17_0:
	u17_0 * x17_0 == 32;
var x17_1 >= 16, <= 784, integer;
var u17_1 >= 1, <= 784, integer;
subject to c_uf17_1:
	u17_1 * x17_1 == 784;
var DSP_17, integer;
subject to c_DSP17:
	DSP_17 == 0;
var x5_0 >= 16, <= 32, integer;
var u5_0 >= 1, <= 32, integer;
subject to c_uf5_0:
	u5_0 * x5_0 == 32;
var x5_1 >= 16, <= 128, integer;
var u5_1 >= 1, <= 128, integer;
subject to c_uf5_1:
	u5_1 * x5_1 == 128;
var DSP_5, integer;
subject to c_DSP5:
	DSP_5 == 0;
var x12_0 >= 16, <= 32, integer;
var u12_0 >= 1, <= 32, integer;
subject to c_uf12_0:
	u12_0 * x12_0 == 32;
var x12_1 >= 16, <= 256, integer;
var u12_1 >= 1, <= 256, integer;
subject to c_uf12_1:
	u12_1 * x12_1 == 256;
var x12_2 >= 16, <= 128, integer;
var u12_2 >= 1, <= 128, integer;
subject to c_uf12_2:
	u12_2 * x12_2 == 128;
var DSP_12, integer;
subject to c_DSP12:
	DSP_12 == u12_0 * u12_1 * u12_2;
subject to c_u0_2_u1_1:
	u0_2 == u1_1;
subject to c_u0_1_u1_0:
	u0_1 == u1_0;
subject to c_u14_0_u12_0:
	u14_0 == u12_0;
subject to c_u14_1_u12_1:
	u14_1 == u12_1;
subject to c_u2_0_u0_0:
	u2_0 == u0_0;
subject to c_u2_1_u0_1:
	u2_1 == u0_1;
subject to c_u9_0_u8_0:
	u9_0 == u8_0;
subject to c_u9_2_u8_1:
	u9_2 == u8_1;
subject to c_u9_2_u10_1:
	u9_2 == u10_1;
subject to c_u9_1_u10_0:
	u9_1 == u10_0;
subject to c_u11_0_u9_0:
	u11_0 == u9_0;
subject to c_u11_1_u9_1:
	u11_1 == u9_1;
subject to c_u18_0_u17_0:
	u18_0 == u17_0;
subject to c_u18_1_u17_1:
	u18_1 == u17_1;
subject to c_u6_0_u5_0:
	u6_0 == u5_0;
subject to c_u6_2_u5_1:
	u6_2 == u5_1;
subject to c_u6_2_u7_1:
	u6_2 == u7_1;
subject to c_u6_1_u7_0:
	u6_1 == u7_0;
subject to c_u8_0_u6_0:
	u8_0 == u6_0;
subject to c_u8_1_u6_1:
	u8_1 == u6_1;
subject to c_u15_0_u14_0:
	u15_0 == u14_0;
subject to c_u15_2_u14_1:
	u15_2 == u14_1;
subject to c_u15_2_u16_1:
	u15_2 == u16_1;
subject to c_u15_1_u16_0:
	u15_1 == u16_0;
subject to c_u3_0_u2_0:
	u3_0 == u2_0;
subject to c_u3_2_u2_1:
	u3_2 == u2_1;
subject to c_u3_2_u4_1:
	u3_2 == u4_1;
subject to c_u3_1_u4_0:
	u3_1 == u4_0;
subject to c_u17_0_u15_0:
	u17_0 == u15_0;
subject to c_u17_1_u15_1:
	u17_1 == u15_1;
subject to c_u5_0_u3_0:
	u5_0 == u3_0;
subject to c_u5_1_u3_1:
	u5_1 == u3_1;
subject to c_u12_0_u11_0:
	u12_0 == u11_0;
subject to c_u12_2_u11_1:
	u12_2 == u11_1;
subject to c_u12_2_u13_1:
	u12_2 == u13_1;
subject to c_u12_1_u13_0:
	u12_1 == u13_0;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_7 + DSP_14 + DSP_2 + DSP_9 + DSP_16 + DSP_4 + DSP_11 + DSP_18 + DSP_6 + DSP_13 + DSP_1 + DSP_8 + DSP_15 + DSP_3 + DSP_10 + DSP_17 + DSP_5 + DSP_12;
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
	ep10000_1 ==  + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 - (0) * 1 * b1_0;
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
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0;
# node: 13 info
# start time
var st13, integer;
subject to cst_st13:
	st13 == ( + fw10000*b10000_0*b13_0);
# relative last reads
var rlr10000_13, integer;
subject to cst_rlr10000_13:
	rlr10000_13 == st13 + (0) * 1 * b13_0;
# epilogues
var ep10000_13, integer;
subject to cep10000_13:
	ep10000_13 ==  + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1)) * 1 * b13_0 - (0) * 1 * b13_0;
# inputs last read/write dependencies
var lt10000_13, integer;
subject to clt10000_13:
	lt10000_13 == max(rlr10000_13, lw10000);
# curr last write times
var lw10000_13, integer;
subject to clw10000_13:
	lw10000_13 == lt10000_13 + ep10000_13;
# node last write time
var lw13, integer;
subject to clw13:
	lw13 == (lw10000_13);
# node first write time
var fw13, integer;
subject to cfw13:
	fw13 == st13 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_1)) * 1 * b13_0;
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
# node: 16 info
# start time
var st16, integer;
subject to cst_st16:
	st16 == ( + fw10000*b10000_0*b16_0);
# relative last reads
var rlr10000_16, integer;
subject to cst_rlr10000_16:
	rlr10000_16 == st16 + (0) * 1 * b16_0;
# epilogues
var ep10000_16, integer;
subject to cep10000_16:
	ep10000_16 ==  + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1)) * 1 * b16_0 - (0) * 1 * b16_0;
# inputs last read/write dependencies
var lt10000_16, integer;
subject to clt10000_16:
	lt10000_16 == max(rlr10000_16, lw10000);
# curr last write times
var lw10000_16, integer;
subject to clw10000_16:
	lw10000_16 == lt10000_16 + ep10000_16;
# node last write time
var lw16, integer;
subject to clw16:
	lw16 == (lw10000_16);
# node first write time
var fw16, integer;
subject to cfw16:
	fw16 == st16 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_1)) * 1 * b16_0;
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
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == ( + fw1*b1_0*b0_0);
# relative last reads
var rlr1_0, integer;
subject to cst_rlr1_0:
	rlr1_0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0;
# epilogues
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 - ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0;
# inputs last read/write dependencies
var lt1_0, integer;
subject to clt1_0:
	lt1_0 == max(rlr1_0, lw1);
# curr last write times
var lw1_0, integer;
subject to clw1_0:
	lw1_0 == lt1_0 + ep1_0;
# node last write time
var lw0, integer;
subject to clw0:
	lw0 == (lw1_0);
# node first write time
var fw0, integer;
subject to cfw0:
	fw0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == ( + fw0*b0_0*b2_0);
# relative last reads
var rlr0_2, integer;
subject to cst_rlr0_2:
	rlr0_2 == st2 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0;
# epilogues
var ep0_2, integer;
subject to cep0_2:
	ep0_2 ==  + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 - ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0;
# inputs last read/write dependencies
var lt0_2, integer;
subject to clt0_2:
	lt0_2 == max(rlr0_2, lw0);
# curr last write times
var lw0_2, integer;
subject to clw0_2:
	lw0_2 == lt0_2 + ep0_2;
# node last write time
var lw2, integer;
subject to clw2:
	lw2 == (lw0_2);
# node first write time
var fw2, integer;
subject to cfw2:
	fw2 == st2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1)) * 1 * b2_0;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == max( + fw2*b2_0*b3_0,  + fw4*b4_0*b3_0);
# relative last reads
var rlr2_3, integer;
subject to cst_rlr2_3:
	rlr2_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0;
var rlr4_3, integer;
subject to cst_rlr4_3:
	rlr4_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0;
# epilogues
var ep2_3, integer;
subject to cep2_3:
	ep2_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0;
var ep4_3, integer;
subject to cep4_3:
	ep4_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0;
# inputs last read/write dependencies
var lt2_3, integer;
subject to clt2_3:
	lt2_3 == max(rlr2_3, lw2);
var lt4_3, integer;
subject to clt4_3:
	lt4_3 == max(rlr4_3, lw4);
# curr last write times
var lw2_3, integer;
subject to clw2_3:
	lw2_3 == lt2_3 + ep2_3;
var lw4_3, integer;
subject to clw4_3:
	lw4_3 == lt4_3 + ep4_3;
# node last write time
var lw3, integer;
subject to clw3:
	lw3 == max(lw2_3, lw4_3);
# node first write time
var fw3, integer;
subject to cfw3:
	fw3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0;
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
	st6 == max( + fw5*b5_0*b6_0,  + fw7*b7_0*b6_0);
# relative last reads
var rlr5_6, integer;
subject to cst_rlr5_6:
	rlr5_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0;
var rlr7_6, integer;
subject to cst_rlr7_6:
	rlr7_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0;
# epilogues
var ep5_6, integer;
subject to cep5_6:
	ep5_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0;
var ep7_6, integer;
subject to cep7_6:
	ep7_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0;
# inputs last read/write dependencies
var lt5_6, integer;
subject to clt5_6:
	lt5_6 == max(rlr5_6, lw5);
var lt7_6, integer;
subject to clt7_6:
	lt7_6 == max(rlr7_6, lw7);
# curr last write times
var lw5_6, integer;
subject to clw5_6:
	lw5_6 == lt5_6 + ep5_6;
var lw7_6, integer;
subject to clw7_6:
	lw7_6 == lt7_6 + ep7_6;
# node last write time
var lw6, integer;
subject to clw6:
	lw6 == max(lw5_6, lw7_6);
# node first write time
var fw6, integer;
subject to cfw6:
	fw6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0;
# node: 8 info
# start time
var st8, integer;
subject to cst_st8:
	st8 == ( + fw6*b6_0*b8_0);
# relative last reads
var rlr6_8, integer;
subject to cst_rlr6_8:
	rlr6_8 == st8 + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0;
# epilogues
var ep6_8, integer;
subject to cep6_8:
	ep6_8 ==  + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 - ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0;
# inputs last read/write dependencies
var lt6_8, integer;
subject to clt6_8:
	lt6_8 == max(rlr6_8, lw6);
# curr last write times
var lw6_8, integer;
subject to clw6_8:
	lw6_8 == lt6_8 + ep6_8;
# node last write time
var lw8, integer;
subject to clw8:
	lw8 == (lw6_8);
# node first write time
var fw8, integer;
subject to cfw8:
	fw8 == st8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_1)) * 1 * b8_0;
# node: 9 info
# start time
var st9, integer;
subject to cst_st9:
	st9 == max( + fw8*b8_0*b9_0,  + fw10*b10_0*b9_0);
# relative last reads
var rlr8_9, integer;
subject to cst_rlr8_9:
	rlr8_9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0;
var rlr10_9, integer;
subject to cst_rlr10_9:
	rlr10_9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0;
# epilogues
var ep8_9, integer;
subject to cep8_9:
	ep8_9 ==  + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 - ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0;
var ep10_9, integer;
subject to cep10_9:
	ep10_9 ==  + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 - ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0;
# inputs last read/write dependencies
var lt8_9, integer;
subject to clt8_9:
	lt8_9 == max(rlr8_9, lw8);
var lt10_9, integer;
subject to clt10_9:
	lt10_9 == max(rlr10_9, lw10);
# curr last write times
var lw8_9, integer;
subject to clw8_9:
	lw8_9 == lt8_9 + ep8_9;
var lw10_9, integer;
subject to clw10_9:
	lw10_9 == lt10_9 + ep10_9;
# node last write time
var lw9, integer;
subject to clw9:
	lw9 == max(lw8_9, lw10_9);
# node first write time
var fw9, integer;
subject to cfw9:
	fw9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0;
# node: 11 info
# start time
var st11, integer;
subject to cst_st11:
	st11 == ( + fw9*b9_0*b11_0);
# relative last reads
var rlr9_11, integer;
subject to cst_rlr9_11:
	rlr9_11 == st11 + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0;
# epilogues
var ep9_11, integer;
subject to cep9_11:
	ep9_11 ==  + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 - ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0;
# inputs last read/write dependencies
var lt9_11, integer;
subject to clt9_11:
	lt9_11 == max(rlr9_11, lw9);
# curr last write times
var lw9_11, integer;
subject to clw9_11:
	lw9_11 == lt9_11 + ep9_11;
# node last write time
var lw11, integer;
subject to clw11:
	lw11 == (lw9_11);
# node first write time
var fw11, integer;
subject to cfw11:
	fw11 == st11 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_1)) * 1 * b11_0;
# node: 12 info
# start time
var st12, integer;
subject to cst_st12:
	st12 == max( + fw11*b11_0*b12_0,  + fw13*b13_0*b12_0);
# relative last reads
var rlr11_12, integer;
subject to cst_rlr11_12:
	rlr11_12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0;
var rlr13_12, integer;
subject to cst_rlr13_12:
	rlr13_12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0;
# epilogues
var ep11_12, integer;
subject to cep11_12:
	ep11_12 ==  + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 - ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0;
var ep13_12, integer;
subject to cep13_12:
	ep13_12 ==  + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 - ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0;
# inputs last read/write dependencies
var lt11_12, integer;
subject to clt11_12:
	lt11_12 == max(rlr11_12, lw11);
var lt13_12, integer;
subject to clt13_12:
	lt13_12 == max(rlr13_12, lw13);
# curr last write times
var lw11_12, integer;
subject to clw11_12:
	lw11_12 == lt11_12 + ep11_12;
var lw13_12, integer;
subject to clw13_12:
	lw13_12 == lt13_12 + ep13_12;
# node last write time
var lw12, integer;
subject to clw12:
	lw12 == max(lw11_12, lw13_12);
# node first write time
var fw12, integer;
subject to cfw12:
	fw12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0;
# node: 14 info
# start time
var st14, integer;
subject to cst_st14:
	st14 == ( + fw12*b12_0*b14_0);
# relative last reads
var rlr12_14, integer;
subject to cst_rlr12_14:
	rlr12_14 == st14 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1)) * 1 * b14_0;
# epilogues
var ep12_14, integer;
subject to cep12_14:
	ep12_14 ==  + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1)) * 1 * b14_0 - ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1)) * 1 * b14_0;
# inputs last read/write dependencies
var lt12_14, integer;
subject to clt12_14:
	lt12_14 == max(rlr12_14, lw12);
# curr last write times
var lw12_14, integer;
subject to clw12_14:
	lw12_14 == lt12_14 + ep12_14;
# node last write time
var lw14, integer;
subject to clw14:
	lw14 == (lw12_14);
# node first write time
var fw14, integer;
subject to cfw14:
	fw14 == st14 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_1)) * 1 * b14_0;
# node: 15 info
# start time
var st15, integer;
subject to cst_st15:
	st15 == max( + fw14*b14_0*b15_0,  + fw16*b16_0*b15_0);
# relative last reads
var rlr14_15, integer;
subject to cst_rlr14_15:
	rlr14_15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0;
var rlr16_15, integer;
subject to cst_rlr16_15:
	rlr16_15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0;
# epilogues
var ep14_15, integer;
subject to cep14_15:
	ep14_15 ==  + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 - ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0;
var ep16_15, integer;
subject to cep16_15:
	ep16_15 ==  + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 - ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0;
# inputs last read/write dependencies
var lt14_15, integer;
subject to clt14_15:
	lt14_15 == max(rlr14_15, lw14);
var lt16_15, integer;
subject to clt16_15:
	lt16_15 == max(rlr16_15, lw16);
# curr last write times
var lw14_15, integer;
subject to clw14_15:
	lw14_15 == lt14_15 + ep14_15;
var lw16_15, integer;
subject to clw16_15:
	lw16_15 == lt16_15 + ep16_15;
# node last write time
var lw15, integer;
subject to clw15:
	lw15 == max(lw14_15, lw16_15);
# node first write time
var fw15, integer;
subject to cfw15:
	fw15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0;
# node: 17 info
# start time
var st17, integer;
subject to cst_st17:
	st17 == ( + fw15*b15_0*b17_0);
# relative last reads
var rlr15_17, integer;
subject to cst_rlr15_17:
	rlr15_17 == st17 + ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1)) * 1 * b17_0;
# epilogues
var ep15_17, integer;
subject to cep15_17:
	ep15_17 ==  + ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1)) * 1 * b17_0 - ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1)) * 1 * b17_0;
# inputs last read/write dependencies
var lt15_17, integer;
subject to clt15_17:
	lt15_17 == max(rlr15_17, lw15);
# curr last write times
var lw15_17, integer;
subject to clw15_17:
	lw15_17 == lt15_17 + ep15_17;
# node last write time
var lw17, integer;
subject to clw17:
	lw17 == (lw15_17);
# node first write time
var fw17, integer;
subject to cfw17:
	fw17 == st17 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x17_1)) * 1 * b17_0;
# node: 18 info
# start time
var st18, integer;
subject to cst_st18:
	st18 == ( + fw17*b17_0*b18_0);
# relative last reads
var rlr17_18, integer;
subject to cst_rlr17_18:
	rlr17_18 == st18 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1)) * 1 * b18_0;
# epilogues
var ep17_18, integer;
subject to cep17_18:
	ep17_18 == 0;
# inputs last read/write dependencies
var lt17_18, integer;
subject to clt17_18:
	lt17_18 == max(rlr17_18, lw17);
# curr last write times
var lw17_18, integer;
subject to clw17_18:
	lw17_18 == lt17_18 + ep17_18;
# node last write time
var lw18, integer;
subject to clw18:
	lw18 == (lw17_18);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw18);
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
display x2_0;
display u2_0;
display x2_1;
display u2_1;
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
display DSP_0;
display DSP_7;
display DSP_14;
display DSP_2;
display DSP_9;
display DSP_16;
display DSP_4;
display DSP_11;
display DSP_18;
display DSP_6;
display DSP_13;
display DSP_1;
display DSP_8;
display DSP_15;
display DSP_3;
display DSP_10;
display DSP_17;
display DSP_5;
display DSP_12;
display latency;
display totalDSPs;
