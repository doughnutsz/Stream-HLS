# solver type
option solver gurobi;
option gurobi_options 'lim:time=1200 tech:logfile=FeedForward_parallel.log';
param b0_0 := 1;
param b7_0 := 1;
param b2_0 := 1;
param b10000_0 := 1;
param b4_0 := 1;
param b6_0 := 1;
param b1_0 := 1;
param b3_0 := 1;
param b5_0 := 1;
var x0_0 >= 16, <= 512, integer;
var u0_0 >= 1, <= 512, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 512;
var x0_1 >= 16, <= 128, integer;
var u0_1 >= 1, <= 128, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 128;
var x0_2 >= 16, <= 256, integer;
var u0_2 >= 1, <= 256, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 256;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2;
var x7_0 >= 16, <= 512, integer;
var u7_0 >= 1, <= 512, integer;
subject to c_uf7_0:
	u7_0 * x7_0 == 512;
var x7_1 >= 16, <= 128, integer;
var u7_1 >= 1, <= 128, integer;
subject to c_uf7_1:
	u7_1 * x7_1 == 128;
var DSP_7, integer;
subject to c_DSP7:
	DSP_7 == 0;
var x2_0 >= 16, <= 128, integer;
var u2_0 >= 1, <= 128, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 128;
var x2_1 >= 16, <= 256, integer;
var u2_1 >= 1, <= 256, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 256;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == 0;
var x4_0 >= 16, <= 512, integer;
var u4_0 >= 1, <= 512, integer;
subject to c_uf4_0:
	u4_0 * x4_0 == 512;
var x4_1 >= 16, <= 256, integer;
var u4_1 >= 1, <= 256, integer;
subject to c_uf4_1:
	u4_1 * x4_1 == 256;
var x4_2 >= 16, <= 128, integer;
var u4_2 >= 1, <= 128, integer;
subject to c_uf4_2:
	u4_2 * x4_2 == 128;
var DSP_4, integer;
subject to c_DSP4:
	DSP_4 == u4_0 * u4_1 * u4_2;
var x6_0 >= 16, <= 512, integer;
var u6_0 >= 1, <= 512, integer;
subject to c_uf6_0:
	u6_0 * x6_0 == 512;
var x6_1 >= 16, <= 128, integer;
var u6_1 >= 1, <= 128, integer;
subject to c_uf6_1:
	u6_1 * x6_1 == 128;
var DSP_6, integer;
subject to c_DSP6:
	DSP_6 == 0;
var x1_0 >= 16, <= 512, integer;
var u1_0 >= 1, <= 512, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 512;
var x1_1 >= 16, <= 128, integer;
var u1_1 >= 1, <= 128, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 128;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == 0;
var x3_0 >= 16, <= 512, integer;
var u3_0 >= 1, <= 512, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 512;
var x3_1 >= 16, <= 256, integer;
var u3_1 >= 1, <= 256, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 256;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == 0;
var x5_0 >= 16, <= 256, integer;
var u5_0 >= 1, <= 256, integer;
subject to c_uf5_0:
	u5_0 * x5_0 == 256;
var x5_1 >= 16, <= 128, integer;
var u5_1 >= 1, <= 128, integer;
subject to c_uf5_1:
	u5_1 * x5_1 == 128;
var DSP_5, integer;
subject to c_DSP5:
	DSP_5 == 0;
subject to c_u0_0_u1_0:
	u0_0 == u1_0;
subject to c_u0_1_u1_1:
	u0_1 == u1_1;
subject to c_u0_1_u2_0:
	u0_1 == u2_0;
subject to c_u0_2_u2_1:
	u0_2 == u2_1;
subject to c_u7_0_u6_0:
	u7_0 == u6_0;
subject to c_u7_1_u6_1:
	u7_1 == u6_1;
subject to c_u4_0_u3_0:
	u4_0 == u3_0;
subject to c_u4_1_u3_1:
	u4_1 == u3_1;
subject to c_u4_1_u5_0:
	u4_1 == u5_0;
subject to c_u4_2_u5_1:
	u4_2 == u5_1;
subject to c_u6_0_u4_0:
	u6_0 == u4_0;
subject to c_u6_1_u4_2:
	u6_1 == u4_2;
subject to c_u3_0_u0_0:
	u3_0 == u0_0;
subject to c_u3_1_u0_2:
	u3_1 == u0_2;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_7 + DSP_2 + DSP_4 + DSP_6 + DSP_1 + DSP_3 + DSP_5;
subject to totalDSPConst:
	totalDSPs <= 512;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
# node: 5 info
# start time
var st5, integer;
subject to cst_st5:
	st5 == ( + fw10000*b10000_0*b5_0);
# relative last reads
var rlr10000_5, integer;
subject to cst_rlr10000_5:
	rlr10000_5 == st5 + (0) * 1 * b5_0;
# epilogues
var ep10000_5, integer;
subject to cep10000_5:
	ep10000_5 ==  + ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0 - (0) * 1 * b5_0;
