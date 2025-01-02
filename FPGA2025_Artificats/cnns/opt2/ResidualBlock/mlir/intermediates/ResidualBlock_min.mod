# solver type
option solver gurobi;
# variable declation and constraints
var x0, binary;
var x7, binary;
var x14, binary;
var x21, binary;
var x2, binary;
var x9, binary;
var x16, binary;
var x23, binary;
var x4, binary;
var x11, binary;
var x18, binary;
var x6, binary;
var x13, binary;
var x20, binary;
var x1, binary;
var x8, binary;
var x15, binary;
var x22, binary;
var x3, binary;
var x10, binary;
var x17, binary;
var x5, binary;
var x12, binary;
var x19, binary;
subject to c0:
	(x0 + x7 + x14 + x21 + x2 + x9 + x16 + x23 + x4 + x11 + x18 + x6 + x13 + x20 + x1 + x8 + x15 + x22 + x3 + x10 + x17 + x5 + x12 + x19) == 1;
var x26, binary;
var x28, binary;
var x25, binary;
var x27, binary;
var x29, binary;
var x24, binary;
subject to c7:
	(x26 + x28 + x25 + x27 + x29 + x24) == 1;
var x33, binary;
var x35, binary;
var x30, binary;
var x32, binary;
var x34, binary;
var x31, binary;
subject to c2:
	(x33 + x35 + x30 + x32 + x34 + x31) == 1;
var x40, binary;
var x37, binary;
var x39, binary;
var x41, binary;
var x36, binary;
var x38, binary;
subject to c4:
	(x40 + x37 + x39 + x41 + x36 + x38) == 1;
var x45, binary;
var x47, binary;
var x42, binary;
var x44, binary;
var x46, binary;
var x43, binary;
subject to c6:
	(x45 + x47 + x42 + x44 + x46 + x43) == 1;
var x52, binary;
var x49, binary;
var x51, binary;
var x53, binary;
var x48, binary;
var x50, binary;
subject to c1:
	(x52 + x49 + x51 + x53 + x48 + x50) == 1;
var x59, binary;
var x54, binary;
var x56, binary;
var x58, binary;
var x55, binary;
var x57, binary;
subject to c8:
	(x59 + x54 + x56 + x58 + x55 + x57) == 1;
var x64, binary;
var x61, binary;
var x63, binary;
var x65, binary;
var x60, binary;
var x62, binary;
subject to c3:
	(x64 + x61 + x63 + x65 + x60 + x62) == 1;
var x71, binary;
var x78, binary;
var x85, binary;
var x66, binary;
var x73, binary;
var x80, binary;
var x87, binary;
var x68, binary;
var x75, binary;
var x82, binary;
var x89, binary;
var x70, binary;
var x77, binary;
var x84, binary;
var x72, binary;
var x79, binary;
var x86, binary;
var x67, binary;
var x74, binary;
var x81, binary;
var x88, binary;
var x69, binary;
var x76, binary;
var x83, binary;
subject to c5:
	(x71 + x78 + x85 + x66 + x73 + x80 + x87 + x68 + x75 + x82 + x89 + x70 + x77 + x84 + x72 + x79 + x86 + x67 + x74 + x81 + x88 + x69 + x76 + x83) == 1;

# node: 10000 info
var st10000, integer;
subject to cst10000:
	st10000 == 0;
var fw10000, integer;
subject to cfw10000:
	fw10000 == fw10000;
var lw10000, integer;
subject to clw10000:
	lw10000 == lw10000;
# node: 6 info
# c_st = max(a_fw, b_fw)
var st6, integer;
subject to cst6:
	st6 == (
0
);
# a_lr = c_st + node_c['a_lr']
var rlr10000_6, integer;
subject to crlr10000_6:
	rlr10000_6 == st6 + 0*x45 + 0*x47 + 0*x42 + 0*x44 + 0*x46 + 0*x43;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep10000_6, integer;
subject to cep10000_6:
	ep10000_6 ==  + 53823*x45 - 0*x45 + 53823*x47 - 0*x47 + 53823*x42 - 0*x42 + 53823*x44 - 0*x44 + 53823*x46 - 0*x46 + 53823*x43 - 0*x43;
# a_lt = max(a_lw, a_lr)
var lt10000_6, integer;
subject to clt10000_6:
	lt10000_6 == max(rlr10000_6, lw10000);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw10000_6, integer;
subject to clw10000_6:
	lw10000_6 == lt10000_6 + ep10000_6;
# c_et = max(c_a_et, c_b_et) + 1
var lw6, integer;
subject to clw6:
	lw6 == max(lw10000_6);
# c_fw = c_st + node_c['fw']
var fw6, integer;
subject to cfw6:
	fw6 == st6 + 0*x45 + 0*x47 + 0*x42 + 0*x44 + 0*x46 + 0*x43;

