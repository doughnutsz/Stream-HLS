# solver type
option solver gurobi;
option gurobi_options 'lim:time=300';
param b0_0 := 1;
param b7_0 := 1;
param b2_0 := 1;
param b9_0 := 1;
param b10000_0 := 1;
param b4_0 := 1;
param b11_0 := 1;
param b6_0 := 1;
param b13_0 := 1;
param b1_0 := 1;
param b8_0 := 1;
param b3_0 := 1;
param b10_0 := 1;
param b5_0 := 1;
param b12_0 := 1;
var x0_0 >= 8, <= 8, integer;
var u0_0 >= 1, <= 8, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 8;
var x0_1 >= 16, <= 512, integer;
var u0_1 >= 1, <= 512, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 512;
var x0_2 >= 16, <= 1024, integer;
var u0_2 >= 1, <= 1024, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 1024;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2;
var x7_0 >= 8, <= 8, integer;
var u7_0 >= 1, <= 8, integer;
subject to c_uf7_0:
	u7_0 * x7_0 == 8;
var x7_1 >= 16, <= 256, integer;
var u7_1 >= 1, <= 256, integer;
subject to c_uf7_1:
	u7_1 * x7_1 == 256;
var x7_2 >= 16, <= 512, integer;
var u7_2 >= 1, <= 512, integer;
subject to c_uf7_2:
	u7_2 * x7_2 == 512;
var DSP_7, integer;
subject to c_DSP7:
	DSP_7 == u7_0 * u7_1 * u7_2;
var x2_0 >= 8, <= 8, integer;
var u2_0 >= 1, <= 8, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 8;
var x2_1 >= 16, <= 512, integer;
var u2_1 >= 1, <= 512, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 512;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == 0;
var x9_0 >= 8, <= 8, integer;
var u9_0 >= 1, <= 8, integer;
subject to c_uf9_0:
	u9_0 * x9_0 == 8;
var x9_1 >= 16, <= 256, integer;
var u9_1 >= 1, <= 256, integer;
subject to c_uf9_1:
	u9_1 * x9_1 == 256;
var DSP_9, integer;
subject to c_DSP9:
	DSP_9 == 0;
var x4_0 >= 8, <= 8, integer;
var u4_0 >= 1, <= 8, integer;
subject to c_uf4_0:
	u4_0 * x4_0 == 8;
var x4_1 >= 16, <= 512, integer;
var u4_1 >= 1, <= 512, integer;
subject to c_uf4_1:
	u4_1 * x4_1 == 512;
var DSP_4, integer;
subject to c_DSP4:
	DSP_4 == 0;
var x11_0 >= 10, <= 10, integer;
var u11_0 >= 1, <= 10, integer;
subject to c_uf11_0:
	u11_0 * x11_0 == 10;
var x11_1 >= 16, <= 256, integer;
var u11_1 >= 1, <= 256, integer;
subject to c_uf11_1:
	u11_1 * x11_1 == 256;
var DSP_11, integer;
subject to c_DSP11:
	DSP_11 == 0;
var x6_0 >= 16, <= 512, integer;
var u6_0 >= 1, <= 512, integer;
subject to c_uf6_0:
	u6_0 * x6_0 == 512;
var x6_1 >= 16, <= 512, integer;
var u6_1 >= 1, <= 512, integer;
subject to c_uf6_1:
	u6_1 * x6_1 == 512;
var DSP_6, integer;
subject to c_DSP6:
	DSP_6 == 0;
var x13_0 >= 8, <= 8, integer;
var u13_0 >= 1, <= 8, integer;
subject to c_uf13_0:
	u13_0 * x13_0 == 8;
var x13_1 >= 10, <= 10, integer;
var u13_1 >= 1, <= 10, integer;
subject to c_uf13_1:
	u13_1 * x13_1 == 10;
var DSP_13, integer;
subject to c_DSP13:
	DSP_13 == 0;
var x1_0 >= 16, <= 512, integer;
var u1_0 >= 1, <= 512, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 512;
var x1_1 >= 16, <= 1024, integer;
var u1_1 >= 1, <= 1024, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 1024;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == 0;
var x8_0 >= 16, <= 256, integer;
var u8_0 >= 1, <= 256, integer;
subject to c_uf8_0:
	u8_0 * x8_0 == 256;
var x8_1 >= 16, <= 512, integer;
var u8_1 >= 1, <= 512, integer;
subject to c_uf8_1:
	u8_1 * x8_1 == 512;
var DSP_8, integer;
subject to c_DSP8:
	DSP_8 == 0;
