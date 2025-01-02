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
var tc10000, integer;
subject to ctc10000:
	tc10000 == 0;
var st10000, integer;
subject to cst10000:
	st10000 == 0;
var et10000, integer;
subject to cet10000:
	et10000 == 0;
var fifo10000, integer;
subject to cfifo10000:
	fifo10000 == 0;

# node: 6 info
var tc6, integer;
subject to ctc6:
	tc6 == (1*53824*x45 + 1*53824*x47 + 1*53824*x42 + 1*53824*x44 + 1*53824*x46 + 1*53824*x43);
var st6, integer;
subject to cst6:
	st6 == (0);
var et6, integer;
subject to cet6:
	et6 == max(st6 + tc6, et10000);
# node: 2 info
var tc2, integer;
subject to ctc2:
	tc2 == (1*53824*x33 + 1*53824*x35 + 1*53824*x30 + 1*53824*x32 + 1*53824*x34 + 1*53824*x31);
var st2, integer;
subject to cst2:
	st2 == (0);
var et2, integer;
subject to cet2:
	et2 == max(st2 + tc2, et10000);
# node: 1 info
var tc1, integer;
subject to ctc1:
	tc1 == (1*53824*x52 + 1*53824*x49 + 1*53824*x51 + 1*53824*x53 + 1*53824*x48 + 1*53824*x50);
var st1, integer;
subject to cst1:
	st1 == (0 + et2*x33*x52 + et2*x35*x52 + et2*x30*x52 + et2*x32*x52 + (st2 + 0)*x34*x52 + et2*x31*x52 + et2*x33*x49 + et2*x35*x49 + et2*x30*x49 + et2*x32*x49 + et2*x34*x49 + (st2 + 0)*x31*x49 + (st2 + 0)*x33*x51 + et2*x35*x51 + et2*x30*x51 + et2*x32*x51 + et2*x34*x51 + et2*x31*x51 + et2*x33*x53 + (st2 + 0)*x35*x53 + et2*x30*x53 + et2*x32*x53 + et2*x34*x53 + et2*x31*x53 + et2*x33*x48 + et2*x35*x48 + (st2 + 0)*x30*x48 + et2*x32*x48 + et2*x34*x48 + et2*x31*x48 + et2*x33*x50 + et2*x35*x50 + et2*x30*x50 + (st2 + 0)*x32*x50 + et2*x34*x50 + et2*x31*x50);
var et1, integer;
subject to cet1:
	et1 == max(st1 + tc1, et2);
# node: 0 info
var tc0, integer;
subject to ctc0:
	tc0 == (4*7750656*x0 + 1*7750656*x7 + 1*7750656*x14 + 1*7750656*x21 + 4*7750656*x2 + 4*7750656*x9 + 4*7750656*x16 + 1*7750656*x23 + 1*7750656*x4 + 1*7750656*x11 + 1*7750656*x18 + 4*7750656*x6 + 4*7750656*x13 + 1*7750656*x20 + 4*7750656*x1 + 4*7750656*x8 + 1*7750656*x15 + 1*7750656*x22 + 4*7750656*x3 + 4*7750656*x10 + 4*7750656*x17 + 1*7750656*x5 + 4*7750656*x12 + 1*7750656*x19);