# node: 2 info
# c_st = max(a_fw, b_fw)
var st2, integer;
subject to cst2:
	st2 == (
0
);
# a_lr = c_st + node_c['a_lr']
var rlr10000_2, integer;
subject to crlr10000_2:
	rlr10000_2 == st2 + 0*x33 + 0*x35 + 0*x30 + 0*x32 + 0*x34 + 0*x31;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep10000_2, integer;
subject to cep10000_2:
	ep10000_2 ==  + 53823*x33 - 0*x33 + 53823*x35 - 0*x35 + 53823*x30 - 0*x30 + 53823*x32 - 0*x32 + 53823*x34 - 0*x34 + 53823*x31 - 0*x31;
# a_lt = max(a_lw, a_lr)
var lt10000_2, integer;
subject to clt10000_2:
	lt10000_2 == max(rlr10000_2, lw10000);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw10000_2, integer;
subject to clw10000_2:
	lw10000_2 == lt10000_2 + ep10000_2;
# c_et = max(c_a_et, c_b_et) + 1
var lw2, integer;
subject to clw2:
	lw2 == max(lw10000_2);
# c_fw = c_st + node_c['fw']
var fw2, integer;
subject to cfw2:
	fw2 == st2 + 0*x33 + 0*x35 + 0*x30 + 0*x32 + 0*x34 + 0*x31;

# node: 1 info
# c_st = max(a_fw, b_fw)
var st1, integer;
subject to cst1:
	st1 == (
0 + lw2*x33*x52 + lw2*x35*x52 + lw2*x30*x52 + lw2*x32*x52 + fw2*x34*x52 + lw2*x31*x52 + lw2*x33*x49 + lw2*x35*x49 + lw2*x30*x49 + lw2*x32*x49 + lw2*x34*x49 + fw2*x31*x49 + fw2*x33*x51 + lw2*x35*x51 + lw2*x30*x51 + lw2*x32*x51 + lw2*x34*x51 + lw2*x31*x51 + lw2*x33*x53 + fw2*x35*x53 + lw2*x30*x53 + lw2*x32*x53 + lw2*x34*x53 + lw2*x31*x53 + lw2*x33*x48 + lw2*x35*x48 + fw2*x30*x48 + lw2*x32*x48 + lw2*x34*x48 + lw2*x31*x48 + lw2*x33*x50 + lw2*x35*x50 + lw2*x30*x50 + fw2*x32*x50 + lw2*x34*x50 + lw2*x31*x50
);
# a_lr = c_st + node_c['a_lr']
var rlr2_1, integer;
subject to crlr2_1:
	rlr2_1 == st1 + 53823*x52 + 53823*x49 + 53823*x51 + 53823*x53 + 53823*x48 + 53823*x50;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep2_1, integer;
subject to cep2_1:
	ep2_1 ==  + 53823*x52 - 53823*x52 + 53823*x49 - 53823*x49 + 53823*x51 - 53823*x51 + 53823*x53 - 53823*x53 + 53823*x48 - 53823*x48 + 53823*x50 - 53823*x50;
# a_lt = max(a_lw, a_lr)
var lt2_1, integer;
subject to clt2_1:
	lt2_1 == max(rlr2_1, lw2);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw2_1, integer;
subject to clw2_1:
	lw2_1 == lt2_1 + ep2_1;
# c_et = max(c_a_et, c_b_et) + 1
var lw1, integer;
subject to clw1:
	lw1 == max(lw2_1);
# c_fw = c_st + node_c['fw']
var fw1, integer;
subject to cfw1:
	fw1 == st1 + 0*x52 + 0*x49 + 0*x51 + 0*x53 + 0*x48 + 0*x50;

