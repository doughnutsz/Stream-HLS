# solver type
option solver gurobi;
option gurobi_options 'lim:time=600';
param b0_0 := 1;
param b7_0 := 1;
param b2_0 := 1;
param b10000_0 := 1;
param b4_0 := 1;
param b6_0 := 1;
param b1_0 := 1;
param b8_0 := 1;
param b3_0 := 1;
param b5_0 := 1;
var x0_0 >= 8, <= 16, integer;
var u0_0 >= 1, <= 16, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 16;
var x0_1 >= 8, <= 56, integer;
var u0_1 >= 1, <= 56, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 56;
var x0_2 >= 8, <= 56, integer;
var u0_2 >= 1, <= 56, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 56;
var x0_3 >= 8, <= 16, integer;
var u0_3 >= 1, <= 16, integer;
subject to c_uf0_3:
	u0_3 * x0_3 == 16;
var x0_4 >= 3, <= 3, integer;
var u0_4 >= 1, <= 3, integer;
subject to c_uf0_4:
	u0_4 * x0_4 == 3;
var x0_5 >= 3, <= 3, integer;
var u0_5 >= 1, <= 3, integer;
subject to c_uf0_5:
	u0_5 * x0_5 == 3;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2 * u0_3 * u0_4 * u0_5;
var x7_0 >= 8, <= 16, integer;
var u7_0 >= 1, <= 16, integer;
subject to c_uf7_0:
	u7_0 * x7_0 == 16;
var x7_1 >= 8, <= 56, integer;
var u7_1 >= 1, <= 56, integer;
subject to c_uf7_1:
	u7_1 * x7_1 == 56;
var x7_2 >= 8, <= 56, integer;
var u7_2 >= 1, <= 56, integer;
subject to c_uf7_2:
	u7_2 * x7_2 == 56;
var DSP_7, integer;
subject to c_DSP7:
	DSP_7 == 0;
var x2_0 >= 8, <= 16, integer;
var u2_0 >= 1, <= 16, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 16;
var x2_1 >= 8, <= 58, integer;
var u2_1 >= 1, <= 58, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 58;
var x2_2 >= 8, <= 58, integer;
var u2_2 >= 1, <= 58, integer;
subject to c_uf2_2:
	u2_2 * x2_2 == 58;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == 0;
var x4_0 >= 8, <= 16, integer;
var u4_0 >= 1, <= 16, integer;
subject to c_uf4_0:
	u4_0 * x4_0 == 16;
var x4_1 >= 8, <= 56, integer;
var u4_1 >= 1, <= 56, integer;
subject to c_uf4_1:
	u4_1 * x4_1 == 56;
var x4_2 >= 8, <= 56, integer;
var u4_2 >= 1, <= 56, integer;
subject to c_uf4_2:
	u4_2 * x4_2 == 56;
var DSP_4, integer;
subject to c_DSP4:
	DSP_4 == 0;
var x6_0 >= 8, <= 16, integer;
var u6_0 >= 1, <= 16, integer;
subject to c_uf6_0:
	u6_0 * x6_0 == 16;
var x6_1 >= 8, <= 58, integer;
var u6_1 >= 1, <= 58, integer;
subject to c_uf6_1:
	u6_1 * x6_1 == 58;
var x6_2 >= 8, <= 58, integer;
var u6_2 >= 1, <= 58, integer;
subject to c_uf6_2:
	u6_2 * x6_2 == 58;
var DSP_6, integer;
subject to c_DSP6:
	DSP_6 == 0;
var x1_0 >= 8, <= 16, integer;
var u1_0 >= 1, <= 16, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 16;
var x1_1 >= 8, <= 56, integer;
var u1_1 >= 1, <= 56, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 56;
var x1_2 >= 8, <= 56, integer;
var u1_2 >= 1, <= 56, integer;
subject to c_uf1_2:
	u1_2 * x1_2 == 56;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == 0;
var x8_0 >= 8, <= 16, integer;
var u8_0 >= 1, <= 16, integer;
subject to c_uf8_0:
	u8_0 * x8_0 == 16;
var x8_1 >= 8, <= 56, integer;
var u8_1 >= 1, <= 56, integer;
subject to c_uf8_1:
	u8_1 * x8_1 == 56;
var x8_2 >= 8, <= 56, integer;
var u8_2 >= 1, <= 56, integer;
subject to c_uf8_2:
	u8_2 * x8_2 == 56;