var st0, integer;
subject to cst0:
	st0 == (0 + (st1 + 0)*x52*x0 + et1*x49*x0 + et1*x51*x0 + et1*x53*x0 + et1*x48*x0 + et1*x50*x0 + et1*x52*x7 + et1*x49*x7 + et1*x51*x7 + et1*x53*x7 + (st1 + 0)*x48*x7 + et1*x50*x7 + et1*x52*x14 + et1*x49*x14 + et1*x51*x14 + et1*x53*x14 + (st1 + 0)*x48*x14 + et1*x50*x14 + (st1 + 0)*x52*x21 + et1*x49*x21 + et1*x51*x21 + et1*x53*x21 + et1*x48*x21 + et1*x50*x21 + et1*x52*x2 + et1*x49*x2 + et1*x51*x2 + et1*x53*x2 + (st1 + 0)*x48*x2 + et1*x50*x2 + (st1 + 0)*x52*x9 + et1*x49*x9 + et1*x51*x9 + et1*x53*x9 + et1*x48*x9 + et1*x50*x9 + (st1 + 0)*x52*x16 + et1*x49*x16 + et1*x51*x16 + et1*x53*x16 + et1*x48*x16 + et1*x50*x16 + et1*x52*x23 + et1*x49*x23 + et1*x51*x23 + et1*x53*x23 + (st1 + 0)*x48*x23 + et1*x50*x23 + et1*x52*x4 + et1*x49*x4 + et1*x51*x4 + et1*x53*x4 + (st1 + 0)*x48*x4 + et1*x50*x4 + et1*x52*x11 + et1*x49*x11 + et1*x51*x11 + et1*x53*x11 + (st1 + 0)*x48*x11 + et1*x50*x11 + (st1 + 0)*x52*x18 + et1*x49*x18 + et1*x51*x18 + et1*x53*x18 + et1*x48*x18 + et1*x50*x18 + et1*x52*x6 + et1*x49*x6 + et1*x51*x6 + et1*x53*x6 + (st1 + 0)*x48*x6 + et1*x50*x6 + et1*x52*x13 + et1*x49*x13 + et1*x51*x13 + et1*x53*x13 + (st1 + 0)*x48*x13 + et1*x50*x13 + et1*x52*x20 + et1*x49*x20 + et1*x51*x20 + et1*x53*x20 + (st1 + 0)*x48*x20 + et1*x50*x20 + (st1 + 0)*x52*x1 + et1*x49*x1 + et1*x51*x1 + et1*x53*x1 + et1*x48*x1 + et1*x50*x1 + (st1 + 0)*x52*x8 + et1*x49*x8 + et1*x51*x8 + et1*x53*x8 + et1*x48*x8 + et1*x50*x8 + et1*x52*x15 + et1*x49*x15 + et1*x51*x15 + et1*x53*x15 + (st1 + 0)*x48*x15 + et1*x50*x15 + et1*x52*x22 + et1*x49*x22 + et1*x51*x22 + et1*x53*x22 + (st1 + 0)*x48*x22 + et1*x50*x22 + (st1 + 0)*x52*x3 + et1*x49*x3 + et1*x51*x3 + et1*x53*x3 + et1*x48*x3 + et1*x50*x3 + (st1 + 0)*x52*x10 + et1*x49*x10 + et1*x51*x10 + et1*x53*x10 + et1*x48*x10 + et1*x50*x10 + (st1 + 0)*x52*x17 + et1*x49*x17 + et1*x51*x17 + et1*x53*x17 + et1*x48*x17 + et1*x50*x17 + et1*x52*x5 + et1*x49*x5 + et1*x51*x5 + et1*x53*x5 + (st1 + 0)*x48*x5 + et1*x50*x5 + (st1 + 0)*x52*x12 + et1*x49*x12 + et1*x51*x12 + et1*x53*x12 + et1*x48*x12 + et1*x50*x12 + (st1 + 0)*x52*x19 + et1*x49*x19 + et1*x51*x19 + et1*x53*x19 + et1*x48*x19 + et1*x50*x19);
var et0, integer;
subject to cet0:
	et0 == max(st0 + tc0, et1);
# node: 3 info
var tc3, integer;
subject to ctc3:
	tc3 == (1*50176*x64 + 1*50176*x61 + 1*50176*x63 + 1*50176*x65 + 1*50176*x60 + 1*50176*x62);