# node: 0 info
# c_st = max(a_fw, b_fw)
var st0, integer;
subject to cst0:
	st0 == (
0 + fw1*x52*x0 + lw1*x49*x0 + lw1*x51*x0 + lw1*x53*x0 + lw1*x48*x0 + lw1*x50*x0 + lw1*x52*x7 + lw1*x49*x7 + lw1*x51*x7 + lw1*x53*x7 + fw1*x48*x7 + lw1*x50*x7 + lw1*x52*x14 + lw1*x49*x14 + lw1*x51*x14 + lw1*x53*x14 + fw1*x48*x14 + lw1*x50*x14 + fw1*x52*x21 + lw1*x49*x21 + lw1*x51*x21 + lw1*x53*x21 + lw1*x48*x21 + lw1*x50*x21 + lw1*x52*x2 + lw1*x49*x2 + lw1*x51*x2 + lw1*x53*x2 + fw1*x48*x2 + lw1*x50*x2 + fw1*x52*x9 + lw1*x49*x9 + lw1*x51*x9 + lw1*x53*x9 + lw1*x48*x9 + lw1*x50*x9 + fw1*x52*x16 + lw1*x49*x16 + lw1*x51*x16 + lw1*x53*x16 + lw1*x48*x16 + lw1*x50*x16 + lw1*x52*x23 + lw1*x49*x23 + lw1*x51*x23 + lw1*x53*x23 + fw1*x48*x23 + lw1*x50*x23 + lw1*x52*x4 + lw1*x49*x4 + lw1*x51*x4 + lw1*x53*x4 + fw1*x48*x4 + lw1*x50*x4 + lw1*x52*x11 + lw1*x49*x11 + lw1*x51*x11 + lw1*x53*x11 + fw1*x48*x11 + lw1*x50*x11 + fw1*x52*x18 + lw1*x49*x18 + lw1*x51*x18 + lw1*x53*x18 + lw1*x48*x18 + lw1*x50*x18 + lw1*x52*x6 + lw1*x49*x6 + lw1*x51*x6 + lw1*x53*x6 + fw1*x48*x6 + lw1*x50*x6 + lw1*x52*x13 + lw1*x49*x13 + lw1*x51*x13 + lw1*x53*x13 + fw1*x48*x13 + lw1*x50*x13 + lw1*x52*x20 + lw1*x49*x20 + lw1*x51*x20 + lw1*x53*x20 + fw1*x48*x20 + lw1*x50*x20 + fw1*x52*x1 + lw1*x49*x1 + lw1*x51*x1 + lw1*x53*x1 + lw1*x48*x1 + lw1*x50*x1 + fw1*x52*x8 + lw1*x49*x8 + lw1*x51*x8 + lw1*x53*x8 + lw1*x48*x8 + lw1*x50*x8 + lw1*x52*x15 + lw1*x49*x15 + lw1*x51*x15 + lw1*x53*x15 + fw1*x48*x15 + lw1*x50*x15 + lw1*x52*x22 + lw1*x49*x22 + lw1*x51*x22 + lw1*x53*x22 + fw1*x48*x22 + lw1*x50*x22 + fw1*x52*x3 + lw1*x49*x3 + lw1*x51*x3 + lw1*x53*x3 + lw1*x48*x3 + lw1*x50*x3 + fw1*x52*x10 + lw1*x49*x10 + lw1*x51*x10 + lw1*x53*x10 + lw1*x48*x10 + lw1*x50*x10 + fw1*x52*x17 + lw1*x49*x17 + lw1*x51*x17 + lw1*x53*x17 + lw1*x48*x17 + lw1*x50*x17 + lw1*x52*x5 + lw1*x49*x5 + lw1*x51*x5 + lw1*x53*x5 + fw1*x48*x5 + lw1*x50*x5 + fw1*x52*x12 + lw1*x49*x12 + lw1*x51*x12 + lw1*x53*x12 + lw1*x48*x12 + lw1*x50*x12 + fw1*x52*x19 + lw1*x49*x19 + lw1*x51*x19 + lw1*x53*x19 + lw1*x48*x19 + lw1*x50*x19
);
# a_lr = c_st + node_c['a_lr']
var rlr1_0, integer;
subject to crlr1_0:
	rlr1_0 == st0 + 1937628*x0 + 7269603*x7 + 7269603*x14 + 861168*x21 + 1937628*x2 + 30993468*x9 + 30993468*x16 + 861168*x23 + 457503*x4 + 53823*x11 + 7750512*x18 + 29186028*x6 + 31002048*x13 + 7750512*x20 + 1937148*x1 + 30993948*x8 + 810723*x15 + 7320048*x22 + 215292*x3 + 215292*x10 + 3443772*x17 + 53823*x5 + 31002048*x12 + 7748592*x19;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + 31002620*x0 - 1937628*x0 + 7750655*x7 - 7269603*x7 + 7750655*x14 - 7269603*x14 + 7750655*x21 - 861168*x21 + 31002620*x2 - 1937628*x2 + 31002620*x9 - 30993468*x9 + 31002620*x16 - 30993468*x16 + 7750655*x23 - 861168*x23 + 7750655*x4 - 457503*x4 + 7750655*x11 - 53823*x11 + 7750655*x18 - 7750512*x18 + 31002620*x6 - 29186028*x6 + 31002620*x13 - 31002048*x13 + 7750655*x20 - 7750512*x20 + 31002620*x1 - 1937148*x1 + 31002620*x8 - 30993948*x8 + 7750655*x15 - 810723*x15 + 7750655*x22 - 7320048*x22 + 31002620*x3 - 215292*x3 + 31002620*x10 - 215292*x10 + 31002620*x17 - 3443772*x17 + 7750655*x5 - 53823*x5 + 31002620*x12 - 31002048*x12 + 7750655*x19 - 7748592*x19;
# a_lt = max(a_lw, a_lr)
var lt1_0, integer;
subject to clt1_0:
	lt1_0 == max(rlr1_0, lw1);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw1_0, integer;
subject to clw1_0:
	lw1_0 == lt1_0 + ep1_0;
# c_et = max(c_a_et, c_b_et) + 1
var lw0, integer;
subject to clw0:
	lw0 == max(lw1_0);
# c_fw = c_st + node_c['fw']
var fw0, integer;
subject to cfw0:
	fw0 == st0 + 572*x0 + 7293152*x7 + 7696832*x14 + 6889712*x21 + 1816592*x2 + 572*x9 + 8252*x16 + 7696832*x23 + 481052*x4 + 6939932*x11 + 2288*x18 + 29064992*x6 + 29064992*x13 + 7266368*x20 + 572*x1 + 572*x8 + 7696832*x15 + 7696832*x22 + 1722428*x3 + 27557948*x10 + 27557948*x17 + 481052*x5 + 8672*x12 + 2288*x19;

