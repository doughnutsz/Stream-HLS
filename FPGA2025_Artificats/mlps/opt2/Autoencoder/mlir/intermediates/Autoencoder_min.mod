# solver type
option solver gurobi;
option gurobi_options 'lim:time=300';
param x0_0 := 32;
param x0_1 := 256;
param x0_2 := 784;
param x7_0 := 64;
param x7_1 := 128;
param x14_0 := 32;
param x14_1 := 256;
param x2_0 := 32;
param x2_1 := 256;
param x9_0 := 32;
param x9_1 := 128;
param x9_2 := 64;
param x16_0 := 784;
param x16_1 := 256;
param x4_0 := 128;
param x4_1 := 256;
param x11_0 := 32;
param x11_1 := 128;
param x18_0 := 32;
param x18_1 := 784;
param x6_0 := 32;
param x6_1 := 64;
param x6_2 := 128;
param x13_0 := 256;
param x13_1 := 128;
param x1_0 := 256;
param x1_1 := 784;
param x8_0 := 32;
param x8_1 := 64;
param x15_0 := 32;
param x15_1 := 784;
param x15_2 := 256;
param x3_0 := 32;
param x3_1 := 128;
param x3_2 := 256;
param x10_0 := 128;
param x10_1 := 64;
param x17_0 := 32;
param x17_1 := 784;
param x5_0 := 32;
param x5_1 := 128;
param x12_0 := 32;
param x12_1 := 256;
param x12_2 := 128;
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
var b14_0, binary;
var b14_1, binary;
subject to c14:
	(b14_0 + b14_1) == 1;
var b2_0, binary;
var b2_1, binary;
subject to c2:
	(b2_0 + b2_1) == 1;
var b9_0, binary;
var b9_1, binary;
var b9_2, binary;
var b9_3, binary;
var b9_4, binary;
var b9_5, binary;
subject to c9:
	(b9_0 + b9_1 + b9_2 + b9_3 + b9_4 + b9_5) == 1;
var b16_0, binary;
var b16_1, binary;
subject to c16:
	(b16_0 + b16_1) == 1;
var b10000_0, binary;
subject to c10000:
	(b10000_0) == 1;
var b4_0, binary;
var b4_1, binary;
subject to c4:
	(b4_0 + b4_1) == 1;
var b11_0, binary;
var b11_1, binary;
subject to c11:
	(b11_0 + b11_1) == 1;
var b18_0, binary;
var b18_1, binary;
subject to c18:
	(b18_0 + b18_1) == 1;
var b6_0, binary;
var b6_1, binary;
var b6_2, binary;
var b6_3, binary;
var b6_4, binary;
var b6_5, binary;
subject to c6:
	(b6_0 + b6_1 + b6_2 + b6_3 + b6_4 + b6_5) == 1;
var b13_0, binary;
var b13_1, binary;
subject to c13:
	(b13_0 + b13_1) == 1;
var b1_0, binary;
var b1_1, binary;
subject to c1:
	(b1_0 + b1_1) == 1;
var b8_0, binary;
var b8_1, binary;
subject to c8:
	(b8_0 + b8_1) == 1;
var b15_0, binary;
var b15_1, binary;
var b15_2, binary;
var b15_3, binary;
var b15_4, binary;
var b15_5, binary;
subject to c15:
	(b15_0 + b15_1 + b15_2 + b15_3 + b15_4 + b15_5) == 1;
var b3_0, binary;
var b3_1, binary;
var b3_2, binary;
var b3_3, binary;
var b3_4, binary;
var b3_5, binary;
subject to c3:
	(b3_0 + b3_1 + b3_2 + b3_3 + b3_4 + b3_5) == 1;
var b10_0, binary;
var b10_1, binary;
subject to c10:
	(b10_0 + b10_1) == 1;
var b17_0, binary;
var b17_1, binary;
subject to c17:
	(b17_0 + b17_1) == 1;
var b5_0, binary;
var b5_1, binary;
subject to c5:
	(b5_0 + b5_1) == 1;