var x3_0 >= 8, <= 8, integer;
var u3_0 >= 1, <= 8, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 8;
var x3_1 >= 16, <= 512, integer;
var u3_1 >= 1, <= 512, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 512;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == 0;
var x10_0 >= 8, <= 8, integer;
var u10_0 >= 1, <= 8, integer;
subject to c_uf10_0:
	u10_0 * x10_0 == 8;
var x10_1 >= 10, <= 10, integer;
var u10_1 >= 1, <= 10, integer;
subject to c_uf10_1:
	u10_1 * x10_1 == 10;
var x10_2 >= 16, <= 256, integer;
var u10_2 >= 1, <= 256, integer;
subject to c_uf10_2:
	u10_2 * x10_2 == 256;
var DSP_10, integer;
subject to c_DSP10:
	DSP_10 == u10_0 * u10_1 * u10_2;
var x5_0 >= 8, <= 8, integer;
var u5_0 >= 1, <= 8, integer;
subject to c_uf5_0:
	u5_0 * x5_0 == 8;
var x5_1 >= 16, <= 512, integer;
var u5_1 >= 1, <= 512, integer;
subject to c_uf5_1:
	u5_1 * x5_1 == 512;
var x5_2 >= 16, <= 512, integer;
var u5_2 >= 1, <= 512, integer;
subject to c_uf5_2:
	u5_2 * x5_2 == 512;
var DSP_5, integer;
subject to c_DSP5:
	DSP_5 == u5_0 * u5_1 * u5_2;
var x12_0 >= 8, <= 8, integer;
var u12_0 >= 1, <= 8, integer;
subject to c_uf12_0:
	u12_0 * x12_0 == 8;
var x12_1 >= 10, <= 10, integer;
var u12_1 >= 1, <= 10, integer;
subject to c_uf12_1:
	u12_1 * x12_1 == 10;
var DSP_12, integer;
subject to c_DSP12:
	DSP_12 == 0;
subject to c_u0_2_u1_1:
	u0_2 == u1_1;
subject to c_u0_1_u1_0:
	u0_1 == u1_0;
subject to c_u7_0_u4_0:
	u7_0 == u4_0;
subject to c_u7_2_u4_1:
	u7_2 == u4_1;
subject to c_u7_2_u8_1:
	u7_2 == u8_1;
subject to c_u7_1_u8_0:
	u7_1 == u8_0;
subject to c_u2_0_u0_0:
	u2_0 == u0_0;
subject to c_u2_1_u0_1:
	u2_1 == u0_1;
subject to c_u9_0_u7_0:
	u9_0 == u7_0;
subject to c_u9_1_u7_1:
	u9_1 == u7_1;
subject to c_u4_0_u2_0:
	u4_0 == u2_0;
subject to c_u4_1_u2_1:
	u4_1 == u2_1;
subject to c_u4_0_u5_0:
	u4_0 == u5_0;
subject to c_u4_1_u5_1:
	u4_1 == u5_1;
subject to c_u13_0_u12_0:
	u13_0 == u12_0;
subject to c_u13_1_u12_1:
	u13_1 == u12_1;
subject to c_u3_0_u2_0:
	u3_0 == u2_0;
subject to c_u3_1_u2_1:
	u3_1 == u2_1;
subject to c_u10_0_u9_0:
	u10_0 == u9_0;
subject to c_u10_2_u9_1:
	u10_2 == u9_1;
subject to c_u10_2_u11_1:
	u10_2 == u11_1;
subject to c_u10_1_u11_0:
	u10_1 == u11_0;
subject to c_u5_0_u3_0:
	u5_0 == u3_0;
subject to c_u5_2_u3_1:
	u5_2 == u3_1;
subject to c_u5_2_u6_1:
	u5_2 == u6_1;
subject to c_u5_1_u6_0:
	u5_1 == u6_0;
subject to c_u12_0_u10_0:
	u12_0 == u10_0;
subject to c_u12_1_u10_1:
	u12_1 == u10_1;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_7 + DSP_2 + DSP_9 + DSP_4 + DSP_11 + DSP_6 + DSP_13 + DSP_1 + DSP_8 + DSP_3 + DSP_10 + DSP_5 + DSP_12;
subject to totalDSPConst:
	totalDSPs <= 512;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
# node: 8 info
# start time
var st8, integer;
subject to cst_st8:
	st8 == ( + fw10000*b10000_0*b8_0);
# relative last reads
var rlr10000_8, integer;
subject to cst_rlr10000_8:
	rlr10000_8 == st8 + (0) * 1 * b8_0;
# epilogues
var ep10000_8, integer;
subject to cep10000_8:
	ep10000_8 ==  + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 - (0) * 1 * b8_0;