# node: 3 info
# c_st = max(a_fw, b_fw)
var st3, integer;
subject to cst3:
	st3 == (
0 + lw0*x0*x64 + lw0*x7*x64 + lw0*x14*x64 + fw0*x21*x64 + lw0*x2*x64 + fw0*x9*x64 + fw0*x16*x64 + fw0*x23*x64 + lw0*x4*x64 + lw0*x11*x64 + fw0*x18*x64 + lw0*x6*x64 + fw0*x13*x64 + fw0*x20*x64 + lw0*x1*x64 + fw0*x8*x64 + lw0*x15*x64 + fw0*x22*x64 + lw0*x3*x64 + lw0*x10*x64 + fw0*x17*x64 + lw0*x5*x64 + fw0*x12*x64 + fw0*x19*x64 + lw0*x0*x61 + lw0*x7*x61 + lw0*x14*x61 + lw0*x21*x61 + lw0*x2*x61 + lw0*x9*x61 + lw0*x16*x61 + lw0*x23*x61 + lw0*x4*x61 + lw0*x11*x61 + lw0*x18*x61 + lw0*x6*x61 + lw0*x13*x61 + lw0*x20*x61 + lw0*x1*x61 + lw0*x8*x61 + lw0*x15*x61 + lw0*x22*x61 + lw0*x3*x61 + lw0*x10*x61 + lw0*x17*x61 + lw0*x5*x61 + lw0*x12*x61 + lw0*x19*x61 + lw0*x0*x63 + lw0*x7*x63 + lw0*x14*x63 + lw0*x21*x63 + lw0*x2*x63 + lw0*x9*x63 + lw0*x16*x63 + lw0*x23*x63 + lw0*x4*x63 + lw0*x11*x63 + lw0*x18*x63 + lw0*x6*x63 + lw0*x13*x63 + lw0*x20*x63 + lw0*x1*x63 + lw0*x8*x63 + lw0*x15*x63 + lw0*x22*x63 + lw0*x3*x63 + lw0*x10*x63 + lw0*x17*x63 + lw0*x5*x63 + lw0*x12*x63 + lw0*x19*x63 + lw0*x0*x65 + lw0*x7*x65 + lw0*x14*x65 + lw0*x21*x65 + lw0*x2*x65 + lw0*x9*x65 + lw0*x16*x65 + lw0*x23*x65 + lw0*x4*x65 + lw0*x11*x65 + lw0*x18*x65 + lw0*x6*x65 + lw0*x13*x65 + lw0*x20*x65 + lw0*x1*x65 + lw0*x8*x65 + lw0*x15*x65 + lw0*x22*x65 + lw0*x3*x65 + lw0*x10*x65 + lw0*x17*x65 + lw0*x5*x65 + lw0*x12*x65 + lw0*x19*x65 + fw0*x0*x60 + fw0*x7*x60 + fw0*x14*x60 + lw0*x21*x60 + fw0*x2*x60 + lw0*x9*x60 + lw0*x16*x60 + lw0*x23*x60 + fw0*x4*x60 + fw0*x11*x60 + lw0*x18*x60 + fw0*x6*x60 + lw0*x13*x60 + lw0*x20*x60 + fw0*x1*x60 + lw0*x8*x60 + fw0*x15*x60 + lw0*x22*x60 + fw0*x3*x60 + fw0*x10*x60 + lw0*x17*x60 + fw0*x5*x60 + lw0*x12*x60 + lw0*x19*x60 + lw0*x0*x62 + lw0*x7*x62 + lw0*x14*x62 + lw0*x21*x62 + lw0*x2*x62 + lw0*x9*x62 + lw0*x16*x62 + lw0*x23*x62 + lw0*x4*x62 + lw0*x11*x62 + lw0*x18*x62 + lw0*x6*x62 + lw0*x13*x62 + lw0*x20*x62 + lw0*x1*x62 + lw0*x8*x62 + lw0*x15*x62 + lw0*x22*x62 + lw0*x3*x62 + lw0*x10*x62 + lw0*x17*x62 + lw0*x5*x62 + lw0*x12*x62 + lw0*x19*x62
);
# a_lr = c_st + node_c['a_lr']
var rlr0_3, integer;
subject to crlr0_3:
	rlr0_3 == st3 + 50175*x64 + 50175*x61 + 50175*x63 + 50175*x65 + 50175*x60 + 50175*x62;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep0_3, integer;
subject to cep0_3:
	ep0_3 ==  + 50175*x64 - 50175*x64 + 50175*x61 - 50175*x61 + 50175*x63 - 50175*x63 + 50175*x65 - 50175*x65 + 50175*x60 - 50175*x60 + 50175*x62 - 50175*x62;
