# solver type
option solver gurobi;
option gurobi_options 'opttol=1e-8 lim:time=60 tech:logfile=gemm_combined.log';
# variable declation and constraints
var b0_0, binary;
var b0_1, binary;
var b0_2, binary;
var b0_3, binary;
var b0_4, binary;
var b0_5, binary;
subject to c0:
	(b0_0 + b0_1 + b0_2 + b0_3 + b0_4 + b0_5) == 1;
var b2_0, binary;
var b2_1, binary;
subject to c2:
	(b2_0 + b2_1) == 1;
var b10000_0, binary;
subject to c10000:
	(b10000_0) == 1;
var b1_0, binary;
var b1_1, binary;
subject to c1:
	(b1_0 + b1_1) == 1;
var x0_0 >= 16, <= 200, integer;
var u0_0 >= 1, <= 200, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 200;
var x0_1 >= 16, <= 220, integer;
var u0_1 >= 1, <= 220, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 220;
var x0_2 >= 16, <= 240, integer;
var u0_2 >= 1, <= 240, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 240;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2 * 5;
var x2_0 >= 16, <= 200, integer;
var u2_0 >= 1, <= 200, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 200;
var x2_1 >= 16, <= 220, integer;
var u2_1 >= 1, <= 220, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 220;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == u2_0 * u2_1 * 0;
var x1_0 >= 16, <= 200, integer;
var u1_0 >= 1, <= 200, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 200;
var x1_1 >= 16, <= 220, integer;
var u1_1 >= 1, <= 220, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 220;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == u1_0 * u1_1 * 8;
subject to c_u2_0_u1_0:
	u2_0 == u1_0;
subject to c_u2_1_u1_1:
	u2_1 == u1_1;
subject to c_u1_0_u0_0:
	u1_0 == u0_0;
subject to c_u1_1_u0_1:
	u1_1 == u0_1;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_2 + DSP_1;
subject to totalDSPConst:
	totalDSPs <= 220;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == ( + fw10000*b10000_0*b0_0 + fw10000*b10000_0*b0_1 + fw10000*b10000_0*b0_2 + fw10000*b10000_0*b0_3 + fw10000*b10000_0*b0_4 + fw10000*b10000_0*b0_5);
# relative last reads
var rlr10000_0, integer;
subject to cst_rlr10000_0:
	rlr10000_0 == st0 + (0) * 4 * b0_0 + (0) * 1 * b0_1 + (0) * 4 * b0_2 + (0) * 1 * b0_3 + (0) * 1 * b0_4 + (0) * 1 * b0_5;
# epilogues
var ep10000_0, integer;
subject to cep10000_0:
	ep10000_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 - (0) * 4 * b0_0 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + (x0_0 - 1) * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 - (0) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 - (0) * 4 * b0_2 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 - (0) * 1 * b0_3 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 - (0) * 1 * b0_4 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5 - (0) * 1 * b0_5;
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
	fw0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + 0 * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
# node: 1 info
# start time
var st1, integer;
subject to cst_st1:
	st1 == ( + fw0*b0_0*b1_0 + fw0*b0_1*b1_0 + lw0*b0_2*b1_0 + fw0*b0_3*b1_0 + lw0*b0_4*b1_0 + lw0*b0_5*b1_0 + lw0*b0_0*b1_1 + lw0*b0_1*b1_1 + fw0*b0_2*b1_1 + lw0*b0_3*b1_1 + fw0*b0_4*b1_1 + fw0*b0_5*b1_1);
# relative last reads
var rlr0_1, integer;
subject to cst_rlr0_1:
	rlr0_1 == st1 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1;
# epilogues
var ep0_1, integer;
subject to cep0_1:
	ep0_1 ==  + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 - ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1 - ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1;
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
# node first write time
var fw1, integer;
subject to cfw1:
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_0)) * 1 * b1_1;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == ( + fw1*b1_0*b2_0 + lw1*b1_1*b2_0 + lw1*b1_0*b2_1 + fw1*b1_1*b2_1);
# relative last reads
var rlr1_2, integer;
subject to cst_rlr1_2:
	rlr1_2 == st2 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0)) * 1 * b2_1;
# epilogues
var ep1_2, integer;
subject to cep1_2:
	ep1_2 == 0;
# inputs last read/write dependencies
var lt1_2, integer;
subject to clt1_2:
	lt1_2 == max(rlr1_2, lw1);
# curr last write times
var lw1_2, integer;
subject to clw1_2:
	lw1_2 == lt1_2 + ep1_2;
# node last write time
var lw2, integer;
subject to clw2:
	lw2 == (lw1_2);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw2);
minimize obj: latency;
solve obj;
display b0_0;
display b0_1;
display b0_2;
display b0_3;
display b0_4;
display b0_5;
display b2_0;
display b2_1;
display b10000_0;
display b1_0;
display b1_1;
display x0_0;
display u0_0;
display x0_1;
display u0_1;
display x0_2;
display u0_2;
display x2_0;
display u2_0;
display x2_1;
display u2_1;
display x1_0;
display u1_0;
display x1_1;
display u1_1;
display DSP_0;
display DSP_2;
display DSP_1;
display latency;
display totalDSPs;
