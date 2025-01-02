# solver type
option solver gurobi;
# variable declation and constraints
var x0, binary;
var x90, binary;
var x7, binary;
var x97, binary;
var x14, binary;
var x104, binary;
var x21, binary;
var x111, binary;
var x28, binary;
var x118, binary;
var x35, binary;
var x42, binary;
var x49, binary;
var x56, binary;
var x63, binary;
var x70, binary;
var x77, binary;
var x84, binary;
var x1, binary;
var x91, binary;
var x8, binary;
var x98, binary;
var x15, binary;
var x105, binary;
var x22, binary;
var x112, binary;
var x29, binary;
var x119, binary;
var x36, binary;
var x43, binary;
var x50, binary;
var x57, binary;
var x64, binary;
var x71, binary;
var x78, binary;
var x85, binary;
var x2, binary;
var x92, binary;
var x9, binary;
var x99, binary;
var x16, binary;
var x106, binary;
var x23, binary;
var x113, binary;
var x30, binary;
var x37, binary;
var x44, binary;
var x51, binary;
var x58, binary;
var x65, binary;
var x72, binary;
var x79, binary;
var x86, binary;
var x3, binary;
var x93, binary;
var x10, binary;
var x100, binary;
var x17, binary;
var x107, binary;
var x24, binary;
var x114, binary;
var x31, binary;
var x38, binary;
var x45, binary;
var x52, binary;
var x59, binary;
var x66, binary;
var x73, binary;
var x80, binary;
var x87, binary;
var x4, binary;
var x94, binary;
var x11, binary;
var x101, binary;
var x18, binary;
var x108, binary;
var x25, binary;
var x115, binary;
var x32, binary;
var x39, binary;
var x46, binary;
var x53, binary;
var x60, binary;
var x67, binary;
var x74, binary;
var x81, binary;
var x88, binary;
var x5, binary;
var x95, binary;
var x12, binary;
var x102, binary;
var x19, binary;
var x109, binary;
var x26, binary;
var x116, binary;
var x33, binary;
var x40, binary;
var x47, binary;
var x54, binary;
var x61, binary;
var x68, binary;
var x75, binary;
var x82, binary;
var x89, binary;
var x6, binary;
var x96, binary;
var x13, binary;
var x103, binary;
var x20, binary;
var x110, binary;
var x27, binary;
var x117, binary;
var x34, binary;
var x41, binary;
var x48, binary;
var x55, binary;
var x62, binary;
var x69, binary;
var x76, binary;
var x83, binary;
subject to c0:
	(x0 + x90 + x7 + x97 + x14 + x104 + x21 + x111 + x28 + x118 + x35 + x42 + x49 + x56 + x63 + x70 + x77 + x84 + x1 + x91 + x8 + x98 + x15 + x105 + x22 + x112 + x29 + x119 + x36 + x43 + x50 + x57 + x64 + x71 + x78 + x85 + x2 + x92 + x9 + x99 + x16 + x106 + x23 + x113 + x30 + x37 + x44 + x51 + x58 + x65 + x72 + x79 + x86 + x3 + x93 + x10 + x100 + x17 + x107 + x24 + x114 + x31 + x38 + x45 + x52 + x59 + x66 + x73 + x80 + x87 + x4 + x94 + x11 + x101 + x18 + x108 + x25 + x115 + x32 + x39 + x46 + x53 + x60 + x67 + x74 + x81 + x88 + x5 + x95 + x12 + x102 + x19 + x109 + x26 + x116 + x33 + x40 + x47 + x54 + x61 + x68 + x75 + x82 + x89 + x6 + x96 + x13 + x103 + x20 + x110 + x27 + x117 + x34 + x41 + x48 + x55 + x62 + x69 + x76 + x83) == 1;
var x123, binary;
var x125, binary;
var x120, binary;
var x122, binary;
var x124, binary;
var x121, binary;
subject to c2:
	(x123 + x125 + x120 + x122 + x124 + x121) == 1;
var x128, binary;
var x130, binary;
var x127, binary;
var x129, binary;
var x131, binary;
var x126, binary;
subject to c4:
	(x128 + x130 + x127 + x129 + x131 + x126) == 1;
var x135, binary;
var x137, binary;
var x132, binary;
var x134, binary;
var x136, binary;
var x133, binary;
subject to c1:
	(x135 + x137 + x132 + x134 + x136 + x133) == 1;
var x154, binary;
var x161, binary;
var x142, binary;
var x149, binary;
var x156, binary;
var x144, binary;
var x151, binary;
var x158, binary;
var x139, binary;
var x146, binary;
var x153, binary;
var x160, binary;
var x141, binary;
var x148, binary;
var x155, binary;
var x143, binary;
var x150, binary;
var x157, binary;
var x138, binary;
var x145, binary;
var x152, binary;
var x159, binary;
var x140, binary;
var x147, binary;
subject to c3:
	(x154 + x161 + x142 + x149 + x156 + x144 + x151 + x158 + x139 + x146 + x153 + x160 + x141 + x148 + x155 + x143 + x150 + x157 + x138 + x145 + x152 + x159 + x140 + x147) == 1;
var x163, binary;
var x165, binary;
var x167, binary;
var x162, binary;
var x164, binary;
var x166, binary;
subject to c5:
	(x163 + x165 + x167 + x162 + x164 + x166) == 1;

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
	rlr10000_2 == st2 + 0*x123 + 0*x125 + 0*x120 + 0*x122 + 0*x124 + 0*x121;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep10000_2, integer;
subject to cep10000_2:
	ep10000_2 ==  + 103967*x123 - 0*x123 + 103967*x125 - 0*x125 + 103967*x120 - 0*x120 + 103967*x122 - 0*x122 + 103967*x124 - 0*x124 + 103967*x121 - 0*x121;
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
	fw2 == st2 + 0*x123 + 0*x125 + 0*x120 + 0*x122 + 0*x124 + 0*x121;

# node: 1 info
# c_st = max(a_fw, b_fw)
var st1, integer;
subject to cst1:
	st1 == (
0 + fw2*x123*x135 + lw2*x125*x135 + lw2*x120*x135 + lw2*x122*x135 + lw2*x124*x135 + lw2*x121*x135 + lw2*x123*x137 + fw2*x125*x137 + lw2*x120*x137 + lw2*x122*x137 + lw2*x124*x137 + lw2*x121*x137 + lw2*x123*x132 + lw2*x125*x132 + fw2*x120*x132 + lw2*x122*x132 + lw2*x124*x132 + lw2*x121*x132 + lw2*x123*x134 + lw2*x125*x134 + lw2*x120*x134 + fw2*x122*x134 + lw2*x124*x134 + lw2*x121*x134 + lw2*x123*x136 + lw2*x125*x136 + lw2*x120*x136 + lw2*x122*x136 + fw2*x124*x136 + lw2*x121*x136 + lw2*x123*x133 + lw2*x125*x133 + lw2*x120*x133 + lw2*x122*x133 + lw2*x124*x133 + fw2*x121*x133
);
# a_lr = c_st + node_c['a_lr']
var rlr2_1, integer;
subject to crlr2_1:
	rlr2_1 == st1 + 103967*x135 + 103967*x137 + 103967*x132 + 103967*x134 + 103967*x136 + 103967*x133;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep2_1, integer;
subject to cep2_1:
	ep2_1 ==  + 103967*x135 - 103967*x135 + 103967*x137 - 103967*x137 + 103967*x132 - 103967*x132 + 103967*x134 - 103967*x134 + 103967*x136 - 103967*x136 + 103967*x133 - 103967*x133;
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
	fw1 == st1 + 0*x135 + 0*x137 + 0*x132 + 0*x134 + 0*x136 + 0*x133;