# a_lt = max(a_lw, a_lr)
var lt0_3, integer;
subject to clt0_3:
	lt0_3 == max(rlr0_3, lw0);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw0_3, integer;
subject to clw0_3:
	lw0_3 == lt0_3 + ep0_3;
# c_et = max(c_a_et, c_b_et) + 1
var lw3, integer;
subject to clw3:
	lw3 == max(lw0_3);
# c_fw = c_st + node_c['fw']
var fw3, integer;
subject to cfw3:
	fw3 == st3 + 0*x64 + 0*x61 + 0*x63 + 0*x65 + 0*x60 + 0*x62;

# node: 4 info
# c_st = max(a_fw, b_fw)
var st4, integer;
subject to cst4:
	st4 == max(
 + fw3*x64*x40 + lw3*x61*x40 + lw3*x63*x40 + lw3*x65*x40 + lw3*x60*x40 + lw3*x62*x40 + lw3*x64*x37 + fw3*x61*x37 + lw3*x63*x37 + lw3*x65*x37 + lw3*x60*x37 + lw3*x62*x37 + lw3*x64*x39 + lw3*x61*x39 + fw3*x63*x39 + lw3*x65*x39 + lw3*x60*x39 + lw3*x62*x39 + lw3*x64*x41 + lw3*x61*x41 + lw3*x63*x41 + fw3*x65*x41 + lw3*x60*x41 + lw3*x62*x41 + lw3*x64*x36 + lw3*x61*x36 + lw3*x63*x36 + lw3*x65*x36 + fw3*x60*x36 + lw3*x62*x36 + lw3*x64*x38 + lw3*x61*x38 + lw3*x63*x38 + lw3*x65*x38 + lw3*x60*x38 + fw3*x62*x38,
 + lw6*x45*x40 + lw6*x47*x40 + lw6*x42*x40 + lw6*x44*x40 + fw6*x46*x40 + lw6*x43*x40 + lw6*x45*x37 + lw6*x47*x37 + lw6*x42*x37 + lw6*x44*x37 + lw6*x46*x37 + fw6*x43*x37 + fw6*x45*x39 + lw6*x47*x39 + lw6*x42*x39 + lw6*x44*x39 + lw6*x46*x39 + lw6*x43*x39 + lw6*x45*x41 + fw6*x47*x41 + lw6*x42*x41 + lw6*x44*x41 + lw6*x46*x41 + lw6*x43*x41 + lw6*x45*x36 + lw6*x47*x36 + fw6*x42*x36 + lw6*x44*x36 + lw6*x46*x36 + lw6*x43*x36 + lw6*x45*x38 + lw6*x47*x38 + lw6*x42*x38 + fw6*x44*x38 + lw6*x46*x38 + lw6*x43*x38
);
# a_lr = c_st + node_c['a_lr']
var rlr3_4, integer;
subject to crlr3_4:
	rlr3_4 == st4 + 53823*x40 + 53823*x37 + 53823*x39 + 53823*x41 + 53823*x36 + 53823*x38;
var rlr6_4, integer;
subject to crlr6_4:
	rlr6_4 == st4 + 53823*x40 + 53823*x37 + 53823*x39 + 53823*x41 + 53823*x36 + 53823*x38;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep3_4, integer;
subject to cep3_4:
	ep3_4 ==  + 53823*x40 - 53823*x40 + 53823*x37 - 53823*x37 + 53823*x39 - 53823*x39 + 53823*x41 - 53823*x41 + 53823*x36 - 53823*x36 + 53823*x38 - 53823*x38;
var ep6_4, integer;
subject to cep6_4:
	ep6_4 ==  + 53823*x40 - 53823*x40 + 53823*x37 - 53823*x37 + 53823*x39 - 53823*x39 + 53823*x41 - 53823*x41 + 53823*x36 - 53823*x36 + 53823*x38 - 53823*x38;
# a_lt = max(a_lw, a_lr)
var lt3_4, integer;
subject to clt3_4:
	lt3_4 == max(rlr3_4, lw3);
var lt6_4, integer;
subject to clt6_4:
	lt6_4 == max(rlr6_4, lw6);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw3_4, integer;
subject to clw3_4:
	lw3_4 == lt3_4 + ep3_4;
var lw6_4, integer;
subject to clw6_4:
	lw6_4 == lt6_4 + ep6_4;
# c_et = max(c_a_et, c_b_et) + 1
var lw4, integer;
subject to clw4:
	lw4 == max(lw3_4, lw6_4);
# c_fw = c_st + node_c['fw']
var fw4, integer;
subject to cfw4:
	fw4 == st4 + 0*x40 + 0*x37 + 0*x39 + 0*x41 + 0*x36 + 0*x38;