var st3, integer;
subject to cst3:
	st3 == (0 + et0*x0*x64 + et0*x7*x64 + et0*x14*x64 + (st0 + 6889712)*x21*x64 + et0*x2*x64 + (st0 + 572)*x9*x64 + (st0 + 8252)*x16*x64 + (st0 + 7696832)*x23*x64 + et0*x4*x64 + et0*x11*x64 + (st0 + 2288)*x18*x64 + et0*x6*x64 + (st0 + 29064992)*x13*x64 + (st0 + 7266368)*x20*x64 + et0*x1*x64 + (st0 + 572)*x8*x64 + et0*x15*x64 + (st0 + 7696832)*x22*x64 + et0*x3*x64 + et0*x10*x64 + (st0 + 27557948)*x17*x64 + et0*x5*x64 + (st0 + 8672)*x12*x64 + (st0 + 2288)*x19*x64 + et0*x0*x61 + et0*x7*x61 + et0*x14*x61 + et0*x21*x61 + et0*x2*x61 + et0*x9*x61 + et0*x16*x61 + et0*x23*x61 + et0*x4*x61 + et0*x11*x61 + et0*x18*x61 + et0*x6*x61 + et0*x13*x61 + et0*x20*x61 + et0*x1*x61 + et0*x8*x61 + et0*x15*x61 + et0*x22*x61 + et0*x3*x61 + et0*x10*x61 + et0*x17*x61 + et0*x5*x61 + et0*x12*x61 + et0*x19*x61 + et0*x0*x63 + et0*x7*x63 + et0*x14*x63 + et0*x21*x63 + et0*x2*x63 + et0*x9*x63 + et0*x16*x63 + et0*x23*x63 + et0*x4*x63 + et0*x11*x63 + et0*x18*x63 + et0*x6*x63 + et0*x13*x63 + et0*x20*x63 + et0*x1*x63 + et0*x8*x63 + et0*x15*x63 + et0*x22*x63 + et0*x3*x63 + et0*x10*x63 + et0*x17*x63 + et0*x5*x63 + et0*x12*x63 + et0*x19*x63 + et0*x0*x65 + et0*x7*x65 + et0*x14*x65 + et0*x21*x65 + et0*x2*x65 + et0*x9*x65 + et0*x16*x65 + et0*x23*x65 + et0*x4*x65 + et0*x11*x65 + et0*x18*x65 + et0*x6*x65 + et0*x13*x65 + et0*x20*x65 + et0*x1*x65 + et0*x8*x65 + et0*x15*x65 + et0*x22*x65 + et0*x3*x65 + et0*x10*x65 + et0*x17*x65 + et0*x5*x65 + et0*x12*x65 + et0*x19*x65 + (st0 + 572)*x0*x60 + (st0 + 7293152)*x7*x60 + (st0 + 7696832)*x14*x60 + et0*x21*x60 + (st0 + 1816592)*x2*x60 + et0*x9*x60 + et0*x16*x60 + et0*x23*x60 + (st0 + 481052)*x4*x60 + (st0 + 6939932)*x11*x60 + et0*x18*x60 + (st0 + 29064992)*x6*x60 + et0*x13*x60 + et0*x20*x60 + (st0 + 572)*x1*x60 + et0*x8*x60 + (st0 + 7696832)*x15*x60 + et0*x22*x60 + (st0 + 1722428)*x3*x60 + (st0 + 27557948)*x10*x60 + et0*x17*x60 + (st0 + 481052)*x5*x60 + et0*x12*x60 + et0*x19*x60 + et0*x0*x62 + et0*x7*x62 + et0*x14*x62 + et0*x21*x62 + et0*x2*x62 + et0*x9*x62 + et0*x16*x62 + et0*x23*x62 + et0*x4*x62 + et0*x11*x62 + et0*x18*x62 + et0*x6*x62 + et0*x13*x62 + et0*x20*x62 + et0*x1*x62 + et0*x8*x62 + et0*x15*x62 + et0*x22*x62 + et0*x3*x62 + et0*x10*x62 + et0*x17*x62 + et0*x5*x62 + et0*x12*x62 + et0*x19*x62);
var et3, integer;
subject to cet3:
	et3 == max(st3 + tc3, et0);
# node: 4 info
var tc4, integer;
subject to ctc4:
	tc4 == (1*53824*x40 + 1*53824*x37 + 1*53824*x39 + 1*53824*x41 + 1*53824*x36 + 1*53824*x38);
