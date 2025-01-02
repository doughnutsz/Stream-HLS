# solver type
option solver gurobi;
option gurobi_options 'opttol=1e-8 lim:time=1200 tech:logfile=MultiHeadSelfAttention1_min.log';
param x0_0 := 64;
param x0_1 := 128;
param x0_2 := 128;
param x7_0 := 128;
param x7_1 := 128;
param x14_0 := 8;
param x14_1 := 64;
param x14_2 := 64;
param x21_0 := 64;
param x21_1 := 128;
param x2_0 := 64;
param x2_1 := 128;
param x2_2 := 128;
param x9_0 := 8;
param x9_1 := 16;
param x9_2 := 64;
param x16_0 := 8;
param x16_1 := 64;
param x16_2 := 64;
param x23_0 := 128;
param x23_1 := 128;
param x4_0 := 128;
param x4_1 := 128;
param x11_0 := 64;
param x11_1 := 128;
param x18_0 := 8;
param x18_1 := 64;
param x18_2 := 64;
param x25_0 := 64;
param x25_1 := 128;
param x6_0 := 8;
param x6_1 := 64;
param x6_2 := 16;
param x13_0 := 8;
param x13_1 := 64;
param x13_2 := 64;
param x13_3 := 16;
param x20_0 := 8;
param x20_1 := 64;
param x20_2 := 16;
param x1_0 := 64;
param x1_1 := 128;
param x8_0 := 64;
param x8_1 := 128;
param x15_0 := 8;
param x15_1 := 64;
param x15_2 := 64;
param x22_0 := 64;
param x22_1 := 128;
param x22_2 := 128;
param x3_0 := 64;
param x3_1 := 128;
param x3_2 := 128;
param x10_0 := 128;
param x10_1 := 128;
param x17_0 := 8;
param x17_1 := 64;
param x17_2 := 64;
param x24_0 := 64;
param x24_1 := 128;
param x5_0 := 64;
param x5_1 := 128;
param x12_0 := 8;
param x12_1 := 64;
param x12_2 := 16;
param x19_0 := 8;
param x19_1 := 64;
param x19_2 := 16;
param x19_3 := 64;
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
var b14_2, binary;
var b14_3, binary;
var b14_4, binary;
var b14_5, binary;
subject to c14:
	(b14_0 + b14_1 + b14_2 + b14_3 + b14_4 + b14_5) == 1;
var b21_0, binary;
var b21_1, binary;
subject to c21:
	(b21_0 + b21_1) == 1;
var b2_0, binary;
var b2_1, binary;
var b2_2, binary;
var b2_3, binary;
var b2_4, binary;
var b2_5, binary;
subject to c2:
	(b2_0 + b2_1 + b2_2 + b2_3 + b2_4 + b2_5) == 1;
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
var b16_2, binary;
var b16_3, binary;
var b16_4, binary;
var b16_5, binary;
subject to c16:
	(b16_0 + b16_1 + b16_2 + b16_3 + b16_4 + b16_5) == 1;
var b10000_0, binary;
subject to c10000:
	(b10000_0) == 1;
var b23_0, binary;
var b23_1, binary;
subject to c23:
	(b23_0 + b23_1) == 1;
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
var b18_2, binary;
var b18_3, binary;
var b18_4, binary;
var b18_5, binary;
subject to c18:
	(b18_0 + b18_1 + b18_2 + b18_3 + b18_4 + b18_5) == 1;
var b25_0, binary;
var b25_1, binary;
subject to c25:
	(b25_0 + b25_1) == 1;
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
var b13_2, binary;
var b13_3, binary;
var b13_4, binary;
var b13_5, binary;
var b13_6, binary;
var b13_7, binary;
var b13_8, binary;
var b13_9, binary;
var b13_10, binary;
var b13_11, binary;
var b13_12, binary;
var b13_13, binary;
var b13_14, binary;
var b13_15, binary;
var b13_16, binary;
var b13_17, binary;
var b13_18, binary;
var b13_19, binary;
var b13_20, binary;
var b13_21, binary;
var b13_22, binary;
var b13_23, binary;
subject to c13:
	(b13_0 + b13_1 + b13_2 + b13_3 + b13_4 + b13_5 + b13_6 + b13_7 + b13_8 + b13_9 + b13_10 + b13_11 + b13_12 + b13_13 + b13_14 + b13_15 + b13_16 + b13_17 + b13_18 + b13_19 + b13_20 + b13_21 + b13_22 + b13_23) == 1;
var b20_0, binary;
var b20_1, binary;
var b20_2, binary;
var b20_3, binary;
var b20_4, binary;
var b20_5, binary;
subject to c20:
	(b20_0 + b20_1 + b20_2 + b20_3 + b20_4 + b20_5) == 1;
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
var b22_0, binary;
var b22_1, binary;
var b22_2, binary;
var b22_3, binary;
var b22_4, binary;
var b22_5, binary;
subject to c22:
	(b22_0 + b22_1 + b22_2 + b22_3 + b22_4 + b22_5) == 1;
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
var b17_2, binary;
var b17_3, binary;
var b17_4, binary;
var b17_5, binary;
subject to c17:
	(b17_0 + b17_1 + b17_2 + b17_3 + b17_4 + b17_5) == 1;
var b24_0, binary;
var b24_1, binary;
subject to c24:
	(b24_0 + b24_1) == 1;
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
var b19_0, binary;
var b19_1, binary;
var b19_2, binary;
var b19_3, binary;
var b19_4, binary;
var b19_5, binary;
var b19_6, binary;
var b19_7, binary;
var b19_8, binary;
var b19_9, binary;
var b19_10, binary;
var b19_11, binary;
var b19_12, binary;
var b19_13, binary;
var b19_14, binary;
var b19_15, binary;
var b19_16, binary;
var b19_17, binary;
var b19_18, binary;
var b19_19, binary;
var b19_20, binary;
var b19_21, binary;
var b19_22, binary;
var b19_23, binary;
subject to c19:
	(b19_0 + b19_1 + b19_2 + b19_3 + b19_4 + b19_5 + b19_6 + b19_7 + b19_8 + b19_9 + b19_10 + b19_11 + b19_12 + b19_13 + b19_14 + b19_15 + b19_16 + b19_17 + b19_18 + b19_19 + b19_20 + b19_21 + b19_22 + b19_23) == 1;
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
	ep10000_1 ==  + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + (x1_1 - 1) * 1 * 1 + (x1_0 - 1) * 1 * 1 * x1_1)) * 1 * b1_0 - (0) * 1 * b1_0 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1 + ((0 + (x1_0 - 1) * 1 * 1 + (x1_1 - 1) * 1 * 1 * x1_0)) * 1 * b1_1 - (0) * 1 * b1_1;
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
	fw1 == st1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_0)) * 1 * b1_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_0)) * 1 * b1_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_1)) * 1 * b1_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x1_0)) * 1 * b1_1;
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
# node: 3 info
# start time
var st3, integer;
subject to cst_st3:
	st3 == max( + fw1*b1_0*b3_0 + lw1*b1_1*b3_0 + fw1*b1_0*b3_1 + lw1*b1_1*b3_1 + fw1*b1_0*b3_2 + lw1*b1_1*b3_2 + lw1*b1_0*b3_3 + fw1*b1_1*b3_3 + lw1*b1_0*b3_4 + fw1*b1_1*b3_4 + lw1*b1_0*b3_5 + fw1*b1_1*b3_5,  + lw4*b4_0*b3_0 + fw4*b4_1*b3_0 + fw4*b4_0*b3_1 + lw4*b4_1*b3_1 + lw4*b4_0*b3_2 + fw4*b4_1*b3_2 + fw4*b4_0*b3_3 + lw4*b4_1*b3_3 + lw4*b4_0*b3_4 + fw4*b4_1*b3_4 + fw4*b4_0*b3_5 + lw4*b4_1*b3_5);
# relative last reads
var rlr1_3, integer;
subject to cst_rlr1_3:
	rlr1_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + 0 * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
var rlr4_3, integer;
subject to cst_rlr4_3:
	rlr4_3 == st3 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + 0 * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + 0 * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