# node: 5 info
# c_st = max(a_fw, b_fw)
var st5, integer;
subject to cst5:
	st5 == (
0 + lw4*x40*x71 + lw4*x37*x71 + lw4*x39*x71 + lw4*x41*x71 + fw4*x36*x71 + lw4*x38*x71 + fw4*x40*x78 + lw4*x37*x78 + lw4*x39*x78 + lw4*x41*x78 + lw4*x36*x78 + lw4*x38*x78 + fw4*x40*x85 + lw4*x37*x85 + lw4*x39*x85 + lw4*x41*x85 + lw4*x36*x85 + lw4*x38*x85 + fw4*x40*x66 + lw4*x37*x66 + lw4*x39*x66 + lw4*x41*x66 + lw4*x36*x66 + lw4*x38*x66 + lw4*x40*x73 + lw4*x37*x73 + lw4*x39*x73 + lw4*x41*x73 + fw4*x36*x73 + lw4*x38*x73 + lw4*x40*x80 + lw4*x37*x80 + lw4*x39*x80 + lw4*x41*x80 + fw4*x36*x80 + lw4*x38*x80 + fw4*x40*x87 + lw4*x37*x87 + lw4*x39*x87 + lw4*x41*x87 + lw4*x36*x87 + lw4*x38*x87 + lw4*x40*x68 + lw4*x37*x68 + lw4*x39*x68 + lw4*x41*x68 + fw4*x36*x68 + lw4*x38*x68 + fw4*x40*x75 + lw4*x37*x75 + lw4*x39*x75 + lw4*x41*x75 + lw4*x36*x75 + lw4*x38*x75 + fw4*x40*x82 + lw4*x37*x82 + lw4*x39*x82 + lw4*x41*x82 + lw4*x36*x82 + lw4*x38*x82 + lw4*x40*x89 + lw4*x37*x89 + lw4*x39*x89 + lw4*x41*x89 + fw4*x36*x89 + lw4*x38*x89 + lw4*x40*x70 + lw4*x37*x70 + lw4*x39*x70 + lw4*x41*x70 + fw4*x36*x70 + lw4*x38*x70 + lw4*x40*x77 + lw4*x37*x77 + lw4*x39*x77 + lw4*x41*x77 + fw4*x36*x77 + lw4*x38*x77 + fw4*x40*x84 + lw4*x37*x84 + lw4*x39*x84 + lw4*x41*x84 + lw4*x36*x84 + lw4*x38*x84 + lw4*x40*x72 + lw4*x37*x72 + lw4*x39*x72 + lw4*x41*x72 + fw4*x36*x72 + lw4*x38*x72 + lw4*x40*x79 + lw4*x37*x79 + lw4*x39*x79 + lw4*x41*x79 + fw4*x36*x79 + lw4*x38*x79 + lw4*x40*x86 + lw4*x37*x86 + lw4*x39*x86 + lw4*x41*x86 + fw4*x36*x86 + lw4*x38*x86 + fw4*x40*x67 + lw4*x37*x67 + lw4*x39*x67 + lw4*x41*x67 + lw4*x36*x67 + lw4*x38*x67 + fw4*x40*x74 + lw4*x37*x74 + lw4*x39*x74 + lw4*x41*x74 + lw4*x36*x74 + lw4*x38*x74 + lw4*x40*x81 + lw4*x37*x81 + lw4*x39*x81 + lw4*x41*x81 + fw4*x36*x81 + lw4*x38*x81 + lw4*x40*x88 + lw4*x37*x88 + lw4*x39*x88 + lw4*x41*x88 + fw4*x36*x88 + lw4*x38*x88 + fw4*x40*x69 + lw4*x37*x69 + lw4*x39*x69 + lw4*x41*x69 + lw4*x36*x69 + lw4*x38*x69 + fw4*x40*x76 + lw4*x37*x76 + lw4*x39*x76 + lw4*x41*x76 + lw4*x36*x76 + lw4*x38*x76 + fw4*x40*x83 + lw4*x37*x83 + lw4*x39*x83 + lw4*x41*x83 + lw4*x36*x83 + lw4*x38*x83
);
# a_lr = c_st + node_c['a_lr']
var rlr4_5, integer;
subject to crlr4_5:
	rlr4_5 == st5 + 53823*x71 + 31002048*x78 + 7748592*x85 + 1937628*x66 + 7269603*x73 + 7269603*x80 + 861168*x87 + 1937628*x68 + 30993468*x75 + 30993468*x82 + 861168*x89 + 457503*x70 + 53823*x77 + 7750512*x84 + 29186028*x72 + 31002048*x79 + 7750512*x86 + 1937148*x67 + 30993948*x74 + 810723*x81 + 7320048*x88 + 215292*x69 + 215292*x76 + 3443772*x83;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep4_5, integer;