var st4, integer;
subject to cst4:
	st4 == max( + (st3 + 0)*x64*x40 + et3*x61*x40 + et3*x63*x40 + et3*x65*x40 + et3*x60*x40 + et3*x62*x40 + et3*x64*x37 + (st3 + 0)*x61*x37 + et3*x63*x37 + et3*x65*x37 + et3*x60*x37 + et3*x62*x37 + et3*x64*x39 + et3*x61*x39 + (st3 + 0)*x63*x39 + et3*x65*x39 + et3*x60*x39 + et3*x62*x39 + et3*x64*x41 + et3*x61*x41 + et3*x63*x41 + (st3 + 0)*x65*x41 + et3*x60*x41 + et3*x62*x41 + et3*x64*x36 + et3*x61*x36 + et3*x63*x36 + et3*x65*x36 + (st3 + 0)*x60*x36 + et3*x62*x36 + et3*x64*x38 + et3*x61*x38 + et3*x63*x38 + et3*x65*x38 + et3*x60*x38 + (st3 + 0)*x62*x38,  + et6*x45*x40 + et6*x47*x40 + et6*x42*x40 + et6*x44*x40 + (st6 + 0)*x46*x40 + et6*x43*x40 + et6*x45*x37 + et6*x47*x37 + et6*x42*x37 + et6*x44*x37 + et6*x46*x37 + (st6 + 0)*x43*x37 + (st6 + 0)*x45*x39 + et6*x47*x39 + et6*x42*x39 + et6*x44*x39 + et6*x46*x39 + et6*x43*x39 + et6*x45*x41 + (st6 + 0)*x47*x41 + et6*x42*x41 + et6*x44*x41 + et6*x46*x41 + et6*x43*x41 + et6*x45*x36 + et6*x47*x36 + (st6 + 0)*x42*x36 + et6*x44*x36 + et6*x46*x36 + et6*x43*x36 + et6*x45*x38 + et6*x47*x38 + et6*x42*x38 + (st6 + 0)*x44*x38 + et6*x46*x38 + et6*x43*x38);
var et4, integer;
subject to cet4:
	et4 == max(st4 + tc4, et3, et6);
# node: 5 info
var tc5, integer;
subject to ctc5:
	tc5 == (1*7750656*x71 + 4*7750656*x78 + 1*7750656*x85 + 4*7750656*x66 + 1*7750656*x73 + 1*7750656*x80 + 1*7750656*x87 + 4*7750656*x68 + 4*7750656*x75 + 4*7750656*x82 + 1*7750656*x89 + 1*7750656*x70 + 1*7750656*x77 + 1*7750656*x84 + 4*7750656*x72 + 4*7750656*x79 + 1*7750656*x86 + 4*7750656*x67 + 4*7750656*x74 + 1*7750656*x81 + 1*7750656*x88 + 4*7750656*x69 + 4*7750656*x76 + 4*7750656*x83);
