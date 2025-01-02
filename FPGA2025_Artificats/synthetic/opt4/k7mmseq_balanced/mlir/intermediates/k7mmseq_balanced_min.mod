# solver type
option solver gurobi;
option gurobi_options 'lim:time=600 tech:logfile=k7mmseq_balanced_min.log';
param x0_0 := 64;
param x0_1 := 64;
param x0_2 := 64;
param x7_0 := 64;
param x7_1 := 64;
param x2_0 := 64;
param x2_1 := 64;
param x2_2 := 64;
param x4_0 := 64;
param x4_1 := 64;
param x4_2 := 64;
param x6_0 := 64;
param x6_1 := 64;
param x6_2 := 64;
param x1_0 := 64;
param x1_1 := 64;
param x1_2 := 64;
param x3_0 := 64;
param x3_1 := 64;
param x3_2 := 64;
param x5_0 := 64;
param x5_1 := 64;
param x5_2 := 64;
# variable declation and constraints
var b0_0, binary;
var b0_1, binary;
var b0_2, binary;
var b0_3, binary;
var b0_4, binary;
var b0_5, binary;
subject to c0:
	(b0_0 + b0_1 + b0_2 + b0_3 + b0_4 + b0_5) == 1;
var b7_0, binary;
var b7_1, binary;
subject to c7:
	(b7_0 + b7_1) == 1;
var b2_0, binary;
var b2_1, binary;
var b2_2, binary;
var b2_3, binary;
var b2_4, binary;
var b2_5, binary;
subject to c2:
	(b2_0 + b2_1 + b2_2 + b2_3 + b2_4 + b2_5) == 1;
var b10000_0, binary;
subject to c10000:
	(b10000_0) == 1;
var b4_0, binary;
var b4_1, binary;
var b4_2, binary;
var b4_3, binary;
var b4_4, binary;
var b4_5, binary;
subject to c4:
	(b4_0 + b4_1 + b4_2 + b4_3 + b4_4 + b4_5) == 1;
var b6_0, binary;
var b6_1, binary;
var b6_2, binary;
var b6_3, binary;
var b6_4, binary;
var b6_5, binary;
subject to c6:
	(b6_0 + b6_1 + b6_2 + b6_3 + b6_4 + b6_5) == 1;
var b1_0, binary;
var b1_1, binary;
var b1_2, binary;
var b1_3, binary;
var b1_4, binary;
var b1_5, binary;
subject to c1:
	(b1_0 + b1_1 + b1_2 + b1_3 + b1_4 + b1_5) == 1;
var b3_0, binary;
var b3_1, binary;
var b3_2, binary;
var b3_3, binary;
var b3_4, binary;
var b3_5, binary;
subject to c3:
	(b3_0 + b3_1 + b3_2 + b3_3 + b3_4 + b3_5) == 1;
var b5_0, binary;
var b5_1, binary;
var b5_2, binary;
var b5_3, binary;
var b5_4, binary;
var b5_5, binary;
subject to c5:
	(b5_0 + b5_1 + b5_2 + b5_3 + b5_4 + b5_5) == 1;
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
	st1 == ( + fw0*b0_0*b1_0 + fw0*b0_1*b1_0 + lw0*b0_2*b1_0 + fw0*b0_3*b1_0 + lw0*b0_4*b1_0 + lw0*b0_5*b1_0 + fw0*b0_0*b1_1 + fw0*b0_1*b1_1 + lw0*b0_2*b1_1 + fw0*b0_3*b1_1 + lw0*b0_4*b1_1 + lw0*b0_5*b1_1 + fw0*b0_0*b1_2 + fw0*b0_1*b1_2 + lw0*b0_2*b1_2 + fw0*b0_3*b1_2 + lw0*b0_4*b1_2 + lw0*b0_5*b1_2 + lw0*b0_0*b1_3 + lw0*b0_1*b1_3 + fw0*b0_2*b1_3 + lw0*b0_3*b1_3 + fw0*b0_4*b1_3 + fw0*b0_5*b1_3 + lw0*b0_0*b1_4 + lw0*b0_1*b1_4 + fw0*b0_2*b1_4 + lw0*b0_3*b1_4 + fw0*b0_4*b1_4 + fw0*b0_5*b1_4 + lw0*b0_0*b1_5 + lw0*b0_1*b1_5 + fw0*b0_2*b1_5 + lw0*b0_3*b1_5 + fw0*b0_4*b1_5 + fw0*b0_5*b1_5);