# epilogues
var ep1_3, integer;
subject to cep1_3:
	ep1_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 - ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 - ((0 + 0 * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 - ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + 0 * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5 - ((0 + (x3_0 - 1) * 1 * 1 + 0 * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
var ep4_3, integer;
subject to cep4_3:
	ep4_3 ==  + ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + (x3_0 - 1) * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 - ((0 + (x3_2 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_2 + 0 * 1 * 1 * x3_2 * x3_1)) * 4 * b3_0 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + (x3_0 - 1) * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 - ((0 + (x3_1 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_1 + 0 * 1 * 1 * x3_1 * x3_2)) * 1 * b3_1 + ((0 + (x3_2 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 - ((0 + (x3_2 - 1) * 1 * 1 + 0 * 1 * 1 * x3_2 + (x3_1 - 1) * 1 * 1 * x3_2 * x3_0)) * 4 * b3_2 + ((0 + (x3_1 - 1) * 1 * 1 + (x3_0 - 1) * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 - ((0 + (x3_1 - 1) * 1 * 1 + 0 * 1 * 1 * x3_1 + (x3_2 - 1) * 1 * 1 * x3_1 * x3_0)) * 1 * b3_3 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 - ((0 + 0 * 1 * 1 + (x3_2 - 1) * 1 * 1 * x3_0 + (x3_1 - 1) * 1 * 1 * x3_0 * x3_2)) * 1 * b3_4 + ((0 + (x3_0 - 1) * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5 - ((0 + 0 * 1 * 1 + (x3_1 - 1) * 1 * 1 * x3_0 + (x3_2 - 1) * 1 * 1 * x3_0 * x3_1)) * 1 * b3_5;
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
	st6 == ( + lw5*b5_0*b6_0 + lw5*b5_1*b6_0 + lw5*b5_0*b6_1 + lw5*b5_1*b6_1 + lw5*b5_0*b6_2 + lw5*b5_1*b6_2 + lw5*b5_0*b6_3 + lw5*b5_1*b6_3 + lw5*b5_0*b6_4 + lw5*b5_1*b6_4 + lw5*b5_0*b6_5 + lw5*b5_1*b6_5);
# relative last reads
var rlr5_6, integer;
subject to cst_rlr5_6:
	rlr5_6 == st6 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 1 * b6_2 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
# epilogues
var ep5_6, integer;
subject to cep5_6:
	ep5_6 ==  + ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_2 + (x6_0 - 1) * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 - ((0 + (x6_1 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_1 + (x6_0 - 1) * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 1 * b6_2 - ((0 + (x6_2 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_2 + (x6_1 - 1) * 1 * 1 * x6_2 * x6_0)) * 1 * b6_2 + ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 - ((0 + (x6_1 - 1) * 1 * 1 + (x6_0 - 1) * 1 * 1 * x6_1 + (x6_2 - 1) * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 - ((0 + (x6_0 - 1) * 1 * 1 + (x6_2 - 1) * 1 * 1 * x6_0 + (x6_1 - 1) * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + (x6_0 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5 - ((0 + (x6_0 - 1) * 1 * 1 + (x6_1 - 1) * 1 * 1 * x6_0 + (x6_2 - 1) * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
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
	fw6 == st6 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_1)) * 1 * b6_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_1 + 0 * 1 * 1 * x6_1 * x6_2)) * 1 * b6_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_2 + 0 * 1 * 1 * x6_2 * x6_0)) * 1 * b6_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_1 + 0 * 1 * 1 * x6_1 * x6_0)) * 1 * b6_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_2)) * 1 * b6_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x6_0 + 0 * 1 * 1 * x6_0 * x6_1)) * 1 * b6_5;
# node: 23 info
# start time
var st23, integer;
subject to cst_st23:
	st23 == ( + fw10000*b10000_0*b23_0 + fw10000*b10000_0*b23_1);
# relative last reads
var rlr10000_23, integer;
subject to cst_rlr10000_23:
	rlr10000_23 == st23 + (0) * 1 * b23_0 + (0) * 1 * b23_1;
# epilogues
var ep10000_23, integer;
subject to cep10000_23:
	ep10000_23 ==  + ((0 + (x23_1 - 1) * 1 * 1 + (x23_0 - 1) * 1 * 1 * x23_1)) * 1 * b23_0 - (0) * 1 * b23_0 + ((0 + (x23_0 - 1) * 1 * 1 + (x23_1 - 1) * 1 * 1 * x23_0)) * 1 * b23_1 - (0) * 1 * b23_1;
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
	fw23 == st23 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x23_1)) * 1 * b23_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x23_0)) * 1 * b23_1;
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
# node: 2 info
# start time
var st2, integer;
subject to cst_st2:
	st2 == max( + fw1*b1_0*b2_0 + lw1*b1_1*b2_0 + fw1*b1_0*b2_1 + lw1*b1_1*b2_1 + fw1*b1_0*b2_2 + lw1*b1_1*b2_2 + lw1*b1_0*b2_3 + fw1*b1_1*b2_3 + lw1*b1_0*b2_4 + fw1*b1_1*b2_4 + lw1*b1_0*b2_5 + fw1*b1_1*b2_5,  + lw7*b7_0*b2_0 + fw7*b7_1*b2_0 + fw7*b7_0*b2_1 + lw7*b7_1*b2_1 + lw7*b7_0*b2_2 + fw7*b7_1*b2_2 + fw7*b7_0*b2_3 + lw7*b7_1*b2_3 + lw7*b7_0*b2_4 + fw7*b7_1*b2_4 + fw7*b7_0*b2_5 + lw7*b7_1*b2_5);
# relative last reads
var rlr1_2, integer;
subject to cst_rlr1_2:
	rlr1_2 == st2 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + 0 * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + 0 * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + (x2_0 - 1) * 1 * 1 + 0 * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
var rlr7_2, integer;
subject to cst_rlr7_2:
	rlr7_2 == st2 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + 0 * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + (x2_1 - 1) * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + (x2_1 - 1) * 1 * 1 + 0 * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + (x2_1 - 1) * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + 0 * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
# epilogues
var ep1_2, integer;
subject to cep1_2:
	ep1_2 ==  + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 - ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 - ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + (x2_1 - 1) * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 - ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 - ((0 + 0 * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + (x2_1 - 1) * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 - ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + 0 * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5 - ((0 + (x2_0 - 1) * 1 * 1 + 0 * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
var ep7_2, integer;
subject to cep7_2:
	ep7_2 ==  + ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + (x2_0 - 1) * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 - ((0 + (x2_2 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + (x2_0 - 1) * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 - ((0 + (x2_1 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + 0 * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_2 + (x2_1 - 1) * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 - ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + (x2_1 - 1) * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + (x2_1 - 1) * 1 * 1 + (x2_0 - 1) * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 - ((0 + (x2_1 - 1) * 1 * 1 + 0 * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + (x2_1 - 1) * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 - ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + (x2_1 - 1) * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + (x2_0 - 1) * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5 - ((0 + 0 * 1 * 1 + (x2_1 - 1) * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
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
	fw2 == st2 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_1)) * 4 * b2_0 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_1 + 0 * 1 * 1 * x2_1 * x2_2)) * 1 * b2_1 + ((0 + (x2_2 - 1) * 1 * 1 + 0 * 1 * 1 * x2_2 + 0 * 1 * 1 * x2_2 * x2_0)) * 4 * b2_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_1 + (x2_2 - 1) * 1 * 1 * x2_1 * x2_0)) * 1 * b2_3 + ((0 + 0 * 1 * 1 + (x2_2 - 1) * 1 * 1 * x2_0 + 0 * 1 * 1 * x2_0 * x2_2)) * 1 * b2_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x2_0 + (x2_2 - 1) * 1 * 1 * x2_0 * x2_1)) * 1 * b2_5;
# node: 8 info
# start time
var st8, integer;
subject to cst_st8:
	st8 == ( + fw2*b2_0*b8_0 + fw2*b2_1*b8_0 + lw2*b2_2*b8_0 + fw2*b2_3*b8_0 + lw2*b2_4*b8_0 + lw2*b2_5*b8_0 + lw2*b2_0*b8_1 + lw2*b2_1*b8_1 + fw2*b2_2*b8_1 + lw2*b2_3*b8_1 + fw2*b2_4*b8_1 + fw2*b2_5*b8_1);
# relative last reads
var rlr2_8, integer;
subject to cst_rlr2_8:
	rlr2_8 == st8 + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 + ((0 + (x8_0 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_0)) * 1 * b8_1;
# epilogues
var ep2_8, integer;
subject to cep2_8:
	ep2_8 ==  + ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 - ((0 + (x8_1 - 1) * 1 * 1 + (x8_0 - 1) * 1 * 1 * x8_1)) * 1 * b8_0 + ((0 + (x8_0 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_0)) * 1 * b8_1 - ((0 + (x8_0 - 1) * 1 * 1 + (x8_1 - 1) * 1 * 1 * x8_0)) * 1 * b8_1;
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
	fw8 == st8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_1)) * 1 * b8_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x8_0)) * 1 * b8_1;
# node: 9 info
# start time
var st9, integer;
subject to cst_st9:
	st9 == ( + lw8*b8_0*b9_0 + lw8*b8_1*b9_0 + lw8*b8_0*b9_1 + lw8*b8_1*b9_1 + lw8*b8_0*b9_2 + lw8*b8_1*b9_2 + lw8*b8_0*b9_3 + lw8*b8_1*b9_3 + lw8*b8_0*b9_4 + lw8*b8_1*b9_4 + lw8*b8_0*b9_5 + lw8*b8_1*b9_5);
# relative last reads
var rlr8_9, integer;
subject to cst_rlr8_9:
	rlr8_9 == st9 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 1 * b9_2 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
# epilogues
var ep8_9, integer;
subject to cep8_9:
	ep8_9 ==  + ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0 - ((0 + (x9_2 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_2 + (x9_0 - 1) * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 - ((0 + (x9_1 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_1 + (x9_0 - 1) * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 1 * b9_2 - ((0 + (x9_2 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_2 + (x9_1 - 1) * 1 * 1 * x9_2 * x9_0)) * 1 * b9_2 + ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 - ((0 + (x9_1 - 1) * 1 * 1 + (x9_0 - 1) * 1 * 1 * x9_1 + (x9_2 - 1) * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 - ((0 + (x9_0 - 1) * 1 * 1 + (x9_2 - 1) * 1 * 1 * x9_0 + (x9_1 - 1) * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + (x9_0 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5 - ((0 + (x9_0 - 1) * 1 * 1 + (x9_1 - 1) * 1 * 1 * x9_0 + (x9_2 - 1) * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
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
	fw9 == st9 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_1)) * 1 * b9_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_1 + 0 * 1 * 1 * x9_1 * x9_2)) * 1 * b9_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_2 + 0 * 1 * 1 * x9_2 * x9_0)) * 1 * b9_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_1 + 0 * 1 * 1 * x9_1 * x9_0)) * 1 * b9_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_0 + 0 * 1 * 1 * x9_0 * x9_2)) * 1 * b9_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x9_0 + 0 * 1 * 1 * x9_0 * x9_1)) * 1 * b9_5;
# node: 13 info
# start time
var st13, integer;
subject to cst_st13:
	st13 == max( + fw6*b6_0*b13_0 + lw6*b6_1*b13_0 + lw6*b6_2*b13_0 + lw6*b6_3*b13_0 + lw6*b6_4*b13_0 + lw6*b6_5*b13_0 + fw6*b6_0*b13_1 + lw6*b6_1*b13_1 + lw6*b6_2*b13_1 + lw6*b6_3*b13_1 + lw6*b6_4*b13_1 + lw6*b6_5*b13_1 + fw6*b6_0*b13_2 + lw6*b6_1*b13_2 + lw6*b6_2*b13_2 + lw6*b6_3*b13_2 + lw6*b6_4*b13_2 + lw6*b6_5*b13_2 + lw6*b6_0*b13_3 + fw6*b6_1*b13_3 + lw6*b6_2*b13_3 + lw6*b6_3*b13_3 + lw6*b6_4*b13_3 + lw6*b6_5*b13_3 + lw6*b6_0*b13_4 + fw6*b6_1*b13_4 + lw6*b6_2*b13_4 + lw6*b6_3*b13_4 + lw6*b6_4*b13_4 + lw6*b6_5*b13_4 + lw6*b6_0*b13_5 + fw6*b6_1*b13_5 + lw6*b6_2*b13_5 + lw6*b6_3*b13_5 + lw6*b6_4*b13_5 + lw6*b6_5*b13_5 + lw6*b6_0*b13_6 + lw6*b6_1*b13_6 + fw6*b6_2*b13_6 + lw6*b6_3*b13_6 + lw6*b6_4*b13_6 + lw6*b6_5*b13_6 + lw6*b6_0*b13_7 + lw6*b6_1*b13_7 + fw6*b6_2*b13_7 + lw6*b6_3*b13_7 + lw6*b6_4*b13_7 + lw6*b6_5*b13_7 + fw6*b6_0*b13_8 + lw6*b6_1*b13_8 + lw6*b6_2*b13_8 + lw6*b6_3*b13_8 + lw6*b6_4*b13_8 + lw6*b6_5*b13_8 + lw6*b6_0*b13_9 + lw6*b6_1*b13_9 + lw6*b6_2*b13_9 + fw6*b6_3*b13_9 + lw6*b6_4*b13_9 + lw6*b6_5*b13_9 + lw6*b6_0*b13_10 + fw6*b6_1*b13_10 + lw6*b6_2*b13_10 + lw6*b6_3*b13_10 + lw6*b6_4*b13_10 + lw6*b6_5*b13_10 + lw6*b6_0*b13_11 + lw6*b6_1*b13_11 + lw6*b6_2*b13_11 + fw6*b6_3*b13_11 + lw6*b6_4*b13_11 + lw6*b6_5*b13_11 + lw6*b6_0*b13_12 + lw6*b6_1*b13_12 + fw6*b6_2*b13_12 + lw6*b6_3*b13_12 + lw6*b6_4*b13_12 + lw6*b6_5*b13_12 + lw6*b6_0*b13_13 + lw6*b6_1*b13_13 + lw6*b6_2*b13_13 + lw6*b6_3*b13_13 + fw6*b6_4*b13_13 + lw6*b6_5*b13_13 + lw6*b6_0*b13_14 + lw6*b6_1*b13_14 + fw6*b6_2*b13_14 + lw6*b6_3*b13_14 + lw6*b6_4*b13_14 + lw6*b6_5*b13_14 + lw6*b6_0*b13_15 + lw6*b6_1*b13_15 + lw6*b6_2*b13_15 + lw6*b6_3*b13_15 + lw6*b6_4*b13_15 + fw6*b6_5*b13_15 + lw6*b6_0*b13_16 + lw6*b6_1*b13_16 + lw6*b6_2*b13_16 + fw6*b6_3*b13_16 + lw6*b6_4*b13_16 + lw6*b6_5*b13_16 + lw6*b6_0*b13_17 + lw6*b6_1*b13_17 + lw6*b6_2*b13_17 + fw6*b6_3*b13_17 + lw6*b6_4*b13_17 + lw6*b6_5*b13_17 + lw6*b6_0*b13_18 + lw6*b6_1*b13_18 + lw6*b6_2*b13_18 + lw6*b6_3*b13_18 + fw6*b6_4*b13_18 + lw6*b6_5*b13_18 + lw6*b6_0*b13_19 + lw6*b6_1*b13_19 + lw6*b6_2*b13_19 + lw6*b6_3*b13_19 + fw6*b6_4*b13_19 + lw6*b6_5*b13_19 + lw6*b6_0*b13_20 + lw6*b6_1*b13_20 + lw6*b6_2*b13_20 + lw6*b6_3*b13_20 + fw6*b6_4*b13_20 + lw6*b6_5*b13_20 + lw6*b6_0*b13_21 + lw6*b6_1*b13_21 + lw6*b6_2*b13_21 + lw6*b6_3*b13_21 + lw6*b6_4*b13_21 + fw6*b6_5*b13_21 + lw6*b6_0*b13_22 + lw6*b6_1*b13_22 + lw6*b6_2*b13_22 + lw6*b6_3*b13_22 + lw6*b6_4*b13_22 + fw6*b6_5*b13_22 + lw6*b6_0*b13_23 + lw6*b6_1*b13_23 + lw6*b6_2*b13_23 + lw6*b6_3*b13_23 + lw6*b6_4*b13_23 + fw6*b6_5*b13_23,  + lw9*b9_0*b13_0 + fw9*b9_1*b13_0 + lw9*b9_2*b13_0 + lw9*b9_3*b13_0 + lw9*b9_4*b13_0 + lw9*b9_5*b13_0 + fw9*b9_0*b13_1 + lw9*b9_1*b13_1 + lw9*b9_2*b13_1 + lw9*b9_3*b13_1 + lw9*b9_4*b13_1 + lw9*b9_5*b13_1 + lw9*b9_0*b13_2 + fw9*b9_1*b13_2 + lw9*b9_2*b13_2 + lw9*b9_3*b13_2 + lw9*b9_4*b13_2 + lw9*b9_5*b13_2 + fw9*b9_0*b13_3 + lw9*b9_1*b13_3 + lw9*b9_2*b13_3 + lw9*b9_3*b13_3 + lw9*b9_4*b13_3 + lw9*b9_5*b13_3 + lw9*b9_0*b13_4 + fw9*b9_1*b13_4 + lw9*b9_2*b13_4 + lw9*b9_3*b13_4 + lw9*b9_4*b13_4 + lw9*b9_5*b13_4 + fw9*b9_0*b13_5 + lw9*b9_1*b13_5 + lw9*b9_2*b13_5 + lw9*b9_3*b13_5 + lw9*b9_4*b13_5 + lw9*b9_5*b13_5 + lw9*b9_0*b13_6 + fw9*b9_1*b13_6 + lw9*b9_2*b13_6 + lw9*b9_3*b13_6 + lw9*b9_4*b13_6 + lw9*b9_5*b13_6 + fw9*b9_0*b13_7 + lw9*b9_1*b13_7 + lw9*b9_2*b13_7 + lw9*b9_3*b13_7 + lw9*b9_4*b13_7 + lw9*b9_5*b13_7 + lw9*b9_0*b13_8 + lw9*b9_1*b13_8 + lw9*b9_2*b13_8 + fw9*b9_3*b13_8 + lw9*b9_4*b13_8 + lw9*b9_5*b13_8 + lw9*b9_0*b13_9 + lw9*b9_1*b13_9 + fw9*b9_2*b13_9 + lw9*b9_3*b13_9 + lw9*b9_4*b13_9 + lw9*b9_5*b13_9 + lw9*b9_0*b13_10 + lw9*b9_1*b13_10 + lw9*b9_2*b13_10 + fw9*b9_3*b13_10 + lw9*b9_4*b13_10 + lw9*b9_5*b13_10 + lw9*b9_0*b13_11 + lw9*b9_1*b13_11 + fw9*b9_2*b13_11 + lw9*b9_3*b13_11 + lw9*b9_4*b13_11 + lw9*b9_5*b13_11 + lw9*b9_0*b13_12 + lw9*b9_1*b13_12 + lw9*b9_2*b13_12 + fw9*b9_3*b13_12 + lw9*b9_4*b13_12 + lw9*b9_5*b13_12 + lw9*b9_0*b13_13 + lw9*b9_1*b13_13 + fw9*b9_2*b13_13 + lw9*b9_3*b13_13 + lw9*b9_4*b13_13 + lw9*b9_5*b13_13 + lw9*b9_0*b13_14 + lw9*b9_1*b13_14 + lw9*b9_2*b13_14 + fw9*b9_3*b13_14 + lw9*b9_4*b13_14 + lw9*b9_5*b13_14 + lw9*b9_0*b13_15 + lw9*b9_1*b13_15 + fw9*b9_2*b13_15 + lw9*b9_3*b13_15 + lw9*b9_4*b13_15 + lw9*b9_5*b13_15 + lw9*b9_0*b13_16 + lw9*b9_1*b13_16 + lw9*b9_2*b13_16 + lw9*b9_3*b13_16 + lw9*b9_4*b13_16 + fw9*b9_5*b13_16 + lw9*b9_0*b13_17 + lw9*b9_1*b13_17 + lw9*b9_2*b13_17 + lw9*b9_3*b13_17 + fw9*b9_4*b13_17 + lw9*b9_5*b13_17 + lw9*b9_0*b13_18 + lw9*b9_1*b13_18 + lw9*b9_2*b13_18 + lw9*b9_3*b13_18 + lw9*b9_4*b13_18 + fw9*b9_5*b13_18 + lw9*b9_0*b13_19 + lw9*b9_1*b13_19 + lw9*b9_2*b13_19 + lw9*b9_3*b13_19 + fw9*b9_4*b13_19 + lw9*b9_5*b13_19 + lw9*b9_0*b13_20 + lw9*b9_1*b13_20 + lw9*b9_2*b13_20 + lw9*b9_3*b13_20 + lw9*b9_4*b13_20 + fw9*b9_5*b13_20 + lw9*b9_0*b13_21 + lw9*b9_1*b13_21 + lw9*b9_2*b13_21 + lw9*b9_3*b13_21 + fw9*b9_4*b13_21 + lw9*b9_5*b13_21 + lw9*b9_0*b13_22 + lw9*b9_1*b13_22 + lw9*b9_2*b13_22 + lw9*b9_3*b13_22 + lw9*b9_4*b13_22 + fw9*b9_5*b13_22 + lw9*b9_0*b13_23 + lw9*b9_1*b13_23 + lw9*b9_2*b13_23 + lw9*b9_3*b13_23 + fw9*b9_4*b13_23 + lw9*b9_5*b13_23);
# relative last reads
var rlr6_13, integer;
subject to cst_rlr6_13:
	rlr6_13 == st13 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 + ((0 + 0 * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 + ((0 + (x13_1 - 1) * 1 * 1 + 0 * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 + 0 * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 + ((0 + 0 * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 + 0 * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 + ((0 + (x13_1 - 1) * 1 * 1 + 0 * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 + ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 + 0 * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 + ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + 0 * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 + ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 + 0 * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 + ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + 0 * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23;
var rlr9_13, integer;
subject to cst_rlr9_13:
	rlr9_13 == st13 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 + ((0 + (x13_2 - 1) * 1 * 1 + 0 * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 + ((0 + 0 * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 + 0 * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 + 0 * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 + ((0 + (x13_2 - 1) * 1 * 1 + 0 * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 + ((0 + 0 * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 + 0 * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + 0 * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 + ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 + ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 + 0 * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + 0 * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 + ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 + ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23;
# epilogues
var ep6_13, integer;
subject to cep6_13:
	ep6_13 ==  + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 - ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 - ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 - ((0 + 0 * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 - ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 - ((0 + (x13_1 - 1) * 1 * 1 + 0 * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 - ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 - ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 + 0 * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 - ((0 + 0 * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 - ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 + 0 * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 - ((0 + (x13_1 - 1) * 1 * 1 + 0 * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 - ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 + 0 * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 - ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 - ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + 0 * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 - ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 - ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 + 0 * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 - ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + 0 * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23;
var ep9_13, integer;
subject to cep9_13:
	ep9_13 ==  + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 - ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 - ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 - ((0 + (x13_2 - 1) * 1 * 1 + 0 * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 - ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 - ((0 + 0 * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_2 + 0 * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 - ((0 + (x13_2 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_3 + 0 * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 - ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + (x13_0 - 1) * 1 * 1 * x13_3 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 - ((0 + (x13_2 - 1) * 1 * 1 + 0 * 1 * 1 * x13_2 + (x13_0 - 1) * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 - ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 - ((0 + 0 * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_1 + (x13_0 - 1) * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 + 0 * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 - ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + 0 * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 + ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_3 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 - ((0 + (x13_3 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 + ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 - ((0 + (x13_2 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 - ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 + ((0 + (x13_1 - 1) * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 - ((0 + 0 * 1 * 1 + (x13_0 - 1) * 1 * 1 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 + 0 * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + 0 * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_3 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + (x13_1 - 1) * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 - ((0 + (x13_0 - 1) * 1 * 1 + (x13_2 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 - ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 + ((0 + (x13_0 - 1) * 1 * 1 + (x13_1 - 1) * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23 - ((0 + (x13_0 - 1) * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_2 - 1) * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23;
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
	fw13 == st13 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_2 + 0 * 1 * 1 * x13_3 * x13_2 * x13_1)) * 4 * b13_0 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_3 + 0 * 1 * 1 * x13_2 * x13_3 * x13_1)) * 1 * b13_1 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_1 + 0 * 1 * 1 * x13_3 * x13_1 * x13_2)) * 4 * b13_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 + 0 * 1 * 1 * x13_2 * x13_1 * x13_3)) * 1 * b13_3 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_3 + 0 * 1 * 1 * x13_1 * x13_3 * x13_2)) * 1 * b13_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 + 0 * 1 * 1 * x13_1 * x13_2 * x13_3)) * 1 * b13_5 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_2 + 0 * 1 * 1 * x13_3 * x13_2 * x13_0)) * 4 * b13_6 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_3 + 0 * 1 * 1 * x13_2 * x13_3 * x13_0)) * 1 * b13_7 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_1 + 0 * 1 * 1 * x13_3 * x13_1 * x13_0)) * 4 * b13_8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_1 * x13_0)) * 1 * b13_9 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_3 + 0 * 1 * 1 * x13_1 * x13_3 * x13_0)) * 1 * b13_10 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_2 * x13_0)) * 1 * b13_11 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_0 + 0 * 1 * 1 * x13_3 * x13_0 * x13_2)) * 4 * b13_12 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 + 0 * 1 * 1 * x13_2 * x13_0 * x13_3)) * 1 * b13_13 + ((0 + (x13_3 - 1) * 1 * 1 + 0 * 1 * 1 * x13_3 + 0 * 1 * 1 * x13_3 * x13_0 + 0 * 1 * 1 * x13_3 * x13_0 * x13_1)) * 4 * b13_14 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_2 + 0 * 1 * 1 * x13_2 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_2 * x13_0 * x13_1)) * 1 * b13_15 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 + 0 * 1 * 1 * x13_1 * x13_0 * x13_3)) * 1 * b13_16 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_1 + 0 * 1 * 1 * x13_1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_1 * x13_0 * x13_2)) * 1 * b13_17 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_3 + 0 * 1 * 1 * x13_0 * x13_3 * x13_2)) * 1 * b13_18 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 + 0 * 1 * 1 * x13_0 * x13_2 * x13_3)) * 1 * b13_19 + ((0 + 0 * 1 * 1 + (x13_3 - 1) * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_3 + 0 * 1 * 1 * x13_0 * x13_3 * x13_1)) * 1 * b13_20 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_2 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_2 * x13_1)) * 1 * b13_21 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_0 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 + 0 * 1 * 1 * x13_0 * x13_1 * x13_3)) * 1 * b13_22 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x13_0 + 0 * 1 * 1 * x13_0 * x13_1 + (x13_3 - 1) * 1 * 1 * x13_0 * x13_1 * x13_2)) * 1 * b13_23;
# node: 14 info
# start time
var st14, integer;
subject to cst_st14:
	st14 == ( + fw13*b13_0*b14_0 + fw13*b13_1*b14_0 + lw13*b13_2*b14_0 + fw13*b13_3*b14_0 + lw13*b13_4*b14_0 + lw13*b13_5*b14_0 + lw13*b13_6*b14_0 + lw13*b13_7*b14_0 + lw13*b13_8*b14_0 + fw13*b13_9*b14_0 + lw13*b13_10*b14_0 + lw13*b13_11*b14_0 + lw13*b13_12*b14_0 + lw13*b13_13*b14_0 + lw13*b13_14*b14_0 + lw13*b13_15*b14_0 + lw13*b13_16*b14_0 + lw13*b13_17*b14_0 + lw13*b13_18*b14_0 + lw13*b13_19*b14_0 + lw13*b13_20*b14_0 + lw13*b13_21*b14_0 + lw13*b13_22*b14_0 + lw13*b13_23*b14_0 + lw13*b13_0*b14_1 + lw13*b13_1*b14_1 + fw13*b13_2*b14_1 + lw13*b13_3*b14_1 + fw13*b13_4*b14_1 + fw13*b13_5*b14_1 + lw13*b13_6*b14_1 + lw13*b13_7*b14_1 + lw13*b13_8*b14_1 + lw13*b13_9*b14_1 + lw13*b13_10*b14_1 + fw13*b13_11*b14_1 + lw13*b13_12*b14_1 + lw13*b13_13*b14_1 + lw13*b13_14*b14_1 + lw13*b13_15*b14_1 + lw13*b13_16*b14_1 + lw13*b13_17*b14_1 + lw13*b13_18*b14_1 + lw13*b13_19*b14_1 + lw13*b13_20*b14_1 + lw13*b13_21*b14_1 + lw13*b13_22*b14_1 + lw13*b13_23*b14_1 + lw13*b13_0*b14_2 + lw13*b13_1*b14_2 + lw13*b13_2*b14_2 + lw13*b13_3*b14_2 + lw13*b13_4*b14_2 + lw13*b13_5*b14_2 + fw13*b13_6*b14_2 + fw13*b13_7*b14_2 + lw13*b13_8*b14_2 + lw13*b13_9*b14_2 + lw13*b13_10*b14_2 + lw13*b13_11*b14_2 + lw13*b13_12*b14_2 + fw13*b13_13*b14_2 + lw13*b13_14*b14_2 + fw13*b13_15*b14_2 + lw13*b13_16*b14_2 + lw13*b13_17*b14_2 + lw13*b13_18*b14_2 + lw13*b13_19*b14_2 + lw13*b13_20*b14_2 + lw13*b13_21*b14_2 + lw13*b13_22*b14_2 + lw13*b13_23*b14_2 + lw13*b13_0*b14_3 + lw13*b13_1*b14_3 + lw13*b13_2*b14_3 + lw13*b13_3*b14_3 + lw13*b13_4*b14_3 + lw13*b13_5*b14_3 + lw13*b13_6*b14_3 + lw13*b13_7*b14_3 + fw13*b13_8*b14_3 + lw13*b13_9*b14_3 + fw13*b13_10*b14_3 + lw13*b13_11*b14_3 + lw13*b13_12*b14_3 + lw13*b13_13*b14_3 + lw13*b13_14*b14_3 + lw13*b13_15*b14_3 + fw13*b13_16*b14_3 + fw13*b13_17*b14_3 + lw13*b13_18*b14_3 + lw13*b13_19*b14_3 + lw13*b13_20*b14_3 + lw13*b13_21*b14_3 + lw13*b13_22*b14_3 + lw13*b13_23*b14_3 + lw13*b13_0*b14_4 + lw13*b13_1*b14_4 + lw13*b13_2*b14_4 + lw13*b13_3*b14_4 + lw13*b13_4*b14_4 + lw13*b13_5*b14_4 + lw13*b13_6*b14_4 + lw13*b13_7*b14_4 + lw13*b13_8*b14_4 + lw13*b13_9*b14_4 + lw13*b13_10*b14_4 + lw13*b13_11*b14_4 + fw13*b13_12*b14_4 + lw13*b13_13*b14_4 + lw13*b13_14*b14_4 + lw13*b13_15*b14_4 + lw13*b13_16*b14_4 + lw13*b13_17*b14_4 + fw13*b13_18*b14_4 + fw13*b13_19*b14_4 + lw13*b13_20*b14_4 + fw13*b13_21*b14_4 + lw13*b13_22*b14_4 + lw13*b13_23*b14_4 + lw13*b13_0*b14_5 + lw13*b13_1*b14_5 + lw13*b13_2*b14_5 + lw13*b13_3*b14_5 + lw13*b13_4*b14_5 + lw13*b13_5*b14_5 + lw13*b13_6*b14_5 + lw13*b13_7*b14_5 + lw13*b13_8*b14_5 + lw13*b13_9*b14_5 + lw13*b13_10*b14_5 + lw13*b13_11*b14_5 + lw13*b13_12*b14_5 + lw13*b13_13*b14_5 + fw13*b13_14*b14_5 + lw13*b13_15*b14_5 + lw13*b13_16*b14_5 + lw13*b13_17*b14_5 + lw13*b13_18*b14_5 + lw13*b13_19*b14_5 + fw13*b13_20*b14_5 + lw13*b13_21*b14_5 + fw13*b13_22*b14_5 + fw13*b13_23*b14_5);
# relative last reads
var rlr13_14, integer;
subject to cst_rlr13_14:
	rlr13_14 == st14 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_1 + (x14_0 - 1) * 1 * 1 * x14_1 * x14_2)) * 1 * b14_1 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_2 + (x14_1 - 1) * 1 * 1 * x14_2 * x14_0)) * 1 * b14_2 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1 + (x14_2 - 1) * 1 * 1 * x14_1 * x14_0)) * 1 * b14_3 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_0 + (x14_1 - 1) * 1 * 1 * x14_0 * x14_2)) * 1 * b14_4 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0 + (x14_2 - 1) * 1 * 1 * x14_0 * x14_1)) * 1 * b14_5;
# epilogues
var ep13_14, integer;
subject to cep13_14:
	ep13_14 ==  + ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 - ((0 + (x14_2 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_2 + (x14_0 - 1) * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_1 + (x14_0 - 1) * 1 * 1 * x14_1 * x14_2)) * 1 * b14_1 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_1 + (x14_0 - 1) * 1 * 1 * x14_1 * x14_2)) * 1 * b14_1 - ((0 + (x14_1 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_1 + (x14_0 - 1) * 1 * 1 * x14_1 * x14_2)) * 1 * b14_1 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_2 + (x14_1 - 1) * 1 * 1 * x14_2 * x14_0)) * 1 * b14_2 + ((0 + (x14_2 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_2 + (x14_1 - 1) * 1 * 1 * x14_2 * x14_0)) * 1 * b14_2 - ((0 + (x14_2 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_2 + (x14_1 - 1) * 1 * 1 * x14_2 * x14_0)) * 1 * b14_2 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1 + (x14_2 - 1) * 1 * 1 * x14_1 * x14_0)) * 1 * b14_3 + ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1 + (x14_2 - 1) * 1 * 1 * x14_1 * x14_0)) * 1 * b14_3 - ((0 + (x14_1 - 1) * 1 * 1 + (x14_0 - 1) * 1 * 1 * x14_1 + (x14_2 - 1) * 1 * 1 * x14_1 * x14_0)) * 1 * b14_3 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_0 + (x14_1 - 1) * 1 * 1 * x14_0 * x14_2)) * 1 * b14_4 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_0 + (x14_1 - 1) * 1 * 1 * x14_0 * x14_2)) * 1 * b14_4 - ((0 + (x14_0 - 1) * 1 * 1 + (x14_2 - 1) * 1 * 1 * x14_0 + (x14_1 - 1) * 1 * 1 * x14_0 * x14_2)) * 1 * b14_4 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0 + (x14_2 - 1) * 1 * 1 * x14_0 * x14_1)) * 1 * b14_5 + ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0 + (x14_2 - 1) * 1 * 1 * x14_0 * x14_1)) * 1 * b14_5 - ((0 + (x14_0 - 1) * 1 * 1 + (x14_1 - 1) * 1 * 1 * x14_0 + (x14_2 - 1) * 1 * 1 * x14_0 * x14_1)) * 1 * b14_5;
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
	fw14 == st14 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_2 + 0 * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_1 + 0 * 1 * 1 * x14_1 * x14_2)) * 1 * b14_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_2 + 0 * 1 * 1 * x14_2 * x14_0)) * 1 * b14_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_1 + 0 * 1 * 1 * x14_1 * x14_0)) * 1 * b14_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_0 + 0 * 1 * 1 * x14_0 * x14_2)) * 1 * b14_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_0 + 0 * 1 * 1 * x14_0 * x14_1)) * 1 * b14_5 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_2 + 0 * 1 * 1 * x14_2 * x14_1)) * 1 * b14_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_1 + 0 * 1 * 1 * x14_1 * x14_2)) * 1 * b14_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_2 + 0 * 1 * 1 * x14_2 * x14_0)) * 1 * b14_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_1 + 0 * 1 * 1 * x14_1 * x14_0)) * 1 * b14_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_0 + 0 * 1 * 1 * x14_0 * x14_2)) * 1 * b14_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x14_0 + 0 * 1 * 1 * x14_0 * x14_1)) * 1 * b14_5;