# node: 0 info
# c_st = max(a_fw, b_fw)
var st0, integer;
subject to cst0:
	st0 == (
0 + lw1*x135*x0 + lw1*x137*x0 + lw1*x132*x0 + lw1*x134*x0 + fw1*x136*x0 + lw1*x133*x0 + lw1*x135*x90 + lw1*x137*x90 + fw1*x132*x90 + lw1*x134*x90 + lw1*x136*x90 + lw1*x133*x90 + lw1*x135*x7 + lw1*x137*x7 + lw1*x132*x7 + fw1*x134*x7 + lw1*x136*x7 + lw1*x133*x7 + fw1*x135*x97 + lw1*x137*x97 + lw1*x132*x97 + lw1*x134*x97 + lw1*x136*x97 + lw1*x133*x97 + lw1*x135*x14 + lw1*x137*x14 + lw1*x132*x14 + fw1*x134*x14 + lw1*x136*x14 + lw1*x133*x14 + fw1*x135*x104 + lw1*x137*x104 + lw1*x132*x104 + lw1*x134*x104 + lw1*x136*x104 + lw1*x133*x104 + lw1*x135*x21 + lw1*x137*x21 + lw1*x132*x21 + fw1*x134*x21 + lw1*x136*x21 + lw1*x133*x21 + lw1*x135*x111 + lw1*x137*x111 + lw1*x132*x111 + lw1*x134*x111 + lw1*x136*x111 + fw1*x133*x111 + lw1*x135*x28 + fw1*x137*x28 + lw1*x132*x28 + lw1*x134*x28 + lw1*x136*x28 + lw1*x133*x28 + lw1*x135*x118 + lw1*x137*x118 + lw1*x132*x118 + lw1*x134*x118 + lw1*x136*x118 + fw1*x133*x118 + lw1*x135*x35 + lw1*x137*x35 + lw1*x132*x35 + lw1*x134*x35 + fw1*x136*x35 + lw1*x133*x35 + lw1*x135*x42 + lw1*x137*x42 + fw1*x132*x42 + lw1*x134*x42 + lw1*x136*x42 + lw1*x133*x42 + fw1*x135*x49 + lw1*x137*x49 + lw1*x132*x49 + lw1*x134*x49 + lw1*x136*x49 + lw1*x133*x49 + lw1*x135*x56 + fw1*x137*x56 + lw1*x132*x56 + lw1*x134*x56 + lw1*x136*x56 + lw1*x133*x56 + lw1*x135*x63 + lw1*x137*x63 + fw1*x132*x63 + lw1*x134*x63 + lw1*x136*x63 + lw1*x133*x63 + lw1*x135*x70 + lw1*x137*x70 + lw1*x132*x70 + fw1*x134*x70 + lw1*x136*x70 + lw1*x133*x70 + lw1*x135*x77 + fw1*x137*x77 + lw1*x132*x77 + lw1*x134*x77 + lw1*x136*x77 + lw1*x133*x77 + lw1*x135*x84 + lw1*x137*x84 + lw1*x132*x84 + lw1*x134*x84 + lw1*x136*x84 + fw1*x133*x84 + lw1*x135*x1 + lw1*x137*x1 + lw1*x132*x1 + lw1*x134*x1 + fw1*x136*x1 + lw1*x133*x1 + lw1*x135*x91 + lw1*x137*x91 + fw1*x132*x91 + lw1*x134*x91 + lw1*x136*x91 + lw1*x133*x91 + lw1*x135*x8 + lw1*x137*x8 + lw1*x132*x8 + lw1*x134*x8 + fw1*x136*x8 + lw1*x133*x8 + fw1*x135*x98 + lw1*x137*x98 + lw1*x132*x98 + lw1*x134*x98 + lw1*x136*x98 + lw1*x133*x98 + lw1*x135*x15 + lw1*x137*x15 + lw1*x132*x15 + fw1*x134*x15 + lw1*x136*x15 + lw1*x133*x15 + fw1*x135*x105 + lw1*x137*x105 + lw1*x132*x105 + lw1*x134*x105 + lw1*x136*x105 + lw1*x133*x105 + lw1*x135*x22 + lw1*x137*x22 + lw1*x132*x22 + fw1*x134*x22 + lw1*x136*x22 + lw1*x133*x22 + fw1*x135*x112 + lw1*x137*x112 + lw1*x132*x112 + lw1*x134*x112 + lw1*x136*x112 + lw1*x133*x112 + lw1*x135*x29 + fw1*x137*x29 + lw1*x132*x29 + lw1*x134*x29 + lw1*x136*x29 + lw1*x133*x29 + lw1*x135*x119 + lw1*x137*x119 + lw1*x132*x119 + lw1*x134*x119 + lw1*x136*x119 + fw1*x133*x119 + lw1*x135*x36 + lw1*x137*x36 + fw1*x132*x36 + lw1*x134*x36 + lw1*x136*x36 + lw1*x133*x36 + lw1*x135*x43 + lw1*x137*x43 + fw1*x132*x43 + lw1*x134*x43 + lw1*x136*x43 + lw1*x133*x43 + lw1*x135*x50 + fw1*x137*x50 + lw1*x132*x50 + lw1*x134*x50 + lw1*x136*x50 + lw1*x133*x50 + lw1*x135*x57 + fw1*x137*x57 + lw1*x132*x57 + lw1*x134*x57 + lw1*x136*x57 + lw1*x133*x57 + lw1*x135*x64 + lw1*x137*x64 + lw1*x132*x64 + lw1*x134*x64 + fw1*x136*x64 + lw1*x133*x64 + lw1*x135*x71 + lw1*x137*x71 + lw1*x132*x71 + fw1*x134*x71 + lw1*x136*x71 + lw1*x133*x71 + lw1*x135*x78 + lw1*x137*x78 + lw1*x132*x78 + lw1*x134*x78 + lw1*x136*x78 + fw1*x133*x78 + lw1*x135*x85 + lw1*x137*x85 + lw1*x132*x85 + lw1*x134*x85 + lw1*x136*x85 + fw1*x133*x85 + lw1*x135*x2 + lw1*x137*x2 + lw1*x132*x2 + lw1*x134*x2 + fw1*x136*x2 + lw1*x133*x2 + lw1*x135*x92 + lw1*x137*x92 + fw1*x132*x92 + lw1*x134*x92 + lw1*x136*x92 + lw1*x133*x92 + lw1*x135*x9 + lw1*x137*x9 + lw1*x132*x9 + lw1*x134*x9 + fw1*x136*x9 + lw1*x133*x9 + fw1*x135*x99 + lw1*x137*x99 + lw1*x132*x99 + lw1*x134*x99 + lw1*x136*x99 + lw1*x133*x99 + lw1*x135*x16 + lw1*x137*x16 + lw1*x132*x16 + lw1*x134*x16 + fw1*x136*x16 + lw1*x133*x16 + fw1*x135*x106 + lw1*x137*x106 + lw1*x132*x106 + lw1*x134*x106 + lw1*x136*x106 + lw1*x133*x106 + lw1*x135*x23 + lw1*x137*x23 + lw1*x132*x23 + fw1*x134*x23 + lw1*x136*x23 + lw1*x133*x23 + fw1*x135*x113 + lw1*x137*x113 + lw1*x132*x113 + lw1*x134*x113 + lw1*x136*x113 + lw1*x133*x113 + lw1*x135*x30 + lw1*x137*x30 + fw1*x132*x30 + lw1*x134*x30 + lw1*x136*x30 + lw1*x133*x30 + lw1*x135*x37 + lw1*x137*x37 + fw1*x132*x37 + lw1*x134*x37 + lw1*x136*x37 + lw1*x133*x37 + lw1*x135*x44 + lw1*x137*x44 + lw1*x132*x44 + fw1*x134*x44 + lw1*x136*x44 + lw1*x133*x44 + lw1*x135*x51 + fw1*x137*x51 + lw1*x132*x51 + lw1*x134*x51 + lw1*x136*x51 + lw1*x133*x51 + lw1*x135*x58 + fw1*x137*x58 + lw1*x132*x58 + lw1*x134*x58 + lw1*x136*x58 + lw1*x133*x58 + lw1*x135*x65 + lw1*x137*x65 + lw1*x132*x65 + lw1*x134*x65 + fw1*x136*x65 + lw1*x133*x65 + fw1*x135*x72 + lw1*x137*x72 + lw1*x132*x72 + lw1*x134*x72 + lw1*x136*x72 + lw1*x133*x72 + lw1*x135*x79 + lw1*x137*x79 + lw1*x132*x79 + lw1*x134*x79 + lw1*x136*x79 + fw1*x133*x79 + lw1*x135*x86 + lw1*x137*x86 + lw1*x132*x86 + lw1*x134*x86 + lw1*x136*x86 + fw1*x133*x86 + lw1*x135*x3 + lw1*x137*x3 + lw1*x132*x3 + lw1*x134*x3 + fw1*x136*x3 + lw1*x133*x3 + lw1*x135*x93 + lw1*x137*x93 + fw1*x132*x93 + lw1*x134*x93 + lw1*x136*x93 + lw1*x133*x93 + lw1*x135*x10 + lw1*x137*x10 + lw1*x132*x10 + lw1*x134*x10 + fw1*x136*x10 + lw1*x133*x10 + fw1*x135*x100 + lw1*x137*x100 + lw1*x132*x100 + lw1*x134*x100 + lw1*x136*x100 + lw1*x133*x100 + lw1*x135*x17 + lw1*x137*x17 + lw1*x132*x17 + lw1*x134*x17 + fw1*x136*x17 + lw1*x133*x17 + fw1*x135*x107 + lw1*x137*x107 + lw1*x132*x107 + lw1*x134*x107 + lw1*x136*x107 + lw1*x133*x107 + lw1*x135*x24 + fw1*x137*x24 + lw1*x132*x24 + lw1*x134*x24 + lw1*x136*x24 + lw1*x133*x24 + lw1*x135*x114 + lw1*x137*x114 + lw1*x132*x114 + lw1*x134*x114 + lw1*x136*x114 + fw1*x133*x114 + lw1*x135*x31 + lw1*x137*x31 + fw1*x132*x31 + lw1*x134*x31 + lw1*x136*x31 + lw1*x133*x31 + lw1*x135*x38 + lw1*x137*x38 + lw1*x132*x38 + fw1*x134*x38 + lw1*x136*x38 + lw1*x133*x38 + lw1*x135*x45 + lw1*x137*x45 + lw1*x132*x45 + fw1*x134*x45 + lw1*x136*x45 + lw1*x133*x45 + lw1*x135*x52 + fw1*x137*x52 + lw1*x132*x52 + lw1*x134*x52 + lw1*x136*x52 + lw1*x133*x52 + lw1*x135*x59 + fw1*x137*x59 + lw1*x132*x59 + lw1*x134*x59 + lw1*x136*x59 + lw1*x133*x59 + lw1*x135*x66 + lw1*x137*x66 + fw1*x132*x66 + lw1*x134*x66 + lw1*x136*x66 + lw1*x133*x66 + fw1*x135*x73 + lw1*x137*x73 + lw1*x132*x73 + lw1*x134*x73 + lw1*x136*x73 + lw1*x133*x73 + fw1*x135*x80 + lw1*x137*x80 + lw1*x132*x80 + lw1*x134*x80 + lw1*x136*x80 + lw1*x133*x80 + lw1*x135*x87 + lw1*x137*x87 + lw1*x132*x87 + lw1*x134*x87 + lw1*x136*x87 + fw1*x133*x87 + lw1*x135*x4 + lw1*x137*x4 + lw1*x132*x4 + lw1*x134*x4 + fw1*x136*x4 + lw1*x133*x4 + lw1*x135*x94 + lw1*x137*x94 + fw1*x132*x94 + lw1*x134*x94 + lw1*x136*x94 + lw1*x133*x94 + lw1*x135*x11 + lw1*x137*x11 + lw1*x132*x11 + lw1*x134*x11 + fw1*x136*x11 + lw1*x133*x11 + fw1*x135*x101 + lw1*x137*x101 + lw1*x132*x101 + lw1*x134*x101 + lw1*x136*x101 + lw1*x133*x101 + lw1*x135*x18 + lw1*x137*x18 + lw1*x132*x18 + fw1*x134*x18 + lw1*x136*x18 + lw1*x133*x18 + lw1*x135*x108 + lw1*x137*x108 + lw1*x132*x108 + lw1*x134*x108 + lw1*x136*x108 + fw1*x133*x108 + lw1*x135*x25 + fw1*x137*x25 + lw1*x132*x25 + lw1*x134*x25 + lw1*x136*x25 + lw1*x133*x25 + lw1*x135*x115 + lw1*x137*x115 + lw1*x132*x115 + lw1*x134*x115 + lw1*x136*x115 + fw1*x133*x115 + lw1*x135*x32 + lw1*x137*x32 + lw1*x132*x32 + lw1*x134*x32 + fw1*x136*x32 + lw1*x133*x32 + lw1*x135*x39 + lw1*x137*x39 + lw1*x132*x39 + fw1*x134*x39 + lw1*x136*x39 + lw1*x133*x39 + lw1*x135*x46 + lw1*x137*x46 + lw1*x132*x46 + fw1*x134*x46 + lw1*x136*x46 + lw1*x133*x46 + lw1*x135*x53 + fw1*x137*x53 + lw1*x132*x53 + lw1*x134*x53 + lw1*x136*x53 + lw1*x133*x53 + lw1*x135*x60 + lw1*x137*x60 + fw1*x132*x60 + lw1*x134*x60 + lw1*x136*x60 + lw1*x133*x60 + lw1*x135*x67 + lw1*x137*x67 + fw1*x132*x67 + lw1*x134*x67 + lw1*x136*x67 + lw1*x133*x67 + fw1*x135*x74 + lw1*x137*x74 + lw1*x132*x74 + lw1*x134*x74 + lw1*x136*x74 + lw1*x133*x74 + fw1*x135*x81 + lw1*x137*x81 + lw1*x132*x81 + lw1*x134*x81 + lw1*x136*x81 + lw1*x133*x81 + lw1*x135*x88 + fw1*x137*x88 + lw1*x132*x88 + lw1*x134*x88 + lw1*x136*x88 + lw1*x133*x88 + lw1*x135*x5 + lw1*x137*x5 + lw1*x132*x5 + lw1*x134*x5 + fw1*x136*x5 + lw1*x133*x5 + lw1*x135*x95 + lw1*x137*x95 + fw1*x132*x95 + lw1*x134*x95 + lw1*x136*x95 + lw1*x133*x95 + lw1*x135*x12 + lw1*x137*x12 + lw1*x132*x12 + fw1*x134*x12 + lw1*x136*x12 + lw1*x133*x12 + lw1*x135*x102 + lw1*x137*x102 + lw1*x132*x102 + lw1*x134*x102 + lw1*x136*x102 + fw1*x133*x102 + lw1*x135*x19 + lw1*x137*x19 + lw1*x132*x19 + fw1*x134*x19 + lw1*x136*x19 + lw1*x133*x19 + lw1*x135*x109 + lw1*x137*x109 + lw1*x132*x109 + lw1*x134*x109 + lw1*x136*x109 + fw1*x133*x109 + lw1*x135*x26 + fw1*x137*x26 + lw1*x132*x26 + lw1*x134*x26 + lw1*x136*x26 + lw1*x133*x26 + lw1*x135*x116 + lw1*x137*x116 + lw1*x132*x116 + lw1*x134*x116 + lw1*x136*x116 + fw1*x133*x116 + lw1*x135*x33 + lw1*x137*x33 + lw1*x132*x33 + lw1*x134*x33 + fw1*x136*x33 + lw1*x133*x33 + lw1*x135*x40 + lw1*x137*x40 + lw1*x132*x40 + lw1*x134*x40 + fw1*x136*x40 + lw1*x133*x40 + lw1*x135*x47 + lw1*x137*x47 + lw1*x132*x47 + fw1*x134*x47 + lw1*x136*x47 + lw1*x133*x47 + lw1*x135*x54 + lw1*x137*x54 + lw1*x132*x54 + lw1*x134*x54 + lw1*x136*x54 + fw1*x133*x54 + lw1*x135*x61 + lw1*x137*x61 + fw1*x132*x61 + lw1*x134*x61 + lw1*x136*x61 + lw1*x133*x61 + lw1*x135*x68 + lw1*x137*x68 + fw1*x132*x68 + lw1*x134*x68 + lw1*x136*x68 + lw1*x133*x68 + fw1*x135*x75 + lw1*x137*x75 + lw1*x132*x75 + lw1*x134*x75 + lw1*x136*x75 + lw1*x133*x75 + lw1*x135*x82 + fw1*x137*x82 + lw1*x132*x82 + lw1*x134*x82 + lw1*x136*x82 + lw1*x133*x82 + lw1*x135*x89 + fw1*x137*x89 + lw1*x132*x89 + lw1*x134*x89 + lw1*x136*x89 + lw1*x133*x89 + lw1*x135*x6 + lw1*x137*x6 + lw1*x132*x6 + fw1*x134*x6 + lw1*x136*x6 + lw1*x133*x6 + fw1*x135*x96 + lw1*x137*x96 + lw1*x132*x96 + lw1*x134*x96 + lw1*x136*x96 + lw1*x133*x96 + lw1*x135*x13 + lw1*x137*x13 + lw1*x132*x13 + fw1*x134*x13 + lw1*x136*x13 + lw1*x133*x13 + lw1*x135*x103 + lw1*x137*x103 + lw1*x132*x103 + lw1*x134*x103 + lw1*x136*x103 + fw1*x133*x103 + lw1*x135*x20 + lw1*x137*x20 + lw1*x132*x20 + fw1*x134*x20 + lw1*x136*x20 + lw1*x133*x20 + lw1*x135*x110 + lw1*x137*x110 + lw1*x132*x110 + lw1*x134*x110 + lw1*x136*x110 + fw1*x133*x110 + lw1*x135*x27 + fw1*x137*x27 + lw1*x132*x27 + lw1*x134*x27 + lw1*x136*x27 + lw1*x133*x27 + lw1*x135*x117 + lw1*x137*x117 + lw1*x132*x117 + lw1*x134*x117 + lw1*x136*x117 + fw1*x133*x117 + lw1*x135*x34 + lw1*x137*x34 + lw1*x132*x34 + lw1*x134*x34 + fw1*x136*x34 + lw1*x133*x34 + lw1*x135*x41 + lw1*x137*x41 + lw1*x132*x41 + lw1*x134*x41 + fw1*x136*x41 + lw1*x133*x41 + fw1*x135*x48 + lw1*x137*x48 + lw1*x132*x48 + lw1*x134*x48 + lw1*x136*x48 + lw1*x133*x48 + lw1*x135*x55 + lw1*x137*x55 + lw1*x132*x55 + lw1*x134*x55 + lw1*x136*x55 + fw1*x133*x55 + lw1*x135*x62 + lw1*x137*x62 + fw1*x132*x62 + lw1*x134*x62 + lw1*x136*x62 + lw1*x133*x62 + lw1*x135*x69 + lw1*x137*x69 + fw1*x132*x69 + lw1*x134*x69 + lw1*x136*x69 + lw1*x133*x69 + lw1*x135*x76 + fw1*x137*x76 + lw1*x132*x76 + lw1*x134*x76 + lw1*x136*x76 + lw1*x133*x76 + lw1*x135*x83 + fw1*x137*x83 + lw1*x132*x83 + lw1*x134*x83 + lw1*x136*x83 + lw1*x133*x83
);
# a_lr = c_st + node_c['a_lr']
var rlr1_0, integer;
subject to crlr1_0:
	rlr1_0 == st0 + 3742812*x0 + 831743*x90 + 3742812*x7 + 934799*x97 + 3720948*x14 + 311675*x104 + 930011*x21 + 311675*x111 + 935647*x28 + 103967*x118 + 311887*x35 + 934799*x42 + 3742812*x49 + 1247604*x56 + 1247604*x63 + 103967*x70 + 928415*x77 + 3430932*x84 + 3742812*x1 + 831743*x91 + 3720948*x8 + 930011*x98 + 3720948*x15 + 311675*x105 + 928415*x22 + 103967*x112 + 935647*x29 + 103967*x119 + 3740100*x36 + 934799*x43 + 3720948*x50 + 1247604*x57 + 103967*x64 + 103967*x71 + 3740100*x78 + 3430932*x85 + 3742644*x2 + 285911*x92 + 3720948*x9 + 930011*x99 + 928415*x16 + 310079*x106 + 928415*x23 + 103967*x113 + 3742812*x30 + 3740100*x37 + 311675*x44 + 3720948*x51 + 311887*x58 + 103967*x65 + 3740100*x72 + 3740100*x79 + 1247604*x86 + 3742644*x3 + 285911*x93 + 930223*x10 + 928415*x100 + 928415*x17 + 310079*x107 + 3742812*x24 + 831743*x114 + 3742812*x31 + 1247604*x38 + 311675*x45 + 930223*x52 + 311887*x59 + 857507*x66 + 3740100*x73 + 1247604*x80 + 1247604*x87 + 935647*x4 + 103967*x94 + 930223*x11 + 928415*x101 + 934799*x18 + 857507*x108 + 3742812*x25 + 831743*x115 + 1247604*x32 + 1247604*x39 + 310079*x46 + 930223*x53 + 3430932*x60 + 857507*x67 + 3720948*x74 + 1247604*x81 + 103967*x88 + 935647*x5 + 103967*x95 + 3740100*x12 + 934799*x102 + 934799*x19 + 857507*x109 + 3742644*x26 + 285911*x116 + 1247604*x33 + 310079*x40 + 310079*x47 + 3742812*x54 + 3430932*x61 + 311675*x68 + 3720948*x75 + 310079*x82 + 103967*x89 + 3742812*x6 + 934799*x96 + 3740100*x13 + 934799*x103 + 930011*x20 + 311675*x110 + 3742644*x27 + 285911*x117 + 311887*x34 + 310079*x41 + 3742812*x48 + 3742812*x55 + 1247604*x62 + 311675*x69 + 928415*x76 + 310079*x83;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep1_0, integer;