var b12_0, binary;
var b12_1, binary;
var b12_2, binary;
var b12_3, binary;
var b12_4, binary;
var b12_5, binary;
subject to c12:
	(b12_0 + b12_1 + b12_2 + b12_3 + b12_4 + b12_5) == 1;
# node: 10000 info
var st10000 >= 0, <= 0, integer;
var fw10000 >= 0, <= 0, integer;
var lw10000 >= 0, <= 0, integer;
# node: 10 info
# start time
var st10, integer;
subject to cst_st10:
	st10 == ( + fw10000*b10000_0*b10_0 + fw10000*b10000_0*b10_1);
# relative last reads
var rlr10000_10, integer;
subject to cst_rlr10000_10:
	rlr10000_10 == st10 + (0) * 1 * b10_0 + (0) * 1 * b10_1;
# epilogues
var ep10000_10, integer;
subject to cep10000_10:
	ep10000_10 ==  + ((0 + (x10_1 - 1) * 1 * 1 + (x10_0 - 1) * 1 * 1 * x10_1)) * 1 * b10_0 - (0) * 1 * b10_0 + ((0 + (x10_0 - 1) * 1 * 1 + (x10_1 - 1) * 1 * 1 * x10_0)) * 1 * b10_1 - (0) * 1 * b10_1;
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
	fw10 == st10 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x10_1)) * 1 * b10_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x10_0)) * 1 * b10_1;
# node: 1 info
# start time
var st1, integer;
subject to cst_st1:
	st1 == ( + fw10000*b10000_0*b1_0 + fw10000*b10000_0*b1_1);
# relative last reads
var rlr10000_1, integer;
subject to cst_rlr10000_1:
	rlr10000_1 == st1 + (0) * 1 * b1_0 + (0) * 1 * b1_1;
# epilogues
var ep10000_1, integer;
subject to cep10000_1:
	ep10000_1 ==  + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 - (0) * 1 * b1_0 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1 - (0) * 1 * b1_1;
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
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_0)) * 1 * b1_1;
# node: 13 info
# start time
var st13, integer;
subject to cst_st13:
	st13 == ( + fw10000*b10000_0*b13_0 + fw10000*b10000_0*b13_1);
# relative last reads
var rlr10000_13, integer;
subject to cst_rlr10000_13:
	rlr10000_13 == st13 + (0) * 1 * b13_0 + (0) * 1 * b13_1;
# epilogues
var ep10000_13, integer;
subject to cep10000_13:
	ep10000_13 ==  + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1)) * 1 * b13_0 - (0) * 1 * b13_0 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0)) * 1 * b13_1 - (0) * 1 * b13_1;
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
	fw13 == st13 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_1)) * 1 * b13_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_0)) * 1 * b13_1;
# node: 4 info
# start time
var st4, integer;
subject to cst_st4:
	st4 == ( + fw10000*b10000_0*b4_0 + fw10000*b10000_0*b4_1);
# relative last reads
var rlr10000_4, integer;
subject to cst_rlr10000_4:
	rlr10000_4 == st4 + (0) * 1 * b4_0 + (0) * 1 * b4_1;
# epilogues
var ep10000_4, integer;
subject to cep10000_4:
	ep10000_4 ==  + ((0 + (x4_1 - 1) * 1 * 1 + (x4_0 - 1) * 1 * 1 * x4_1)) * 1 * b4_0 - (0) * 1 * b4_0 + ((0 + (x4_0 - 1) * 1 * 1 + (x4_1 - 1) * 1 * 1 * x4_0)) * 1 * b4_1 - (0) * 1 * b4_1;
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
	fw4 == st4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_1)) * 1 * b4_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x4_0)) * 1 * b4_1;
# node: 16 info
# start time
var st16, integer;
subject to cst_st16:
	st16 == ( + fw10000*b10000_0*b16_0 + fw10000*b10000_0*b16_1);
# relative last reads
var rlr10000_16, integer;
subject to cst_rlr10000_16:
	rlr10000_16 == st16 + (0) * 1 * b16_0 + (0) * 1 * b16_1;