# inputs last read/write dependencies
var lt10000_5, integer;
subject to clt10000_5:
	lt10000_5 == max(rlr10000_5, lw10000);
# curr last write times
var lw10000_5, integer;
subject to clw10000_5:
	lw10000_5 == lt10000_5 + ep10000_5;
# node last write time
var lw5, integer;
subject to clw5:
	lw5 == (lw10000_5);
# node first write time
var fw5, integer;
subject to cfw5:
	fw5 == st5 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x5_1)) * 1 * b5_0;
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
	ep10000_2 ==  + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 - (0) * 1 * b2_0;
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
	fw2 == st2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1)) * 1 * b2_0;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == max( + fw1*b1_0*b0_0,  + fw2*b2_0*b0_0);
# relative last reads
var rlr1_0, integer;
subject to cst_rlr1_0:
	rlr1_0 == st0 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
var rlr2_0, integer;
subject to cst_rlr2_0:
	rlr2_0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
# epilogues
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0 - ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
var ep2_0, integer;
subject to cep2_0:
	ep2_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0 - ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
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
	fw0 == st0 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == ( + fw0*b0_0*b3_0);
# relative last reads
var rlr0_3, integer;
subject to cst_rlr0_3:
	rlr0_3 == st3 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0;
# epilogues
var ep0_3, integer;
subject to cep0_3:
	ep0_3 ==  + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0 - ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0;
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
	fw3 == st3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_1)) * 1 * b3_0;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == max( + fw3*b3_0*b4_0,  + fw5*b5_0*b4_0);
# relative last reads
var rlr3_4, integer;
subject to cst_rlr3_4:
	rlr3_4 == st4 + ((0 + 0 * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
var rlr5_4, integer;
subject to cst_rlr5_4:
	rlr5_4 == st4 + ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
# epilogues
var ep3_4, integer;
subject to cep3_4:
	ep3_4 ==  + ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0 - ((0 + 0 * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
var ep5_4, integer;
subject to cep5_4:
	ep5_4 ==  + ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0 - ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
# inputs last read/write dependencies
var lt3_4, integer;
subject to clt3_4:
	lt3_4 == max(rlr3_4, lw3);
var lt5_4, integer;
subject to clt5_4:
	lt5_4 == max(rlr5_4, lw5);
# curr last write times
var lw3_4, integer;
subject to clw3_4:
	lw3_4 == lt3_4 + ep3_4;
var lw5_4, integer;
subject to clw5_4:
	lw5_4 == lt5_4 + ep5_4;
# node last write time
var lw4, integer;
subject to clw4:
	lw4 == max(lw3_4, lw5_4);
# node first write time
var fw4, integer;
subject to cfw4:
	fw4 == st4 + ((0 + 0 * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_1)) * 1 * b4_0;
# node: 6 info
# start time
var st6, integer;
subject to cst_st6:
	st6 == ( + fw4*b4_0*b6_0);
# relative last reads
var rlr4_6, integer;
subject to cst_rlr4_6:
	rlr4_6 == st6 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1)) * 1 * b6_0;
# epilogues
var ep4_6, integer;
subject to cep4_6:
	ep4_6 ==  + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1)) * 1 * b6_0 - ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1)) * 1 * b6_0;
# inputs last read/write dependencies
var lt4_6, integer;
subject to clt4_6:
	lt4_6 == max(rlr4_6, lw4);
# curr last write times
var lw4_6, integer;
subject to clw4_6:
	lw4_6 == lt4_6 + ep4_6;
# node last write time
var lw6, integer;
subject to clw6:
	lw6 == (lw4_6);
# node first write time
var fw6, integer;
subject to cfw6:
	fw6 == st6 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_1)) * 1 * b6_0;
# node: 7 info
# start time
var st7, integer;
subject to cst_st7:
	st7 == ( + fw6*b6_0*b7_0);
# relative last reads
var rlr6_7, integer;
subject to cst_rlr6_7:
	rlr6_7 == st7 + ((0 + (x7_1 - 1) * 1 * 1 + (x7_0 - 1) * 1 * 1 * x7_1)) * 1 * b7_0;
# epilogues
var ep6_7, integer;
subject to cep6_7:
	ep6_7 == 0;
# inputs last read/write dependencies
var lt6_7, integer;
subject to clt6_7:
	lt6_7 == max(rlr6_7, lw6);
# curr last write times
var lw6_7, integer;
subject to clw6_7:
	lw6_7 == lt6_7 + ep6_7;
# node last write time
var lw7, integer;
subject to clw7:
	lw7 == (lw6_7);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw7);
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
display x2_0;
display u2_0;
display x2_1;
display u2_1;
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
display x1_0;
display u1_0;
display x1_1;
display u1_1;
display x3_0;
display u3_0;
display x3_1;
display u3_1;
display x5_0;
display u5_0;
display x5_1;
display u5_1;
display DSP_0;
display DSP_7;
display DSP_2;
display DSP_4;
display DSP_6;
display DSP_1;
display DSP_3;
display DSP_5;
display latency;
display totalDSPs;