var DSP_8, integer;
subject to c_DSP8:
	DSP_8 == 0;
var x3_0 >= 8, <= 16, integer;
var u3_0 >= 1, <= 16, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 16;
var x3_1 >= 8, <= 56, integer;
var u3_1 >= 1, <= 56, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 56;
var x3_2 >= 8, <= 56, integer;
var u3_2 >= 1, <= 56, integer;
subject to c_uf3_2:
	u3_2 * x3_2 == 56;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == 0;
var x5_0 >= 8, <= 16, integer;
var u5_0 >= 1, <= 16, integer;
subject to c_uf5_0:
	u5_0 * x5_0 == 16;
var x5_1 >= 8, <= 56, integer;
var u5_1 >= 1, <= 56, integer;
subject to c_uf5_1:
	u5_1 * x5_1 == 56;
var x5_2 >= 8, <= 56, integer;
var u5_2 >= 1, <= 56, integer;
subject to c_uf5_2:
	u5_2 * x5_2 == 56;
var x5_3 >= 8, <= 16, integer;
var u5_3 >= 1, <= 16, integer;
subject to c_uf5_3:
	u5_3 * x5_3 == 16;
var x5_4 >= 3, <= 3, integer;
var u5_4 >= 1, <= 3, integer;
subject to c_uf5_4:
	u5_4 * x5_4 == 3;
var x5_5 >= 3, <= 3, integer;
var u5_5 >= 1, <= 3, integer;
subject to c_uf5_5:
	u5_5 * x5_5 == 3;
var DSP_5, integer;
subject to c_DSP5:
	DSP_5 == u5_0 * u5_1 * u5_2 * u5_3 * u5_4 * u5_5;
subject to c_u0_3_u1_0:
	u0_3 == u1_0;
subject to c_u0_1_u1_1:
	u0_1 == u1_1;
subject to c_u0_4_u1_2:
	u0_4 == u1_2;
subject to c_u0_3_u2_0:
	u0_3 == u2_0;
subject to c_u0_1_u2_1:
	u0_1 == u2_1;
subject to c_u0_4_u2_2:
	u0_4 == u2_2;
subject to c_u7_0_u5_0:
	u7_0 == u5_0;
subject to c_u7_1_u5_1:
	u7_1 == u5_1;
subject to c_u7_2_u5_2:
	u7_2 == u5_2;
subject to c_u4_0_u3_0:
	u4_0 == u3_0;
subject to c_u4_1_u3_1:
	u4_1 == u3_1;
subject to c_u4_2_u3_2:
	u4_2 == u3_2;
subject to c_u8_0_u7_0:
	u8_0 == u7_0;
subject to c_u8_1_u7_1:
	u8_1 == u7_1;
subject to c_u8_2_u7_2:
	u8_2 == u7_2;
subject to c_u3_0_u0_0:
	u3_0 == u0_0;
subject to c_u3_1_u0_1:
	u3_1 == u0_1;
subject to c_u3_2_u0_2:
	u3_2 == u0_2;
subject to c_u5_3_u4_0:
	u5_3 == u4_0;
subject to c_u5_1_u4_1:
	u5_1 == u4_1;
subject to c_u5_4_u4_2:
	u5_4 == u4_2;
subject to c_u5_3_u6_0:
	u5_3 == u6_0;
subject to c_u5_1_u6_1:
	u5_1 == u6_1;
subject to c_u5_4_u6_2:
	u5_4 == u6_2;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_7 + DSP_2 + DSP_4 + DSP_6 + DSP_1 + DSP_8 + DSP_3 + DSP_5;