subject to cep1_0:
	ep1_0 ==  + 3742844*x0 - 3742812*x0 + 935711*x90 - 831743*x90 + 3742844*x7 - 3742812*x7 + 935711*x97 - 934799*x97 + 3742844*x14 - 3720948*x14 + 935711*x104 - 311675*x104 + 935711*x21 - 930011*x21 + 935711*x111 - 311675*x111 + 935711*x28 - 935647*x28 + 935711*x118 - 103967*x118 + 935711*x35 - 311887*x35 + 935711*x42 - 934799*x42 + 3742844*x49 - 3742812*x49 + 3742844*x56 - 1247604*x56 + 3742844*x63 - 1247604*x63 + 935711*x70 - 103967*x70 + 935711*x77 - 928415*x77 + 3742844*x84 - 3430932*x84 + 3742844*x1 - 3742812*x1 + 935711*x91 - 831743*x91 + 3742844*x8 - 3720948*x8 + 935711*x98 - 930011*x98 + 3742844*x15 - 3720948*x15 + 935711*x105 - 311675*x105 + 935711*x22 - 928415*x22 + 935711*x112 - 103967*x112 + 935711*x29 - 935647*x29 + 935711*x119 - 103967*x119 + 3742844*x36 - 3740100*x36 + 935711*x43 - 934799*x43 + 3742844*x50 - 3720948*x50 + 3742844*x57 - 1247604*x57 + 935711*x64 - 103967*x64 + 935711*x71 - 103967*x71 + 3742844*x78 - 3740100*x78 + 3742844*x85 - 3430932*x85 + 3742844*x2 - 3742644*x2 + 935711*x92 - 285911*x92 + 3742844*x9 - 3720948*x9 + 935711*x99 - 930011*x99 + 935711*x16 - 928415*x16 + 935711*x106 - 310079*x106 + 935711*x23 - 928415*x23 + 935711*x113 - 103967*x113 + 3742844*x30 - 3742812*x30 + 3742844*x37 - 3740100*x37 + 935711*x44 - 311675*x44 + 3742844*x51 - 3720948*x51 + 935711*x58 - 311887*x58 + 935711*x65 - 103967*x65 + 3742844*x72 - 3740100*x72 + 3742844*x79 - 3740100*x79 + 3742844*x86 - 1247604*x86 + 3742844*x3 - 3742644*x3 + 935711*x93 - 285911*x93 + 935711*x10 - 930223*x10 + 935711*x100 - 928415*x100 + 935711*x17 - 928415*x17 + 935711*x107 - 310079*x107 + 3742844*x24 - 3742812*x24 + 935711*x114 - 831743*x114 + 3742844*x31 - 3742812*x31 + 3742844*x38 - 1247604*x38 + 935711*x45 - 311675*x45 + 935711*x52 - 930223*x52 + 935711*x59 - 311887*x59 + 935711*x66 - 857507*x66 + 3742844*x73 - 3740100*x73 + 3742844*x80 - 1247604*x80 + 3742844*x87 - 1247604*x87 + 935711*x4 - 935647*x4 + 935711*x94 - 103967*x94 + 935711*x11 - 930223*x11 + 935711*x101 - 928415*x101 + 935711*x18 - 934799*x18 + 935711*x108 - 857507*x108 + 3742844*x25 - 3742812*x25 + 935711*x115 - 831743*x115 + 3742844*x32 - 1247604*x32 + 3742844*x39 - 1247604*x39 + 935711*x46 - 310079*x46 + 935711*x53 - 930223*x53 + 3742844*x60 - 3430932*x60 + 935711*x67 - 857507*x67 + 3742844*x74 - 3720948*x74 + 3742844*x81 - 1247604*x81 + 935711*x88 - 103967*x88 + 935711*x5 - 935647*x5 + 935711*x95 - 103967*x95 + 3742844*x12 - 3740100*x12 + 935711*x102 - 934799*x102 + 935711*x19 - 934799*x19 + 935711*x109 - 857507*x109 + 3742844*x26 - 3742644*x26 + 935711*x116 - 285911*x116 + 3742844*x33 - 1247604*x33 + 935711*x40 - 310079*x40 + 935711*x47 - 310079*x47 + 3742844*x54 - 3742812*x54 + 3742844*x61 - 3430932*x61 + 935711*x68 - 311675*x68 + 3742844*x75 - 3720948*x75 + 935711*x82 - 310079*x82 + 935711*x89 - 103967*x89 + 3742844*x6 - 3742812*x6 + 935711*x96 - 934799*x96 + 3742844*x13 - 3740100*x13 + 935711*x103 - 934799*x103 + 935711*x20 - 930011*x20 + 935711*x110 - 311675*x110 + 3742844*x27 - 3742644*x27 + 935711*x117 - 285911*x117 + 935711*x34 - 311887*x34 + 935711*x41 - 310079*x41 + 3742844*x48 - 3742812*x48 + 3742844*x55 - 3742812*x55 + 3742844*x62 - 1247604*x62 + 935711*x69 - 311675*x69 + 935711*x76 - 928415*x76 + 935711*x83 - 310079*x83;
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
	fw0 == st0 + 32*x0 + 103968*x90 + 32*x7 + 912*x97 + 21896*x14 + 624036*x104 + 5700*x21 + 624036*x111 + 64*x28 + 831744*x118 + 623824*x35 + 912*x42 + 32*x49 + 2495240*x56 + 2495240*x63 + 831744*x70 + 7296*x77 + 311912*x84 + 32*x1 + 103968*x91 + 21896*x8 + 5700*x98 + 21896*x15 + 624036*x105 + 7296*x22 + 831744*x112 + 64*x29 + 831744*x119 + 2744*x36 + 912*x43 + 21896*x50 + 2495240*x57 + 831744*x64 + 831744*x71 + 2744*x78 + 311912*x85 + 200*x2 + 649800*x92 + 21896*x9 + 5700*x99 + 7296*x16 + 625632*x106 + 7296*x23 + 831744*x113 + 32*x30 + 2744*x37 + 624036*x44 + 21896*x51 + 623824*x58 + 831744*x65 + 2744*x72 + 2744*x79 + 2495240*x86 + 200*x3 + 649800*x93 + 5488*x10 + 7296*x100 + 7296*x17 + 625632*x107 + 32*x24 + 103968*x114 + 32*x31 + 2495240*x38 + 624036*x45 + 5488*x52 + 623824*x59 + 78204*x66 + 2744*x73 + 2495240*x80 + 2495240*x87 + 64*x4 + 831744*x94 + 5488*x11 + 7296*x101 + 912*x18 + 78204*x108 + 32*x25 + 103968*x115 + 2495240*x32 + 2495240*x39 + 625632*x46 + 5488*x53 + 311912*x60 + 78204*x67 + 21896*x74 + 2495240*x81 + 831744*x88 + 64*x5 + 831744*x95 + 2744*x12 + 912*x102 + 912*x19 + 78204*x109 + 200*x26 + 649800*x116 + 2495240*x33 + 625632*x40 + 625632*x47 + 32*x54 + 311912*x61 + 624036*x68 + 21896*x75 + 625632*x82 + 831744*x89 + 32*x6 + 912*x96 + 2744*x13 + 912*x103 + 5700*x20 + 624036*x110 + 200*x27 + 649800*x117 + 623824*x34 + 625632*x41 + 32*x48 + 32*x55 + 2495240*x62 + 624036*x69 + 7296*x76 + 625632*x83;