var st5, integer;
subject to cst5:
	st5 == (0 + et4*x40*x71 + et4*x37*x71 + et4*x39*x71 + et4*x41*x71 + (st4 + 0)*x36*x71 + et4*x38*x71 + (st4 + 0)*x40*x78 + et4*x37*x78 + et4*x39*x78 + et4*x41*x78 + et4*x36*x78 + et4*x38*x78 + (st4 + 0)*x40*x85 + et4*x37*x85 + et4*x39*x85 + et4*x41*x85 + et4*x36*x85 + et4*x38*x85 + (st4 + 0)*x40*x66 + et4*x37*x66 + et4*x39*x66 + et4*x41*x66 + et4*x36*x66 + et4*x38*x66 + et4*x40*x73 + et4*x37*x73 + et4*x39*x73 + et4*x41*x73 + (st4 + 0)*x36*x73 + et4*x38*x73 + et4*x40*x80 + et4*x37*x80 + et4*x39*x80 + et4*x41*x80 + (st4 + 0)*x36*x80 + et4*x38*x80 + (st4 + 0)*x40*x87 + et4*x37*x87 + et4*x39*x87 + et4*x41*x87 + et4*x36*x87 + et4*x38*x87 + et4*x40*x68 + et4*x37*x68 + et4*x39*x68 + et4*x41*x68 + (st4 + 0)*x36*x68 + et4*x38*x68 + (st4 + 0)*x40*x75 + et4*x37*x75 + et4*x39*x75 + et4*x41*x75 + et4*x36*x75 + et4*x38*x75 + (st4 + 0)*x40*x82 + et4*x37*x82 + et4*x39*x82 + et4*x41*x82 + et4*x36*x82 + et4*x38*x82 + et4*x40*x89 + et4*x37*x89 + et4*x39*x89 + et4*x41*x89 + (st4 + 0)*x36*x89 + et4*x38*x89 + et4*x40*x70 + et4*x37*x70 + et4*x39*x70 + et4*x41*x70 + (st4 + 0)*x36*x70 + et4*x38*x70 + et4*x40*x77 + et4*x37*x77 + et4*x39*x77 + et4*x41*x77 + (st4 + 0)*x36*x77 + et4*x38*x77 + (st4 + 0)*x40*x84 + et4*x37*x84 + et4*x39*x84 + et4*x41*x84 + et4*x36*x84 + et4*x38*x84 + et4*x40*x72 + et4*x37*x72 + et4*x39*x72 + et4*x41*x72 + (st4 + 0)*x36*x72 + et4*x38*x72 + et4*x40*x79 + et4*x37*x79 + et4*x39*x79 + et4*x41*x79 + (st4 + 0)*x36*x79 + et4*x38*x79 + et4*x40*x86 + et4*x37*x86 + et4*x39*x86 + et4*x41*x86 + (st4 + 0)*x36*x86 + et4*x38*x86 + (st4 + 0)*x40*x67 + et4*x37*x67 + et4*x39*x67 + et4*x41*x67 + et4*x36*x67 + et4*x38*x67 + (st4 + 0)*x40*x74 + et4*x37*x74 + et4*x39*x74 + et4*x41*x74 + et4*x36*x74 + et4*x38*x74 + et4*x40*x81 + et4*x37*x81 + et4*x39*x81 + et4*x41*x81 + (st4 + 0)*x36*x81 + et4*x38*x81 + et4*x40*x88 + et4*x37*x88 + et4*x39*x88 + et4*x41*x88 + (st4 + 0)*x36*x88 + et4*x38*x88 + (st4 + 0)*x40*x69 + et4*x37*x69 + et4*x39*x69 + et4*x41*x69 + et4*x36*x69 + et4*x38*x69 + (st4 + 0)*x40*x76 + et4*x37*x76 + et4*x39*x76 + et4*x41*x76 + et4*x36*x76 + et4*x38*x76 + (st4 + 0)*x40*x83 + et4*x37*x83 + et4*x39*x83 + et4*x41*x83 + et4*x36*x83 + et4*x38*x83);
var et5, integer;
subject to cet5:
	et5 == max(st5 + tc5, et4);
# node: 7 info
var tc7, integer;
subject to ctc7:
	tc7 == (1*50176*x26 + 1*50176*x28 + 1*50176*x25 + 1*50176*x27 + 1*50176*x29 + 1*50176*x24);