# relative last reads
var rlr0_1, integer;
subject to cst_rlr0_1:
	rlr0_1 == st1 + ((0 + (x1_2 - 1) * 1 * 1 + 0 * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 4 * b1_0 + ((0 + 0 * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_1 + (x1_0 - 1) * 1 * 1 * x1_1 * x1_2)) * 1 * b1_1 + ((0 + (x1_2 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_2 + 0 * 1 * 1 * x1_2 * x1_0)) * 4 * b1_2 + ((0 + 0 * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1 + (x1_2 - 1) * 1 * 1 * x1_1 * x1_0)) * 1 * b1_3 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_0 + 0 * 1 * 1 * x1_0 * x1_2)) * 1 * b1_4 + ((0 + (x1_0 - 1) * 1 * 1 + 0 * 1 * 1 * x1_0 + (x1_2 - 1) * 1 * 1 * x1_0 * x1_1)) * 1 * b1_5;
# epilogues
var ep0_1, integer;
subject to cep0_1:
	ep0_1 ==  + ((0 + (x1_2 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 4 * b1_0 - ((0 + (x1_2 - 1) * 1 * 1 + 0 * 1 * 1 * x1_2 + (x1_0 - 1) * 1 * 1 * x1_2 * x1_1)) * 4 * b1_0 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_1 + (x1_0 - 1) * 1 * 1 * x1_1 * x1_2)) * 1 * b1_1 - ((0 + 0 * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_1 + (x1_0 - 1) * 1 * 1 * x1_1 * x1_2)) * 1 * b1_1 + ((0 + (x1_2 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_2 + (x1_1 - 1) * 1 * 1 * x1_2 * x1_0)) * 4 * b1_2 - ((0 + (x1_2 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_2 + 0 * 1 * 1 * x1_2 * x1_0)) * 4 * b1_2 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1 + (x1_2 - 1) * 1 * 1 * x1_1 * x1_0)) * 1 * b1_3 - ((0 + 0 * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1 + (x1_2 - 1) * 1 * 1 * x1_1 * x1_0)) * 1 * b1_3 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_0 + (x1_1 - 1) * 1 * 1 * x1_0 * x1_2)) * 1 * b1_4 - ((0 + (x1_0 - 1) * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_0 + 0 * 1 * 1 * x1_0 * x1_2)) * 1 * b1_4 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0 + (x1_2 - 1) * 1 * 1 * x1_0 * x1_1)) * 1 * b1_5 - ((0 + (x1_0 - 1) * 1 * 1 + 0 * 1 * 1 * x1_0 + (x1_2 - 1) * 1 * 1 * x1_0 * x1_1)) * 1 * b1_5;
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
	fw1 == st1 + ((0 + (x1_2 - 1) * 1 * 1 + 0 * 1 * 1 * x1_2 + 0 * 1 * 1 * x1_2 * x1_1)) * 4 * b1_0 + ((0 + 0 * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_1 + 0 * 1 * 1 * x1_1 * x1_2)) * 1 * b1_1 + ((0 + (x1_2 - 1) * 1 * 1 + 0 * 1 * 1 * x1_2 + 0 * 1 * 1 * x1_2 * x1_0)) * 4 * b1_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1 + (x1_2 - 1) * 1 * 1 * x1_1 * x1_0)) * 1 * b1_3 + ((0 + 0 * 1 * 1 + (x1_2 - 1) * 1 * 1 * x1_0 + 0 * 1 * 1 * x1_0 * x1_2)) * 1 * b1_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_0 + (x1_2 - 1) * 1 * 1 * x1_0 * x1_1)) * 1 * b1_5;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == ( + fw1*b1_0*b2_0 + fw1*b1_1*b2_0 + lw1*b1_2*b2_0 + fw1*b1_3*b2_0 + lw1*b1_4*b2_0 + lw1*b1_5*b2_0 + fw1*b1_0*b2_1 + fw1*b1_1*b2_1 + lw1*b1_2*b2_1 + fw1*b1_3*b2_1 + lw1*b1_4*b2_1 + lw1*b1_5*b2_1 + fw1*b1_0*b2_2 + fw1*b1_1*b2_2 + lw1*b1_2*b2_2 + fw1*b1_3*b2_2 + lw1*b1_4*b2_2 + lw1*b1_5*b2_2 + lw1*b1_0*b2_3 + lw1*b1_1*b2_3 + fw1*b1_2*b2_3 + lw1*b1_3*b2_3 + fw1*b1_4*b2_3 + fw1*b1_5*b2_3 + lw1*b1_0*b2_4 + lw1*b1_1*b2_4 + fw1*b1_2*b2_4 + lw1*b1_3*b2_4 + fw1*b1_4*b2_4 + fw1*b1_5*b2_4 + lw1*b1_0*b2_5 + lw1*b1_1*b2_5 + fw1*b1_2*b2_5 + lw1*b1_3*b2_5 + fw1*b1_4*b2_5 + fw1*b1_5*b2_5);