# node: 15 info
# start time
var st15, integer;
subject to cst_st15:
	st15 == ( + fw14*b14_0*b15_0 + lw14*b14_1*b15_0 + lw14*b14_2*b15_0 + lw14*b14_3*b15_0 + lw14*b14_4*b15_0 + lw14*b14_5*b15_0 + lw14*b14_0*b15_1 + fw14*b14_1*b15_1 + lw14*b14_2*b15_1 + lw14*b14_3*b15_1 + lw14*b14_4*b15_1 + lw14*b14_5*b15_1 + lw14*b14_0*b15_2 + lw14*b14_1*b15_2 + fw14*b14_2*b15_2 + lw14*b14_3*b15_2 + lw14*b14_4*b15_2 + lw14*b14_5*b15_2 + lw14*b14_0*b15_3 + lw14*b14_1*b15_3 + lw14*b14_2*b15_3 + fw14*b14_3*b15_3 + lw14*b14_4*b15_3 + lw14*b14_5*b15_3 + lw14*b14_0*b15_4 + lw14*b14_1*b15_4 + lw14*b14_2*b15_4 + lw14*b14_3*b15_4 + fw14*b14_4*b15_4 + lw14*b14_5*b15_4 + lw14*b14_0*b15_5 + lw14*b14_1*b15_5 + lw14*b14_2*b15_5 + lw14*b14_3*b15_5 + lw14*b14_4*b15_5 + fw14*b14_5*b15_5);