# node: 3 info
# c_st = max(a_fw, b_fw)
var st3, integer;
subject to cst3:
	st3 == (
0 + lw0*x0*x154 + lw0*x90*x154 + lw0*x7*x154 + fw0*x97*x154 + lw0*x14*x154 + fw0*x104*x154 + lw0*x21*x154 + lw0*x111*x154 + lw0*x28*x154 + lw0*x118*x154 + lw0*x35*x154 + lw0*x42*x154 + fw0*x49*x154 + lw0*x56*x154 + lw0*x63*x154 + lw0*x70*x154 + lw0*x77*x154 + lw0*x84*x154 + lw0*x1*x154 + lw0*x91*x154 + lw0*x8*x154 + fw0*x98*x154 + lw0*x15*x154 + fw0*x105*x154 + lw0*x22*x154 + fw0*x112*x154 + lw0*x29*x154 + lw0*x119*x154 + lw0*x36*x154 + lw0*x43*x154 + lw0*x50*x154 + lw0*x57*x154 + lw0*x64*x154 + lw0*x71*x154 + lw0*x78*x154 + lw0*x85*x154 + lw0*x2*x154 + lw0*x92*x154 + lw0*x9*x154 + fw0*x99*x154 + lw0*x16*x154 + fw0*x106*x154 + lw0*x23*x154 + fw0*x113*x154 + lw0*x30*x154 + lw0*x37*x154 + lw0*x44*x154 + lw0*x51*x154 + lw0*x58*x154 + lw0*x65*x154 + fw0*x72*x154 + lw0*x79*x154 + lw0*x86*x154 + lw0*x3*x154 + lw0*x93*x154 + lw0*x10*x154 + fw0*x100*x154 + lw0*x17*x154 + fw0*x107*x154 + lw0*x24*x154 + lw0*x114*x154 + lw0*x31*x154 + lw0*x38*x154 + lw0*x45*x154 + lw0*x52*x154 + lw0*x59*x154 + lw0*x66*x154 + fw0*x73*x154 + fw0*x80*x154 + lw0*x87*x154 + lw0*x4*x154 + lw0*x94*x154 + lw0*x11*x154 + fw0*x101*x154 + lw0*x18*x154 + lw0*x108*x154 + lw0*x25*x154 + lw0*x115*x154 + lw0*x32*x154 + lw0*x39*x154 + lw0*x46*x154 + lw0*x53*x154 + lw0*x60*x154 + lw0*x67*x154 + fw0*x74*x154 + fw0*x81*x154 + lw0*x88*x154 + lw0*x5*x154 + lw0*x95*x154 + lw0*x12*x154 + lw0*x102*x154 + lw0*x19*x154 + lw0*x109*x154 + lw0*x26*x154 + lw0*x116*x154 + lw0*x33*x154 + lw0*x40*x154 + lw0*x47*x154 + lw0*x54*x154 + lw0*x61*x154 + lw0*x68*x154 + fw0*x75*x154 + lw0*x82*x154 + lw0*x89*x154 + lw0*x6*x154 + fw0*x96*x154 + lw0*x13*x154 + lw0*x103*x154 + lw0*x20*x154 + lw0*x110*x154 + lw0*x27*x154 + lw0*x117*x154 + lw0*x34*x154 + lw0*x41*x154 + fw0*x48*x154 + lw0*x55*x154 + lw0*x62*x154 + lw0*x69*x154 + lw0*x76*x154 + lw0*x83*x154 + lw0*x0*x161 + lw0*x90*x161 + lw0*x7*x161 + lw0*x97*x161 + lw0*x14*x161 + lw0*x104*x161 + lw0*x21*x161 + fw0*x111*x161 + lw0*x28*x161 + fw0*x118*x161 + lw0*x35*x161 + lw0*x42*x161 + lw0*x49*x161 + lw0*x56*x161 + lw0*x63*x161 + lw0*x70*x161 + lw0*x77*x161 + fw0*x84*x161 + lw0*x1*x161 + lw0*x91*x161 + lw0*x8*x161 + lw0*x98*x161 + lw0*x15*x161 + lw0*x105*x161 + lw0*x22*x161 + lw0*x112*x161 + lw0*x29*x161 + fw0*x119*x161 + lw0*x36*x161 + lw0*x43*x161 + lw0*x50*x161 + lw0*x57*x161 + lw0*x64*x161 + lw0*x71*x161 + fw0*x78*x161 + fw0*x85*x161 + lw0*x2*x161 + lw0*x92*x161 + lw0*x9*x161 + lw0*x99*x161 + lw0*x16*x161 + lw0*x106*x161 + lw0*x23*x161 + lw0*x113*x161 + lw0*x30*x161 + lw0*x37*x161 + lw0*x44*x161 + lw0*x51*x161 + lw0*x58*x161 + lw0*x65*x161 + lw0*x72*x161 + fw0*x79*x161 + fw0*x86*x161 + lw0*x3*x161 + lw0*x93*x161 + lw0*x10*x161 + lw0*x100*x161 + lw0*x17*x161 + lw0*x107*x161 + lw0*x24*x161 + fw0*x114*x161 + lw0*x31*x161 + lw0*x38*x161 + lw0*x45*x161 + lw0*x52*x161 + lw0*x59*x161 + lw0*x66*x161 + lw0*x73*x161 + lw0*x80*x161 + fw0*x87*x161 + lw0*x4*x161 + lw0*x94*x161 + lw0*x11*x161 + lw0*x101*x161 + lw0*x18*x161 + fw0*x108*x161 + lw0*x25*x161 + fw0*x115*x161 + lw0*x32*x161 + lw0*x39*x161 + lw0*x46*x161 + lw0*x53*x161 + lw0*x60*x161 + lw0*x67*x161 + lw0*x74*x161 + lw0*x81*x161 + lw0*x88*x161 + lw0*x5*x161 + lw0*x95*x161 + lw0*x12*x161 + fw0*x102*x161 + lw0*x19*x161 + fw0*x109*x161 + lw0*x26*x161 + fw0*x116*x161 + lw0*x33*x161 + lw0*x40*x161 + lw0*x47*x161 + fw0*x54*x161 + lw0*x61*x161 + lw0*x68*x161 + lw0*x75*x161 + lw0*x82*x161 + lw0*x89*x161 + lw0*x6*x161 + lw0*x96*x161 + lw0*x13*x161 + fw0*x103*x161 + lw0*x20*x161 + fw0*x110*x161 + lw0*x27*x161 + fw0*x117*x161 + lw0*x34*x161 + lw0*x41*x161 + lw0*x48*x161 + fw0*x55*x161 + lw0*x62*x161 + lw0*x69*x161 + lw0*x76*x161 + lw0*x83*x161 + lw0*x0*x142 + lw0*x90*x142 + lw0*x7*x142 + fw0*x97*x142 + lw0*x14*x142 + fw0*x104*x142 + lw0*x21*x142 + lw0*x111*x142 + lw0*x28*x142 + lw0*x118*x142 + lw0*x35*x142 + lw0*x42*x142 + fw0*x49*x142 + lw0*x56*x142 + lw0*x63*x142 + lw0*x70*x142 + lw0*x77*x142 + lw0*x84*x142 + lw0*x1*x142 + lw0*x91*x142 + lw0*x8*x142 + fw0*x98*x142 + lw0*x15*x142 + fw0*x105*x142 + lw0*x22*x142 + fw0*x112*x142 + lw0*x29*x142 + lw0*x119*x142 + lw0*x36*x142 + lw0*x43*x142 + lw0*x50*x142 + lw0*x57*x142 + lw0*x64*x142 + lw0*x71*x142 + lw0*x78*x142 + lw0*x85*x142 + lw0*x2*x142 + lw0*x92*x142 + lw0*x9*x142 + fw0*x99*x142 + lw0*x16*x142 + fw0*x106*x142 + lw0*x23*x142 + fw0*x113*x142 + lw0*x30*x142 + lw0*x37*x142 + lw0*x44*x142 + lw0*x51*x142 + lw0*x58*x142 + lw0*x65*x142 + fw0*x72*x142 + lw0*x79*x142 + lw0*x86*x142 + lw0*x3*x142 + lw0*x93*x142 + lw0*x10*x142 + fw0*x100*x142 + lw0*x17*x142 + fw0*x107*x142 + lw0*x24*x142 + lw0*x114*x142 + lw0*x31*x142 + lw0*x38*x142 + lw0*x45*x142 + lw0*x52*x142 + lw0*x59*x142 + lw0*x66*x142 + fw0*x73*x142 + fw0*x80*x142 + lw0*x87*x142 + lw0*x4*x142 + lw0*x94*x142 + lw0*x11*x142 + fw0*x101*x142 + lw0*x18*x142 + lw0*x108*x142 + lw0*x25*x142 + lw0*x115*x142 + lw0*x32*x142 + lw0*x39*x142 + lw0*x46*x142 + lw0*x53*x142 + lw0*x60*x142 + lw0*x67*x142 + fw0*x74*x142 + fw0*x81*x142 + lw0*x88*x142 + lw0*x5*x142 + lw0*x95*x142 + lw0*x12*x142 + lw0*x102*x142 + lw0*x19*x142 + lw0*x109*x142 + lw0*x26*x142 + lw0*x116*x142 + lw0*x33*x142 + lw0*x40*x142 + lw0*x47*x142 + lw0*x54*x142 + lw0*x61*x142 + lw0*x68*x142 + fw0*x75*x142 + lw0*x82*x142 + lw0*x89*x142 + lw0*x6*x142 + fw0*x96*x142 + lw0*x13*x142 + lw0*x103*x142 + lw0*x20*x142 + lw0*x110*x142 + lw0*x27*x142 + lw0*x117*x142 + lw0*x34*x142 + lw0*x41*x142 + fw0*x48*x142 + lw0*x55*x142 + lw0*x62*x142 + lw0*x69*x142 + lw0*x76*x142 + lw0*x83*x142 + lw0*x0*x149 + lw0*x90*x149 + lw0*x7*x149 + lw0*x97*x149 + lw0*x14*x149 + lw0*x104*x149 + lw0*x21*x149 + fw0*x111*x149 + lw0*x28*x149 + fw0*x118*x149 + lw0*x35*x149 + lw0*x42*x149 + lw0*x49*x149 + lw0*x56*x149 + lw0*x63*x149 + lw0*x70*x149 + lw0*x77*x149 + fw0*x84*x149 + lw0*x1*x149 + lw0*x91*x149 + lw0*x8*x149 + lw0*x98*x149 + lw0*x15*x149 + lw0*x105*x149 + lw0*x22*x149 + lw0*x112*x149 + lw0*x29*x149 + fw0*x119*x149 + lw0*x36*x149 + lw0*x43*x149 + lw0*x50*x149 + lw0*x57*x149 + lw0*x64*x149 + lw0*x71*x149 + fw0*x78*x149 + fw0*x85*x149 + lw0*x2*x149 + lw0*x92*x149 + lw0*x9*x149 + lw0*x99*x149 + lw0*x16*x149 + lw0*x106*x149 + lw0*x23*x149 + lw0*x113*x149 + lw0*x30*x149 + lw0*x37*x149 + lw0*x44*x149 + lw0*x51*x149 + lw0*x58*x149 + lw0*x65*x149 + lw0*x72*x149 + fw0*x79*x149 + fw0*x86*x149 + lw0*x3*x149 + lw0*x93*x149 + lw0*x10*x149 + lw0*x100*x149 + lw0*x17*x149 + lw0*x107*x149 + lw0*x24*x149 + fw0*x114*x149 + lw0*x31*x149 + lw0*x38*x149 + lw0*x45*x149 + lw0*x52*x149 + lw0*x59*x149 + lw0*x66*x149 + lw0*x73*x149 + lw0*x80*x149 + fw0*x87*x149 + lw0*x4*x149 + lw0*x94*x149 + lw0*x11*x149 + lw0*x101*x149 + lw0*x18*x149 + fw0*x108*x149 + lw0*x25*x149 + fw0*x115*x149 + lw0*x32*x149 + lw0*x39*x149 + lw0*x46*x149 + lw0*x53*x149 + lw0*x60*x149 + lw0*x67*x149 + lw0*x74*x149 + lw0*x81*x149 + lw0*x88*x149 + lw0*x5*x149 + lw0*x95*x149 + lw0*x12*x149 + fw0*x102*x149 + lw0*x19*x149 + fw0*x109*x149 + lw0*x26*x149 + fw0*x116*x149 + lw0*x33*x149 + lw0*x40*x149 + lw0*x47*x149 + fw0*x54*x149 + lw0*x61*x149 + lw0*x68*x149 + lw0*x75*x149 + lw0*x82*x149 + lw0*x89*x149 + lw0*x6*x149 + lw0*x96*x149 + lw0*x13*x149 + fw0*x103*x149 + lw0*x20*x149 + fw0*x110*x149 + lw0*x27*x149 + fw0*x117*x149 + lw0*x34*x149 + lw0*x41*x149 + lw0*x48*x149 + fw0*x55*x149 + lw0*x62*x149 + lw0*x69*x149 + lw0*x76*x149 + lw0*x83*x149 + fw0*x0*x156 + lw0*x90*x156 + lw0*x7*x156 + lw0*x97*x156 + lw0*x14*x156 + lw0*x104*x156 + lw0*x21*x156 + lw0*x111*x156 + lw0*x28*x156 + lw0*x118*x156 + fw0*x35*x156 + lw0*x42*x156 + lw0*x49*x156 + lw0*x56*x156 + lw0*x63*x156 + lw0*x70*x156 + lw0*x77*x156 + lw0*x84*x156 + fw0*x1*x156 + lw0*x91*x156 + fw0*x8*x156 + lw0*x98*x156 + lw0*x15*x156 + lw0*x105*x156 + lw0*x22*x156 + lw0*x112*x156 + lw0*x29*x156 + lw0*x119*x156 + lw0*x36*x156 + lw0*x43*x156 + lw0*x50*x156 + lw0*x57*x156 + fw0*x64*x156 + lw0*x71*x156 + lw0*x78*x156 + lw0*x85*x156 + fw0*x2*x156 + lw0*x92*x156 + fw0*x9*x156 + lw0*x99*x156 + fw0*x16*x156 + lw0*x106*x156 + lw0*x23*x156 + lw0*x113*x156 + lw0*x30*x156 + lw0*x37*x156 + lw0*x44*x156 + lw0*x51*x156 + lw0*x58*x156 + fw0*x65*x156 + lw0*x72*x156 + lw0*x79*x156 + lw0*x86*x156 + fw0*x3*x156 + lw0*x93*x156 + fw0*x10*x156 + lw0*x100*x156 + fw0*x17*x156 + lw0*x107*x156 + lw0*x24*x156 + lw0*x114*x156 + lw0*x31*x156 + lw0*x38*x156 + lw0*x45*x156 + lw0*x52*x156 + lw0*x59*x156 + lw0*x66*x156 + lw0*x73*x156 + lw0*x80*x156 + lw0*x87*x156 + fw0*x4*x156 + lw0*x94*x156 + fw0*x11*x156 + lw0*x101*x156 + lw0*x18*x156 + lw0*x108*x156 + lw0*x25*x156 + lw0*x115*x156 + fw0*x32*x156 + lw0*x39*x156 + lw0*x46*x156 + lw0*x53*x156 + lw0*x60*x156 + lw0*x67*x156 + lw0*x74*x156 + lw0*x81*x156 + lw0*x88*x156 + fw0*x5*x156 + lw0*x95*x156 + lw0*x12*x156 + lw0*x102*x156 + lw0*x19*x156 + lw0*x109*x156 + lw0*x26*x156 + lw0*x116*x156 + fw0*x33*x156 + fw0*x40*x156 + lw0*x47*x156 + lw0*x54*x156 + lw0*x61*x156 + lw0*x68*x156 + lw0*x75*x156 + lw0*x82*x156 + lw0*x89*x156 + lw0*x6*x156 + lw0*x96*x156 + lw0*x13*x156 + lw0*x103*x156 + lw0*x20*x156 + lw0*x110*x156 + lw0*x27*x156 + lw0*x117*x156 + fw0*x34*x156 + fw0*x41*x156 + lw0*x48*x156 + lw0*x55*x156 + lw0*x62*x156 + lw0*x69*x156 + lw0*x76*x156 + lw0*x83*x156 + fw0*x0*x144 + lw0*x90*x144 + lw0*x7*x144 + lw0*x97*x144 + lw0*x14*x144 + lw0*x104*x144 + lw0*x21*x144 + lw0*x111*x144 + lw0*x28*x144 + lw0*x118*x144 + fw0*x35*x144 + lw0*x42*x144 + lw0*x49*x144 + lw0*x56*x144 + lw0*x63*x144 + lw0*x70*x144 + lw0*x77*x144 + lw0*x84*x144 + fw0*x1*x144 + lw0*x91*x144 + fw0*x8*x144 + lw0*x98*x144 + lw0*x15*x144 + lw0*x105*x144 + lw0*x22*x144 + lw0*x112*x144 + lw0*x29*x144 + lw0*x119*x144 + lw0*x36*x144 + lw0*x43*x144 + lw0*x50*x144 + lw0*x57*x144 + fw0*x64*x144 + lw0*x71*x144 + lw0*x78*x144 + lw0*x85*x144 + fw0*x2*x144 + lw0*x92*x144 + fw0*x9*x144 + lw0*x99*x144 + fw0*x16*x144 + lw0*x106*x144 + lw0*x23*x144 + lw0*x113*x144 + lw0*x30*x144 + lw0*x37*x144 + lw0*x44*x144 + lw0*x51*x144 + lw0*x58*x144 + fw0*x65*x144 + lw0*x72*x144 + lw0*x79*x144 + lw0*x86*x144 + fw0*x3*x144 + lw0*x93*x144 + fw0*x10*x144 + lw0*x100*x144 + fw0*x17*x144 + lw0*x107*x144 + lw0*x24*x144 + lw0*x114*x144 + lw0*x31*x144 + lw0*x38*x144 + lw0*x45*x144 + lw0*x52*x144 + lw0*x59*x144 + lw0*x66*x144 + lw0*x73*x144 + lw0*x80*x144 + lw0*x87*x144 + fw0*x4*x144 + lw0*x94*x144 + fw0*x11*x144 + lw0*x101*x144 + lw0*x18*x144 + lw0*x108*x144 + lw0*x25*x144 + lw0*x115*x144 + fw0*x32*x144 + lw0*x39*x144 + lw0*x46*x144 + lw0*x53*x144 + lw0*x60*x144 + lw0*x67*x144 + lw0*x74*x144 + lw0*x81*x144 + lw0*x88*x144 + fw0*x5*x144 + lw0*x95*x144 + lw0*x12*x144 + lw0*x102*x144 + lw0*x19*x144 + lw0*x109*x144 + lw0*x26*x144 + lw0*x116*x144 + fw0*x33*x144 + fw0*x40*x144 + lw0*x47*x144 + lw0*x54*x144 + lw0*x61*x144 + lw0*x68*x144 + lw0*x75*x144 + lw0*x82*x144 + lw0*x89*x144 + lw0*x6*x144 + lw0*x96*x144 + lw0*x13*x144 + lw0*x103*x144 + lw0*x20*x144 + lw0*x110*x144 + lw0*x27*x144 + lw0*x117*x144 + fw0*x34*x144 + fw0*x41*x144 + lw0*x48*x144 + lw0*x55*x144 + lw0*x62*x144 + lw0*x69*x144 + lw0*x76*x144 + lw0*x83*x144 + lw0*x0*x151 + lw0*x90*x151 + fw0*x7*x151 + lw0*x97*x151 + fw0*x14*x151 + lw0*x104*x151 + fw0*x21*x151 + lw0*x111*x151 + lw0*x28*x151 + lw0*x118*x151 + lw0*x35*x151 + lw0*x42*x151 + lw0*x49*x151 + lw0*x56*x151 + lw0*x63*x151 + fw0*x70*x151 + lw0*x77*x151 + lw0*x84*x151 + lw0*x1*x151 + lw0*x91*x151 + lw0*x8*x151 + lw0*x98*x151 + fw0*x15*x151 + lw0*x105*x151 + fw0*x22*x151 + lw0*x112*x151 + lw0*x29*x151 + lw0*x119*x151 + lw0*x36*x151 + lw0*x43*x151 + lw0*x50*x151 + lw0*x57*x151 + lw0*x64*x151 + fw0*x71*x151 + lw0*x78*x151 + lw0*x85*x151 + lw0*x2*x151 + lw0*x92*x151 + lw0*x9*x151 + lw0*x99*x151 + lw0*x16*x151 + lw0*x106*x151 + fw0*x23*x151 + lw0*x113*x151 + lw0*x30*x151 + lw0*x37*x151 + fw0*x44*x151 + lw0*x51*x151 + lw0*x58*x151 + lw0*x65*x151 + lw0*x72*x151 + lw0*x79*x151 + lw0*x86*x151 + lw0*x3*x151 + lw0*x93*x151 + lw0*x10*x151 + lw0*x100*x151 + lw0*x17*x151 + lw0*x107*x151 + lw0*x24*x151 + lw0*x114*x151 + lw0*x31*x151 + fw0*x38*x151 + fw0*x45*x151 + lw0*x52*x151 + lw0*x59*x151 + lw0*x66*x151 + lw0*x73*x151 + lw0*x80*x151 + lw0*x87*x151 + lw0*x4*x151 + lw0*x94*x151 + lw0*x11*x151 + lw0*x101*x151 + fw0*x18*x151 + lw0*x108*x151 + lw0*x25*x151 + lw0*x115*x151 + lw0*x32*x151 + fw0*x39*x151 + fw0*x46*x151 + lw0*x53*x151 + lw0*x60*x151 + lw0*x67*x151 + lw0*x74*x151 + lw0*x81*x151 + lw0*x88*x151 + lw0*x5*x151 + lw0*x95*x151 + fw0*x12*x151 + lw0*x102*x151 + fw0*x19*x151 + lw0*x109*x151 + lw0*x26*x151 + lw0*x116*x151 + lw0*x33*x151 + lw0*x40*x151 + fw0*x47*x151 + lw0*x54*x151 + lw0*x61*x151 + lw0*x68*x151 + lw0*x75*x151 + lw0*x82*x151 + lw0*x89*x151 + fw0*x6*x151 + lw0*x96*x151 + fw0*x13*x151 + lw0*x103*x151 + fw0*x20*x151 + lw0*x110*x151 + lw0*x27*x151 + lw0*x117*x151 + lw0*x34*x151 + lw0*x41*x151 + lw0*x48*x151 + lw0*x55*x151 + lw0*x62*x151 + lw0*x69*x151 + lw0*x76*x151 + lw0*x83*x151 + lw0*x0*x158 + lw0*x90*x158 + lw0*x7*x158 + lw0*x97*x158 + lw0*x14*x158 + lw0*x104*x158 + lw0*x21*x158 + lw0*x111*x158 + fw0*x28*x158 + lw0*x118*x158 + lw0*x35*x158 + lw0*x42*x158 + lw0*x49*x158 + fw0*x56*x158 + lw0*x63*x158 + lw0*x70*x158 + fw0*x77*x158 + lw0*x84*x158 + lw0*x1*x158 + lw0*x91*x158 + lw0*x8*x158 + lw0*x98*x158 + lw0*x15*x158 + lw0*x105*x158 + lw0*x22*x158 + lw0*x112*x158 + fw0*x29*x158 + lw0*x119*x158 + lw0*x36*x158 + lw0*x43*x158 + fw0*x50*x158 + fw0*x57*x158 + lw0*x64*x158 + lw0*x71*x158 + lw0*x78*x158 + lw0*x85*x158 + lw0*x2*x158 + lw0*x92*x158 + lw0*x9*x158 + lw0*x99*x158 + lw0*x16*x158 + lw0*x106*x158 + lw0*x23*x158 + lw0*x113*x158 + lw0*x30*x158 + lw0*x37*x158 + lw0*x44*x158 + fw0*x51*x158 + fw0*x58*x158 + lw0*x65*x158 + lw0*x72*x158 + lw0*x79*x158 + lw0*x86*x158 + lw0*x3*x158 + lw0*x93*x158 + lw0*x10*x158 + lw0*x100*x158 + lw0*x17*x158 + lw0*x107*x158 + fw0*x24*x158 + lw0*x114*x158 + lw0*x31*x158 + lw0*x38*x158 + lw0*x45*x158 + fw0*x52*x158 + fw0*x59*x158 + lw0*x66*x158 + lw0*x73*x158 + lw0*x80*x158 + lw0*x87*x158 + lw0*x4*x158 + lw0*x94*x158 + lw0*x11*x158 + lw0*x101*x158 + lw0*x18*x158 + lw0*x108*x158 + fw0*x25*x158 + lw0*x115*x158 + lw0*x32*x158 + lw0*x39*x158 + lw0*x46*x158 + fw0*x53*x158 + lw0*x60*x158 + lw0*x67*x158 + lw0*x74*x158 + lw0*x81*x158 + fw0*x88*x158 + lw0*x5*x158 + lw0*x95*x158 + lw0*x12*x158 + lw0*x102*x158 + lw0*x19*x158 + lw0*x109*x158 + fw0*x26*x158 + lw0*x116*x158 + lw0*x33*x158 + lw0*x40*x158 + lw0*x47*x158 + lw0*x54*x158 + lw0*x61*x158 + lw0*x68*x158 + lw0*x75*x158 + fw0*x82*x158 + fw0*x89*x158 + lw0*x6*x158 + lw0*x96*x158 + lw0*x13*x158 + lw0*x103*x158 + lw0*x20*x158 + lw0*x110*x158 + fw0*x27*x158 + lw0*x117*x158 + lw0*x34*x158 + lw0*x41*x158 + lw0*x48*x158 + lw0*x55*x158 + lw0*x62*x158 + lw0*x69*x158 + fw0*x76*x158 + fw0*x83*x158 + lw0*x0*x139 + lw0*x90*x139 + fw0*x7*x139 + lw0*x97*x139 + fw0*x14*x139 + lw0*x104*x139 + fw0*x21*x139 + lw0*x111*x139 + lw0*x28*x139 + lw0*x118*x139 + lw0*x35*x139 + lw0*x42*x139 + lw0*x49*x139 + lw0*x56*x139 + lw0*x63*x139 + fw0*x70*x139 + lw0*x77*x139 + lw0*x84*x139 + lw0*x1*x139 + lw0*x91*x139 + lw0*x8*x139 + lw0*x98*x139 + fw0*x15*x139 + lw0*x105*x139 + fw0*x22*x139 + lw0*x112*x139 + lw0*x29*x139 + lw0*x119*x139 + lw0*x36*x139 + lw0*x43*x139 + lw0*x50*x139 + lw0*x57*x139 + lw0*x64*x139 + fw0*x71*x139 + lw0*x78*x139 + lw0*x85*x139 + lw0*x2*x139 + lw0*x92*x139 + lw0*x9*x139 + lw0*x99*x139 + lw0*x16*x139 + lw0*x106*x139 + fw0*x23*x139 + lw0*x113*x139 + lw0*x30*x139 + lw0*x37*x139 + fw0*x44*x139 + lw0*x51*x139 + lw0*x58*x139 + lw0*x65*x139 + lw0*x72*x139 + lw0*x79*x139 + lw0*x86*x139 + lw0*x3*x139 + lw0*x93*x139 + lw0*x10*x139 + lw0*x100*x139 + lw0*x17*x139 + lw0*x107*x139 + lw0*x24*x139 + lw0*x114*x139 + lw0*x31*x139 + fw0*x38*x139 + fw0*x45*x139 + lw0*x52*x139 + lw0*x59*x139 + lw0*x66*x139 + lw0*x73*x139 + lw0*x80*x139 + lw0*x87*x139 + lw0*x4*x139 + lw0*x94*x139 + lw0*x11*x139 + lw0*x101*x139 + fw0*x18*x139 + lw0*x108*x139 + lw0*x25*x139 + lw0*x115*x139 + lw0*x32*x139 + fw0*x39*x139 + fw0*x46*x139 + lw0*x53*x139 + lw0*x60*x139 + lw0*x67*x139 + lw0*x74*x139 + lw0*x81*x139 + lw0*x88*x139 + lw0*x5*x139 + lw0*x95*x139 + fw0*x12*x139 + lw0*x102*x139 + fw0*x19*x139 + lw0*x109*x139 + lw0*x26*x139 + lw0*x116*x139 + lw0*x33*x139 + lw0*x40*x139 + fw0*x47*x139 + lw0*x54*x139 + lw0*x61*x139 + lw0*x68*x139 + lw0*x75*x139 + lw0*x82*x139 + lw0*x89*x139 + fw0*x6*x139 + lw0*x96*x139 + fw0*x13*x139 + lw0*x103*x139 + fw0*x20*x139 + lw0*x110*x139 + lw0*x27*x139 + lw0*x117*x139 + lw0*x34*x139 + lw0*x41*x139 + lw0*x48*x139 + lw0*x55*x139 + lw0*x62*x139 + lw0*x69*x139 + lw0*x76*x139 + lw0*x83*x139 + lw0*x0*x146 + lw0*x90*x146 + lw0*x7*x146 + lw0*x97*x146 + lw0*x14*x146 + lw0*x104*x146 + lw0*x21*x146 + lw0*x111*x146 + fw0*x28*x146 + lw0*x118*x146 + lw0*x35*x146 + lw0*x42*x146 + lw0*x49*x146 + fw0*x56*x146 + lw0*x63*x146 + lw0*x70*x146 + fw0*x77*x146 + lw0*x84*x146 + lw0*x1*x146 + lw0*x91*x146 + lw0*x8*x146 + lw0*x98*x146 + lw0*x15*x146 + lw0*x105*x146 + lw0*x22*x146 + lw0*x112*x146 + fw0*x29*x146 + lw0*x119*x146 + lw0*x36*x146 + lw0*x43*x146 + fw0*x50*x146 + fw0*x57*x146 + lw0*x64*x146 + lw0*x71*x146 + lw0*x78*x146 + lw0*x85*x146 + lw0*x2*x146 + lw0*x92*x146 + lw0*x9*x146 + lw0*x99*x146 + lw0*x16*x146 + lw0*x106*x146 + lw0*x23*x146 + lw0*x113*x146 + lw0*x30*x146 + lw0*x37*x146 + lw0*x44*x146 + fw0*x51*x146 + fw0*x58*x146 + lw0*x65*x146 + lw0*x72*x146 + lw0*x79*x146 + lw0*x86*x146 + lw0*x3*x146 + lw0*x93*x146 + lw0*x10*x146 + lw0*x100*x146 + lw0*x17*x146 + lw0*x107*x146 + fw0*x24*x146 + lw0*x114*x146 + lw0*x31*x146 + lw0*x38*x146 + lw0*x45*x146 + fw0*x52*x146 + fw0*x59*x146 + lw0*x66*x146 + lw0*x73*x146 + lw0*x80*x146 + lw0*x87*x146 + lw0*x4*x146 + lw0*x94*x146 + lw0*x11*x146 + lw0*x101*x146 + lw0*x18*x146 + lw0*x108*x146 + fw0*x25*x146 + lw0*x115*x146 + lw0*x32*x146 + lw0*x39*x146 + lw0*x46*x146 + fw0*x53*x146 + lw0*x60*x146 + lw0*x67*x146 + lw0*x74*x146 + lw0*x81*x146 + fw0*x88*x146 + lw0*x5*x146 + lw0*x95*x146 + lw0*x12*x146 + lw0*x102*x146 + lw0*x19*x146 + lw0*x109*x146 + fw0*x26*x146 + lw0*x116*x146 + lw0*x33*x146 + lw0*x40*x146 + lw0*x47*x146 + lw0*x54*x146 + lw0*x61*x146 + lw0*x68*x146 + lw0*x75*x146 + fw0*x82*x146 + fw0*x89*x146 + lw0*x6*x146 + lw0*x96*x146 + lw0*x13*x146 + lw0*x103*x146 + lw0*x20*x146 + lw0*x110*x146 + fw0*x27*x146 + lw0*x117*x146 + lw0*x34*x146 + lw0*x41*x146 + lw0*x48*x146 + lw0*x55*x146 + lw0*x62*x146 + lw0*x69*x146 + fw0*x76*x146 + fw0*x83*x146 + lw0*x0*x153 + fw0*x90*x153 + lw0*x7*x153 + lw0*x97*x153 + lw0*x14*x153 + lw0*x104*x153 + lw0*x21*x153 + lw0*x111*x153 + lw0*x28*x153 + lw0*x118*x153 + lw0*x35*x153 + fw0*x42*x153 + lw0*x49*x153 + lw0*x56*x153 + fw0*x63*x153 + lw0*x70*x153 + lw0*x77*x153 + lw0*x84*x153 + lw0*x1*x153 + fw0*x91*x153 + lw0*x8*x153 + lw0*x98*x153 + lw0*x15*x153 + lw0*x105*x153 + lw0*x22*x153 + lw0*x112*x153 + lw0*x29*x153 + lw0*x119*x153 + fw0*x36*x153 + fw0*x43*x153 + lw0*x50*x153 + lw0*x57*x153 + lw0*x64*x153 + lw0*x71*x153 + lw0*x78*x153 + lw0*x85*x153 + lw0*x2*x153 + fw0*x92*x153 + lw0*x9*x153 + lw0*x99*x153 + lw0*x16*x153 + lw0*x106*x153 + lw0*x23*x153 + lw0*x113*x153 + fw0*x30*x153 + fw0*x37*x153 + lw0*x44*x153 + lw0*x51*x153 + lw0*x58*x153 + lw0*x65*x153 + lw0*x72*x153 + lw0*x79*x153 + lw0*x86*x153 + lw0*x3*x153 + fw0*x93*x153 + lw0*x10*x153 + lw0*x100*x153 + lw0*x17*x153 + lw0*x107*x153 + lw0*x24*x153 + lw0*x114*x153 + fw0*x31*x153 + lw0*x38*x153 + lw0*x45*x153 + lw0*x52*x153 + lw0*x59*x153 + fw0*x66*x153 + lw0*x73*x153 + lw0*x80*x153 + lw0*x87*x153 + lw0*x4*x153 + fw0*x94*x153 + lw0*x11*x153 + lw0*x101*x153 + lw0*x18*x153 + lw0*x108*x153 + lw0*x25*x153 + lw0*x115*x153 + lw0*x32*x153 + lw0*x39*x153 + lw0*x46*x153 + lw0*x53*x153 + fw0*x60*x153 + fw0*x67*x153 + lw0*x74*x153 + lw0*x81*x153 + lw0*x88*x153 + lw0*x5*x153 + fw0*x95*x153 + lw0*x12*x153 + lw0*x102*x153 + lw0*x19*x153 + lw0*x109*x153 + lw0*x26*x153 + lw0*x116*x153 + lw0*x33*x153 + lw0*x40*x153 + lw0*x47*x153 + lw0*x54*x153 + fw0*x61*x153 + fw0*x68*x153 + lw0*x75*x153 + lw0*x82*x153 + lw0*x89*x153 + lw0*x6*x153 + lw0*x96*x153 + lw0*x13*x153 + lw0*x103*x153 + lw0*x20*x153 + lw0*x110*x153 + lw0*x27*x153 + lw0*x117*x153 + lw0*x34*x153 + lw0*x41*x153 + lw0*x48*x153 + lw0*x55*x153 + fw0*x62*x153 + fw0*x69*x153 + lw0*x76*x153 + lw0*x83*x153 + lw0*x0*x160 + lw0*x90*x160 + lw0*x7*x160 + fw0*x97*x160 + lw0*x14*x160 + fw0*x104*x160 + lw0*x21*x160 + lw0*x111*x160 + lw0*x28*x160 + lw0*x118*x160 + lw0*x35*x160 + lw0*x42*x160 + fw0*x49*x160 + lw0*x56*x160 + lw0*x63*x160 + lw0*x70*x160 + lw0*x77*x160 + lw0*x84*x160 + lw0*x1*x160 + lw0*x91*x160 + lw0*x8*x160 + fw0*x98*x160 + lw0*x15*x160 + fw0*x105*x160 + lw0*x22*x160 + fw0*x112*x160 + lw0*x29*x160 + lw0*x119*x160 + lw0*x36*x160 + lw0*x43*x160 + lw0*x50*x160 + lw0*x57*x160 + lw0*x64*x160 + lw0*x71*x160 + lw0*x78*x160 + lw0*x85*x160 + lw0*x2*x160 + lw0*x92*x160 + lw0*x9*x160 + fw0*x99*x160 + lw0*x16*x160 + fw0*x106*x160 + lw0*x23*x160 + fw0*x113*x160 + lw0*x30*x160 + lw0*x37*x160 + lw0*x44*x160 + lw0*x51*x160 + lw0*x58*x160 + lw0*x65*x160 + fw0*x72*x160 + lw0*x79*x160 + lw0*x86*x160 + lw0*x3*x160 + lw0*x93*x160 + lw0*x10*x160 + fw0*x100*x160 + lw0*x17*x160 + fw0*x107*x160 + lw0*x24*x160 + lw0*x114*x160 + lw0*x31*x160 + lw0*x38*x160 + lw0*x45*x160 + lw0*x52*x160 + lw0*x59*x160 + lw0*x66*x160 + fw0*x73*x160 + fw0*x80*x160 + lw0*x87*x160 + lw0*x4*x160 + lw0*x94*x160 + lw0*x11*x160 + fw0*x101*x160 + lw0*x18*x160 + lw0*x108*x160 + lw0*x25*x160 + lw0*x115*x160 + lw0*x32*x160 + lw0*x39*x160 + lw0*x46*x160 + lw0*x53*x160 + lw0*x60*x160 + lw0*x67*x160 + fw0*x74*x160 + fw0*x81*x160 + lw0*x88*x160 + lw0*x5*x160 + lw0*x95*x160 + lw0*x12*x160 + lw0*x102*x160 + lw0*x19*x160 + lw0*x109*x160 + lw0*x26*x160 + lw0*x116*x160 + lw0*x33*x160 + lw0*x40*x160 + lw0*x47*x160 + lw0*x54*x160 + lw0*x61*x160 + lw0*x68*x160 + fw0*x75*x160 + lw0*x82*x160 + lw0*x89*x160 + lw0*x6*x160 + fw0*x96*x160 + lw0*x13*x160 + lw0*x103*x160 + lw0*x20*x160 + lw0*x110*x160 + lw0*x27*x160 + lw0*x117*x160 + lw0*x34*x160 + lw0*x41*x160 + fw0*x48*x160 + lw0*x55*x160 + lw0*x62*x160 + lw0*x69*x160 + lw0*x76*x160 + lw0*x83*x160 + lw0*x0*x141 + fw0*x90*x141 + lw0*x7*x141 + lw0*x97*x141 + lw0*x14*x141 + lw0*x104*x141 + lw0*x21*x141 + lw0*x111*x141 + lw0*x28*x141 + lw0*x118*x141 + lw0*x35*x141 + fw0*x42*x141 + lw0*x49*x141 + lw0*x56*x141 + fw0*x63*x141 + lw0*x70*x141 + lw0*x77*x141 + lw0*x84*x141 + lw0*x1*x141 + fw0*x91*x141 + lw0*x8*x141 + lw0*x98*x141 + lw0*x15*x141 + lw0*x105*x141 + lw0*x22*x141 + lw0*x112*x141 + lw0*x29*x141 + lw0*x119*x141 + fw0*x36*x141 + fw0*x43*x141 + lw0*x50*x141 + lw0*x57*x141 + lw0*x64*x141 + lw0*x71*x141 + lw0*x78*x141 + lw0*x85*x141 + lw0*x2*x141 + fw0*x92*x141 + lw0*x9*x141 + lw0*x99*x141 + lw0*x16*x141 + lw0*x106*x141 + lw0*x23*x141 + lw0*x113*x141 + fw0*x30*x141 + fw0*x37*x141 + lw0*x44*x141 + lw0*x51*x141 + lw0*x58*x141 + lw0*x65*x141 + lw0*x72*x141 + lw0*x79*x141 + lw0*x86*x141 + lw0*x3*x141 + fw0*x93*x141 + lw0*x10*x141 + lw0*x100*x141 + lw0*x17*x141 + lw0*x107*x141 + lw0*x24*x141 + lw0*x114*x141 + fw0*x31*x141 + lw0*x38*x141 + lw0*x45*x141 + lw0*x52*x141 + lw0*x59*x141 + fw0*x66*x141 + lw0*x73*x141 + lw0*x80*x141 + lw0*x87*x141 + lw0*x4*x141 + fw0*x94*x141 + lw0*x11*x141 + lw0*x101*x141 + lw0*x18*x141 + lw0*x108*x141 + lw0*x25*x141 + lw0*x115*x141 + lw0*x32*x141 + lw0*x39*x141 + lw0*x46*x141 + lw0*x53*x141 + fw0*x60*x141 + fw0*x67*x141 + lw0*x74*x141 + lw0*x81*x141 + lw0*x88*x141 + lw0*x5*x141 + fw0*x95*x141 + lw0*x12*x141 + lw0*x102*x141 + lw0*x19*x141 + lw0*x109*x141 + lw0*x26*x141 + lw0*x116*x141 + lw0*x33*x141 + lw0*x40*x141 + lw0*x47*x141 + lw0*x54*x141 + fw0*x61*x141 + fw0*x68*x141 + lw0*x75*x141 + lw0*x82*x141 + lw0*x89*x141 + lw0*x6*x141 + lw0*x96*x141 + lw0*x13*x141 + lw0*x103*x141 + lw0*x20*x141 + lw0*x110*x141 + lw0*x27*x141 + lw0*x117*x141 + lw0*x34*x141 + lw0*x41*x141 + lw0*x48*x141 + lw0*x55*x141 + fw0*x62*x141 + fw0*x69*x141 + lw0*x76*x141 + lw0*x83*x141 + lw0*x0*x148 + lw0*x90*x148 + lw0*x7*x148 + fw0*x97*x148 + lw0*x14*x148 + fw0*x104*x148 + lw0*x21*x148 + lw0*x111*x148 + lw0*x28*x148 + lw0*x118*x148 + lw0*x35*x148 + lw0*x42*x148 + fw0*x49*x148 + lw0*x56*x148 + lw0*x63*x148 + lw0*x70*x148 + lw0*x77*x148 + lw0*x84*x148 + lw0*x1*x148 + lw0*x91*x148 + lw0*x8*x148 + fw0*x98*x148 + lw0*x15*x148 + fw0*x105*x148 + lw0*x22*x148 + fw0*x112*x148 + lw0*x29*x148 + lw0*x119*x148 + lw0*x36*x148 + lw0*x43*x148 + lw0*x50*x148 + lw0*x57*x148 + lw0*x64*x148 + lw0*x71*x148 + lw0*x78*x148 + lw0*x85*x148 + lw0*x2*x148 + lw0*x92*x148 + lw0*x9*x148 + fw0*x99*x148 + lw0*x16*x148 + fw0*x106*x148 + lw0*x23*x148 + fw0*x113*x148 + lw0*x30*x148 + lw0*x37*x148 + lw0*x44*x148 + lw0*x51*x148 + lw0*x58*x148 + lw0*x65*x148 + fw0*x72*x148 + lw0*x79*x148 + lw0*x86*x148 + lw0*x3*x148 + lw0*x93*x148 + lw0*x10*x148 + fw0*x100*x148 + lw0*x17*x148 + fw0*x107*x148 + lw0*x24*x148 + lw0*x114*x148 + lw0*x31*x148 + lw0*x38*x148 + lw0*x45*x148 + lw0*x52*x148 + lw0*x59*x148 + lw0*x66*x148 + fw0*x73*x148 + fw0*x80*x148 + lw0*x87*x148 + lw0*x4*x148 + lw0*x94*x148 + lw0*x11*x148 + fw0*x101*x148 + lw0*x18*x148 + lw0*x108*x148 + lw0*x25*x148 + lw0*x115*x148 + lw0*x32*x148 + lw0*x39*x148 + lw0*x46*x148 + lw0*x53*x148 + lw0*x60*x148 + lw0*x67*x148 + fw0*x74*x148 + fw0*x81*x148 + lw0*x88*x148 + lw0*x5*x148 + lw0*x95*x148 + lw0*x12*x148 + lw0*x102*x148 + lw0*x19*x148 + lw0*x109*x148 + lw0*x26*x148 + lw0*x116*x148 + lw0*x33*x148 + lw0*x40*x148 + lw0*x47*x148 + lw0*x54*x148 + lw0*x61*x148 + lw0*x68*x148 + fw0*x75*x148 + lw0*x82*x148 + lw0*x89*x148 + lw0*x6*x148 + fw0*x96*x148 + lw0*x13*x148 + lw0*x103*x148 + lw0*x20*x148 + lw0*x110*x148 + lw0*x27*x148 + lw0*x117*x148 + lw0*x34*x148 + lw0*x41*x148 + fw0*x48*x148 + lw0*x55*x148 + lw0*x62*x148 + lw0*x69*x148 + lw0*x76*x148 + lw0*x83*x148 + lw0*x0*x155 + lw0*x90*x155 + lw0*x7*x155 + lw0*x97*x155 + lw0*x14*x155 + lw0*x104*x155 + lw0*x21*x155 + fw0*x111*x155 + lw0*x28*x155 + fw0*x118*x155 + lw0*x35*x155 + lw0*x42*x155 + lw0*x49*x155 + lw0*x56*x155 + lw0*x63*x155 + lw0*x70*x155 + lw0*x77*x155 + fw0*x84*x155 + lw0*x1*x155 + lw0*x91*x155 + lw0*x8*x155 + lw0*x98*x155 + lw0*x15*x155 + lw0*x105*x155 + lw0*x22*x155 + lw0*x112*x155 + lw0*x29*x155 + fw0*x119*x155 + lw0*x36*x155 + lw0*x43*x155 + lw0*x50*x155 + lw0*x57*x155 + lw0*x64*x155 + lw0*x71*x155 + fw0*x78*x155 + fw0*x85*x155 + lw0*x2*x155 + lw0*x92*x155 + lw0*x9*x155 + lw0*x99*x155 + lw0*x16*x155 + lw0*x106*x155 + lw0*x23*x155 + lw0*x113*x155 + lw0*x30*x155 + lw0*x37*x155 + lw0*x44*x155 + lw0*x51*x155 + lw0*x58*x155 + lw0*x65*x155 + lw0*x72*x155 + fw0*x79*x155 + fw0*x86*x155 + lw0*x3*x155 + lw0*x93*x155 + lw0*x10*x155 + lw0*x100*x155 + lw0*x17*x155 + lw0*x107*x155 + lw0*x24*x155 + fw0*x114*x155 + lw0*x31*x155 + lw0*x38*x155 + lw0*x45*x155 + lw0*x52*x155 + lw0*x59*x155 + lw0*x66*x155 + lw0*x73*x155 + lw0*x80*x155 + fw0*x87*x155 + lw0*x4*x155 + lw0*x94*x155 + lw0*x11*x155 + lw0*x101*x155 + lw0*x18*x155 + fw0*x108*x155 + lw0*x25*x155 + fw0*x115*x155 + lw0*x32*x155 + lw0*x39*x155 + lw0*x46*x155 + lw0*x53*x155 + lw0*x60*x155 + lw0*x67*x155 + lw0*x74*x155 + lw0*x81*x155 + lw0*x88*x155 + lw0*x5*x155 + lw0*x95*x155 + lw0*x12*x155 + fw0*x102*x155 + lw0*x19*x155 + fw0*x109*x155 + lw0*x26*x155 + fw0*x116*x155 + lw0*x33*x155 + lw0*x40*x155 + lw0*x47*x155 + fw0*x54*x155 + lw0*x61*x155 + lw0*x68*x155 + lw0*x75*x155 + lw0*x82*x155 + lw0*x89*x155 + lw0*x6*x155 + lw0*x96*x155 + lw0*x13*x155 + fw0*x103*x155 + lw0*x20*x155 + fw0*x110*x155 + lw0*x27*x155 + fw0*x117*x155 + lw0*x34*x155 + lw0*x41*x155 + lw0*x48*x155 + fw0*x55*x155 + lw0*x62*x155 + lw0*x69*x155 + lw0*x76*x155 + lw0*x83*x155 + lw0*x0*x143 + lw0*x90*x143 + lw0*x7*x143 + lw0*x97*x143 + lw0*x14*x143 + lw0*x104*x143 + lw0*x21*x143 + fw0*x111*x143 + lw0*x28*x143 + fw0*x118*x143 + lw0*x35*x143 + lw0*x42*x143 + lw0*x49*x143 + lw0*x56*x143 + lw0*x63*x143 + lw0*x70*x143 + lw0*x77*x143 + fw0*x84*x143 + lw0*x1*x143 + lw0*x91*x143 + lw0*x8*x143 + lw0*x98*x143 + lw0*x15*x143 + lw0*x105*x143 + lw0*x22*x143 + lw0*x112*x143 + lw0*x29*x143 + fw0*x119*x143 + lw0*x36*x143 + lw0*x43*x143 + lw0*x50*x143 + lw0*x57*x143 + lw0*x64*x143 + lw0*x71*x143 + fw0*x78*x143 + fw0*x85*x143 + lw0*x2*x143 + lw0*x92*x143 + lw0*x9*x143 + lw0*x99*x143 + lw0*x16*x143 + lw0*x106*x143 + lw0*x23*x143 + lw0*x113*x143 + lw0*x30*x143 + lw0*x37*x143 + lw0*x44*x143 + lw0*x51*x143 + lw0*x58*x143 + lw0*x65*x143 + lw0*x72*x143 + fw0*x79*x143 + fw0*x86*x143 + lw0*x3*x143 + lw0*x93*x143 + lw0*x10*x143 + lw0*x100*x143 + lw0*x17*x143 + lw0*x107*x143 + lw0*x24*x143 + fw0*x114*x143 + lw0*x31*x143 + lw0*x38*x143 + lw0*x45*x143 + lw0*x52*x143 + lw0*x59*x143 + lw0*x66*x143 + lw0*x73*x143 + lw0*x80*x143 + fw0*x87*x143 + lw0*x4*x143 + lw0*x94*x143 + lw0*x11*x143 + lw0*x101*x143 + lw0*x18*x143 + fw0*x108*x143 + lw0*x25*x143 + fw0*x115*x143 + lw0*x32*x143 + lw0*x39*x143 + lw0*x46*x143 + lw0*x53*x143 + lw0*x60*x143 + lw0*x67*x143 + lw0*x74*x143 + lw0*x81*x143 + lw0*x88*x143 + lw0*x5*x143 + lw0*x95*x143 + lw0*x12*x143 + fw0*x102*x143 + lw0*x19*x143 + fw0*x109*x143 + lw0*x26*x143 + fw0*x116*x143 + lw0*x33*x143 + lw0*x40*x143 + lw0*x47*x143 + fw0*x54*x143 + lw0*x61*x143 + lw0*x68*x143 + lw0*x75*x143 + lw0*x82*x143 + lw0*x89*x143 + lw0*x6*x143 + lw0*x96*x143 + lw0*x13*x143 + fw0*x103*x143 + lw0*x20*x143 + fw0*x110*x143 + lw0*x27*x143 + fw0*x117*x143 + lw0*x34*x143 + lw0*x41*x143 + lw0*x48*x143 + fw0*x55*x143 + lw0*x62*x143 + lw0*x69*x143 + lw0*x76*x143 + lw0*x83*x143 + fw0*x0*x150 + lw0*x90*x150 + lw0*x7*x150 + lw0*x97*x150 + lw0*x14*x150 + lw0*x104*x150 + lw0*x21*x150 + lw0*x111*x150 + lw0*x28*x150 + lw0*x118*x150 + fw0*x35*x150 + lw0*x42*x150 + lw0*x49*x150 + lw0*x56*x150 + lw0*x63*x150 + lw0*x70*x150 + lw0*x77*x150 + lw0*x84*x150 + fw0*x1*x150 + lw0*x91*x150 + fw0*x8*x150 + lw0*x98*x150 + lw0*x15*x150 + lw0*x105*x150 + lw0*x22*x150 + lw0*x112*x150 + lw0*x29*x150 + lw0*x119*x150 + lw0*x36*x150 + lw0*x43*x150 + lw0*x50*x150 + lw0*x57*x150 + fw0*x64*x150 + lw0*x71*x150 + lw0*x78*x150 + lw0*x85*x150 + fw0*x2*x150 + lw0*x92*x150 + fw0*x9*x150 + lw0*x99*x150 + fw0*x16*x150 + lw0*x106*x150 + lw0*x23*x150 + lw0*x113*x150 + lw0*x30*x150 + lw0*x37*x150 + lw0*x44*x150 + lw0*x51*x150 + lw0*x58*x150 + fw0*x65*x150 + lw0*x72*x150 + lw0*x79*x150 + lw0*x86*x150 + fw0*x3*x150 + lw0*x93*x150 + fw0*x10*x150 + lw0*x100*x150 + fw0*x17*x150 + lw0*x107*x150 + lw0*x24*x150 + lw0*x114*x150 + lw0*x31*x150 + lw0*x38*x150 + lw0*x45*x150 + lw0*x52*x150 + lw0*x59*x150 + lw0*x66*x150 + lw0*x73*x150 + lw0*x80*x150 + lw0*x87*x150 + fw0*x4*x150 + lw0*x94*x150 + fw0*x11*x150 + lw0*x101*x150 + lw0*x18*x150 + lw0*x108*x150 + lw0*x25*x150 + lw0*x115*x150 + fw0*x32*x150 + lw0*x39*x150 + lw0*x46*x150 + lw0*x53*x150 + lw0*x60*x150 + lw0*x67*x150 + lw0*x74*x150 + lw0*x81*x150 + lw0*x88*x150 + fw0*x5*x150 + lw0*x95*x150 + lw0*x12*x150 + lw0*x102*x150 + lw0*x19*x150 + lw0*x109*x150 + lw0*x26*x150 + lw0*x116*x150 + fw0*x33*x150 + fw0*x40*x150 + lw0*x47*x150 + lw0*x54*x150 + lw0*x61*x150 + lw0*x68*x150 + lw0*x75*x150 + lw0*x82*x150 + lw0*x89*x150 + lw0*x6*x150 + lw0*x96*x150 + lw0*x13*x150 + lw0*x103*x150 + lw0*x20*x150 + lw0*x110*x150 + lw0*x27*x150 + lw0*x117*x150 + fw0*x34*x150 + fw0*x41*x150 + lw0*x48*x150 + lw0*x55*x150 + lw0*x62*x150 + lw0*x69*x150 + lw0*x76*x150 + lw0*x83*x150 + lw0*x0*x157 + lw0*x90*x157 + fw0*x7*x157 + lw0*x97*x157 + fw0*x14*x157 + lw0*x104*x157 + fw0*x21*x157 + lw0*x111*x157 + lw0*x28*x157 + lw0*x118*x157 + lw0*x35*x157 + lw0*x42*x157 + lw0*x49*x157 + lw0*x56*x157 + lw0*x63*x157 + fw0*x70*x157 + lw0*x77*x157 + lw0*x84*x157 + lw0*x1*x157 + lw0*x91*x157 + lw0*x8*x157 + lw0*x98*x157 + fw0*x15*x157 + lw0*x105*x157 + fw0*x22*x157 + lw0*x112*x157 + lw0*x29*x157 + lw0*x119*x157 + lw0*x36*x157 + lw0*x43*x157 + lw0*x50*x157 + lw0*x57*x157 + lw0*x64*x157 + fw0*x71*x157 + lw0*x78*x157 + lw0*x85*x157 + lw0*x2*x157 + lw0*x92*x157 + lw0*x9*x157 + lw0*x99*x157 + lw0*x16*x157 + lw0*x106*x157 + fw0*x23*x157 + lw0*x113*x157 + lw0*x30*x157 + lw0*x37*x157 + fw0*x44*x157 + lw0*x51*x157 + lw0*x58*x157 + lw0*x65*x157 + lw0*x72*x157 + lw0*x79*x157 + lw0*x86*x157 + lw0*x3*x157 + lw0*x93*x157 + lw0*x10*x157 + lw0*x100*x157 + lw0*x17*x157 + lw0*x107*x157 + lw0*x24*x157 + lw0*x114*x157 + lw0*x31*x157 + fw0*x38*x157 + fw0*x45*x157 + lw0*x52*x157 + lw0*x59*x157 + lw0*x66*x157 + lw0*x73*x157 + lw0*x80*x157 + lw0*x87*x157 + lw0*x4*x157 + lw0*x94*x157 + lw0*x11*x157 + lw0*x101*x157 + fw0*x18*x157 + lw0*x108*x157 + lw0*x25*x157 + lw0*x115*x157 + lw0*x32*x157 + fw0*x39*x157 + fw0*x46*x157 + lw0*x53*x157 + lw0*x60*x157 + lw0*x67*x157 + lw0*x74*x157 + lw0*x81*x157 + lw0*x88*x157 + lw0*x5*x157 + lw0*x95*x157 + fw0*x12*x157 + lw0*x102*x157 + fw0*x19*x157 + lw0*x109*x157 + lw0*x26*x157 + lw0*x116*x157 + lw0*x33*x157 + lw0*x40*x157 + fw0*x47*x157 + lw0*x54*x157 + lw0*x61*x157 + lw0*x68*x157 + lw0*x75*x157 + lw0*x82*x157 + lw0*x89*x157 + fw0*x6*x157 + lw0*x96*x157 + fw0*x13*x157 + lw0*x103*x157 + fw0*x20*x157 + lw0*x110*x157 + lw0*x27*x157 + lw0*x117*x157 + lw0*x34*x157 + lw0*x41*x157 + lw0*x48*x157 + lw0*x55*x157 + lw0*x62*x157 + lw0*x69*x157 + lw0*x76*x157 + lw0*x83*x157 + fw0*x0*x138 + lw0*x90*x138 + lw0*x7*x138 + lw0*x97*x138 + lw0*x14*x138 + lw0*x104*x138 + lw0*x21*x138 + lw0*x111*x138 + lw0*x28*x138 + lw0*x118*x138 + fw0*x35*x138 + lw0*x42*x138 + lw0*x49*x138 + lw0*x56*x138 + lw0*x63*x138 + lw0*x70*x138 + lw0*x77*x138 + lw0*x84*x138 + fw0*x1*x138 + lw0*x91*x138 + fw0*x8*x138 + lw0*x98*x138 + lw0*x15*x138 + lw0*x105*x138 + lw0*x22*x138 + lw0*x112*x138 + lw0*x29*x138 + lw0*x119*x138 + lw0*x36*x138 + lw0*x43*x138 + lw0*x50*x138 + lw0*x57*x138 + fw0*x64*x138 + lw0*x71*x138 + lw0*x78*x138 + lw0*x85*x138 + fw0*x2*x138 + lw0*x92*x138 + fw0*x9*x138 + lw0*x99*x138 + fw0*x16*x138 + lw0*x106*x138 + lw0*x23*x138 + lw0*x113*x138 + lw0*x30*x138 + lw0*x37*x138 + lw0*x44*x138 + lw0*x51*x138 + lw0*x58*x138 + fw0*x65*x138 + lw0*x72*x138 + lw0*x79*x138 + lw0*x86*x138 + fw0*x3*x138 + lw0*x93*x138 + fw0*x10*x138 + lw0*x100*x138 + fw0*x17*x138 + lw0*x107*x138 + lw0*x24*x138 + lw0*x114*x138 + lw0*x31*x138 + lw0*x38*x138 + lw0*x45*x138 + lw0*x52*x138 + lw0*x59*x138 + lw0*x66*x138 + lw0*x73*x138 + lw0*x80*x138 + lw0*x87*x138 + fw0*x4*x138 + lw0*x94*x138 + fw0*x11*x138 + lw0*x101*x138 + lw0*x18*x138 + lw0*x108*x138 + lw0*x25*x138 + lw0*x115*x138 + fw0*x32*x138 + lw0*x39*x138 + lw0*x46*x138 + lw0*x53*x138 + lw0*x60*x138 + lw0*x67*x138 + lw0*x74*x138 + lw0*x81*x138 + lw0*x88*x138 + fw0*x5*x138 + lw0*x95*x138 + lw0*x12*x138 + lw0*x102*x138 + lw0*x19*x138 + lw0*x109*x138 + lw0*x26*x138 + lw0*x116*x138 + fw0*x33*x138 + fw0*x40*x138 + lw0*x47*x138 + lw0*x54*x138 + lw0*x61*x138 + lw0*x68*x138 + lw0*x75*x138 + lw0*x82*x138 + lw0*x89*x138 + lw0*x6*x138 + lw0*x96*x138 + lw0*x13*x138 + lw0*x103*x138 + lw0*x20*x138 + lw0*x110*x138 + lw0*x27*x138 + lw0*x117*x138 + fw0*x34*x138 + fw0*x41*x138 + lw0*x48*x138 + lw0*x55*x138 + lw0*x62*x138 + lw0*x69*x138 + lw0*x76*x138 + lw0*x83*x138 + lw0*x0*x145 + lw0*x90*x145 + fw0*x7*x145 + lw0*x97*x145 + fw0*x14*x145 + lw0*x104*x145 + fw0*x21*x145 + lw0*x111*x145 + lw0*x28*x145 + lw0*x118*x145 + lw0*x35*x145 + lw0*x42*x145 + lw0*x49*x145 + lw0*x56*x145 + lw0*x63*x145 + fw0*x70*x145 + lw0*x77*x145 + lw0*x84*x145 + lw0*x1*x145 + lw0*x91*x145 + lw0*x8*x145 + lw0*x98*x145 + fw0*x15*x145 + lw0*x105*x145 + fw0*x22*x145 + lw0*x112*x145 + lw0*x29*x145 + lw0*x119*x145 + lw0*x36*x145 + lw0*x43*x145 + lw0*x50*x145 + lw0*x57*x145 + lw0*x64*x145 + fw0*x71*x145 + lw0*x78*x145 + lw0*x85*x145 + lw0*x2*x145 + lw0*x92*x145 + lw0*x9*x145 + lw0*x99*x145 + lw0*x16*x145 + lw0*x106*x145 + fw0*x23*x145 + lw0*x113*x145 + lw0*x30*x145 + lw0*x37*x145 + fw0*x44*x145 + lw0*x51*x145 + lw0*x58*x145 + lw0*x65*x145 + lw0*x72*x145 + lw0*x79*x145 + lw0*x86*x145 + lw0*x3*x145 + lw0*x93*x145 + lw0*x10*x145 + lw0*x100*x145 + lw0*x17*x145 + lw0*x107*x145 + lw0*x24*x145 + lw0*x114*x145 + lw0*x31*x145 + fw0*x38*x145 + fw0*x45*x145 + lw0*x52*x145 + lw0*x59*x145 + lw0*x66*x145 + lw0*x73*x145 + lw0*x80*x145 + lw0*x87*x145 + lw0*x4*x145 + lw0*x94*x145 + lw0*x11*x145 + lw0*x101*x145 + fw0*x18*x145 + lw0*x108*x145 + lw0*x25*x145 + lw0*x115*x145 + lw0*x32*x145 + fw0*x39*x145 + fw0*x46*x145 + lw0*x53*x145 + lw0*x60*x145 + lw0*x67*x145 + lw0*x74*x145 + lw0*x81*x145 + lw0*x88*x145 + lw0*x5*x145 + lw0*x95*x145 + fw0*x12*x145 + lw0*x102*x145 + fw0*x19*x145 + lw0*x109*x145 + lw0*x26*x145 + lw0*x116*x145 + lw0*x33*x145 + lw0*x40*x145 + fw0*x47*x145 + lw0*x54*x145 + lw0*x61*x145 + lw0*x68*x145 + lw0*x75*x145 + lw0*x82*x145 + lw0*x89*x145 + fw0*x6*x145 + lw0*x96*x145 + fw0*x13*x145 + lw0*x103*x145 + fw0*x20*x145 + lw0*x110*x145 + lw0*x27*x145 + lw0*x117*x145 + lw0*x34*x145 + lw0*x41*x145 + lw0*x48*x145 + lw0*x55*x145 + lw0*x62*x145 + lw0*x69*x145 + lw0*x76*x145 + lw0*x83*x145 + lw0*x0*x152 + lw0*x90*x152 + lw0*x7*x152 + lw0*x97*x152 + lw0*x14*x152 + lw0*x104*x152 + lw0*x21*x152 + lw0*x111*x152 + fw0*x28*x152 + lw0*x118*x152 + lw0*x35*x152 + lw0*x42*x152 + lw0*x49*x152 + fw0*x56*x152 + lw0*x63*x152 + lw0*x70*x152 + fw0*x77*x152 + lw0*x84*x152 + lw0*x1*x152 + lw0*x91*x152 + lw0*x8*x152 + lw0*x98*x152 + lw0*x15*x152 + lw0*x105*x152 + lw0*x22*x152 + lw0*x112*x152 + fw0*x29*x152 + lw0*x119*x152 + lw0*x36*x152 + lw0*x43*x152 + fw0*x50*x152 + fw0*x57*x152 + lw0*x64*x152 + lw0*x71*x152 + lw0*x78*x152 + lw0*x85*x152 + lw0*x2*x152 + lw0*x92*x152 + lw0*x9*x152 + lw0*x99*x152 + lw0*x16*x152 + lw0*x106*x152 + lw0*x23*x152 + lw0*x113*x152 + lw0*x30*x152 + lw0*x37*x152 + lw0*x44*x152 + fw0*x51*x152 + fw0*x58*x152 + lw0*x65*x152 + lw0*x72*x152 + lw0*x79*x152 + lw0*x86*x152 + lw0*x3*x152 + lw0*x93*x152 + lw0*x10*x152 + lw0*x100*x152 + lw0*x17*x152 + lw0*x107*x152 + fw0*x24*x152 + lw0*x114*x152 + lw0*x31*x152 + lw0*x38*x152 + lw0*x45*x152 + fw0*x52*x152 + fw0*x59*x152 + lw0*x66*x152 + lw0*x73*x152 + lw0*x80*x152 + lw0*x87*x152 + lw0*x4*x152 + lw0*x94*x152 + lw0*x11*x152 + lw0*x101*x152 + lw0*x18*x152 + lw0*x108*x152 + fw0*x25*x152 + lw0*x115*x152 + lw0*x32*x152 + lw0*x39*x152 + lw0*x46*x152 + fw0*x53*x152 + lw0*x60*x152 + lw0*x67*x152 + lw0*x74*x152 + lw0*x81*x152 + fw0*x88*x152 + lw0*x5*x152 + lw0*x95*x152 + lw0*x12*x152 + lw0*x102*x152 + lw0*x19*x152 + lw0*x109*x152 + fw0*x26*x152 + lw0*x116*x152 + lw0*x33*x152 + lw0*x40*x152 + lw0*x47*x152 + lw0*x54*x152 + lw0*x61*x152 + lw0*x68*x152 + lw0*x75*x152 + fw0*x82*x152 + fw0*x89*x152 + lw0*x6*x152 + lw0*x96*x152 + lw0*x13*x152 + lw0*x103*x152 + lw0*x20*x152 + lw0*x110*x152 + fw0*x27*x152 + lw0*x117*x152 + lw0*x34*x152 + lw0*x41*x152 + lw0*x48*x152 + lw0*x55*x152 + lw0*x62*x152 + lw0*x69*x152 + fw0*x76*x152 + fw0*x83*x152 + lw0*x0*x159 + fw0*x90*x159 + lw0*x7*x159 + lw0*x97*x159 + lw0*x14*x159 + lw0*x104*x159 + lw0*x21*x159 + lw0*x111*x159 + lw0*x28*x159 + lw0*x118*x159 + lw0*x35*x159 + fw0*x42*x159 + lw0*x49*x159 + lw0*x56*x159 + fw0*x63*x159 + lw0*x70*x159 + lw0*x77*x159 + lw0*x84*x159 + lw0*x1*x159 + fw0*x91*x159 + lw0*x8*x159 + lw0*x98*x159 + lw0*x15*x159 + lw0*x105*x159 + lw0*x22*x159 + lw0*x112*x159 + lw0*x29*x159 + lw0*x119*x159 + fw0*x36*x159 + fw0*x43*x159 + lw0*x50*x159 + lw0*x57*x159 + lw0*x64*x159 + lw0*x71*x159 + lw0*x78*x159 + lw0*x85*x159 + lw0*x2*x159 + fw0*x92*x159 + lw0*x9*x159 + lw0*x99*x159 + lw0*x16*x159 + lw0*x106*x159 + lw0*x23*x159 + lw0*x113*x159 + fw0*x30*x159 + fw0*x37*x159 + lw0*x44*x159 + lw0*x51*x159 + lw0*x58*x159 + lw0*x65*x159 + lw0*x72*x159 + lw0*x79*x159 + lw0*x86*x159 + lw0*x3*x159 + fw0*x93*x159 + lw0*x10*x159 + lw0*x100*x159 + lw0*x17*x159 + lw0*x107*x159 + lw0*x24*x159 + lw0*x114*x159 + fw0*x31*x159 + lw0*x38*x159 + lw0*x45*x159 + lw0*x52*x159 + lw0*x59*x159 + fw0*x66*x159 + lw0*x73*x159 + lw0*x80*x159 + lw0*x87*x159 + lw0*x4*x159 + fw0*x94*x159 + lw0*x11*x159 + lw0*x101*x159 + lw0*x18*x159 + lw0*x108*x159 + lw0*x25*x159 + lw0*x115*x159 + lw0*x32*x159 + lw0*x39*x159 + lw0*x46*x159 + lw0*x53*x159 + fw0*x60*x159 + fw0*x67*x159 + lw0*x74*x159 + lw0*x81*x159 + lw0*x88*x159 + lw0*x5*x159 + fw0*x95*x159 + lw0*x12*x159 + lw0*x102*x159 + lw0*x19*x159 + lw0*x109*x159 + lw0*x26*x159 + lw0*x116*x159 + lw0*x33*x159 + lw0*x40*x159 + lw0*x47*x159 + lw0*x54*x159 + fw0*x61*x159 + fw0*x68*x159 + lw0*x75*x159 + lw0*x82*x159 + lw0*x89*x159 + lw0*x6*x159 + lw0*x96*x159 + lw0*x13*x159 + lw0*x103*x159 + lw0*x20*x159 + lw0*x110*x159 + lw0*x27*x159 + lw0*x117*x159 + lw0*x34*x159 + lw0*x41*x159 + lw0*x48*x159 + lw0*x55*x159 + fw0*x62*x159 + fw0*x69*x159 + lw0*x76*x159 + lw0*x83*x159 + lw0*x0*x140 + lw0*x90*x140 + lw0*x7*x140 + lw0*x97*x140 + lw0*x14*x140 + lw0*x104*x140 + lw0*x21*x140 + lw0*x111*x140 + fw0*x28*x140 + lw0*x118*x140 + lw0*x35*x140 + lw0*x42*x140 + lw0*x49*x140 + fw0*x56*x140 + lw0*x63*x140 + lw0*x70*x140 + fw0*x77*x140 + lw0*x84*x140 + lw0*x1*x140 + lw0*x91*x140 + lw0*x8*x140 + lw0*x98*x140 + lw0*x15*x140 + lw0*x105*x140 + lw0*x22*x140 + lw0*x112*x140 + fw0*x29*x140 + lw0*x119*x140 + lw0*x36*x140 + lw0*x43*x140 + fw0*x50*x140 + fw0*x57*x140 + lw0*x64*x140 + lw0*x71*x140 + lw0*x78*x140 + lw0*x85*x140 + lw0*x2*x140 + lw0*x92*x140 + lw0*x9*x140 + lw0*x99*x140 + lw0*x16*x140 + lw0*x106*x140 + lw0*x23*x140 + lw0*x113*x140 + lw0*x30*x140 + lw0*x37*x140 + lw0*x44*x140 + fw0*x51*x140 + fw0*x58*x140 + lw0*x65*x140 + lw0*x72*x140 + lw0*x79*x140 + lw0*x86*x140 + lw0*x3*x140 + lw0*x93*x140 + lw0*x10*x140 + lw0*x100*x140 + lw0*x17*x140 + lw0*x107*x140 + fw0*x24*x140 + lw0*x114*x140 + lw0*x31*x140 + lw0*x38*x140 + lw0*x45*x140 + fw0*x52*x140 + fw0*x59*x140 + lw0*x66*x140 + lw0*x73*x140 + lw0*x80*x140 + lw0*x87*x140 + lw0*x4*x140 + lw0*x94*x140 + lw0*x11*x140 + lw0*x101*x140 + lw0*x18*x140 + lw0*x108*x140 + fw0*x25*x140 + lw0*x115*x140 + lw0*x32*x140 + lw0*x39*x140 + lw0*x46*x140 + fw0*x53*x140 + lw0*x60*x140 + lw0*x67*x140 + lw0*x74*x140 + lw0*x81*x140 + fw0*x88*x140 + lw0*x5*x140 + lw0*x95*x140 + lw0*x12*x140 + lw0*x102*x140 + lw0*x19*x140 + lw0*x109*x140 + fw0*x26*x140 + lw0*x116*x140 + lw0*x33*x140 + lw0*x40*x140 + lw0*x47*x140 + lw0*x54*x140 + lw0*x61*x140 + lw0*x68*x140 + lw0*x75*x140 + fw0*x82*x140 + fw0*x89*x140 + lw0*x6*x140 + lw0*x96*x140 + lw0*x13*x140 + lw0*x103*x140 + lw0*x20*x140 + lw0*x110*x140 + fw0*x27*x140 + lw0*x117*x140 + lw0*x34*x140 + lw0*x41*x140 + lw0*x48*x140 + lw0*x55*x140 + lw0*x62*x140 + lw0*x69*x140 + fw0*x76*x140 + fw0*x83*x140 + lw0*x0*x147 + fw0*x90*x147 + lw0*x7*x147 + lw0*x97*x147 + lw0*x14*x147 + lw0*x104*x147 + lw0*x21*x147 + lw0*x111*x147 + lw0*x28*x147 + lw0*x118*x147 + lw0*x35*x147 + fw0*x42*x147 + lw0*x49*x147 + lw0*x56*x147 + fw0*x63*x147 + lw0*x70*x147 + lw0*x77*x147 + lw0*x84*x147 + lw0*x1*x147 + fw0*x91*x147 + lw0*x8*x147 + lw0*x98*x147 + lw0*x15*x147 + lw0*x105*x147 + lw0*x22*x147 + lw0*x112*x147 + lw0*x29*x147 + lw0*x119*x147 + fw0*x36*x147 + fw0*x43*x147 + lw0*x50*x147 + lw0*x57*x147 + lw0*x64*x147 + lw0*x71*x147 + lw0*x78*x147 + lw0*x85*x147 + lw0*x2*x147 + fw0*x92*x147 + lw0*x9*x147 + lw0*x99*x147 + lw0*x16*x147 + lw0*x106*x147 + lw0*x23*x147 + lw0*x113*x147 + fw0*x30*x147 + fw0*x37*x147 + lw0*x44*x147 + lw0*x51*x147 + lw0*x58*x147 + lw0*x65*x147 + lw0*x72*x147 + lw0*x79*x147 + lw0*x86*x147 + lw0*x3*x147 + fw0*x93*x147 + lw0*x10*x147 + lw0*x100*x147 + lw0*x17*x147 + lw0*x107*x147 + lw0*x24*x147 + lw0*x114*x147 + fw0*x31*x147 + lw0*x38*x147 + lw0*x45*x147 + lw0*x52*x147 + lw0*x59*x147 + fw0*x66*x147 + lw0*x73*x147 + lw0*x80*x147 + lw0*x87*x147 + lw0*x4*x147 + fw0*x94*x147 + lw0*x11*x147 + lw0*x101*x147 + lw0*x18*x147 + lw0*x108*x147 + lw0*x25*x147 + lw0*x115*x147 + lw0*x32*x147 + lw0*x39*x147 + lw0*x46*x147 + lw0*x53*x147 + fw0*x60*x147 + fw0*x67*x147 + lw0*x74*x147 + lw0*x81*x147 + lw0*x88*x147 + lw0*x5*x147 + fw0*x95*x147 + lw0*x12*x147 + lw0*x102*x147 + lw0*x19*x147 + lw0*x109*x147 + lw0*x26*x147 + lw0*x116*x147 + lw0*x33*x147 + lw0*x40*x147 + lw0*x47*x147 + lw0*x54*x147 + fw0*x61*x147 + fw0*x68*x147 + lw0*x75*x147 + lw0*x82*x147 + lw0*x89*x147 + lw0*x6*x147 + lw0*x96*x147 + lw0*x13*x147 + lw0*x103*x147 + lw0*x20*x147 + lw0*x110*x147 + lw0*x27*x147 + lw0*x117*x147 + lw0*x34*x147 + lw0*x41*x147 + lw0*x48*x147 + lw0*x55*x147 + fw0*x62*x147 + fw0*x69*x147 + lw0*x76*x147 + lw0*x83*x147
);
# a_lr = c_st + node_c['a_lr']
var rlr0_3, integer;
subject to crlr0_3:
	rlr0_3 == st3 + 802031*x154 + 802808*x161 + 100351*x142 + 715007*x149 + 802808*x156 + 3186172*x144 + 802031*x151 + 802808*x158 + 100351*x139 + 3186172*x146 + 802031*x153 + 802808*x160 + 100351*x141 + 796543*x148 + 802031*x155 + 100351*x143 + 3211036*x150 + 802808*x157 + 401404*x138 + 796543*x145 + 3211036*x152 + 802808*x159 + 401404*x140 + 715007*x147;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep0_3, integer;