# relative last reads
var rlr1_2, integer;
subject to cst_rlr1_2:
	rlr1_2 == st2 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + 0 * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + 0 * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + (x2_0 - 1) * 1 * 1 + 0 * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
# epilogues
var ep1_2, integer;
subject to cep1_2:
	ep1_2 ==  + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 - ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 - ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + (x2_1 - 1) * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 - ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 - ((0 + 0 * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + (x2_1 - 1) * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 - ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + 0 * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5 - ((0 + (x2_0 - 1) * 1 * 1 + 0 * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
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
# node first write time
var fw2, integer;
subject to cfw2:
	fw2 == st2 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + 0 * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + 0 * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == ( + fw2*b2_0*b3_0 + fw2*b2_1*b3_0 + lw2*b2_2*b3_0 + fw2*b2_3*b3_0 + lw2*b2_4*b3_0 + lw2*b2_5*b3_0 + fw2*b2_0*b3_1 + fw2*b2_1*b3_1 + lw2*b2_2*b3_1 + fw2*b2_3*b3_1 + lw2*b2_4*b3_1 + lw2*b2_5*b3_1 + fw2*b2_0*b3_2 + fw2*b2_1*b3_2 + lw2*b2_2*b3_2 + fw2*b2_3*b3_2 + lw2*b2_4*b3_2 + lw2*b2_5*b3_2 + lw2*b2_0*b3_3 + lw2*b2_1*b3_3 + fw2*b2_2*b3_3 + lw2*b2_3*b3_3 + fw2*b2_4*b3_3 + fw2*b2_5*b3_3 + lw2*b2_0*b3_4 + lw2*b2_1*b3_4 + fw2*b2_2*b3_4 + lw2*b2_3*b3_4 + fw2*b2_4*b3_4 + fw2*b2_5*b3_4 + lw2*b2_0*b3_5 + lw2*b2_1*b3_5 + fw2*b2_2*b3_5 + lw2*b2_3*b3_5 + fw2*b2_4*b3_5 + fw2*b2_5*b3_5);
# relative last reads
var rlr2_3, integer;
subject to cst_rlr2_3:
	rlr2_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + 0 * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
# epilogues
var ep2_3, integer;
subject to cep2_3:
	ep2_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 - ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 - ((0 + 0 * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 - ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5 - ((0 + (x3_0 - 1) * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
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
	fw3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + 0 * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == ( + fw3*b3_0*b4_0 + fw3*b3_1*b4_0 + lw3*b3_2*b4_0 + fw3*b3_3*b4_0 + lw3*b3_4*b4_0 + lw3*b3_5*b4_0 + fw3*b3_0*b4_1 + fw3*b3_1*b4_1 + lw3*b3_2*b4_1 + fw3*b3_3*b4_1 + lw3*b3_4*b4_1 + lw3*b3_5*b4_1 + fw3*b3_0*b4_2 + fw3*b3_1*b4_2 + lw3*b3_2*b4_2 + fw3*b3_3*b4_2 + lw3*b3_4*b4_2 + lw3*b3_5*b4_2 + lw3*b3_0*b4_3 + lw3*b3_1*b4_3 + fw3*b3_2*b4_3 + lw3*b3_3*b4_3 + fw3*b3_4*b4_3 + fw3*b3_5*b4_3 + lw3*b3_0*b4_4 + lw3*b3_1*b4_4 + fw3*b3_2*b4_4 + lw3*b3_3*b4_4 + fw3*b3_4*b4_4 + fw3*b3_5*b4_4 + lw3*b3_0*b4_5 + lw3*b3_1*b4_5 + fw3*b3_2*b4_5 + lw3*b3_3*b4_5 + fw3*b3_4*b4_5 + fw3*b3_5*b4_5);
# relative last reads
var rlr3_4, integer;
subject to cst_rlr3_4:
	rlr3_4 == st4 + ((0 + (x4_2 - 1) * 1 * 1 + 0 * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 4 * b4_0 + ((0 + 0 * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_1 + (x4_0 - 1) * 1 * 1 * x4_1 * x4_2)) * 1 * b4_1 + ((0 + (x4_2 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_0)) * 4 * b4_2 + ((0 + 0 * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1 + (x4_2 - 1) * 1 * 1 * x4_1 * x4_0)) * 1 * b4_3 + ((0 + (x4_0 - 1) * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_0 + 0 * 1 * 1 * x4_0 * x4_2)) * 1 * b4_4 + ((0 + (x4_0 - 1) * 1 * 1 + 0 * 1 * 1 * x4_0 + (x4_2 - 1) * 1 * 1 * x4_0 * x4_1)) * 1 * b4_5;
# epilogues
var ep3_4, integer;
subject to cep3_4:
	ep3_4 ==  + ((0 + (x4_2 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 4 * b4_0 - ((0 + (x4_2 - 1) * 1 * 1 + 0 * 1 * 1 * x4_2 + (x4_0 - 1) * 1 * 1 * x4_2 * x4_1)) * 4 * b4_0 + ((0 + (x4_1 - 1) * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_1 + (x4_0 - 1) * 1 * 1 * x4_1 * x4_2)) * 1 * b4_1 - ((0 + 0 * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_1 + (x4_0 - 1) * 1 * 1 * x4_1 * x4_2)) * 1 * b4_1 + ((0 + (x4_2 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_2 + (x4_1 - 1) * 1 * 1 * x4_2 * x4_0)) * 4 * b4_2 - ((0 + (x4_2 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_0)) * 4 * b4_2 + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1 + (x4_2 - 1) * 1 * 1 * x4_1 * x4_0)) * 1 * b4_3 - ((0 + 0 * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1 + (x4_2 - 1) * 1 * 1 * x4_1 * x4_0)) * 1 * b4_3 + ((0 + (x4_0 - 1) * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_0 + (x4_1 - 1) * 1 * 1 * x4_0 * x4_2)) * 1 * b4_4 - ((0 + (x4_0 - 1) * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_0 + 0 * 1 * 1 * x4_0 * x4_2)) * 1 * b4_4 + ((0 + (x4_0 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_0 + (x4_2 - 1) * 1 * 1 * x4_0 * x4_1)) * 1 * b4_5 - ((0 + (x4_0 - 1) * 1 * 1 + 0 * 1 * 1 * x4_0 + (x4_2 - 1) * 1 * 1 * x4_0 * x4_1)) * 1 * b4_5;
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
	fw4 == st4 + ((0 + (x4_2 - 1) * 1 * 1 + 0 * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_1)) * 4 * b4_0 + ((0 + 0 * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_1 + 0 * 1 * 1 * x4_1 * x4_2)) * 1 * b4_1 + ((0 + (x4_2 - 1) * 1 * 1 + 0 * 1 * 1 * x4_2 + 0 * 1 * 1 * x4_2 * x4_0)) * 4 * b4_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_1 + (x4_2 - 1) * 1 * 1 * x4_1 * x4_0)) * 1 * b4_3 + ((0 + 0 * 1 * 1 + (x4_2 - 1) * 1 * 1 * x4_0 + 0 * 1 * 1 * x4_0 * x4_2)) * 1 * b4_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_0 + (x4_2 - 1) * 1 * 1 * x4_0 * x4_1)) * 1 * b4_5;
# node: 5 info
# start time
var st5, integer;
subject to cst_st5:
	st5 == ( + fw4*b4_0*b5_0 + fw4*b4_1*b5_0 + lw4*b4_2*b5_0 + fw4*b4_3*b5_0 + lw4*b4_4*b5_0 + lw4*b4_5*b5_0 + fw4*b4_0*b5_1 + fw4*b4_1*b5_1 + lw4*b4_2*b5_1 + fw4*b4_3*b5_1 + lw4*b4_4*b5_1 + lw4*b4_5*b5_1 + fw4*b4_0*b5_2 + fw4*b4_1*b5_2 + lw4*b4_2*b5_2 + fw4*b4_3*b5_2 + lw4*b4_4*b5_2 + lw4*b4_5*b5_2 + lw4*b4_0*b5_3 + lw4*b4_1*b5_3 + fw4*b4_2*b5_3 + lw4*b4_3*b5_3 + fw4*b4_4*b5_3 + fw4*b4_5*b5_3 + lw4*b4_0*b5_4 + lw4*b4_1*b5_4 + fw4*b4_2*b5_4 + lw4*b4_3*b5_4 + fw4*b4_4*b5_4 + fw4*b4_5*b5_4 + lw4*b4_0*b5_5 + lw4*b4_1*b5_5 + fw4*b4_2*b5_5 + lw4*b4_3*b5_5 + fw4*b4_4*b5_5 + fw4*b4_5*b5_5);
# relative last reads
var rlr4_5, integer;
subject to cst_rlr4_5:
	rlr4_5 == st5 + ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0 + ((0 + 0 * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_1 + (x5_0 - 1) * 1 * 1 * x5_1 * x5_2)) * 1 * b5_1 + ((0 + (x5_2 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_0)) * 4 * b5_2 + ((0 + 0 * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1 + (x5_2 - 1) * 1 * 1 * x5_1 * x5_0)) * 1 * b5_3 + ((0 + (x5_0 - 1) * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_0 + 0 * 1 * 1 * x5_0 * x5_2)) * 1 * b5_4 + ((0 + (x5_0 - 1) * 1 * 1 + 0 * 1 * 1 * x5_0 + (x5_2 - 1) * 1 * 1 * x5_0 * x5_1)) * 1 * b5_5;
# epilogues
var ep4_5, integer;
subject to cep4_5:
	ep4_5 ==  + ((0 + (x5_2 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0 - ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + (x5_0 - 1) * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0 + ((0 + (x5_1 - 1) * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_1 + (x5_0 - 1) * 1 * 1 * x5_1 * x5_2)) * 1 * b5_1 - ((0 + 0 * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_1 + (x5_0 - 1) * 1 * 1 * x5_1 * x5_2)) * 1 * b5_1 + ((0 + (x5_2 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_2 + (x5_1 - 1) * 1 * 1 * x5_2 * x5_0)) * 4 * b5_2 - ((0 + (x5_2 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_0)) * 4 * b5_2 + ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1 + (x5_2 - 1) * 1 * 1 * x5_1 * x5_0)) * 1 * b5_3 - ((0 + 0 * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1 + (x5_2 - 1) * 1 * 1 * x5_1 * x5_0)) * 1 * b5_3 + ((0 + (x5_0 - 1) * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_0 + (x5_1 - 1) * 1 * 1 * x5_0 * x5_2)) * 1 * b5_4 - ((0 + (x5_0 - 1) * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_0 + 0 * 1 * 1 * x5_0 * x5_2)) * 1 * b5_4 + ((0 + (x5_0 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_0 + (x5_2 - 1) * 1 * 1 * x5_0 * x5_1)) * 1 * b5_5 - ((0 + (x5_0 - 1) * 1 * 1 + 0 * 1 * 1 * x5_0 + (x5_2 - 1) * 1 * 1 * x5_0 * x5_1)) * 1 * b5_5;
# inputs last read/write dependencies
var lt4_5, integer;
subject to clt4_5:
	lt4_5 == max(rlr4_5, lw4);
# curr last write times
var lw4_5, integer;
subject to clw4_5:
	lw4_5 == lt4_5 + ep4_5;
# node last write time
var lw5, integer;
subject to clw5:
	lw5 == (lw4_5);
# node first write time
var fw5, integer;
subject to cfw5:
	fw5 == st5 + ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_1)) * 4 * b5_0 + ((0 + 0 * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_1 + 0 * 1 * 1 * x5_1 * x5_2)) * 1 * b5_1 + ((0 + (x5_2 - 1) * 1 * 1 + 0 * 1 * 1 * x5_2 + 0 * 1 * 1 * x5_2 * x5_0)) * 4 * b5_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x5_1 + (x5_2 - 1) * 1 * 1 * x5_1 * x5_0)) * 1 * b5_3 + ((0 + 0 * 1 * 1 + (x5_2 - 1) * 1 * 1 * x5_0 + 0 * 1 * 1 * x5_0 * x5_2)) * 1 * b5_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x5_0 + (x5_2 - 1) * 1 * 1 * x5_0 * x5_1)) * 1 * b5_5;
# node: 6 info
# start time
var st6, integer;
subject to cst_st6:
	st6 == ( + fw5*b5_0*b6_0 + fw5*b5_1*b6_0 + lw5*b5_2*b6_0 + fw5*b5_3*b6_0 + lw5*b5_4*b6_0 + lw5*b5_5*b6_0 + fw5*b5_0*b6_1 + fw5*b5_1*b6_1 + lw5*b5_2*b6_1 + fw5*b5_3*b6_1 + lw5*b5_4*b6_1 + lw5*b5_5*b6_1 + fw5*b5_0*b6_2 + fw5*b5_1*b6_2 + lw5*b5_2*b6_2 + fw5*b5_3*b6_2 + lw5*b5_4*b6_2 + lw5*b5_5*b6_2 + lw5*b5_0*b6_3 + lw5*b5_1*b6_3 + fw5*b5_2*b6_3 + lw5*b5_3*b6_3 + fw5*b5_4*b6_3 + fw5*b5_5*b6_3 + lw5*b5_0*b6_4 + lw5*b5_1*b6_4 + fw5*b5_2*b6_4 + lw5*b5_3*b6_4 + fw5*b5_4*b6_4 + fw5*b5_5*b6_4 + lw5*b5_0*b6_5 + lw5*b5_1*b6_5 + fw5*b5_2*b6_5 + lw5*b5_3*b6_5 + fw5*b5_4*b6_5 + fw5*b5_5*b6_5);
# relative last reads
var rlr5_6, integer;
subject to cst_rlr5_6:
	rlr5_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + 0 * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + 0 * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
# epilogues
var ep5_6, integer;
subject to cep5_6:
	ep5_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 - ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 - ((0 + 0 * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 - ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5 - ((0 + (x6_0 - 1) * 1 * 1 + 0 * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
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
	fw6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + 0 * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
# node: 7 info
# start time
var st7, integer;
subject to cst_st7:
	st7 == ( + fw6*b6_0*b7_0 + fw6*b6_1*b7_0 + lw6*b6_2*b7_0 + fw6*b6_3*b7_0 + lw6*b6_4*b7_0 + lw6*b6_5*b7_0 + lw6*b6_0*b7_1 + lw6*b6_1*b7_1 + fw6*b6_2*b7_1 + lw6*b6_3*b7_1 + fw6*b6_4*b7_1 + fw6*b6_5*b7_1);
# relative last reads
var rlr6_7, integer;
subject to cst_rlr6_7:
	rlr6_7 == st7 + ((0 + (x7_1 - 1) * 1 * 1 + (x7_0 - 1) * 1 * 1 * x7_1)) * 1 * b7_0 + ((0 + (x7_0 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_0)) * 1 * b7_1;
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
display b0_0;
display b0_1;
display b0_2;
display b0_3;
display b0_4;
display b0_5;
display b7_0;
display b7_1;
display b2_0;
display b2_1;
display b2_2;
display b2_3;
display b2_4;
display b2_5;
display b10000_0;
display b4_0;
display b4_1;
display b4_2;
display b4_3;
display b4_4;
display b4_5;
display b6_0;
display b6_1;
display b6_2;
display b6_3;
display b6_4;
display b6_5;
display b1_0;
display b1_1;
display b1_2;
display b1_3;
display b1_4;
display b1_5;
display b3_0;
display b3_1;
display b3_2;
display b3_3;
display b3_4;
display b3_5;
display b5_0;
display b5_1;
display b5_2;
display b5_3;
display b5_4;
display b5_5;
display latency;