# relative last reads
var rlr14_15, integer;
subject to cst_rlr14_15:
	rlr14_15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 2 * b15_0 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 2 * b15_2 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
# epilogues
var ep14_15, integer;
subject to cep14_15:
	ep14_15 ==  + ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 2 * b15_0 - ((0 + (x15_2 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_2 + (x15_0 - 1) * 1 * 1 * x15_2 * x15_1)) * 2 * b15_0 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 - ((0 + (x15_1 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + (x15_0 - 1) * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 2 * b15_2 - ((0 + (x15_2 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_2 + (x15_1 - 1) * 1 * 1 * x15_2 * x15_0)) * 2 * b15_2 + ((0 + (x15_1 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 - ((0 + (x15_1 - 1) * 1 * 1 + (x15_0 - 1) * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 - ((0 + (x15_0 - 1) * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + (x15_1 - 1) * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + (x15_0 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5 - ((0 + (x15_0 - 1) * 1 * 1 + (x15_1 - 1) * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
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
	fw15 == st15 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_1)) * 2 * b15_0 + ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_1 + 0 * 1 * 1 * x15_1 * x15_2)) * 1 * b15_1 + ((0 + (x15_2 - 1) * 1 * 1 + 0 * 1 * 1 * x15_2 + 0 * 1 * 1 * x15_2 * x15_0)) * 2 * b15_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x15_1 + (x15_2 - 1) * 1 * 1 * x15_1 * x15_0)) * 1 * b15_3 + ((0 + 0 * 1 * 1 + (x15_2 - 1) * 1 * 1 * x15_0 + 0 * 1 * 1 * x15_0 * x15_2)) * 1 * b15_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x15_0 + (x15_2 - 1) * 1 * 1 * x15_0 * x15_1)) * 1 * b15_5;
# node: 16 info
# start time
var st16, integer;
subject to cst_st16:
	st16 == max( + fw14*b14_0*b16_0 + lw14*b14_1*b16_0 + lw14*b14_2*b16_0 + lw14*b14_3*b16_0 + lw14*b14_4*b16_0 + lw14*b14_5*b16_0 + lw14*b14_0*b16_1 + fw14*b14_1*b16_1 + lw14*b14_2*b16_1 + lw14*b14_3*b16_1 + lw14*b14_4*b16_1 + lw14*b14_5*b16_1 + lw14*b14_0*b16_2 + lw14*b14_1*b16_2 + fw14*b14_2*b16_2 + lw14*b14_3*b16_2 + lw14*b14_4*b16_2 + lw14*b14_5*b16_2 + lw14*b14_0*b16_3 + lw14*b14_1*b16_3 + lw14*b14_2*b16_3 + fw14*b14_3*b16_3 + lw14*b14_4*b16_3 + lw14*b14_5*b16_3 + lw14*b14_0*b16_4 + lw14*b14_1*b16_4 + lw14*b14_2*b16_4 + lw14*b14_3*b16_4 + fw14*b14_4*b16_4 + lw14*b14_5*b16_4 + lw14*b14_0*b16_5 + lw14*b14_1*b16_5 + lw14*b14_2*b16_5 + lw14*b14_3*b16_5 + lw14*b14_4*b16_5 + fw14*b14_5*b16_5,  + fw15*b15_0*b16_0 + fw15*b15_1*b16_0 + lw15*b15_2*b16_0 + fw15*b15_3*b16_0 + lw15*b15_4*b16_0 + lw15*b15_5*b16_0 + fw15*b15_0*b16_1 + fw15*b15_1*b16_1 + lw15*b15_2*b16_1 + fw15*b15_3*b16_1 + lw15*b15_4*b16_1 + lw15*b15_5*b16_1 + lw15*b15_0*b16_2 + lw15*b15_1*b16_2 + fw15*b15_2*b16_2 + lw15*b15_3*b16_2 + fw15*b15_4*b16_2 + fw15*b15_5*b16_2 + fw15*b15_0*b16_3 + fw15*b15_1*b16_3 + lw15*b15_2*b16_3 + fw15*b15_3*b16_3 + lw15*b15_4*b16_3 + lw15*b15_5*b16_3 + lw15*b15_0*b16_4 + lw15*b15_1*b16_4 + fw15*b15_2*b16_4 + lw15*b15_3*b16_4 + fw15*b15_4*b16_4 + fw15*b15_5*b16_4 + lw15*b15_0*b16_5 + lw15*b15_1*b16_5 + fw15*b15_2*b16_5 + lw15*b15_3*b16_5 + fw15*b15_4*b16_5 + fw15*b15_5*b16_5);
# relative last reads
var rlr14_16, integer;
subject to cst_rlr14_16:
	rlr14_16 == st16 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + (x16_2 - 1) * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + (x16_2 - 1) * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5;
var rlr15_16, integer;
subject to cst_rlr15_16:
	rlr15_16 == st16 + ((0 + 0 * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_1 - 1) * 1 * 1 + 0 * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + 0 * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + 0 * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + (x16_0 - 1) * 1 * 1 + 0 * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + 0 * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5;
# epilogues
var ep14_16, integer;
subject to cep14_16:
	ep14_16 ==  + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 - ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 - ((0 + (x16_1 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 - ((0 + (x16_2 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + (x16_2 - 1) * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + (x16_2 - 1) * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 - ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + (x16_2 - 1) * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 - ((0 + (x16_0 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + (x16_2 - 1) * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + (x16_2 - 1) * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5 - ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + (x16_2 - 1) * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5;
var ep15_16, integer;
subject to cep15_16:
	ep15_16 ==  + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 - ((0 + 0 * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_2 + (x16_0 - 1) * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 - ((0 + (x16_1 - 1) * 1 * 1 + 0 * 1 * 1 * x16_1 + (x16_0 - 1) * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + (x16_2 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 - ((0 + 0 * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_2 + (x16_1 - 1) * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + (x16_2 - 1) * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + (x16_2 - 1) * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 - ((0 + (x16_1 - 1) * 1 * 1 + (x16_0 - 1) * 1 * 1 * x16_1 + 0 * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_2 - 1) * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 - ((0 + (x16_0 - 1) * 1 * 1 + 0 * 1 * 1 * x16_0 + (x16_1 - 1) * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + (x16_2 - 1) * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5 + ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + (x16_2 - 1) * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5 - ((0 + (x16_0 - 1) * 1 * 1 + (x16_1 - 1) * 1 * 1 * x16_0 + 0 * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5;
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
	fw16 == st16 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_2 + 0 * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_1 + 0 * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_2 + 0 * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_1 + 0 * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_0 + 0 * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_0 + 0 * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_2 + 0 * 1 * 1 * x16_2 * x16_1)) * 1 * b16_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_1 + 0 * 1 * 1 * x16_1 * x16_2)) * 1 * b16_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_2 + 0 * 1 * 1 * x16_2 * x16_0)) * 1 * b16_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_1 + 0 * 1 * 1 * x16_1 * x16_0)) * 1 * b16_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_0 + 0 * 1 * 1 * x16_0 * x16_2)) * 1 * b16_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x16_0 + 0 * 1 * 1 * x16_0 * x16_1)) * 1 * b16_5;
# node: 17 info
# start time
var st17, integer;
subject to cst_st17:
	st17 == ( + fw16*b16_0*b17_0 + lw16*b16_1*b17_0 + lw16*b16_2*b17_0 + lw16*b16_3*b17_0 + lw16*b16_4*b17_0 + lw16*b16_5*b17_0 + lw16*b16_0*b17_1 + fw16*b16_1*b17_1 + lw16*b16_2*b17_1 + lw16*b16_3*b17_1 + lw16*b16_4*b17_1 + lw16*b16_5*b17_1 + lw16*b16_0*b17_2 + lw16*b16_1*b17_2 + fw16*b16_2*b17_2 + lw16*b16_3*b17_2 + lw16*b16_4*b17_2 + lw16*b16_5*b17_2 + lw16*b16_0*b17_3 + lw16*b16_1*b17_3 + lw16*b16_2*b17_3 + fw16*b16_3*b17_3 + lw16*b16_4*b17_3 + lw16*b16_5*b17_3 + lw16*b16_0*b17_4 + lw16*b16_1*b17_4 + lw16*b16_2*b17_4 + lw16*b16_3*b17_4 + fw16*b16_4*b17_4 + lw16*b16_5*b17_4 + lw16*b16_0*b17_5 + lw16*b16_1*b17_5 + lw16*b16_2*b17_5 + lw16*b16_3*b17_5 + lw16*b16_4*b17_5 + fw16*b16_5*b17_5);
# relative last reads
var rlr16_17, integer;
subject to cst_rlr16_17:
	rlr16_17 == st17 + ((0 + (x17_2 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + (x17_0 - 1) * 1 * 1 * x17_2 * x17_1)) * 4 * b17_0 + ((0 + (x17_1 - 1) * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_1 + (x17_0 - 1) * 1 * 1 * x17_1 * x17_2)) * 1 * b17_1 + ((0 + (x17_2 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_2 + (x17_1 - 1) * 1 * 1 * x17_2 * x17_0)) * 4 * b17_2 + ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1 + (x17_2 - 1) * 1 * 1 * x17_1 * x17_0)) * 1 * b17_3 + ((0 + (x17_0 - 1) * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_0 + (x17_1 - 1) * 1 * 1 * x17_0 * x17_2)) * 1 * b17_4 + ((0 + (x17_0 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_0 + (x17_2 - 1) * 1 * 1 * x17_0 * x17_1)) * 1 * b17_5;
# epilogues
var ep16_17, integer;
subject to cep16_17:
	ep16_17 ==  + ((0 + (x17_2 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + (x17_0 - 1) * 1 * 1 * x17_2 * x17_1)) * 4 * b17_0 - ((0 + (x17_2 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_2 + (x17_0 - 1) * 1 * 1 * x17_2 * x17_1)) * 4 * b17_0 + ((0 + (x17_1 - 1) * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_1 + (x17_0 - 1) * 1 * 1 * x17_1 * x17_2)) * 1 * b17_1 - ((0 + (x17_1 - 1) * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_1 + (x17_0 - 1) * 1 * 1 * x17_1 * x17_2)) * 1 * b17_1 + ((0 + (x17_2 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_2 + (x17_1 - 1) * 1 * 1 * x17_2 * x17_0)) * 4 * b17_2 - ((0 + (x17_2 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_2 + (x17_1 - 1) * 1 * 1 * x17_2 * x17_0)) * 4 * b17_2 + ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1 + (x17_2 - 1) * 1 * 1 * x17_1 * x17_0)) * 1 * b17_3 - ((0 + (x17_1 - 1) * 1 * 1 + (x17_0 - 1) * 1 * 1 * x17_1 + (x17_2 - 1) * 1 * 1 * x17_1 * x17_0)) * 1 * b17_3 + ((0 + (x17_0 - 1) * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_0 + (x17_1 - 1) * 1 * 1 * x17_0 * x17_2)) * 1 * b17_4 - ((0 + (x17_0 - 1) * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_0 + (x17_1 - 1) * 1 * 1 * x17_0 * x17_2)) * 1 * b17_4 + ((0 + (x17_0 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_0 + (x17_2 - 1) * 1 * 1 * x17_0 * x17_1)) * 1 * b17_5 - ((0 + (x17_0 - 1) * 1 * 1 + (x17_1 - 1) * 1 * 1 * x17_0 + (x17_2 - 1) * 1 * 1 * x17_0 * x17_1)) * 1 * b17_5;
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
	fw17 == st17 + ((0 + (x17_2 - 1) * 1 * 1 + 0 * 1 * 1 * x17_2 + 0 * 1 * 1 * x17_2 * x17_1)) * 4 * b17_0 + ((0 + 0 * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_1 + 0 * 1 * 1 * x17_1 * x17_2)) * 1 * b17_1 + ((0 + (x17_2 - 1) * 1 * 1 + 0 * 1 * 1 * x17_2 + 0 * 1 * 1 * x17_2 * x17_0)) * 4 * b17_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x17_1 + (x17_2 - 1) * 1 * 1 * x17_1 * x17_0)) * 1 * b17_3 + ((0 + 0 * 1 * 1 + (x17_2 - 1) * 1 * 1 * x17_0 + 0 * 1 * 1 * x17_0 * x17_2)) * 1 * b17_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x17_0 + (x17_2 - 1) * 1 * 1 * x17_0 * x17_1)) * 1 * b17_5;
# node: 18 info
# start time
var st18, integer;
subject to cst_st18:
	st18 == max( + fw16*b16_0*b18_0 + lw16*b16_1*b18_0 + lw16*b16_2*b18_0 + lw16*b16_3*b18_0 + lw16*b16_4*b18_0 + lw16*b16_5*b18_0 + lw16*b16_0*b18_1 + fw16*b16_1*b18_1 + lw16*b16_2*b18_1 + lw16*b16_3*b18_1 + lw16*b16_4*b18_1 + lw16*b16_5*b18_1 + lw16*b16_0*b18_2 + lw16*b16_1*b18_2 + fw16*b16_2*b18_2 + lw16*b16_3*b18_2 + lw16*b16_4*b18_2 + lw16*b16_5*b18_2 + lw16*b16_0*b18_3 + lw16*b16_1*b18_3 + lw16*b16_2*b18_3 + fw16*b16_3*b18_3 + lw16*b16_4*b18_3 + lw16*b16_5*b18_3 + lw16*b16_0*b18_4 + lw16*b16_1*b18_4 + lw16*b16_2*b18_4 + lw16*b16_3*b18_4 + fw16*b16_4*b18_4 + lw16*b16_5*b18_4 + lw16*b16_0*b18_5 + lw16*b16_1*b18_5 + lw16*b16_2*b18_5 + lw16*b16_3*b18_5 + lw16*b16_4*b18_5 + fw16*b16_5*b18_5,  + fw17*b17_0*b18_0 + fw17*b17_1*b18_0 + lw17*b17_2*b18_0 + fw17*b17_3*b18_0 + lw17*b17_4*b18_0 + lw17*b17_5*b18_0 + fw17*b17_0*b18_1 + fw17*b17_1*b18_1 + lw17*b17_2*b18_1 + fw17*b17_3*b18_1 + lw17*b17_4*b18_1 + lw17*b17_5*b18_1 + lw17*b17_0*b18_2 + lw17*b17_1*b18_2 + fw17*b17_2*b18_2 + lw17*b17_3*b18_2 + fw17*b17_4*b18_2 + fw17*b17_5*b18_2 + fw17*b17_0*b18_3 + fw17*b17_1*b18_3 + lw17*b17_2*b18_3 + fw17*b17_3*b18_3 + lw17*b17_4*b18_3 + lw17*b17_5*b18_3 + lw17*b17_0*b18_4 + lw17*b17_1*b18_4 + fw17*b17_2*b18_4 + lw17*b17_3*b18_4 + fw17*b17_4*b18_4 + fw17*b17_5*b18_4 + lw17*b17_0*b18_5 + lw17*b17_1*b18_5 + fw17*b17_2*b18_5 + lw17*b17_3*b18_5 + fw17*b17_4*b18_5 + fw17*b17_5*b18_5);
# relative last reads
var rlr16_18, integer;
subject to cst_rlr16_18:
	rlr16_18 == st18 + ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_1 + (x18_0 - 1) * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 + ((0 + (x18_2 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_2 + (x18_1 - 1) * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1 + (x18_2 - 1) * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_0 + (x18_1 - 1) * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0 + (x18_2 - 1) * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5;
var rlr17_18, integer;
subject to cst_rlr17_18:
	rlr17_18 == st18 + ((0 + 0 * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 + ((0 + (x18_1 - 1) * 1 * 1 + 0 * 1 * 1 * x18_1 + (x18_0 - 1) * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 + ((0 + 0 * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_2 + (x18_1 - 1) * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1 + 0 * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 + ((0 + (x18_0 - 1) * 1 * 1 + 0 * 1 * 1 * x18_0 + (x18_1 - 1) * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0 + 0 * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5;
# epilogues
var ep16_18, integer;
subject to cep16_18:
	ep16_18 ==  + ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 - ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_1 + (x18_0 - 1) * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 - ((0 + (x18_1 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_1 + (x18_0 - 1) * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 + ((0 + (x18_2 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_2 + (x18_1 - 1) * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 - ((0 + (x18_2 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_2 + (x18_1 - 1) * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1 + (x18_2 - 1) * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 - ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1 + (x18_2 - 1) * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_0 + (x18_1 - 1) * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 - ((0 + (x18_0 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_0 + (x18_1 - 1) * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0 + (x18_2 - 1) * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5 - ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0 + (x18_2 - 1) * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5;
var ep17_18, integer;
subject to cep17_18:
	ep17_18 ==  + ((0 + (x18_2 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 - ((0 + 0 * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_2 + (x18_0 - 1) * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_1 + (x18_0 - 1) * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 - ((0 + (x18_1 - 1) * 1 * 1 + 0 * 1 * 1 * x18_1 + (x18_0 - 1) * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 + ((0 + (x18_2 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_2 + (x18_1 - 1) * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 - ((0 + 0 * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_2 + (x18_1 - 1) * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 + ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1 + (x18_2 - 1) * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 - ((0 + (x18_1 - 1) * 1 * 1 + (x18_0 - 1) * 1 * 1 * x18_1 + 0 * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_2 - 1) * 1 * 1 * x18_0 + (x18_1 - 1) * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 - ((0 + (x18_0 - 1) * 1 * 1 + 0 * 1 * 1 * x18_0 + (x18_1 - 1) * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 + ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0 + (x18_2 - 1) * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5 - ((0 + (x18_0 - 1) * 1 * 1 + (x18_1 - 1) * 1 * 1 * x18_0 + 0 * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5;
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
	fw18 == st18 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_2 + 0 * 1 * 1 * x18_2 * x18_1)) * 1 * b18_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_1 + 0 * 1 * 1 * x18_1 * x18_2)) * 1 * b18_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_2 + 0 * 1 * 1 * x18_2 * x18_0)) * 1 * b18_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_1 + 0 * 1 * 1 * x18_1 * x18_0)) * 1 * b18_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_0 + 0 * 1 * 1 * x18_0 * x18_2)) * 1 * b18_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x18_0 + 0 * 1 * 1 * x18_0 * x18_1)) * 1 * b18_5;
# node: 0 info
# start time
var st0, integer;
subject to cst_st0:
	st0 == max( + fw1*b1_0*b0_0 + lw1*b1_1*b0_0 + fw1*b1_0*b0_1 + lw1*b1_1*b0_1 + fw1*b1_0*b0_2 + lw1*b1_1*b0_2 + lw1*b1_0*b0_3 + fw1*b1_1*b0_3 + lw1*b1_0*b0_4 + fw1*b1_1*b0_4 + lw1*b1_0*b0_5 + fw1*b1_1*b0_5,  + lw10*b10_0*b0_0 + fw10*b10_1*b0_0 + fw10*b10_0*b0_1 + lw10*b10_1*b0_1 + lw10*b10_0*b0_2 + fw10*b10_1*b0_2 + fw10*b10_0*b0_3 + lw10*b10_1*b0_3 + lw10*b10_0*b0_4 + fw10*b10_1*b0_4 + fw10*b10_0*b0_5 + lw10*b10_1*b0_5);
# relative last reads
var rlr1_0, integer;
subject to cst_rlr1_0:
	rlr1_0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + (x0_0 - 1) * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + 0 * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + 0 * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + (x0_0 - 1) * 1 * 1 + 0 * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
var rlr10_0, integer;
subject to cst_rlr10_0:
	rlr10_0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + (x0_1 - 1) * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
# epilogues
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 - ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + (x0_0 - 1) * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 - ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + (x0_0 - 1) * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 - ((0 + (x0_2 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 - ((0 + 0 * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 - ((0 + (x0_0 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + 0 * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5 - ((0 + (x0_0 - 1) * 1 * 1 + 0 * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
var ep10_0, integer;
subject to cep10_0:
	ep10_0 ==  + ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + (x0_0 - 1) * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 - ((0 + (x0_2 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + (x0_0 - 1) * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 - ((0 + (x0_1 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 - ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + (x0_1 - 1) * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + (x0_1 - 1) * 1 * 1 + (x0_0 - 1) * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 - ((0 + (x0_1 - 1) * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 - ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + (x0_1 - 1) * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + (x0_0 - 1) * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5 - ((0 + 0 * 1 * 1 + (x0_1 - 1) * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
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
	fw0 == st0 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_1)) * 4 * b0_0 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_1 + 0 * 1 * 1 * x0_1 * x0_2)) * 1 * b0_1 + ((0 + (x0_2 - 1) * 1 * 1 + 0 * 1 * 1 * x0_2 + 0 * 1 * 1 * x0_2 * x0_0)) * 4 * b0_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x0_1 + (x0_2 - 1) * 1 * 1 * x0_1 * x0_0)) * 1 * b0_3 + ((0 + 0 * 1 * 1 + (x0_2 - 1) * 1 * 1 * x0_0 + 0 * 1 * 1 * x0_0 * x0_2)) * 1 * b0_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x0_0 + (x0_2 - 1) * 1 * 1 * x0_0 * x0_1)) * 1 * b0_5;
# node: 11 info
# start time
var st11, integer;
subject to cst_st11:
	st11 == ( + fw0*b0_0*b11_0 + fw0*b0_1*b11_0 + lw0*b0_2*b11_0 + fw0*b0_3*b11_0 + lw0*b0_4*b11_0 + lw0*b0_5*b11_0 + lw0*b0_0*b11_1 + lw0*b0_1*b11_1 + fw0*b0_2*b11_1 + lw0*b0_3*b11_1 + fw0*b0_4*b11_1 + fw0*b0_5*b11_1);
# relative last reads
var rlr0_11, integer;
subject to cst_rlr0_11:
	rlr0_11 == st11 + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 + ((0 + (x11_0 - 1) * 1 * 1 + (x11_1 - 1) * 1 * 1 * x11_0)) * 1 * b11_1;
# epilogues
var ep0_11, integer;
subject to cep0_11:
	ep0_11 ==  + ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 - ((0 + (x11_1 - 1) * 1 * 1 + (x11_0 - 1) * 1 * 1 * x11_1)) * 1 * b11_0 + ((0 + (x11_0 - 1) * 1 * 1 + (x11_1 - 1) * 1 * 1 * x11_0)) * 1 * b11_1 - ((0 + (x11_0 - 1) * 1 * 1 + (x11_1 - 1) * 1 * 1 * x11_0)) * 1 * b11_1;
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
	fw11 == st11 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_1)) * 1 * b11_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x11_0)) * 1 * b11_1;
# node: 12 info
# start time
var st12, integer;
subject to cst_st12:
	st12 == ( + lw11*b11_0*b12_0 + lw11*b11_1*b12_0 + lw11*b11_0*b12_1 + lw11*b11_1*b12_1 + lw11*b11_0*b12_2 + lw11*b11_1*b12_2 + lw11*b11_0*b12_3 + lw11*b11_1*b12_3 + lw11*b11_0*b12_4 + lw11*b11_1*b12_4 + lw11*b11_0*b12_5 + lw11*b11_1*b12_5);
# relative last reads
var rlr11_12, integer;
subject to cst_rlr11_12:
	rlr11_12 == st12 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 1 * b12_2 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
# epilogues
var ep11_12, integer;
subject to cep11_12:
	ep11_12 ==  + ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0 - ((0 + (x12_2 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_2 + (x12_0 - 1) * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 - ((0 + (x12_1 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_1 + (x12_0 - 1) * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 1 * b12_2 - ((0 + (x12_2 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_2 + (x12_1 - 1) * 1 * 1 * x12_2 * x12_0)) * 1 * b12_2 + ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 - ((0 + (x12_1 - 1) * 1 * 1 + (x12_0 - 1) * 1 * 1 * x12_1 + (x12_2 - 1) * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 - ((0 + (x12_0 - 1) * 1 * 1 + (x12_2 - 1) * 1 * 1 * x12_0 + (x12_1 - 1) * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + (x12_0 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5 - ((0 + (x12_0 - 1) * 1 * 1 + (x12_1 - 1) * 1 * 1 * x12_0 + (x12_2 - 1) * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
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
	fw12 == st12 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_1)) * 1 * b12_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_1 + 0 * 1 * 1 * x12_1 * x12_2)) * 1 * b12_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_2 + 0 * 1 * 1 * x12_2 * x12_0)) * 1 * b12_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_1 + 0 * 1 * 1 * x12_1 * x12_0)) * 1 * b12_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_0 + 0 * 1 * 1 * x12_0 * x12_2)) * 1 * b12_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x12_0 + 0 * 1 * 1 * x12_0 * x12_1)) * 1 * b12_5;
# node: 19 info
# start time
var st19, integer;
subject to cst_st19:
	st19 == max( + fw18*b18_0*b19_0 + lw18*b18_1*b19_0 + lw18*b18_2*b19_0 + lw18*b18_3*b19_0 + lw18*b18_4*b19_0 + lw18*b18_5*b19_0 + fw18*b18_0*b19_1 + lw18*b18_1*b19_1 + lw18*b18_2*b19_1 + lw18*b18_3*b19_1 + lw18*b18_4*b19_1 + lw18*b18_5*b19_1 + fw18*b18_0*b19_2 + lw18*b18_1*b19_2 + lw18*b18_2*b19_2 + lw18*b18_3*b19_2 + lw18*b18_4*b19_2 + lw18*b18_5*b19_2 + lw18*b18_0*b19_3 + fw18*b18_1*b19_3 + lw18*b18_2*b19_3 + lw18*b18_3*b19_3 + lw18*b18_4*b19_3 + lw18*b18_5*b19_3 + lw18*b18_0*b19_4 + fw18*b18_1*b19_4 + lw18*b18_2*b19_4 + lw18*b18_3*b19_4 + lw18*b18_4*b19_4 + lw18*b18_5*b19_4 + lw18*b18_0*b19_5 + fw18*b18_1*b19_5 + lw18*b18_2*b19_5 + lw18*b18_3*b19_5 + lw18*b18_4*b19_5 + lw18*b18_5*b19_5 + lw18*b18_0*b19_6 + lw18*b18_1*b19_6 + fw18*b18_2*b19_6 + lw18*b18_3*b19_6 + lw18*b18_4*b19_6 + lw18*b18_5*b19_6 + lw18*b18_0*b19_7 + lw18*b18_1*b19_7 + fw18*b18_2*b19_7 + lw18*b18_3*b19_7 + lw18*b18_4*b19_7 + lw18*b18_5*b19_7 + fw18*b18_0*b19_8 + lw18*b18_1*b19_8 + lw18*b18_2*b19_8 + lw18*b18_3*b19_8 + lw18*b18_4*b19_8 + lw18*b18_5*b19_8 + lw18*b18_0*b19_9 + lw18*b18_1*b19_9 + lw18*b18_2*b19_9 + fw18*b18_3*b19_9 + lw18*b18_4*b19_9 + lw18*b18_5*b19_9 + lw18*b18_0*b19_10 + fw18*b18_1*b19_10 + lw18*b18_2*b19_10 + lw18*b18_3*b19_10 + lw18*b18_4*b19_10 + lw18*b18_5*b19_10 + lw18*b18_0*b19_11 + lw18*b18_1*b19_11 + lw18*b18_2*b19_11 + fw18*b18_3*b19_11 + lw18*b18_4*b19_11 + lw18*b18_5*b19_11 + lw18*b18_0*b19_12 + lw18*b18_1*b19_12 + fw18*b18_2*b19_12 + lw18*b18_3*b19_12 + lw18*b18_4*b19_12 + lw18*b18_5*b19_12 + lw18*b18_0*b19_13 + lw18*b18_1*b19_13 + lw18*b18_2*b19_13 + lw18*b18_3*b19_13 + fw18*b18_4*b19_13 + lw18*b18_5*b19_13 + lw18*b18_0*b19_14 + lw18*b18_1*b19_14 + fw18*b18_2*b19_14 + lw18*b18_3*b19_14 + lw18*b18_4*b19_14 + lw18*b18_5*b19_14 + lw18*b18_0*b19_15 + lw18*b18_1*b19_15 + lw18*b18_2*b19_15 + lw18*b18_3*b19_15 + lw18*b18_4*b19_15 + fw18*b18_5*b19_15 + lw18*b18_0*b19_16 + lw18*b18_1*b19_16 + lw18*b18_2*b19_16 + fw18*b18_3*b19_16 + lw18*b18_4*b19_16 + lw18*b18_5*b19_16 + lw18*b18_0*b19_17 + lw18*b18_1*b19_17 + lw18*b18_2*b19_17 + fw18*b18_3*b19_17 + lw18*b18_4*b19_17 + lw18*b18_5*b19_17 + lw18*b18_0*b19_18 + lw18*b18_1*b19_18 + lw18*b18_2*b19_18 + lw18*b18_3*b19_18 + fw18*b18_4*b19_18 + lw18*b18_5*b19_18 + lw18*b18_0*b19_19 + lw18*b18_1*b19_19 + lw18*b18_2*b19_19 + lw18*b18_3*b19_19 + fw18*b18_4*b19_19 + lw18*b18_5*b19_19 + lw18*b18_0*b19_20 + lw18*b18_1*b19_20 + lw18*b18_2*b19_20 + lw18*b18_3*b19_20 + fw18*b18_4*b19_20 + lw18*b18_5*b19_20 + lw18*b18_0*b19_21 + lw18*b18_1*b19_21 + lw18*b18_2*b19_21 + lw18*b18_3*b19_21 + lw18*b18_4*b19_21 + fw18*b18_5*b19_21 + lw18*b18_0*b19_22 + lw18*b18_1*b19_22 + lw18*b18_2*b19_22 + lw18*b18_3*b19_22 + lw18*b18_4*b19_22 + fw18*b18_5*b19_22 + lw18*b18_0*b19_23 + lw18*b18_1*b19_23 + lw18*b18_2*b19_23 + lw18*b18_3*b19_23 + lw18*b18_4*b19_23 + fw18*b18_5*b19_23,  + lw12*b12_0*b19_0 + fw12*b12_1*b19_0 + lw12*b12_2*b19_0 + lw12*b12_3*b19_0 + lw12*b12_4*b19_0 + lw12*b12_5*b19_0 + fw12*b12_0*b19_1 + lw12*b12_1*b19_1 + lw12*b12_2*b19_1 + lw12*b12_3*b19_1 + lw12*b12_4*b19_1 + lw12*b12_5*b19_1 + lw12*b12_0*b19_2 + fw12*b12_1*b19_2 + lw12*b12_2*b19_2 + lw12*b12_3*b19_2 + lw12*b12_4*b19_2 + lw12*b12_5*b19_2 + fw12*b12_0*b19_3 + lw12*b12_1*b19_3 + lw12*b12_2*b19_3 + lw12*b12_3*b19_3 + lw12*b12_4*b19_3 + lw12*b12_5*b19_3 + lw12*b12_0*b19_4 + fw12*b12_1*b19_4 + lw12*b12_2*b19_4 + lw12*b12_3*b19_4 + lw12*b12_4*b19_4 + lw12*b12_5*b19_4 + fw12*b12_0*b19_5 + lw12*b12_1*b19_5 + lw12*b12_2*b19_5 + lw12*b12_3*b19_5 + lw12*b12_4*b19_5 + lw12*b12_5*b19_5 + lw12*b12_0*b19_6 + fw12*b12_1*b19_6 + lw12*b12_2*b19_6 + lw12*b12_3*b19_6 + lw12*b12_4*b19_6 + lw12*b12_5*b19_6 + fw12*b12_0*b19_7 + lw12*b12_1*b19_7 + lw12*b12_2*b19_7 + lw12*b12_3*b19_7 + lw12*b12_4*b19_7 + lw12*b12_5*b19_7 + lw12*b12_0*b19_8 + lw12*b12_1*b19_8 + lw12*b12_2*b19_8 + fw12*b12_3*b19_8 + lw12*b12_4*b19_8 + lw12*b12_5*b19_8 + lw12*b12_0*b19_9 + lw12*b12_1*b19_9 + fw12*b12_2*b19_9 + lw12*b12_3*b19_9 + lw12*b12_4*b19_9 + lw12*b12_5*b19_9 + lw12*b12_0*b19_10 + lw12*b12_1*b19_10 + lw12*b12_2*b19_10 + fw12*b12_3*b19_10 + lw12*b12_4*b19_10 + lw12*b12_5*b19_10 + lw12*b12_0*b19_11 + lw12*b12_1*b19_11 + fw12*b12_2*b19_11 + lw12*b12_3*b19_11 + lw12*b12_4*b19_11 + lw12*b12_5*b19_11 + lw12*b12_0*b19_12 + lw12*b12_1*b19_12 + lw12*b12_2*b19_12 + fw12*b12_3*b19_12 + lw12*b12_4*b19_12 + lw12*b12_5*b19_12 + lw12*b12_0*b19_13 + lw12*b12_1*b19_13 + fw12*b12_2*b19_13 + lw12*b12_3*b19_13 + lw12*b12_4*b19_13 + lw12*b12_5*b19_13 + lw12*b12_0*b19_14 + lw12*b12_1*b19_14 + lw12*b12_2*b19_14 + fw12*b12_3*b19_14 + lw12*b12_4*b19_14 + lw12*b12_5*b19_14 + lw12*b12_0*b19_15 + lw12*b12_1*b19_15 + fw12*b12_2*b19_15 + lw12*b12_3*b19_15 + lw12*b12_4*b19_15 + lw12*b12_5*b19_15 + lw12*b12_0*b19_16 + lw12*b12_1*b19_16 + lw12*b12_2*b19_16 + lw12*b12_3*b19_16 + lw12*b12_4*b19_16 + fw12*b12_5*b19_16 + lw12*b12_0*b19_17 + lw12*b12_1*b19_17 + lw12*b12_2*b19_17 + lw12*b12_3*b19_17 + fw12*b12_4*b19_17 + lw12*b12_5*b19_17 + lw12*b12_0*b19_18 + lw12*b12_1*b19_18 + lw12*b12_2*b19_18 + lw12*b12_3*b19_18 + lw12*b12_4*b19_18 + fw12*b12_5*b19_18 + lw12*b12_0*b19_19 + lw12*b12_1*b19_19 + lw12*b12_2*b19_19 + lw12*b12_3*b19_19 + fw12*b12_4*b19_19 + lw12*b12_5*b19_19 + lw12*b12_0*b19_20 + lw12*b12_1*b19_20 + lw12*b12_2*b19_20 + lw12*b12_3*b19_20 + lw12*b12_4*b19_20 + fw12*b12_5*b19_20 + lw12*b12_0*b19_21 + lw12*b12_1*b19_21 + lw12*b12_2*b19_21 + lw12*b12_3*b19_21 + fw12*b12_4*b19_21 + lw12*b12_5*b19_21 + lw12*b12_0*b19_22 + lw12*b12_1*b19_22 + lw12*b12_2*b19_22 + lw12*b12_3*b19_22 + lw12*b12_4*b19_22 + fw12*b12_5*b19_22 + lw12*b12_0*b19_23 + lw12*b12_1*b19_23 + lw12*b12_2*b19_23 + lw12*b12_3*b19_23 + fw12*b12_4*b19_23 + lw12*b12_5*b19_23);
# relative last reads
var rlr18_19, integer;
subject to cst_rlr18_19:
	rlr18_19 == st19 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 + ((0 + 0 * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 + ((0 + (x19_1 - 1) * 1 * 1 + 0 * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 + 0 * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 + ((0 + 0 * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 + 0 * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 + ((0 + (x19_1 - 1) * 1 * 1 + 0 * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 + ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 + 0 * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 + ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + 0 * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 + ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 + 0 * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 + ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + 0 * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23;
var rlr12_19, integer;
subject to cst_rlr12_19:
	rlr12_19 == st19 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 + ((0 + (x19_2 - 1) * 1 * 1 + 0 * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 + ((0 + 0 * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 + 0 * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 + 0 * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 + ((0 + (x19_2 - 1) * 1 * 1 + 0 * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 + ((0 + 0 * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 + 0 * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + 0 * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 + ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 + ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 + 0 * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + 0 * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 + ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 + ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23;
# epilogues
var ep18_19, integer;
subject to cep18_19:
	ep18_19 ==  + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 - ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 - ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 - ((0 + 0 * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 - ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 - ((0 + (x19_1 - 1) * 1 * 1 + 0 * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 - ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 - ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 + 0 * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 - ((0 + 0 * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 - ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 + 0 * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 - ((0 + (x19_1 - 1) * 1 * 1 + 0 * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 - ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 + 0 * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 - ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 - ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + 0 * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 - ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 - ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 + 0 * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 - ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + 0 * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23;
var ep12_19, integer;
subject to cep12_19:
	ep12_19 ==  + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 - ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 - ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 - ((0 + (x19_2 - 1) * 1 * 1 + 0 * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 - ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 - ((0 + 0 * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_2 + 0 * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 - ((0 + (x19_2 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_3 + 0 * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 - ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + (x19_0 - 1) * 1 * 1 * x19_3 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 - ((0 + (x19_2 - 1) * 1 * 1 + 0 * 1 * 1 * x19_2 + (x19_0 - 1) * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 - ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 - ((0 + 0 * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_1 + (x19_0 - 1) * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 + 0 * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 - ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + 0 * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 + ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_3 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 - ((0 + (x19_3 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 + ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 - ((0 + (x19_2 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 - ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 + ((0 + (x19_1 - 1) * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 - ((0 + 0 * 1 * 1 + (x19_0 - 1) * 1 * 1 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 + 0 * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + 0 * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_3 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + (x19_1 - 1) * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 - ((0 + (x19_0 - 1) * 1 * 1 + (x19_2 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 - ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 + ((0 + (x19_0 - 1) * 1 * 1 + (x19_1 - 1) * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23 - ((0 + (x19_0 - 1) * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_2 - 1) * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23;
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
	fw19 == st19 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_2 + 0 * 1 * 1 * x19_3 * x19_2 * x19_1)) * 4 * b19_0 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_3 + 0 * 1 * 1 * x19_2 * x19_3 * x19_1)) * 1 * b19_1 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_1 + 0 * 1 * 1 * x19_3 * x19_1 * x19_2)) * 4 * b19_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 + 0 * 1 * 1 * x19_2 * x19_1 * x19_3)) * 1 * b19_3 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_3 + 0 * 1 * 1 * x19_1 * x19_3 * x19_2)) * 1 * b19_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 + 0 * 1 * 1 * x19_1 * x19_2 * x19_3)) * 1 * b19_5 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_2 + 0 * 1 * 1 * x19_3 * x19_2 * x19_0)) * 4 * b19_6 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_3 + 0 * 1 * 1 * x19_2 * x19_3 * x19_0)) * 1 * b19_7 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_1 + 0 * 1 * 1 * x19_3 * x19_1 * x19_0)) * 4 * b19_8 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_1 * x19_0)) * 1 * b19_9 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_3 + 0 * 1 * 1 * x19_1 * x19_3 * x19_0)) * 1 * b19_10 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_2 * x19_0)) * 1 * b19_11 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_0 + 0 * 1 * 1 * x19_3 * x19_0 * x19_2)) * 4 * b19_12 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 + 0 * 1 * 1 * x19_2 * x19_0 * x19_3)) * 1 * b19_13 + ((0 + (x19_3 - 1) * 1 * 1 + 0 * 1 * 1 * x19_3 + 0 * 1 * 1 * x19_3 * x19_0 + 0 * 1 * 1 * x19_3 * x19_0 * x19_1)) * 4 * b19_14 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_2 + 0 * 1 * 1 * x19_2 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_2 * x19_0 * x19_1)) * 1 * b19_15 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 + 0 * 1 * 1 * x19_1 * x19_0 * x19_3)) * 1 * b19_16 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_1 + 0 * 1 * 1 * x19_1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_1 * x19_0 * x19_2)) * 1 * b19_17 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_3 + 0 * 1 * 1 * x19_0 * x19_3 * x19_2)) * 1 * b19_18 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 + 0 * 1 * 1 * x19_0 * x19_2 * x19_3)) * 1 * b19_19 + ((0 + 0 * 1 * 1 + (x19_3 - 1) * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_3 + 0 * 1 * 1 * x19_0 * x19_3 * x19_1)) * 1 * b19_20 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_2 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_2 * x19_1)) * 1 * b19_21 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_0 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 + 0 * 1 * 1 * x19_0 * x19_1 * x19_3)) * 1 * b19_22 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x19_0 + 0 * 1 * 1 * x19_0 * x19_1 + (x19_3 - 1) * 1 * 1 * x19_0 * x19_1 * x19_2)) * 1 * b19_23;
# node: 20 info
# start time
var st20, integer;
subject to cst_st20:
	st20 == ( + fw19*b19_0*b20_0 + fw19*b19_1*b20_0 + lw19*b19_2*b20_0 + fw19*b19_3*b20_0 + lw19*b19_4*b20_0 + lw19*b19_5*b20_0 + lw19*b19_6*b20_0 + lw19*b19_7*b20_0 + lw19*b19_8*b20_0 + fw19*b19_9*b20_0 + lw19*b19_10*b20_0 + lw19*b19_11*b20_0 + lw19*b19_12*b20_0 + lw19*b19_13*b20_0 + lw19*b19_14*b20_0 + lw19*b19_15*b20_0 + lw19*b19_16*b20_0 + lw19*b19_17*b20_0 + lw19*b19_18*b20_0 + lw19*b19_19*b20_0 + lw19*b19_20*b20_0 + lw19*b19_21*b20_0 + lw19*b19_22*b20_0 + lw19*b19_23*b20_0 + lw19*b19_0*b20_1 + lw19*b19_1*b20_1 + fw19*b19_2*b20_1 + lw19*b19_3*b20_1 + fw19*b19_4*b20_1 + fw19*b19_5*b20_1 + lw19*b19_6*b20_1 + lw19*b19_7*b20_1 + lw19*b19_8*b20_1 + lw19*b19_9*b20_1 + lw19*b19_10*b20_1 + fw19*b19_11*b20_1 + lw19*b19_12*b20_1 + lw19*b19_13*b20_1 + lw19*b19_14*b20_1 + lw19*b19_15*b20_1 + lw19*b19_16*b20_1 + lw19*b19_17*b20_1 + lw19*b19_18*b20_1 + lw19*b19_19*b20_1 + lw19*b19_20*b20_1 + lw19*b19_21*b20_1 + lw19*b19_22*b20_1 + lw19*b19_23*b20_1 + lw19*b19_0*b20_2 + lw19*b19_1*b20_2 + lw19*b19_2*b20_2 + lw19*b19_3*b20_2 + lw19*b19_4*b20_2 + lw19*b19_5*b20_2 + fw19*b19_6*b20_2 + fw19*b19_7*b20_2 + lw19*b19_8*b20_2 + lw19*b19_9*b20_2 + lw19*b19_10*b20_2 + lw19*b19_11*b20_2 + lw19*b19_12*b20_2 + fw19*b19_13*b20_2 + lw19*b19_14*b20_2 + fw19*b19_15*b20_2 + lw19*b19_16*b20_2 + lw19*b19_17*b20_2 + lw19*b19_18*b20_2 + lw19*b19_19*b20_2 + lw19*b19_20*b20_2 + lw19*b19_21*b20_2 + lw19*b19_22*b20_2 + lw19*b19_23*b20_2 + lw19*b19_0*b20_3 + lw19*b19_1*b20_3 + lw19*b19_2*b20_3 + lw19*b19_3*b20_3 + lw19*b19_4*b20_3 + lw19*b19_5*b20_3 + lw19*b19_6*b20_3 + lw19*b19_7*b20_3 + fw19*b19_8*b20_3 + lw19*b19_9*b20_3 + fw19*b19_10*b20_3 + lw19*b19_11*b20_3 + lw19*b19_12*b20_3 + lw19*b19_13*b20_3 + lw19*b19_14*b20_3 + lw19*b19_15*b20_3 + fw19*b19_16*b20_3 + fw19*b19_17*b20_3 + lw19*b19_18*b20_3 + lw19*b19_19*b20_3 + lw19*b19_20*b20_3 + lw19*b19_21*b20_3 + lw19*b19_22*b20_3 + lw19*b19_23*b20_3 + lw19*b19_0*b20_4 + lw19*b19_1*b20_4 + lw19*b19_2*b20_4 + lw19*b19_3*b20_4 + lw19*b19_4*b20_4 + lw19*b19_5*b20_4 + lw19*b19_6*b20_4 + lw19*b19_7*b20_4 + lw19*b19_8*b20_4 + lw19*b19_9*b20_4 + lw19*b19_10*b20_4 + lw19*b19_11*b20_4 + fw19*b19_12*b20_4 + lw19*b19_13*b20_4 + lw19*b19_14*b20_4 + lw19*b19_15*b20_4 + lw19*b19_16*b20_4 + lw19*b19_17*b20_4 + fw19*b19_18*b20_4 + fw19*b19_19*b20_4 + lw19*b19_20*b20_4 + fw19*b19_21*b20_4 + lw19*b19_22*b20_4 + lw19*b19_23*b20_4 + lw19*b19_0*b20_5 + lw19*b19_1*b20_5 + lw19*b19_2*b20_5 + lw19*b19_3*b20_5 + lw19*b19_4*b20_5 + lw19*b19_5*b20_5 + lw19*b19_6*b20_5 + lw19*b19_7*b20_5 + lw19*b19_8*b20_5 + lw19*b19_9*b20_5 + lw19*b19_10*b20_5 + lw19*b19_11*b20_5 + lw19*b19_12*b20_5 + lw19*b19_13*b20_5 + fw19*b19_14*b20_5 + lw19*b19_15*b20_5 + lw19*b19_16*b20_5 + lw19*b19_17*b20_5 + lw19*b19_18*b20_5 + lw19*b19_19*b20_5 + fw19*b19_20*b20_5 + lw19*b19_21*b20_5 + fw19*b19_22*b20_5 + fw19*b19_23*b20_5);
# relative last reads
var rlr19_20, integer;
subject to cst_rlr19_20:
	rlr19_20 == st20 + ((0 + (x20_2 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_2 + (x20_0 - 1) * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0 + ((0 + (x20_1 - 1) * 1 * 1 + (x20_2 - 1) * 1 * 1 * x20_1 + (x20_0 - 1) * 1 * 1 * x20_1 * x20_2)) * 1 * b20_1 + ((0 + (x20_2 - 1) * 1 * 1 + (x20_0 - 1) * 1 * 1 * x20_2 + (x20_1 - 1) * 1 * 1 * x20_2 * x20_0)) * 1 * b20_2 + ((0 + (x20_1 - 1) * 1 * 1 + (x20_0 - 1) * 1 * 1 * x20_1 + (x20_2 - 1) * 1 * 1 * x20_1 * x20_0)) * 1 * b20_3 + ((0 + (x20_0 - 1) * 1 * 1 + (x20_2 - 1) * 1 * 1 * x20_0 + (x20_1 - 1) * 1 * 1 * x20_0 * x20_2)) * 1 * b20_4 + ((0 + (x20_0 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_0 + (x20_2 - 1) * 1 * 1 * x20_0 * x20_1)) * 1 * b20_5;
# epilogues
var ep19_20, integer;
subject to cep19_20:
	ep19_20 ==  + ((0 + (x20_2 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_2 + (x20_0 - 1) * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0 - ((0 + (x20_2 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_2 + (x20_0 - 1) * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0 + ((0 + (x20_1 - 1) * 1 * 1 + (x20_2 - 1) * 1 * 1 * x20_1 + (x20_0 - 1) * 1 * 1 * x20_1 * x20_2)) * 1 * b20_1 - ((0 + (x20_1 - 1) * 1 * 1 + (x20_2 - 1) * 1 * 1 * x20_1 + (x20_0 - 1) * 1 * 1 * x20_1 * x20_2)) * 1 * b20_1 + ((0 + (x20_2 - 1) * 1 * 1 + (x20_0 - 1) * 1 * 1 * x20_2 + (x20_1 - 1) * 1 * 1 * x20_2 * x20_0)) * 1 * b20_2 - ((0 + (x20_2 - 1) * 1 * 1 + (x20_0 - 1) * 1 * 1 * x20_2 + (x20_1 - 1) * 1 * 1 * x20_2 * x20_0)) * 1 * b20_2 + ((0 + (x20_1 - 1) * 1 * 1 + (x20_0 - 1) * 1 * 1 * x20_1 + (x20_2 - 1) * 1 * 1 * x20_1 * x20_0)) * 1 * b20_3 - ((0 + (x20_1 - 1) * 1 * 1 + (x20_0 - 1) * 1 * 1 * x20_1 + (x20_2 - 1) * 1 * 1 * x20_1 * x20_0)) * 1 * b20_3 + ((0 + (x20_0 - 1) * 1 * 1 + (x20_2 - 1) * 1 * 1 * x20_0 + (x20_1 - 1) * 1 * 1 * x20_0 * x20_2)) * 1 * b20_4 - ((0 + (x20_0 - 1) * 1 * 1 + (x20_2 - 1) * 1 * 1 * x20_0 + (x20_1 - 1) * 1 * 1 * x20_0 * x20_2)) * 1 * b20_4 + ((0 + (x20_0 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_0 + (x20_2 - 1) * 1 * 1 * x20_0 * x20_1)) * 1 * b20_5 - ((0 + (x20_0 - 1) * 1 * 1 + (x20_1 - 1) * 1 * 1 * x20_0 + (x20_2 - 1) * 1 * 1 * x20_0 * x20_1)) * 1 * b20_5;
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
	fw20 == st20 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_2 + 0 * 1 * 1 * x20_2 * x20_1)) * 1 * b20_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_1 + 0 * 1 * 1 * x20_1 * x20_2)) * 1 * b20_1 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_2 + 0 * 1 * 1 * x20_2 * x20_0)) * 1 * b20_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_1 + 0 * 1 * 1 * x20_1 * x20_0)) * 1 * b20_3 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_0 + 0 * 1 * 1 * x20_0 * x20_2)) * 1 * b20_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x20_0 + 0 * 1 * 1 * x20_0 * x20_1)) * 1 * b20_5;
# node: 21 info
# start time
var st21, integer;
subject to cst_st21:
	st21 == ( + lw20*b20_0*b21_0 + lw20*b20_1*b21_0 + lw20*b20_2*b21_0 + lw20*b20_3*b21_0 + lw20*b20_4*b21_0 + lw20*b20_5*b21_0 + lw20*b20_0*b21_1 + lw20*b20_1*b21_1 + lw20*b20_2*b21_1 + lw20*b20_3*b21_1 + lw20*b20_4*b21_1 + lw20*b20_5*b21_1);
# relative last reads
var rlr20_21, integer;
subject to cst_rlr20_21:
	rlr20_21 == st21 + ((0 + (x21_1 - 1) * 1 * 1 + (x21_0 - 1) * 1 * 1 * x21_1)) * 1 * b21_0 + ((0 + (x21_0 - 1) * 1 * 1 + (x21_1 - 1) * 1 * 1 * x21_0)) * 1 * b21_1;
# epilogues
var ep20_21, integer;
subject to cep20_21:
	ep20_21 ==  + ((0 + (x21_1 - 1) * 1 * 1 + (x21_0 - 1) * 1 * 1 * x21_1)) * 1 * b21_0 - ((0 + (x21_1 - 1) * 1 * 1 + (x21_0 - 1) * 1 * 1 * x21_1)) * 1 * b21_0 + ((0 + (x21_0 - 1) * 1 * 1 + (x21_1 - 1) * 1 * 1 * x21_0)) * 1 * b21_1 - ((0 + (x21_0 - 1) * 1 * 1 + (x21_1 - 1) * 1 * 1 * x21_0)) * 1 * b21_1;
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
	fw21 == st21 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x21_1)) * 1 * b21_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x21_0)) * 1 * b21_1;
# node: 22 info
# start time
var st22, integer;
subject to cst_st22:
	st22 == max( + fw21*b21_0*b22_0 + lw21*b21_1*b22_0 + fw21*b21_0*b22_1 + lw21*b21_1*b22_1 + fw21*b21_0*b22_2 + lw21*b21_1*b22_2 + lw21*b21_0*b22_3 + fw21*b21_1*b22_3 + lw21*b21_0*b22_4 + fw21*b21_1*b22_4 + lw21*b21_0*b22_5 + fw21*b21_1*b22_5,  + lw23*b23_0*b22_0 + fw23*b23_1*b22_0 + fw23*b23_0*b22_1 + lw23*b23_1*b22_1 + lw23*b23_0*b22_2 + fw23*b23_1*b22_2 + fw23*b23_0*b22_3 + lw23*b23_1*b22_3 + lw23*b23_0*b22_4 + fw23*b23_1*b22_4 + fw23*b23_0*b22_5 + lw23*b23_1*b22_5);
# relative last reads
var rlr21_22, integer;
subject to cst_rlr21_22:
	rlr21_22 == st22 + ((0 + (x22_2 - 1) * 1 * 1 + 0 * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 + ((0 + 0 * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + (x22_0 - 1) * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 + ((0 + (x22_2 - 1) * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 + ((0 + 0 * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 + ((0 + (x22_0 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + 0 * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 + ((0 + (x22_0 - 1) * 1 * 1 + 0 * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5;
var rlr23_22, integer;
subject to cst_rlr23_22:
	rlr23_22 == st22 + ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 + ((0 + (x22_1 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + 0 * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 + ((0 + (x22_2 - 1) * 1 * 1 + 0 * 1 * 1 * x22_2 + (x22_1 - 1) * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 + ((0 + (x22_1 - 1) * 1 * 1 + 0 * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 + ((0 + 0 * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + (x22_1 - 1) * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 + ((0 + 0 * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5;
# epilogues
var ep21_22, integer;
subject to cep21_22:
	ep21_22 ==  + ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 - ((0 + (x22_2 - 1) * 1 * 1 + 0 * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 + ((0 + (x22_1 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + (x22_0 - 1) * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 - ((0 + 0 * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + (x22_0 - 1) * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 + ((0 + (x22_2 - 1) * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_2 + (x22_1 - 1) * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 - ((0 + (x22_2 - 1) * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 + ((0 + (x22_1 - 1) * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 - ((0 + 0 * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 + ((0 + (x22_0 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + (x22_1 - 1) * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 - ((0 + (x22_0 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + 0 * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 + ((0 + (x22_0 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5 - ((0 + (x22_0 - 1) * 1 * 1 + 0 * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5;
var ep23_22, integer;
subject to cep23_22:
	ep23_22 ==  + ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + (x22_0 - 1) * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 - ((0 + (x22_2 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 + ((0 + (x22_1 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + (x22_0 - 1) * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 - ((0 + (x22_1 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + 0 * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 + ((0 + (x22_2 - 1) * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_2 + (x22_1 - 1) * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 - ((0 + (x22_2 - 1) * 1 * 1 + 0 * 1 * 1 * x22_2 + (x22_1 - 1) * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 + ((0 + (x22_1 - 1) * 1 * 1 + (x22_0 - 1) * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 - ((0 + (x22_1 - 1) * 1 * 1 + 0 * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 + ((0 + (x22_0 - 1) * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + (x22_1 - 1) * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 - ((0 + 0 * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + (x22_1 - 1) * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 + ((0 + (x22_0 - 1) * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5 - ((0 + 0 * 1 * 1 + (x22_1 - 1) * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5;
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
	fw22 == st22 + ((0 + (x22_2 - 1) * 1 * 1 + 0 * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_1)) * 4 * b22_0 + ((0 + 0 * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_1 + 0 * 1 * 1 * x22_1 * x22_2)) * 1 * b22_1 + ((0 + (x22_2 - 1) * 1 * 1 + 0 * 1 * 1 * x22_2 + 0 * 1 * 1 * x22_2 * x22_0)) * 4 * b22_2 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x22_1 + (x22_2 - 1) * 1 * 1 * x22_1 * x22_0)) * 1 * b22_3 + ((0 + 0 * 1 * 1 + (x22_2 - 1) * 1 * 1 * x22_0 + 0 * 1 * 1 * x22_0 * x22_2)) * 1 * b22_4 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x22_0 + (x22_2 - 1) * 1 * 1 * x22_0 * x22_1)) * 1 * b22_5;
# node: 24 info
# start time
var st24, integer;
subject to cst_st24:
	st24 == ( + fw22*b22_0*b24_0 + fw22*b22_1*b24_0 + lw22*b22_2*b24_0 + fw22*b22_3*b24_0 + lw22*b22_4*b24_0 + lw22*b22_5*b24_0 + lw22*b22_0*b24_1 + lw22*b22_1*b24_1 + fw22*b22_2*b24_1 + lw22*b22_3*b24_1 + fw22*b22_4*b24_1 + fw22*b22_5*b24_1);
# relative last reads
var rlr22_24, integer;
subject to cst_rlr22_24:
	rlr22_24 == st24 + ((0 + (x24_1 - 1) * 1 * 1 + (x24_0 - 1) * 1 * 1 * x24_1)) * 1 * b24_0 + ((0 + (x24_0 - 1) * 1 * 1 + (x24_1 - 1) * 1 * 1 * x24_0)) * 1 * b24_1;
# epilogues
var ep22_24, integer;
subject to cep22_24:
	ep22_24 ==  + ((0 + (x24_1 - 1) * 1 * 1 + (x24_0 - 1) * 1 * 1 * x24_1)) * 1 * b24_0 - ((0 + (x24_1 - 1) * 1 * 1 + (x24_0 - 1) * 1 * 1 * x24_1)) * 1 * b24_0 + ((0 + (x24_0 - 1) * 1 * 1 + (x24_1 - 1) * 1 * 1 * x24_0)) * 1 * b24_1 - ((0 + (x24_0 - 1) * 1 * 1 + (x24_1 - 1) * 1 * 1 * x24_0)) * 1 * b24_1;
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
	fw24 == st24 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x24_1)) * 1 * b24_0 + ((0 + 0 * 1 * 1 + 0 * 1 * 1 * x24_0)) * 1 * b24_1;
# node: 25 info
# start time
var st25, integer;
subject to cst_st25:
	st25 == ( + fw24*b24_0*b25_0 + lw24*b24_1*b25_0 + lw24*b24_0*b25_1 + fw24*b24_1*b25_1);
# relative last reads
var rlr24_25, integer;
subject to cst_rlr24_25:
	rlr24_25 == st25 + ((0 + (x25_1 - 1) * 1 * 1 + (x25_0 - 1) * 1 * 1 * x25_1)) * 1 * b25_0 + ((0 + (x25_0 - 1) * 1 * 1 + (x25_1 - 1) * 1 * 1 * x25_0)) * 1 * b25_1;
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
display b14_2;
display b14_3;
display b14_4;
display b14_5;
display b21_0;
display b21_1;
display b2_0;
display b2_1;
display b2_2;
display b2_3;
display b2_4;
display b2_5;
display b9_0;
display b9_1;
display b9_2;
display b9_3;
display b9_4;
display b9_5;
display b16_0;
display b16_1;
display b16_2;
display b16_3;
display b16_4;
display b16_5;
display b10000_0;
display b23_0;
display b23_1;
display b4_0;
display b4_1;
display b11_0;
display b11_1;
display b18_0;
display b18_1;
display b18_2;
display b18_3;
display b18_4;
display b18_5;
display b25_0;
display b25_1;
display b6_0;
display b6_1;
display b6_2;
display b6_3;
display b6_4;
display b6_5;
display b13_0;
display b13_1;
display b13_2;
display b13_3;
display b13_4;
display b13_5;
display b13_6;
display b13_7;
display b13_8;
display b13_9;
display b13_10;
display b13_11;
display b13_12;
display b13_13;
display b13_14;
display b13_15;
display b13_16;
display b13_17;
display b13_18;
display b13_19;
display b13_20;
display b13_21;
display b13_22;
display b13_23;
display b20_0;
display b20_1;
display b20_2;
display b20_3;
display b20_4;
display b20_5;
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
display b22_0;
display b22_1;
display b22_2;
display b22_3;
display b22_4;
display b22_5;
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
display b17_2;
display b17_3;
display b17_4;
display b17_5;
display b24_0;
display b24_1;
display b5_0;
display b5_1;
display b12_0;
display b12_1;
display b12_2;
display b12_3;
display b12_4;
display b12_5;
display b19_0;
display b19_1;
display b19_2;
display b19_3;
display b19_4;
display b19_5;
display b19_6;
display b19_7;
display b19_8;
display b19_9;
display b19_10;
display b19_11;
display b19_12;
display b19_13;
display b19_14;
display b19_15;
display b19_16;
display b19_17;
display b19_18;
display b19_19;
display b19_20;
display b19_21;
display b19_22;
display b19_23;
display latency;
