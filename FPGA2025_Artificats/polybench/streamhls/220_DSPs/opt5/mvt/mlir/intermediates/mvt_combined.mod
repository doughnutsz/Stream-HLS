# solver type
option solver gurobi;
option gurobi_options 'opttol=1e-8 lim:time=60 tech:logfile=mvt_combined.log';
# variable declation and constraints
var b0_0, binary;
var b0_1, binary;
subject to c0:
	(b0_0 + b0_1) == 1;
var b2_0, binary;
var b2_1, binary;
subject to c2:
	(b2_0 + b2_1) == 1;
var b10000_0, binary;
subject to c10000:
	(b10000_0) == 1;
var b4_0, binary;
subject to c4:
	(b4_0) == 1;
var b1_0, binary;
subject to c1:
	(b1_0) == 1;
var b3_0, binary;
var b3_1, binary;
subject to c3:
	(b3_0 + b3_1) == 1;
var x0_0 >= 16, <= 400, integer;
var u0_0 >= 1, <= 400, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 400;
var x0_1 >= 16, <= 400, integer;
var u0_1 >= 1, <= 400, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 400;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * 5;
var x2_0 >= 16, <= 400, integer;
var u2_0 >= 1, <= 400, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 400;
var x2_1 >= 16, <= 400, integer;
var u2_1 >= 1, <= 400, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 400;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == u2_0 * u2_1 * 0;
var x4_0 >= 16, <= 400, integer;
var u4_0 >= 1, <= 400, integer;
subject to c_uf4_0:
	u4_0 * x4_0 == 400;
var DSP_4, integer;
subject to c_DSP4:
	DSP_4 == u4_0 * 0;
var x1_0 >= 16, <= 400, integer;
var u1_0 >= 1, <= 400, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 400;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == u1_0 * 0;
var x3_0 >= 16, <= 400, integer;
var u3_0 >= 1, <= 400, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 400;
var x3_1 >= 16, <= 400, integer;
var u3_1 >= 1, <= 400, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 400;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == u3_0 * u3_1 * 5;
subject to c_u4_0_u3_0:
	u4_0 == u3_0;
subject to c_u1_0_u0_0:
	u1_0 == u0_0;
subject to c_u3_0_u2_1:
	u3_0 == u2_1;
subject to c_u3_1_u2_0:
	u3_1 == u2_0;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_2 + DSP_4 + DSP_1 + DSP_3;
subject to totalDSPConst:
	totalDSPs <= 220;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == ( + fw10000*b10000_0*b2_0 + fw10000*b10000_0*b2_1);
# relative last reads
var rlr10000_2, integer;
subject to cst_rlr10000_2:
	rlr10000_2 == st2 + (0) * 1 * b2_0 + (0) * 1 * b2_1;
# epilogues
var ep10000_2, integer;
subject to cep10000_2:
	ep10000_2 ==  + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 - (0) * 1 * b2_0 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0)) * 1 * b2_1 - (0) * 1 * b2_1;
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
	fw2 == st2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_0)) * 1 * b2_1;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == ( + lw2*b2_0*b3_0 + fw2*b2_1*b3_0 + fw2*b2_0*b3_1 + lw2*b2_1*b3_1);
# relative last reads
var rlr2_3, integer;
subject to cst_rlr2_3:
	rlr2_3 == st3 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 4 * b3_0 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0)) * 1 * b3_1;
# epilogues
var ep2_3, integer;
subject to cep2_3:
	ep2_3 ==  + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 4 * b3_0 - ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 4 * b3_0 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0)) * 1 * b3_1 - ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0)) * 1 * b3_1;
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
	fw3 == st3 + ((0 + (x3_1 - 1) * 1 * 1 + 0 * 1 * 1 * x3_1)) * 4 * b3_0 + ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0)) * 1 * b3_1;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == ( + fw3*b3_0*b4_0 + fw3*b3_1*b4_0);
# relative last reads
var rlr3_4, integer;
subject to cst_rlr3_4:
	rlr3_4 == st4 + ((0 + (x4_0 - 1) * 1 * 1)) * 1 * b4_0;
# epilogues
var ep3_4, integer;
subject to cep3_4:
	ep3_4 == 0;
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
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == ( + fw10000*b10000_0*b0_0 + fw10000*b10000_0*b0_1);
# relative last reads
var rlr10000_0, integer;
subject to cst_rlr10000_0:
	rlr10000_0 == st0 + (0) * 4 * b0_0 + (0) * 1 * b0_1;
# epilogues
var ep10000_0, integer;
subject to cep10000_0:
	ep10000_0 ==  + ((0 + (x0_1 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1)) * 4 * b0_0 - (0) * 4 * b0_0 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0)) * 1 * b0_1 - (0) * 1 * b0_1;
# inputs last read/write dependencies
var lt10000_0, integer;
subject to clt10000_0:
	lt10000_0 == max(rlr10000_0, lw10000);
# curr last write times
var lw10000_0, integer;
subject to clw10000_0:
	lw10000_0 == lt10000_0 + ep10000_0;
# node last write time
var lw0, integer;
subject to clw0:
	lw0 == (lw10000_0);
# node first write time
var fw0, integer;
subject to cfw0:
	fw0 == st0 + ((0 + (x0_1 - 1) * 1 * 1 + 0 * 1 * 1 * x0_1)) * 4 * b0_0 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0)) * 1 * b0_1;
# node: 1 info
# start time
var st1, integer;
subject to cst_st1:
	st1 == ( + fw0*b0_0*b1_0 + fw0*b0_1*b1_0);
# relative last reads
var rlr0_1, integer;
subject to cst_rlr0_1:
	rlr0_1 == st1 + ((0 + (x1_0 - 1) * 1 * 1)) * 1 * b1_0;
# epilogues
var ep0_1, integer;
subject to cep0_1:
	ep0_1 == 0;
# inputs last read/write dependencies
var lt0_1, integer;
subject to clt0_1:
	lt0_1 == max(rlr0_1, lw0);
# curr last write times
var lw0_1, integer;
subject to clw0_1:
	lw0_1 == lt0_1 + ep0_1;
# node last write time
var lw1, integer;
subject to clw1:
	lw1 == (lw0_1);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw4, lw1);
minimize obj: latency;
solve obj;
display b0_0;
display b0_1;
display b2_0;
display b2_1;
display b10000_0;
display b4_0;
display b1_0;
display b3_0;
display b3_1;
display x0_0;
display u0_0;
display x0_1;
display u0_1;
display x2_0;
display u2_0;
display x2_1;
display u2_1;
display x4_0;
display u4_0;
display x1_0;
display u1_0;
display x3_0;
display u3_0;
display x3_1;
display u3_1;
display DSP_0;
display DSP_2;
display DSP_4;
display DSP_1;
display DSP_3;
display latency;
display totalDSPs;
