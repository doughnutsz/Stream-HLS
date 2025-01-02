# solver type
option solver gurobi;
option gurobi_options 'opttol=1e-8 lim:time=60 tech:logfile=k3mm_parallel.log';
param b0_0 := 1;
param b2_0 := 1;
param b10000_0 := 1;
param b1_0 := 1;
param b3_0 := 1;
var x0_0 >= 16, <= 190, integer;
var u0_0 >= 1, <= 190, integer;
subject to c_uf0_0:
	u0_0 * x0_0 == 190;
var x0_1 >= 16, <= 200, integer;
var u0_1 >= 1, <= 200, integer;
subject to c_uf0_1:
	u0_1 * x0_1 == 200;
var x0_2 >= 16, <= 180, integer;
var u0_2 >= 1, <= 180, integer;
subject to c_uf0_2:
	u0_2 * x0_2 == 180;
var DSP_0, integer;
subject to c_DSP0:
	DSP_0 == u0_0 * u0_1 * u0_2;
var x2_0 >= 16, <= 190, integer;
var u2_0 >= 1, <= 190, integer;
subject to c_uf2_0:
	u2_0 * x2_0 == 190;
var x2_1 >= 16, <= 220, integer;
var u2_1 >= 1, <= 220, integer;
subject to c_uf2_1:
	u2_1 * x2_1 == 220;
var x2_2 >= 16, <= 210, integer;
var u2_2 >= 1, <= 210, integer;
subject to c_uf2_2:
	u2_2 * x2_2 == 210;
var DSP_2, integer;
subject to c_DSP2:
	DSP_2 == u2_0 * u2_1 * u2_2;
var x1_0 >= 16, <= 190, integer;
var u1_0 >= 1, <= 190, integer;
subject to c_uf1_0:
	u1_0 * x1_0 == 190;
var x1_1 >= 16, <= 210, integer;
var u1_1 >= 1, <= 210, integer;
subject to c_uf1_1:
	u1_1 * x1_1 == 210;
var x1_2 >= 16, <= 180, integer;
var u1_2 >= 1, <= 180, integer;
subject to c_uf1_2:
	u1_2 * x1_2 == 180;
var DSP_1, integer;
subject to c_DSP1:
	DSP_1 == u1_0 * u1_1 * u1_2;
var x3_0 >= 16, <= 210, integer;
var u3_0 >= 1, <= 210, integer;
subject to c_uf3_0:
	u3_0 * x3_0 == 210;
var x3_1 >= 16, <= 180, integer;
var u3_1 >= 1, <= 180, integer;
subject to c_uf3_1:
	u3_1 * x3_1 == 180;
var DSP_3, integer;
subject to c_DSP3:
	DSP_3 == 0;
subject to c_u1_2_u0_2:
	u1_2 == u0_2;
subject to c_u1_0_u0_0:
	u1_0 == u0_0;
subject to c_u1_0_u2_0:
	u1_0 == u2_0;
subject to c_u1_1_u2_2:
	u1_1 == u2_2;
subject to c_u3_1_u1_2:
	u3_1 == u1_2;
subject to c_u3_0_u1_1:
	u3_0 == u1_1;
var totalDSPs, integer;
subject to totalDSPDef:
	totalDSPs == DSP_0 + DSP_2 + DSP_1 + DSP_3;
subject to totalDSPConst:
	totalDSPs <= 512;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
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
	fw2 == st2 + ((0 + 0 * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 1 * b2_0;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == ( + fw10000*b10000_0*b0_0);
# relative last reads
var rlr10000_0, integer;
subject to cst_rlr10000_0:
	rlr10000_0 == st0 + (0) * 1 * b0_0;
# epilogues
var ep10000_0, integer;
subject to cep10000_0:
	ep10000_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0 - (0) * 1 * b0_0;
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
	fw0 == st0 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 1 * b0_0;
# node: 1 info
# start time
var st1, integer;
subject to cst_st1:
	st1 == max( + fw0*b0_0*b1_0,  + fw2*b2_0*b1_0);
# relative last reads
var rlr0_1, integer;
subject to cst_rlr0_1:
	rlr0_1 == st1 + ((0 + (x1_2 - 1) * 1 * 1 + 0 * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0;
var rlr2_1, integer;
subject to cst_rlr2_1:
	rlr2_1 == st1 + ((0 + 0 * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0;
# epilogues
var ep0_1, integer;
subject to cep0_1:
	ep0_1 ==  + ((0 + (x1_2 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0 - ((0 + (x1_2 - 1) * 1 * 1 + 0 * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0;
var ep2_1, integer;
subject to cep2_1:
	ep2_1 ==  + ((0 + (x1_2 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0 - ((0 + 0 * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0;
# inputs last read/write dependencies
var lt0_1, integer;
subject to clt0_1:
	lt0_1 == max(rlr0_1, lw0);
var lt2_1, integer;
subject to clt2_1:
	lt2_1 == max(rlr2_1, lw2);
# curr last write times
var lw0_1, integer;
subject to clw0_1:
	lw0_1 == lt0_1 + ep0_1;
var lw2_1, integer;
subject to clw2_1:
	lw2_1 == lt2_1 + ep2_1;
# node last write time
var lw1, integer;
subject to clw1:
	lw1 == max(lw0_1, lw2_1);
# node first write time
var fw1, integer;
subject to cfw1:
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 1 * b1_0;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == ( + fw1*b1_0*b3_0);
# relative last reads
var rlr1_3, integer;
subject to cst_rlr1_3:
	rlr1_3 == st3 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1)) * 1 * b3_0;
# epilogues
var ep1_3, integer;
subject to cep1_3:
	ep1_3 == 0;
# inputs last read/write dependencies
var lt1_3, integer;
subject to clt1_3:
	lt1_3 == max(rlr1_3, lw1);
# curr last write times
var lw1_3, integer;
subject to clw1_3:
	lw1_3 == lt1_3 + ep1_3;
# node last write time
var lw3, integer;
subject to clw3:
	lw3 == (lw1_3);
# objective function
var latency, integer;
subject to clatency:
	latency == max(lw3);
minimize obj: latency;
solve obj;
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
display x2_2;
display u2_2;
display x1_0;
display u1_0;
display x1_1;
display u1_1;
display x1_2;
display u1_2;
display x3_0;
display u3_0;
display x3_1;
display u3_1;
display DSP_0;
display DSP_2;
display DSP_1;
display DSP_3;
display latency;
display totalDSPs;