subject to cep0_3:
	ep0_3 ==  + 802815*x154 - 802031*x154 + 802815*x161 - 802808*x161 + 802815*x142 - 100351*x142 + 802815*x149 - 715007*x149 + 802815*x156 - 802808*x156 + 3211260*x144 - 3186172*x144 + 802815*x151 - 802031*x151 + 802815*x158 - 802808*x158 + 802815*x139 - 100351*x139 + 3211260*x146 - 3186172*x146 + 802815*x153 - 802031*x153 + 802815*x160 - 802808*x160 + 802815*x141 - 100351*x141 + 802815*x148 - 796543*x148 + 802815*x155 - 802031*x155 + 802815*x143 - 100351*x143 + 3211260*x150 - 3211036*x150 + 802815*x157 - 802808*x157 + 3211260*x138 - 401404*x138 + 802815*x145 - 796543*x145 + 3211260*x152 - 3211036*x152 + 802815*x159 - 802808*x159 + 3211260*x140 - 401404*x140 + 802815*x147 - 715007*x147;
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
	fw3 == st3 + 6272*x154 + 702464*x161 + 784*x142 + 702464*x149 + 56*x156 + 28*x144 + 6272*x151 + 56*x158 + 784*x139 + 28*x146 + 702464*x153 + 6272*x160 + 87808*x141 + 784*x148 + 702464*x155 + 87808*x143 + 28*x150 + 6272*x157 + 28*x138 + 784*x145 + 28*x152 + 702464*x159 + 28*x140 + 702464*x147;