# inputs last read/write dependencies
var lt10000_8, integer;
subject to clt10000_8:
	lt10000_8 == max(rlr10000_8, lw10000);
# curr last write times
var lw10000_8, integer;
subject to clw10000_8:
	lw10000_8 == lt10000_8 + ep10000_8;
# node last write time
var lw8, integer;
subject to clw8:
	lw8 == (lw10000_8);
# node first write time
var fw8, integer;
subject to cfw8:
	fw8 == st8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_1)) * 1 * b8_0;
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
# node: 6 info
# start time
var st6, integer;
subject to cst_st6:
	st6 == ( + fw10000*b10000_0*b6_0);
# relative last reads
var rlr10000_6, integer;
subject to cst_rlr10000_6:
	rlr10000_6 == st6 + (0) * 1 * b6_0;
# epilogues
var ep10000_6, integer;
subject to cep10000_6:
	ep10000_6 ==  + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1)) * 1 * b6_0 - (0) * 1 * b6_0;
# inputs last read/write dependencies
var lt10000_6, integer;
subject to clt10000_6:
	lt10000_6 == max(rlr10000_6, lw10000);
# curr last write times
var lw10000_6, integer;
subject to clw10000_6:
	lw10000_6 == lt10000_6 + ep10000_6;
# node last write time
var lw6, integer;
subject to clw6:
	lw6 == (lw10000_6);
# node first write time
var fw6, integer;
subject to cfw6:
	fw6 == st6 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_1)) * 1 * b6_0;
# node: 11 info
# start time
var st11, integer;
subject to cst_st11:
	st11 == ( + fw10000*b10000_0*b11_0);
# relative last reads
var rlr10000_11, integer;
subject to cst_rlr10000_11:
	rlr10000_11 == st11 + (0) * 1 * b11_0;
# epilogues
var ep10000_11, integer;
subject to cep10000_11:
	ep10000_11 ==  + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 - (0) * 1 * b11_0;
# inputs last read/write dependencies
var lt10000_11, integer;
subject to clt10000_11:
	lt10000_11 == max(rlr10000_11, lw10000);
# curr last write times
var lw10000_11, integer;
subject to clw10000_11:
	lw10000_11 == lt10000_11 + ep10000_11;
# node last write time
var lw11, integer;
subject to clw11:
	lw11 == (lw10000_11);
# node first write time
var fw11, integer;
subject to cfw11:
	fw11 == st11 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_1)) * 1 * b11_0;
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
	ep0_2 ==  + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 - ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0;
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
	fw2 == st2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1)) * 1 * b2_0;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == ( + fw2*b2_0*b3_0);
# relative last reads
var rlr2_3, integer;
subject to cst_rlr2_3:
	rlr2_3 == st3 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0;
# epilogues
var ep2_3, integer;
subject to cep2_3:
	ep2_3 ==  + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0 - ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0;
# inputs last read/write dependencies
var lt2_3, integer;
subject to clt2_3:
	lt2_3 == max(rlr2_3, lw2);
# curr last write times
var lw2_3, integer;
subject to clw2_3:
	lw2_3 == lt2_3 + ep2_3;
# node last write time
var lw3, integer;
subject to clw3:
	lw3 == (lw2_3);
# node first write time
var fw3, integer;
subject to cfw3:
	fw3 == st3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_1)) * 1 * b3_0;
# node: 5 info
# start time
var st5, integer;
subject to cst_st5:
	st5 == max( + fw3*b3_0*b5_0,  + fw6*b6_0*b5_0);
# relative last reads
var rlr3_5, integer;
subject to cst_rlr3_5:
	rlr3_5 == st5 + ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0;