subject to cep4_5:
	ep4_5 ==  + 7750655*x71 - 53823*x71 + 31002620*x78 - 31002048*x78 + 7750655*x85 - 7748592*x85 + 31002620*x66 - 1937628*x66 + 7750655*x73 - 7269603*x73 + 7750655*x80 - 7269603*x80 + 7750655*x87 - 861168*x87 + 31002620*x68 - 1937628*x68 + 31002620*x75 - 30993468*x75 + 31002620*x82 - 30993468*x82 + 7750655*x89 - 861168*x89 + 7750655*x70 - 457503*x70 + 7750655*x77 - 53823*x77 + 7750655*x84 - 7750512*x84 + 31002620*x72 - 29186028*x72 + 31002620*x79 - 31002048*x79 + 7750655*x86 - 7750512*x86 + 31002620*x67 - 1937148*x67 + 31002620*x74 - 30993948*x74 + 7750655*x81 - 810723*x81 + 7750655*x88 - 7320048*x88 + 31002620*x69 - 215292*x69 + 31002620*x76 - 215292*x76 + 31002620*x83 - 3443772*x83;
# a_lt = max(a_lw, a_lr)
var lt4_5, integer;
subject to clt4_5:
	lt4_5 == max(rlr4_5, lw4);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw4_5, integer;
subject to clw4_5:
	lw4_5 == lt4_5 + ep4_5;
# c_et = max(c_a_et, c_b_et) + 1
var lw5, integer;
subject to clw5:
	lw5 == max(lw4_5);
# c_fw = c_st + node_c['fw']
var fw5, integer;
subject to cfw5:
	fw5 == st5 + 481052*x71 + 8672*x78 + 2288*x85 + 572*x66 + 7293152*x73 + 7696832*x80 + 6889712*x87 + 1816592*x68 + 572*x75 + 8252*x82 + 7696832*x89 + 481052*x70 + 6939932*x77 + 2288*x84 + 29064992*x72 + 29064992*x79 + 7266368*x86 + 572*x67 + 572*x74 + 7696832*x81 + 7696832*x88 + 1722428*x69 + 27557948*x76 + 27557948*x83;

# node: 7 info
# c_st = max(a_fw, b_fw)
var st7, integer;
subject to cst7:
	st7 == (
0 + lw5*x71*x26 + lw5*x78*x26 + lw5*x85*x26 + lw5*x66*x26 + lw5*x73*x26 + lw5*x80*x26 + lw5*x87*x26 + lw5*x68*x26 + lw5*x75*x26 + lw5*x82*x26 + lw5*x89*x26 + lw5*x70*x26 + lw5*x77*x26 + lw5*x84*x26 + lw5*x72*x26 + lw5*x79*x26 + lw5*x86*x26 + lw5*x67*x26 + lw5*x74*x26 + lw5*x81*x26 + lw5*x88*x26 + lw5*x69*x26 + lw5*x76*x26 + lw5*x83*x26 + lw5*x71*x28 + fw5*x78*x28 + fw5*x85*x28 + lw5*x66*x28 + lw5*x73*x28 + lw5*x80*x28 + fw5*x87*x28 + lw5*x68*x28 + fw5*x75*x28 + fw5*x82*x28 + fw5*x89*x28 + lw5*x70*x28 + lw5*x77*x28 + fw5*x84*x28 + lw5*x72*x28 + fw5*x79*x28 + fw5*x86*x28 + lw5*x67*x28 + fw5*x74*x28 + lw5*x81*x28 + fw5*x88*x28 + lw5*x69*x28 + lw5*x76*x28 + fw5*x83*x28 + lw5*x71*x25 + lw5*x78*x25 + lw5*x85*x25 + lw5*x66*x25 + lw5*x73*x25 + lw5*x80*x25 + lw5*x87*x25 + lw5*x68*x25 + lw5*x75*x25 + lw5*x82*x25 + lw5*x89*x25 + lw5*x70*x25 + lw5*x77*x25 + lw5*x84*x25 + lw5*x72*x25 + lw5*x79*x25 + lw5*x86*x25 + lw5*x67*x25 + lw5*x74*x25 + lw5*x81*x25 + lw5*x88*x25 + lw5*x69*x25 + lw5*x76*x25 + lw5*x83*x25 + lw5*x71*x27 + lw5*x78*x27 + lw5*x85*x27 + lw5*x66*x27 + lw5*x73*x27 + lw5*x80*x27 + lw5*x87*x27 + lw5*x68*x27 + lw5*x75*x27 + lw5*x82*x27 + lw5*x89*x27 + lw5*x70*x27 + lw5*x77*x27 + lw5*x84*x27 + lw5*x72*x27 + lw5*x79*x27 + lw5*x86*x27 + lw5*x67*x27 + lw5*x74*x27 + lw5*x81*x27 + lw5*x88*x27 + lw5*x69*x27 + lw5*x76*x27 + lw5*x83*x27 + lw5*x71*x29 + lw5*x78*x29 + lw5*x85*x29 + lw5*x66*x29 + lw5*x73*x29 + lw5*x80*x29 + lw5*x87*x29 + lw5*x68*x29 + lw5*x75*x29 + lw5*x82*x29 + lw5*x89*x29 + lw5*x70*x29 + lw5*x77*x29 + lw5*x84*x29 + lw5*x72*x29 + lw5*x79*x29 + lw5*x86*x29 + lw5*x67*x29 + lw5*x74*x29 + lw5*x81*x29 + lw5*x88*x29 + lw5*x69*x29 + lw5*x76*x29 + lw5*x83*x29 + fw5*x71*x24 + lw5*x78*x24 + lw5*x85*x24 + fw5*x66*x24 + fw5*x73*x24 + fw5*x80*x24 + lw5*x87*x24 + fw5*x68*x24 + lw5*x75*x24 + lw5*x82*x24 + lw5*x89*x24 + fw5*x70*x24 + fw5*x77*x24 + lw5*x84*x24 + fw5*x72*x24 + lw5*x79*x24 + lw5*x86*x24 + fw5*x67*x24 + lw5*x74*x24 + fw5*x81*x24 + lw5*x88*x24 + fw5*x69*x24 + fw5*x76*x24 + lw5*x83*x24
);
# a_lr = c_st + node_c['a_lr']
var rlr5_7, integer;
subject to crlr5_7:
	rlr5_7 == st7 + 50175*x26 + 50175*x28 + 50175*x25 + 50175*x27 + 50175*x29 + 50175*x24;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep5_7, integer;