# node: 4 info
# c_st = max(a_fw, b_fw)
var st4, integer;
subject to cst4:
	st4 == (
0 + lw3*x154*x128 + lw3*x161*x128 + lw3*x142*x128 + lw3*x149*x128 + lw3*x156*x128 + fw3*x144*x128 + fw3*x151*x128 + lw3*x158*x128 + lw3*x139*x128 + lw3*x146*x128 + fw3*x153*x128 + lw3*x160*x128 + lw3*x141*x128 + lw3*x148*x128 + lw3*x155*x128 + lw3*x143*x128 + lw3*x150*x128 + lw3*x157*x128 + lw3*x138*x128 + fw3*x145*x128 + lw3*x152*x128 + lw3*x159*x128 + lw3*x140*x128 + lw3*x147*x128 + lw3*x154*x130 + lw3*x161*x130 + lw3*x142*x130 + lw3*x149*x130 + fw3*x156*x130 + lw3*x144*x130 + lw3*x151*x130 + lw3*x158*x130 + lw3*x139*x130 + lw3*x146*x130 + lw3*x153*x130 + lw3*x160*x130 + lw3*x141*x130 + lw3*x148*x130 + lw3*x155*x130 + lw3*x143*x130 + fw3*x150*x130 + fw3*x157*x130 + lw3*x138*x130 + lw3*x145*x130 + lw3*x152*x130 + fw3*x159*x130 + lw3*x140*x130 + lw3*x147*x130 + lw3*x154*x127 + lw3*x161*x127 + fw3*x142*x127 + fw3*x149*x127 + lw3*x156*x127 + lw3*x144*x127 + lw3*x151*x127 + lw3*x158*x127 + lw3*x139*x127 + lw3*x146*x127 + lw3*x153*x127 + lw3*x160*x127 + lw3*x141*x127 + lw3*x148*x127 + lw3*x155*x127 + fw3*x143*x127 + lw3*x150*x127 + lw3*x157*x127 + lw3*x138*x127 + lw3*x145*x127 + lw3*x152*x127 + lw3*x159*x127 + fw3*x140*x127 + lw3*x147*x127 + fw3*x154*x129 + lw3*x161*x129 + lw3*x142*x129 + lw3*x149*x129 + lw3*x156*x129 + lw3*x144*x129 + lw3*x151*x129 + lw3*x158*x129 + lw3*x139*x129 + fw3*x146*x129 + lw3*x153*x129 + lw3*x160*x129 + lw3*x141*x129 + fw3*x148*x129 + fw3*x155*x129 + lw3*x143*x129 + lw3*x150*x129 + lw3*x157*x129 + lw3*x138*x129 + lw3*x145*x129 + lw3*x152*x129 + lw3*x159*x129 + lw3*x140*x129 + lw3*x147*x129 + lw3*x154*x131 + fw3*x161*x131 + lw3*x142*x131 + lw3*x149*x131 + lw3*x156*x131 + lw3*x144*x131 + lw3*x151*x131 + fw3*x158*x131 + lw3*x139*x131 + lw3*x146*x131 + lw3*x153*x131 + fw3*x160*x131 + lw3*x141*x131 + lw3*x148*x131 + lw3*x155*x131 + lw3*x143*x131 + lw3*x150*x131 + lw3*x157*x131 + lw3*x138*x131 + lw3*x145*x131 + fw3*x152*x131 + lw3*x159*x131 + lw3*x140*x131 + lw3*x147*x131 + lw3*x154*x126 + lw3*x161*x126 + lw3*x142*x126 + lw3*x149*x126 + lw3*x156*x126 + lw3*x144*x126 + lw3*x151*x126 + lw3*x158*x126 + fw3*x139*x126 + lw3*x146*x126 + lw3*x153*x126 + lw3*x160*x126 + fw3*x141*x126 + lw3*x148*x126 + lw3*x155*x126 + lw3*x143*x126 + lw3*x150*x126 + lw3*x157*x126 + fw3*x138*x126 + lw3*x145*x126 + lw3*x152*x126 + lw3*x159*x126 + lw3*x140*x126 + fw3*x147*x126
);
# a_lr = c_st + node_c['a_lr']
var rlr3_4, integer;
subject to crlr3_4:
	rlr3_4 == st4 + 100351*x128 + 100351*x130 + 100351*x127 + 100351*x129 + 100351*x131 + 100351*x126;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep3_4, integer;