var st7, integer;
subject to cst7:
	st7 == (0 + et5*x71*x26 + et5*x78*x26 + et5*x85*x26 + et5*x66*x26 + et5*x73*x26 + et5*x80*x26 + et5*x87*x26 + et5*x68*x26 + et5*x75*x26 + et5*x82*x26 + et5*x89*x26 + et5*x70*x26 + et5*x77*x26 + et5*x84*x26 + et5*x72*x26 + et5*x79*x26 + et5*x86*x26 + et5*x67*x26 + et5*x74*x26 + et5*x81*x26 + et5*x88*x26 + et5*x69*x26 + et5*x76*x26 + et5*x83*x26 + et5*x71*x28 + (st5 + 8672)*x78*x28 + (st5 + 2288)*x85*x28 + et5*x66*x28 + et5*x73*x28 + et5*x80*x28 + (st5 + 6889712)*x87*x28 + et5*x68*x28 + (st5 + 572)*x75*x28 + (st5 + 8252)*x82*x28 + (st5 + 7696832)*x89*x28 + et5*x70*x28 + et5*x77*x28 + (st5 + 2288)*x84*x28 + et5*x72*x28 + (st5 + 29064992)*x79*x28 + (st5 + 7266368)*x86*x28 + et5*x67*x28 + (st5 + 572)*x74*x28 + et5*x81*x28 + (st5 + 7696832)*x88*x28 + et5*x69*x28 + et5*x76*x28 + (st5 + 27557948)*x83*x28 + et5*x71*x25 + et5*x78*x25 + et5*x85*x25 + et5*x66*x25 + et5*x73*x25 + et5*x80*x25 + et5*x87*x25 + et5*x68*x25 + et5*x75*x25 + et5*x82*x25 + et5*x89*x25 + et5*x70*x25 + et5*x77*x25 + et5*x84*x25 + et5*x72*x25 + et5*x79*x25 + et5*x86*x25 + et5*x67*x25 + et5*x74*x25 + et5*x81*x25 + et5*x88*x25 + et5*x69*x25 + et5*x76*x25 + et5*x83*x25 + et5*x71*x27 + et5*x78*x27 + et5*x85*x27 + et5*x66*x27 + et5*x73*x27 + et5*x80*x27 + et5*x87*x27 + et5*x68*x27 + et5*x75*x27 + et5*x82*x27 + et5*x89*x27 + et5*x70*x27 + et5*x77*x27 + et5*x84*x27 + et5*x72*x27 + et5*x79*x27 + et5*x86*x27 + et5*x67*x27 + et5*x74*x27 + et5*x81*x27 + et5*x88*x27 + et5*x69*x27 + et5*x76*x27 + et5*x83*x27 + et5*x71*x29 + et5*x78*x29 + et5*x85*x29 + et5*x66*x29 + et5*x73*x29 + et5*x80*x29 + et5*x87*x29 + et5*x68*x29 + et5*x75*x29 + et5*x82*x29 + et5*x89*x29 + et5*x70*x29 + et5*x77*x29 + et5*x84*x29 + et5*x72*x29 + et5*x79*x29 + et5*x86*x29 + et5*x67*x29 + et5*x74*x29 + et5*x81*x29 + et5*x88*x29 + et5*x69*x29 + et5*x76*x29 + et5*x83*x29 + (st5 + 481052)*x71*x24 + et5*x78*x24 + et5*x85*x24 + (st5 + 572)*x66*x24 + (st5 + 7293152)*x73*x24 + (st5 + 7696832)*x80*x24 + et5*x87*x24 + (st5 + 1816592)*x68*x24 + et5*x75*x24 + et5*x82*x24 + et5*x89*x24 + (st5 + 481052)*x70*x24 + (st5 + 6939932)*x77*x24 + et5*x84*x24 + (st5 + 29064992)*x72*x24 + et5*x79*x24 + et5*x86*x24 + (st5 + 572)*x67*x24 + et5*x74*x24 + (st5 + 7696832)*x81*x24 + et5*x88*x24 + (st5 + 1722428)*x69*x24 + (st5 + 27557948)*x76*x24 + et5*x83*x24);
var et7, integer;
subject to cet7:
	et7 == max(st7 + tc7, et5);
# node: 8 info
var tc8, integer;
subject to ctc8:
	tc8 == (1*50176*x59 + 1*50176*x54 + 1*50176*x56 + 1*50176*x58 + 1*50176*x55 + 1*50176*x57);
var st8, integer;
subject to cst8:
	st8 == (0 + et7*x26*x59 + et7*x28*x59 + et7*x25*x59 + et7*x27*x59 + (st7 + 0)*x29*x59 + et7*x24*x59 + et7*x26*x54 + et7*x28*x54 + et7*x25*x54 + et7*x27*x54 + et7*x29*x54 + (st7 + 0)*x24*x54 + (st7 + 0)*x26*x56 + et7*x28*x56 + et7*x25*x56 + et7*x27*x56 + et7*x29*x56 + et7*x24*x56 + et7*x26*x58 + (st7 + 0)*x28*x58 + et7*x25*x58 + et7*x27*x58 + et7*x29*x58 + et7*x24*x58 + et7*x26*x55 + et7*x28*x55 + (st7 + 0)*x25*x55 + et7*x27*x55 + et7*x29*x55 + et7*x24*x55 + et7*x26*x57 + et7*x28*x57 + et7*x25*x57 + (st7 + 0)*x27*x57 + et7*x29*x57 + et7*x24*x57);
var et8, integer;
subject to cet8:
	et8 == max(st8 + tc8, et7);
# objective function
var latency, integer;
subject to clatency:
	latency == et8;
maximize obj: latency;
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