subject to totalDSPConst:
	totalDSPs <= 512;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
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
	ep10000_1 ==  + ((0 + (x1_2 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0 - (0) * 1 * b1_0;
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
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_2 + 0 * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0;
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
	ep10000_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0 - (0) * 1 * b6_0;
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
	fw6 == st6 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == ( + fw10000*b10000_0*b2_0);
# relative last reads
var rlr10000_2, integer;
subject to cst_rlr10000_2:
	rlr10000_2 == st2 + (0) * 1 * b2_0;
# epilogues
var ep10000_2, integer;
subject to cep10000_2:
	ep10000_2 ==  + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0 - (0) * 1 * b2_0;
# inputs last read/write dependencies
var lt10000_2, integer;
subject to clt10000_2:
	lt10000_2 == max(rlr10000_2, lw10000);
# curr last write times
var lw10000_2, integer;
subject to clw10000_2:
	lw10000_2 == lt10000_2 + ep10000_2;
# node last write time
var lw2, integer;
subject to clw2:
	lw2 == (lw10000_2);
# node first write time
var fw2, integer;
subject to cfw2:
	fw2 == st2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == max( + lw1*b1_0*b0_0,  + lw2*b2_0*b0_0);
# relative last reads
var rlr1_0, integer;
subject to cst_rlr1_0:
	rlr1_0 == st0 + ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + (x0_2 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 + (x0_1 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0;
var rlr2_0, integer;
subject to cst_rlr2_0:
	rlr2_0 == st0 + ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + (x0_2 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 + (x0_1 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0;
# epilogues
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + (x0_2 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 + (x0_1 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0 - ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + (x0_2 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 + (x0_1 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0;
var ep2_0, integer;
subject to cep2_0:
	ep2_0 ==  + ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + (x0_2 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 + (x0_1 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0 - ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + (x0_2 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 + (x0_1 - 1) * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0;
# inputs last read/write dependencies
var lt1_0, integer;
subject to clt1_0:
	lt1_0 == max(rlr1_0, lw1);
var lt2_0, integer;
subject to clt2_0:
	lt2_0 == max(rlr2_0, lw2);
# curr last write times
var lw1_0, integer;
subject to clw1_0:
	lw1_0 == lt1_0 + ep1_0;
var lw2_0, integer;
subject to clw2_0:
	lw2_0 == lt2_0 + ep2_0;
# node last write time
var lw0, integer;
subject to clw0:
	lw0 == max(lw1_0, lw2_0);
# node first write time
var fw0, integer;
subject to cfw0:
	fw0 == st0 + ((0 + (x0_5 - 1) * 1 * 1 + (x0_4 - 1) * 1 * 1 * x0_5 + (x0_3 - 1) * 1 * 1 * x0_5 * x0_4 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 + 0 * 1 * 1 * x0_5 * x0_4 * x0_3 * x0_2 * x0_1)) * 4 * b0_0;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == ( + fw0*b0_0*b3_0);
# relative last reads
var rlr0_3, integer;
subject to cst_rlr0_3:
	rlr0_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
# epilogues
var ep0_3, integer;
subject to cep0_3:
	ep0_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
# inputs last read/write dependencies
var lt0_3, integer;
subject to clt0_3:
	lt0_3 == max(rlr0_3, lw0);
# curr last write times
var lw0_3, integer;
subject to clw0_3:
	lw0_3 == lt0_3 + ep0_3;
# node last write time
var lw3, integer;
subject to clw3:
	lw3 == (lw0_3);
# node first write time
var fw3, integer;
subject to cfw3:
	fw3 == st3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 1 * b3_0;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == ( + fw3*b3_0*b4_0);
# relative last reads
var rlr3_4, integer;
subject to cst_rlr3_4:
	rlr3_4 == st4 + ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
# epilogues
var ep3_4, integer;
subject to cep3_4:
	ep3_4 ==  + ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0 - ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
# inputs last read/write dependencies
var lt3_4, integer;
subject to clt3_4:
	lt3_4 == max(rlr3_4, lw3);
# curr last write times
var lw3_4, integer;
subject to clw3_4:
	lw3_4 == lt3_4 + ep3_4;
# node last write time
var lw4, integer;
subject to clw4:
	lw4 == (lw3_4);
# node first write time
var fw4, integer;
subject to cfw4:
	fw4 == st4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
# node: 5 info
# start time
var st5, integer;
subject to cst_st5:
	st5 == max( + lw4*b4_0*b5_0,  + lw6*b6_0*b5_0);
# relative last reads
var rlr4_5, integer;
subject to cst_rlr4_5:
	rlr4_5 == st5 + ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + (x5_2 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 + (x5_1 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0;
var rlr6_5, integer;
subject to cst_rlr6_5:
	rlr6_5 == st5 + ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + (x5_2 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 + (x5_1 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0;
# epilogues
var ep4_5, integer;
subject to cep4_5:
	ep4_5 ==  + ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + (x5_2 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 + (x5_1 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0 - ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + (x5_2 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 + (x5_1 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0;
var ep6_5, integer;
subject to cep6_5:
	ep6_5 ==  + ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + (x5_2 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 + (x5_1 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0 - ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + (x5_2 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 + (x5_1 - 1) * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0;
# inputs last read/write dependencies
var lt4_5, integer;
subject to clt4_5:
	lt4_5 == max(rlr4_5, lw4);
var lt6_5, integer;
subject to clt6_5:
	lt6_5 == max(rlr6_5, lw6);
# curr last write times
var lw4_5, integer;
subject to clw4_5:
	lw4_5 == lt4_5 + ep4_5;
var lw6_5, integer;
subject to clw6_5:
	lw6_5 == lt6_5 + ep6_5;
# node last write time
var lw5, integer;
subject to clw5:
	lw5 == max(lw4_5, lw6_5);
# node first write time
var fw5, integer;
subject to cfw5:
	fw5 == st5 + ((0 + (x5_5 - 1) * 1 * 1 + (x5_4 - 1) * 1 * 1 * x5_5 + (x5_3 - 1) * 1 * 1 * x5_5 * x5_4 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 + 0 * 1 * 1 * x5_5 * x5_4 * x5_3 * x5_2 * x5_1)) * 4 * b5_0;
# node: 7 info
# start time
var st7, integer;
subject to cst_st7:
	st7 == ( + fw5*b5_0*b7_0);
# relative last reads
var rlr5_7, integer;
subject to cst_rlr5_7:
	rlr5_7 == st7 + ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 1 * b7_0;
# epilogues
var ep5_7, integer;
subject to cep5_7:
	ep5_7 ==  + ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 1 * b7_0 - ((0 + (x7_2 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_2 + (x7_0 - 1) * 1 * 1 * x7_2 * x7_1)) * 1 * b7_0;
# inputs last read/write dependencies
var lt5_7, integer;
subject to clt5_7:
	lt5_7 == max(rlr5_7, lw5);
# curr last write times
var lw5_7, integer;
subject to clw5_7:
	lw5_7 == lt5_7 + ep5_7;
# node last write time
var lw7, integer;
subject to clw7:
	lw7 == (lw5_7);
# node first write time
var fw7, integer;
subject to cfw7:
	fw7 == st7 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x7_2 + 0 * 1 * 1 * x7_2 * x7_1)) * 1 * b7_0;
# node: 8 info
# start time
var st8, integer;
subject to cst_st8:
	st8 == ( + fw7*b7_0*b8_0);
# relative last reads
var rlr7_8, integer;
subject to cst_rlr7_8:
	rlr7_8 == st8 + ((0 + (x8_2 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_2 + (x8_0 - 1) * 1 * 1 * x8_2 * x8_1)) * 1 * b8_0;
# epilogues
var ep7_8, integer;
subject to cep7_8:
	ep7_8 == 0;
# inputs last read/write dependencies
var lt7_8, integer;
subject to clt7_8:
	lt7_8 == max(rlr7_8, lw7);
# curr last write times
var lw7_8, integer;
subject to clw7_8:
	lw7_8 == lt7_8 + ep7_8;
# node last write time
var lw8, integer;
subject to clw8:
	lw8 == (lw7_8);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw8);
minimize obj: latency;
solve obj;
display x0_0;
display u0_0;
display x0_1;
display u0_1;
display x0_2;
display u0_2;
display x0_3;
display u0_3;
display x0_4;
display u0_4;
display x0_5;
display u0_5;
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
display x2_2;
display u2_2;
display x4_0;
display u4_0;
display x4_1;
display u4_1;
display x4_2;
display u4_2;
display x6_0;
display u6_0;
display x6_1;
display u6_1;
display x6_2;
display u6_2;
display x1_0;
display u1_0;
display x1_1;
display u1_1;
display x1_2;
display u1_2;
display x8_0;
display u8_0;
display x8_1;
display u8_1;
display x8_2;
display u8_2;
display x3_0;
display u3_0;
display x3_1;
display u3_1;
display x3_2;
display u3_2;
display x5_0;
display u5_0;
display x5_1;
display u5_1;
display x5_2;
display u5_2;
display x5_3;
display u5_3;
display x5_4;
display u5_4;
display x5_5;
display u5_5;
display DSP_0;
display DSP_7;
display DSP_2;
display DSP_4;
display DSP_6;
display DSP_1;
display DSP_8;
display DSP_3;
display DSP_5;
display latency;
display totalDSPs;