subject to cep3_4:
	ep3_4 ==  + 100351*x128 - 100351*x128 + 100351*x130 - 100351*x130 + 100351*x127 - 100351*x127 + 100351*x129 - 100351*x129 + 100351*x131 - 100351*x131 + 100351*x126 - 100351*x126;
# a_lt = max(a_lw, a_lr)
var lt3_4, integer;
subject to clt3_4:
	lt3_4 == max(rlr3_4, lw3);
# c_a_et = max(a_lt, a_ft) + c_epilogue_a # max may not be necessary
var lw3_4, integer;
subject to clw3_4:
	lw3_4 == lt3_4 + ep3_4;
# c_et = max(c_a_et, c_b_et) + 1
var lw4, integer;
subject to clw4:
	lw4 == max(lw3_4);
# c_fw = c_st + node_c['fw']
var fw4, integer;
subject to cfw4:
	fw4 == st4 + 0*x128 + 0*x130 + 0*x127 + 0*x129 + 0*x131 + 0*x126;

# node: 5 info
# c_st = max(a_fw, b_fw)
var st5, integer;
subject to cst5:
	st5 == (
0 + lw4*x128*x163 + lw4*x130*x163 + fw4*x127*x163 + lw4*x129*x163 + lw4*x131*x163 + lw4*x126*x163 + lw4*x128*x165 + lw4*x130*x165 + lw4*x127*x165 + fw4*x129*x165 + lw4*x131*x165 + lw4*x126*x165 + lw4*x128*x167 + lw4*x130*x167 + lw4*x127*x167 + lw4*x129*x167 + fw4*x131*x167 + lw4*x126*x167 + lw4*x128*x162 + lw4*x130*x162 + lw4*x127*x162 + lw4*x129*x162 + lw4*x131*x162 + fw4*x126*x162 + fw4*x128*x164 + lw4*x130*x164 + lw4*x127*x164 + lw4*x129*x164 + lw4*x131*x164 + lw4*x126*x164 + lw4*x128*x166 + fw4*x130*x166 + lw4*x127*x166 + lw4*x129*x166 + lw4*x131*x166 + lw4*x126*x166
);
# a_lr = c_st + node_c['a_lr']
var rlr4_5, integer;
subject to crlr4_5:
	rlr4_5 == st5 + 100351*x163 + 100351*x165 + 100351*x167 + 100351*x162 + 100351*x164 + 100351*x166;