subject to cep5_7:
	ep5_7 ==  + 50175*x26 - 50175*x26 + 50175*x28 - 50175*x28 + 50175*x25 - 50175*x25 + 50175*x27 - 50175*x27 + 50175*x29 - 50175*x29 + 50175*x24 - 50175*x24;
# a_lt = max(a_lw, a_lr)
var lt5_7, integer;
subject to clt5_7:
	lt5_7 == max(rlr5_7, lw5);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw5_7, integer;
subject to clw5_7:
	lw5_7 == lt5_7 + ep5_7;
# c_et = max(c_a_et, c_b_et) + 1
var lw7, integer;
subject to clw7:
	lw7 == max(lw5_7);
# c_fw = c_st + node_c['fw']
var fw7, integer;
subject to cfw7:
	fw7 == st7 + 0*x26 + 0*x28 + 0*x25 + 0*x27 + 0*x29 + 0*x24;

# node: 8 info
# c_st = max(a_fw, b_fw)
var st8, integer;
subject to cst8:
	st8 == (
0 + lw7*x26*x59 + lw7*x28*x59 + lw7*x25*x59 + lw7*x27*x59 + fw7*x29*x59 + lw7*x24*x59 + lw7*x26*x54 + lw7*x28*x54 + lw7*x25*x54 + lw7*x27*x54 + lw7*x29*x54 + fw7*x24*x54 + fw7*x26*x56 + lw7*x28*x56 + lw7*x25*x56 + lw7*x27*x56 + lw7*x29*x56 + lw7*x24*x56 + lw7*x26*x58 + fw7*x28*x58 + lw7*x25*x58 + lw7*x27*x58 + lw7*x29*x58 + lw7*x24*x58 + lw7*x26*x55 + lw7*x28*x55 + fw7*x25*x55 + lw7*x27*x55 + lw7*x29*x55 + lw7*x24*x55 + lw7*x26*x57 + lw7*x28*x57 + lw7*x25*x57 + fw7*x27*x57 + lw7*x29*x57 + lw7*x24*x57
);
# a_lr = c_st + node_c['a_lr']
var rlr7_8, integer;
subject to crlr7_8:
	rlr7_8 == st8 + 50175*x59 + 50175*x54 + 50175*x56 + 50175*x58 + 50175*x55 + 50175*x57;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep7_8, integer;
subject to cep7_8:
	ep7_8 == 0
;
# a_lt = max(a_lw, a_lr)
var lt7_8, integer;
subject to clt7_8:
	lt7_8 == max(rlr7_8, lw7);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw7_8, integer;
subject to clw7_8:
	lw7_8 == lt7_8 + ep7_8;
# c_et = max(c_a_et, c_b_et) + 1
var lw8, integer;
subject to clw8:
	lw8 == max(lw7_8);
;

# objective function
var latency, integer;
subject to clatency:
	latency == lw8;
minimize obj: latency;
solve obj;
display x0;
display x7;
display x14;
display x21;
display x2;
display x9;
display x16;
display x23;
display x4;
display x11;
display x18;
display x6;
display x13;
display x20;
display x1;
display x8;
display x15;
display x22;
display x3;
display x10;
display x17;
display x5;
display x12;
display x19;
display x26;
display x28;
display x25;
display x27;
display x29;
display x24;
display x33;
display x35;
display x30;
display x32;
display x34;
display x31;
display x40;
display x37;
display x39;
display x41;
display x36;
display x38;
display x45;
display x47;
display x42;
display x44;
display x46;
display x43;
display x52;
display x49;
display x51;
display x53;
display x48;
display x50;
display x59;
display x54;
display x56;
display x58;
display x55;
display x57;
display x64;
display x61;
display x63;
display x65;
display x60;
display x62;
display x71;
display x78;
display x85;
display x66;
display x73;
display x80;
display x87;
display x68;
display x75;
display x82;
display x89;
display x70;
display x77;
display x84;
display x72;
display x79;
display x86;
display x67;
display x74;
display x81;
display x88;
display x69;
display x76;
display x83;
display latency;