# epilogues
var ep10000_16, integer;
subject to cep10000_16:
	ep10000_16 ==  + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1)) * 1 * b16_0 - (0) * 1 * b16_0 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0)) * 1 * b16_1 - (0) * 1 * b16_1;
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
	fw16 == st16 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_1)) * 1 * b16_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_0)) * 1 * b16_1;
# node: 7 info
# start time
var st7, integer;
subject to cst_st7:
	st7 == ( + fw10000*b10000_0*b7_0 + fw10000*b10000_0*b7_1);
# relative last reads
var rlr10000_7, integer;
subject to cst_rlr10000_7:
	rlr10000_7 == st7 + (0) * 1 * b7_0 + (0) * 1 * b7_1;
# epilogues
var ep10000_7, integer;
subject to cep10000_7:
	ep10000_7 ==  + ((0 + (x7_1 - 1) * 1 * 1 + (x7_0 - 1) * 1 * 1 * x7_1)) * 1 * b7_0 - (0) * 1 * b7_0 + ((0 + (x7_0 - 1) * 1 * 1 + (x7_1 - 1) * 1 * 1 * x7_0)) * 1 * b7_1 - (0) * 1 * b7_1;
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
	fw7 == st7 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x7_1)) * 1 * b7_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x7_0)) * 1 * b7_1;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == ( + fw1*b1_0*b0_0 + lw1*b1_1*b0_0 + lw1*b1_0*b0_1 + fw1*b1_1*b0_1 + fw1*b1_0*b0_2 + lw1*b1_1*b0_2 + lw1*b1_0*b0_3 + fw1*b1_1*b0_3 + fw1*b1_0*b0_4 + lw1*b1_1*b0_4 + lw1*b1_0*b0_5 + fw1*b1_1*b0_5);
# relative last reads
var rlr1_0, integer;
subject to cst_rlr1_0:
	rlr1_0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + (x0_1 - 1) * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
# epilogues
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 - ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + (x0_0 - 1) * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 - ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 - ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 - ((0 + (x0_1 - 1) * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 - ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5 - ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
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
	fw0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + 0 * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == ( + fw0*b0_0*b2_0 + fw0*b0_1*b2_0 + lw0*b0_2*b2_0 + fw0*b0_3*b2_0 + lw0*b0_4*b2_0 + lw0*b0_5*b2_0 + lw0*b0_0*b2_1 + lw0*b0_1*b2_1 + fw0*b0_2*b2_1 + lw0*b0_3*b2_1 + fw0*b0_4*b2_1 + fw0*b0_5*b2_1);
# relative last reads
var rlr0_2, integer;
subject to cst_rlr0_2:
	rlr0_2 == st2 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0)) * 1 * b2_1;
# epilogues
var ep0_2, integer;
subject to cep0_2:
	ep0_2 ==  + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 - ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0)) * 1 * b2_1 - ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0)) * 1 * b2_1;
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
	fw2 == st2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1)) * 1 * b2_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_0)) * 1 * b2_1;
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == max( + fw2*b2_0*b3_0 + lw2*b2_1*b3_0 + fw2*b2_0*b3_1 + lw2*b2_1*b3_1 + fw2*b2_0*b3_2 + lw2*b2_1*b3_2 + lw2*b2_0*b3_3 + fw2*b2_1*b3_3 + lw2*b2_0*b3_4 + fw2*b2_1*b3_4 + lw2*b2_0*b3_5 + fw2*b2_1*b3_5,  + fw4*b4_0*b3_0 + lw4*b4_1*b3_0 + lw4*b4_0*b3_1 + fw4*b4_1*b3_1 + fw4*b4_0*b3_2 + lw4*b4_1*b3_2 + lw4*b4_0*b3_3 + fw4*b4_1*b3_3 + fw4*b4_0*b3_4 + lw4*b4_1*b3_4 + lw4*b4_0*b3_5 + fw4*b4_1*b3_5);
# relative last reads
var rlr2_3, integer;
subject to cst_rlr2_3:
	rlr2_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + 0 * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
var rlr4_3, integer;
subject to cst_rlr4_3:
	rlr4_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + 0 * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + 0 * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