# c_epilogue_a = node_c['lw'] - node_c['a_lr']
var ep4_5, integer;
subject to cep4_5:
	ep4_5 == 0
;
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
;

# objective function
var latency, integer;
subject to clatency:
	latency == lw5;
minimize obj: latency;
solve obj;
display x0;
display x90;
display x7;
display x97;
display x14;
display x104;
display x21;
display x111;
display x28;
display x118;
display x35;
display x42;
display x49;
display x56;
display x63;
display x70;
display x77;
display x84;
display x1;
display x91;
display x8;
display x98;
display x15;
display x105;
display x22;
display x112;
display x29;
display x119;
display x36;
display x43;
display x50;
display x57;
display x64;
display x71;
display x78;
display x85;
display x2;
display x92;
display x9;
display x99;
display x16;
display x106;
display x23;
display x113;
display x30;
display x37;
display x44;
display x51;
display x58;
display x65;
display x72;
display x79;
display x86;
display x3;
display x93;
display x10;
display x100;
display x17;
display x107;
display x24;
display x114;
display x31;
display x38;
display x45;
display x52;
display x59;
display x66;
display x73;
display x80;
display x87;
display x4;
display x94;
display x11;
display x101;
display x18;
display x108;
display x25;
display x115;
display x32;
display x39;
display x46;
display x53;
display x60;
display x67;
display x74;
display x81;
display x88;
display x5;
display x95;
display x12;
display x102;
display x19;
display x109;
display x26;
display x116;
display x33;
display x40;
display x47;
display x54;
display x61;
display x68;
display x75;
display x82;
display x89;
display x6;
display x96;
display x13;
display x103;
display x20;
display x110;
display x27;
display x117;
display x34;
display x41;
display x48;
display x55;
display x62;
display x69;
display x76;
display x83;
display x123;
display x125;
display x120;
display x122;
display x124;
display x121;
display x128;
display x130;
display x127;
display x129;
display x131;
display x126;
display x135;
display x137;
display x132;
display x134;
display x136;
display x133;
display x154;
display x161;
display x142;
display x149;
display x156;
display x144;
display x151;
display x158;
display x139;
display x146;
display x153;
display x160;
display x141;
display x148;
display x155;
display x143;
display x150;
display x157;
display x138;
display x145;
display x152;
display x159;
display x140;
display x147;
display x163;
display x165;
display x167;
display x162;
display x164;
display x166;
display latency;