var rlr6_5, integer;
subject to cst_rlr6_5:
	rlr6_5 == st5 + ((0 + (x5_2 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0;
# epilogues
var ep3_5, integer;
subject to cep3_5:
	ep3_5 ==  + ((0 + (x5_2 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0 - ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0;
var ep6_5, integer;
subject to cep6_5:
	ep6_5 ==  + ((0 + (x5_2 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0 - ((0 + (x5_2 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0;
# inputs last read/write dependencies
var lt3_5, integer;
subject to clt3_5:
	lt3_5 == max(rlr3_5, lw3);
var lt6_5, integer;
subject to clt6_5:
	lt6_5 == max(rlr6_5, lw6);
# curr last write times
var lw3_5, integer;
subject to clw3_5:
	lw3_5 == lt3_5 + ep3_5;
var lw6_5, integer;
subject to clw6_5:
	lw6_5 == lt6_5 + ep6_5;
# node last write time
var lw5, integer;
subject to clw5:
	lw5 == max(lw3_5, lw6_5);
# node first write time
var fw5, integer;
subject to cfw5:
	fw5 == st5 + ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == max( + fw2*b2_0*b4_0,  + fw5*b5_0*b4_0);
# relative last reads
var rlr2_4, integer;
subject to cst_rlr2_4:
	rlr2_4 == st4 + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0;
var rlr5_4, integer;
subject to cst_rlr5_4:
	rlr5_4 == st4 + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0;
# epilogues
var ep2_4, integer;
subject to cep2_4:
	ep2_4 ==  + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0 - ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0;
var ep5_4, integer;
subject to cep5_4:
	ep5_4 ==  + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0 - ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0;
# inputs last read/write dependencies
var lt2_4, integer;
subject to clt2_4:
	lt2_4 == max(rlr2_4, lw2);
var lt5_4, integer;
subject to clt5_4:
	lt5_4 == max(rlr5_4, lw5);
# curr last write times
var lw2_4, integer;
subject to clw2_4:
	lw2_4 == lt2_4 + ep2_4;
var lw5_4, integer;
subject to clw5_4:
	lw5_4 == lt5_4 + ep5_4;
# node last write time
var lw4, integer;
subject to clw4:
	lw4 == max(lw2_4, lw5_4);
# node first write time
var fw4, integer;
subject to cfw4:
	fw4 == st4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_1)) * 1 * b4_0;
# node: 7 info
# start time
var st7, integer;
subject to cst_st7:
	st7 == max( + fw4*b4_0*b7_0,  + fw8*b8_0*b7_0);
# relative last reads
var rlr4_7, integer;
subject to cst_rlr4_7:
	rlr4_7 == st7 + ((0 + (x7_2 - 1) * 1 * 1 + 0 * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0;
var rlr8_7, integer;
subject to cst_rlr8_7:
	rlr8_7 == st7 + ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + 0 * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0;
# epilogues
var ep4_7, integer;
subject to cep4_7:
	ep4_7 ==  + ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0 - ((0 + (x7_2 - 1) * 1 * 1 + 0 * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0;
var ep8_7, integer;
subject to cep8_7:
	ep8_7 ==  + ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0 - ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + 0 * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0;
# inputs last read/write dependencies
var lt4_7, integer;
subject to clt4_7:
	lt4_7 == max(rlr4_7, lw4);
var lt8_7, integer;
subject to clt8_7:
	lt8_7 == max(rlr8_7, lw8);
# curr last write times
var lw4_7, integer;
subject to clw4_7:
	lw4_7 == lt4_7 + ep4_7;
var lw8_7, integer;
subject to clw8_7:
	lw8_7 == lt8_7 + ep8_7;
# node last write time
var lw7, integer;
subject to clw7:
	lw7 == max(lw4_7, lw8_7);
# node first write time
var fw7, integer;
subject to cfw7:
	fw7 == st7 + ((0 + (x7_2 - 1) * 1 * 1 + 0 * 1 * 1 * x7_2 + 0 * 1 * 1 * x7_2 * x7_1)) * 4 * b7_0;
# node: 9 info
# start time
var st9, integer;
subject to cst_st9:
	st9 == ( + fw7*b7_0*b9_0);
# relative last reads
var rlr7_9, integer;
subject to cst_rlr7_9:
	rlr7_9 == st9 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1)) * 1 * b9_0;
# epilogues
var ep7_9, integer;
subject to cep7_9:
	ep7_9 ==  + ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1)) * 1 * b9_0 - ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1)) * 1 * b9_0;
# inputs last read/write dependencies
var lt7_9, integer;
subject to clt7_9:
	lt7_9 == max(rlr7_9, lw7);
# curr last write times
var lw7_9, integer;
subject to clw7_9:
	lw7_9 == lt7_9 + ep7_9;
# node last write time
var lw9, integer;
subject to clw9:
	lw9 == (lw7_9);
# node first write time
var fw9, integer;
subject to cfw9:
	fw9 == st9 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_1)) * 1 * b9_0;
# node: 10 info
# start time
var st10, integer;
subject to cst_st10:
	st10 == max( + fw9*b9_0*b10_0,  + fw11*b11_0*b10_0);
# relative last reads
var rlr9_10, integer;
subject to cst_rlr9_10:
	rlr9_10 == st10 + ((0 + (x10_2 - 1) * 1 * 1 + 0 * 1 * 1 * x10_2 + (x10_0 - 1) * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0;
var rlr11_10, integer;
subject to cst_rlr11_10:
	rlr11_10 == st10 + ((0 + (x10_2 - 1) * 1 * 1 + (x10_1 - 1) * 1 * 1 * x10_2 + 0 * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0;
# epilogues
var ep9_10, integer;
subject to cep9_10:
	ep9_10 ==  + ((0 + (x10_2 - 1) * 1 * 1 + (x10_1 - 1) * 1 * 1 * x10_2 + (x10_0 - 1) * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0 - ((0 + (x10_2 - 1) * 1 * 1 + 0 * 1 * 1 * x10_2 + (x10_0 - 1) * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0;
var ep11_10, integer;
subject to cep11_10:
	ep11_10 ==  + ((0 + (x10_2 - 1) * 1 * 1 + (x10_1 - 1) * 1 * 1 * x10_2 + (x10_0 - 1) * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0 - ((0 + (x10_2 - 1) * 1 * 1 + (x10_1 - 1) * 1 * 1 * x10_2 + 0 * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0;
# inputs last read/write dependencies
var lt9_10, integer;
subject to clt9_10:
	lt9_10 == max(rlr9_10, lw9);
var lt11_10, integer;
subject to clt11_10:
	lt11_10 == max(rlr11_10, lw11);
# curr last write times
var lw9_10, integer;
subject to clw9_10:
	lw9_10 == lt9_10 + ep9_10;
var lw11_10, integer;
subject to clw11_10:
	lw11_10 == lt11_10 + ep11_10;
# node last write time
var lw10, integer;
subject to clw10:
	lw10 == max(lw9_10, lw11_10);
# node first write time
var fw10, integer;
subject to cfw10:
	fw10 == st10 + ((0 + (x10_2 - 1) * 1 * 1 + 0 * 1 * 1 * x10_2 + 0 * 1 * 1 * x10_2 * x10_1)) * 4 * b10_0;
# node: 12 info
# start time
var st12, integer;
subject to cst_st12:
	st12 == ( + fw10*b10_0*b12_0);
# relative last reads
var rlr10_12, integer;
subject to cst_rlr10_12:
	rlr10_12 == st12 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1)) * 1 * b12_0;
# epilogues
var ep10_12, integer;
subject to cep10_12:
	ep10_12 ==  + ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1)) * 1 * b12_0 - ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1)) * 1 * b12_0;
# inputs last read/write dependencies
var lt10_12, integer;
subject to clt10_12:
	lt10_12 == max(rlr10_12, lw10);
# curr last write times
var lw10_12, integer;
subject to clw10_12:
	lw10_12 == lt10_12 + ep10_12;
# node last write time
var lw12, integer;
subject to clw12:
	lw12 == (lw10_12);
# node first write time
var fw12, integer;
subject to cfw12:
	fw12 == st12 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_1)) * 1 * b12_0;
# node: 13 info
# start time
var st13, integer;
subject to cst_st13:
	st13 == ( + fw12*b12_0*b13_0);
# relative last reads
var rlr12_13, integer;
subject to cst_rlr12_13:
	rlr12_13 == st13 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1)) * 1 * b13_0;
# epilogues
var ep12_13, integer;
subject to cep12_13:
	ep12_13 == 0;
# inputs last read/write dependencies
var lt12_13, integer;
subject to clt12_13:
	lt12_13 == max(rlr12_13, lw12);
# curr last write times
var lw12_13, integer;
subject to clw12_13:
	lw12_13 == lt12_13 + ep12_13;
# node last write time
var lw13, integer;
subject to clw13:
	lw13 == (lw12_13);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw13);
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
display x7_2;
display u7_2;
display x2_0;
display u2_0;
display x2_1;
display u2_1;
display x9_0;
display u9_0;
display x9_1;
display u9_1;
display x4_0;
display u4_0;
display x4_1;
display u4_1;
display x11_0;
display u11_0;
display x11_1;
display u11_1;
display x6_0;
display u6_0;
display x6_1;
display u6_1;
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
display x3_0;
display u3_0;
display x3_1;
display u3_1;
display x10_0;
display u10_0;
display x10_1;
display u10_1;
display x10_2;
display u10_2;
display x5_0;
display u5_0;
display x5_1;
display u5_1;
display x5_2;
display u5_2;
display x12_0;
display u12_0;
display x12_1;
display u12_1;
display DSP_0;
display DSP_7;
display DSP_2;
display DSP_9;
display DSP_4;
display DSP_11;
display DSP_6;
display DSP_13;
display DSP_1;
display DSP_8;
display DSP_3;
display DSP_10;
display DSP_5;
display DSP_12;
display latency;
display totalDSPs;