# epilogues
var ep2_3, integer;
subject to cep2_3:
	ep2_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 - ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 - ((0 + 0 * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 - ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5 - ((0 + (x3_0 - 1) * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
var ep4_3, integer;
subject to cep4_3:
	ep4_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 - ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + 0 * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 - ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 - ((0 + (x3_1 - 1) * 1 * 1 + 0 * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 - ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5 - ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
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
	fw3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + 0 * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
# node: 5 info
# start time
var st5, integer;
subject to cst_st5:
	st5 == ( + fw3*b3_0*b5_0 + fw3*b3_1*b5_0 + lw3*b3_2*b5_0 + fw3*b3_3*b5_0 + lw3*b3_4*b5_0 + lw3*b3_5*b5_0 + lw3*b3_0*b5_1 + lw3*b3_1*b5_1 + fw3*b3_2*b5_1 + lw3*b3_3*b5_1 + fw3*b3_4*b5_1 + fw3*b3_5*b5_1);
# relative last reads
var rlr3_5, integer;
subject to cst_rlr3_5:
	rlr3_5 == st5 + ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0 + ((0 + (x5_0 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_0)) * 1 * b5_1;
# epilogues
var ep3_5, integer;
subject to cep3_5:
	ep3_5 ==  + ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0 - ((0 + (x5_1 - 1) * 1 * 1 + (x5_0 - 1) * 1 * 1 * x5_1)) * 1 * b5_0 + ((0 + (x5_0 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_0)) * 1 * b5_1 - ((0 + (x5_0 - 1) * 1 * 1 + (x5_1 - 1) * 1 * 1 * x5_0)) * 1 * b5_1;
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
	fw5 == st5 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x5_1)) * 1 * b5_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x5_0)) * 1 * b5_1;
# node: 6 info
# start time
var st6, integer;
subject to cst_st6:
	st6 == max( + fw5*b5_0*b6_0 + lw5*b5_1*b6_0 + fw5*b5_0*b6_1 + lw5*b5_1*b6_1 + fw5*b5_0*b6_2 + lw5*b5_1*b6_2 + lw5*b5_0*b6_3 + fw5*b5_1*b6_3 + lw5*b5_0*b6_4 + fw5*b5_1*b6_4 + lw5*b5_0*b6_5 + fw5*b5_1*b6_5,  + fw7*b7_0*b6_0 + lw7*b7_1*b6_0 + lw7*b7_0*b6_1 + fw7*b7_1*b6_1 + fw7*b7_0*b6_2 + lw7*b7_1*b6_2 + lw7*b7_0*b6_3 + fw7*b7_1*b6_3 + fw7*b7_0*b6_4 + lw7*b7_1*b6_4 + lw7*b7_0*b6_5 + fw7*b7_1*b6_5);
# relative last reads
var rlr5_6, integer;
subject to cst_rlr5_6:
	rlr5_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + 0 * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + 0 * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
var rlr7_6, integer;
subject to cst_rlr7_6:
	rlr7_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + 0 * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + (x6_1 - 1) * 1 * 1 + 0 * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + 0 * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
# epilogues
var ep5_6, integer;
subject to cep5_6:
	ep5_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 - ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 - ((0 + 0 * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 - ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5 - ((0 + (x6_0 - 1) * 1 * 1 + 0 * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
var ep7_6, integer;
subject to cep7_6:
	ep7_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 - ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + 0 * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 - ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 - ((0 + (x6_1 - 1) * 1 * 1 + 0 * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 - ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5 - ((0 + 0 * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
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
	fw6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 4 * b6_0 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + 0 * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 4 * b6_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + 0 * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
# node: 8 info
# start time
var st8, integer;
subject to cst_st8:
	st8 == ( + fw6*b6_0*b8_0 + fw6*b6_1*b8_0 + lw6*b6_2*b8_0 + fw6*b6_3*b8_0 + lw6*b6_4*b8_0 + lw6*b6_5*b8_0 + lw6*b6_0*b8_1 + lw6*b6_1*b8_1 + fw6*b6_2*b8_1 + lw6*b6_3*b8_1 + fw6*b6_4*b8_1 + fw6*b6_5*b8_1);
# relative last reads
var rlr6_8, integer;
subject to cst_rlr6_8:
	rlr6_8 == st8 + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 + ((0 + (x8_0 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_0)) * 1 * b8_1;
# epilogues
var ep6_8, integer;
subject to cep6_8:
	ep6_8 ==  + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 - ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 + ((0 + (x8_0 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_0)) * 1 * b8_1 - ((0 + (x8_0 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_0)) * 1 * b8_1;
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
	fw8 == st8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_1)) * 1 * b8_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_0)) * 1 * b8_1;
# node: 9 info
# start time
var st9, integer;
subject to cst_st9:
	st9 == max( + fw8*b8_0*b9_0 + lw8*b8_1*b9_0 + fw8*b8_0*b9_1 + lw8*b8_1*b9_1 + fw8*b8_0*b9_2 + lw8*b8_1*b9_2 + lw8*b8_0*b9_3 + fw8*b8_1*b9_3 + lw8*b8_0*b9_4 + fw8*b8_1*b9_4 + lw8*b8_0*b9_5 + fw8*b8_1*b9_5,  + fw10*b10_0*b9_0 + lw10*b10_1*b9_0 + lw10*b10_0*b9_1 + fw10*b10_1*b9_1 + fw10*b10_0*b9_2 + lw10*b10_1*b9_2 + lw10*b10_0*b9_3 + fw10*b10_1*b9_3 + fw10*b10_0*b9_4 + lw10*b10_1*b9_4 + lw10*b10_0*b9_5 + fw10*b10_1*b9_5);
# relative last reads
var rlr8_9, integer;
subject to cst_rlr8_9:
	rlr8_9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 + ((0 + 0 * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 + ((0 + 0 * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + 0 * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + (x9_0 - 1) * 1 * 1 + 0 * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
var rlr10_9, integer;
subject to cst_rlr10_9:
	rlr10_9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + 0 * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 + ((0 + (x9_1 - 1) * 1 * 1 + 0 * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + 0 * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + 0 * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
# epilogues
var ep8_9, integer;
subject to cep8_9:
	ep8_9 ==  + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 - ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 - ((0 + 0 * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 - ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 - ((0 + 0 * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 - ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + 0 * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5 - ((0 + (x9_0 - 1) * 1 * 1 + 0 * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
var ep10_9, integer;
subject to cep10_9:
	ep10_9 ==  + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 - ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 - ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + 0 * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 - ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 - ((0 + (x9_1 - 1) * 1 * 1 + 0 * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 - ((0 + 0 * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5 - ((0 + 0 * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
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
	fw9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 4 * b9_0 + ((0 + 0 * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + 0 * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + 0 * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_0)) * 4 * b9_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + 0 * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + 0 * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
# node: 11 info
# start time
var st11, integer;
subject to cst_st11:
	st11 == ( + fw9*b9_0*b11_0 + fw9*b9_1*b11_0 + lw9*b9_2*b11_0 + fw9*b9_3*b11_0 + lw9*b9_4*b11_0 + lw9*b9_5*b11_0 + lw9*b9_0*b11_1 + lw9*b9_1*b11_1 + fw9*b9_2*b11_1 + lw9*b9_3*b11_1 + fw9*b9_4*b11_1 + fw9*b9_5*b11_1);
# relative last reads
var rlr9_11, integer;
subject to cst_rlr9_11:
	rlr9_11 == st11 + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 + ((0 + (x11_0 - 1) * 1 * 1 + (x11_1 - 1) * 1 * 1 * x11_0)) * 1 * b11_1;
# epilogues
var ep9_11, integer;
subject to cep9_11:
	ep9_11 ==  + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 - ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 + ((0 + (x11_0 - 1) * 1 * 1 + (x11_1 - 1) * 1 * 1 * x11_0)) * 1 * b11_1 - ((0 + (x11_0 - 1) * 1 * 1 + (x11_1 - 1) * 1 * 1 * x11_0)) * 1 * b11_1;
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
	fw11 == st11 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_1)) * 1 * b11_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_0)) * 1 * b11_1;
# node: 12 info
# start time
var st12, integer;
subject to cst_st12:
	st12 == max( + fw11*b11_0*b12_0 + lw11*b11_1*b12_0 + fw11*b11_0*b12_1 + lw11*b11_1*b12_1 + fw11*b11_0*b12_2 + lw11*b11_1*b12_2 + lw11*b11_0*b12_3 + fw11*b11_1*b12_3 + lw11*b11_0*b12_4 + fw11*b11_1*b12_4 + lw11*b11_0*b12_5 + fw11*b11_1*b12_5,  + fw13*b13_0*b12_0 + lw13*b13_1*b12_0 + lw13*b13_0*b12_1 + fw13*b13_1*b12_1 + fw13*b13_0*b12_2 + lw13*b13_1*b12_2 + lw13*b13_0*b12_3 + fw13*b13_1*b12_3 + fw13*b13_0*b12_4 + lw13*b13_1*b12_4 + lw13*b13_0*b12_5 + fw13*b13_1*b12_5);
# relative last reads
var rlr11_12, integer;
subject to cst_rlr11_12:
	rlr11_12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 + ((0 + 0 * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 + ((0 + 0 * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + 0 * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + (x12_0 - 1) * 1 * 1 + 0 * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
var rlr13_12, integer;
subject to cst_rlr13_12:
	rlr13_12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + 0 * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 + ((0 + (x12_1 - 1) * 1 * 1 + 0 * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + 0 * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + 0 * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
# epilogues
var ep11_12, integer;
subject to cep11_12:
	ep11_12 ==  + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 - ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 - ((0 + 0 * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 - ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 - ((0 + 0 * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 - ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + 0 * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5 - ((0 + (x12_0 - 1) * 1 * 1 + 0 * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
var ep13_12, integer;
subject to cep13_12:
	ep13_12 ==  + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 - ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 - ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + 0 * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 - ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 - ((0 + (x12_1 - 1) * 1 * 1 + 0 * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 - ((0 + 0 * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5 - ((0 + 0 * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
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
	fw12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 4 * b12_0 + ((0 + 0 * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + 0 * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + 0 * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_0)) * 4 * b12_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + 0 * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + 0 * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
# node: 14 info
# start time
var st14, integer;
subject to cst_st14:
	st14 == ( + fw12*b12_0*b14_0 + fw12*b12_1*b14_0 + lw12*b12_2*b14_0 + fw12*b12_3*b14_0 + lw12*b12_4*b14_0 + lw12*b12_5*b14_0 + lw12*b12_0*b14_1 + lw12*b12_1*b14_1 + fw12*b12_2*b14_1 + lw12*b12_3*b14_1 + fw12*b12_4*b14_1 + fw12*b12_5*b14_1);
# relative last reads
var rlr12_14, integer;
subject to cst_rlr12_14:
	rlr12_14 == st14 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1)) * 1 * b14_0 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0)) * 1 * b14_1;
# epilogues
var ep12_14, integer;
subject to cep12_14:
	ep12_14 ==  + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1)) * 1 * b14_0 - ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1)) * 1 * b14_0 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0)) * 1 * b14_1 - ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0)) * 1 * b14_1;
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
	fw14 == st14 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_1)) * 1 * b14_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_0)) * 1 * b14_1;
# node: 15 info
# start time
var st15, integer;
subject to cst_st15:
	st15 == max( + fw14*b14_0*b15_0 + lw14*b14_1*b15_0 + fw14*b14_0*b15_1 + lw14*b14_1*b15_1 + fw14*b14_0*b15_2 + lw14*b14_1*b15_2 + lw14*b14_0*b15_3 + fw14*b14_1*b15_3 + lw14*b14_0*b15_4 + fw14*b14_1*b15_4 + lw14*b14_0*b15_5 + fw14*b14_1*b15_5,  + fw16*b16_0*b15_0 + lw16*b16_1*b15_0 + lw16*b16_0*b15_1 + fw16*b16_1*b15_1 + fw16*b16_0*b15_2 + lw16*b16_1*b15_2 + lw16*b16_0*b15_3 + fw16*b16_1*b15_3 + fw16*b16_0*b15_4 + lw16*b16_1*b15_4 + lw16*b16_0*b15_5 + fw16*b16_1*b15_5);
# relative last reads
var rlr14_15, integer;
subject to cst_rlr14_15:
	rlr14_15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 + ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 + ((0 + 0 * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + 0 * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + (x15_0 - 1) * 1 * 1 + 0 * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
var rlr16_15, integer;
subject to cst_rlr16_15:
	rlr16_15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + 0 * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 + ((0 + (x15_1 - 1) * 1 * 1 + 0 * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + 0 * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
# epilogues
var ep14_15, integer;
subject to cep14_15:
	ep14_15 ==  + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 - ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 - ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 - ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 - ((0 + 0 * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 - ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + 0 * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5 - ((0 + (x15_0 - 1) * 1 * 1 + 0 * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
var ep16_15, integer;
subject to cep16_15:
	ep16_15 ==  + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 - ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 - ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + 0 * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 - ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 - ((0 + (x15_1 - 1) * 1 * 1 + 0 * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 - ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5 - ((0 + 0 * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
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
	fw15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 4 * b15_0 + ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + 0 * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_0)) * 4 * b15_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + 0 * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
# node: 17 info
# start time
var st17, integer;
subject to cst_st17:
	st17 == ( + fw15*b15_0*b17_0 + fw15*b15_1*b17_0 + lw15*b15_2*b17_0 + fw15*b15_3*b17_0 + lw15*b15_4*b17_0 + lw15*b15_5*b17_0 + lw15*b15_0*b17_1 + lw15*b15_1*b17_1 + fw15*b15_2*b17_1 + lw15*b15_3*b17_1 + fw15*b15_4*b17_1 + fw15*b15_5*b17_1);
# relative last reads
var rlr15_17, integer;
subject to cst_rlr15_17:
	rlr15_17 == st17 + ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1)) * 1 * b17_0 + ((0 + (x17_0 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_0)) * 1 * b17_1;
# epilogues
var ep15_17, integer;
subject to cep15_17:
	ep15_17 ==  + ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1)) * 1 * b17_0 - ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1)) * 1 * b17_0 + ((0 + (x17_0 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_0)) * 1 * b17_1 - ((0 + (x17_0 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_0)) * 1 * b17_1;
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
	fw17 == st17 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x17_1)) * 1 * b17_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x17_0)) * 1 * b17_1;
# node: 18 info
# start time
var st18, integer;
subject to cst_st18:
	st18 == ( + fw17*b17_0*b18_0 + lw17*b17_1*b18_0 + lw17*b17_0*b18_1 + fw17*b17_1*b18_1);
# relative last reads
var rlr17_18, integer;
subject to cst_rlr17_18:
	rlr17_18 == st18 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1)) * 1 * b18_0 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0)) * 1 * b18_1;
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
display b0_0;
display b0_1;
display b0_2;
display b0_3;
display b0_4;
display b0_5;
display b7_0;
display b7_1;
display b14_0;
display b14_1;
display b2_0;
display b2_1;
display b9_0;
display b9_1;
display b9_2;
display b9_3;
display b9_4;
display b9_5;
display b16_0;
display b16_1;
display b10000_0;
display b4_0;
display b4_1;
display b11_0;
display b11_1;
display b18_0;
display b18_1;
display b6_0;
display b6_1;
display b6_2;
display b6_3;
display b6_4;
display b6_5;
display b13_0;
display b13_1;
display b1_0;
display b1_1;
display b8_0;
display b8_1;
display b15_0;
display b15_1;
display b15_2;
display b15_3;
display b15_4;
display b15_5;
display b3_0;
display b3_1;
display b3_2;
display b3_3;
display b3_4;
display b3_5;
display b10_0;
display b10_1;
display b17_0;
display b17_1;
display b5_0;
display b5_1;
display b12_0;
display b12_1;
display b12_2;
display b12_3;
display b12_4;
display b12_5;
display latency;
