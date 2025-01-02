b0_697 = 1
b7_2 = 1
b2_2 = 1
b10000_0 = 1
b4_5 = 1
b6_0 = 1
b1_0 = 1
b8_2 = 1
b3_5 = 1
b5_547 = 1
x0_5 = 8
u0_5 = 2
assert u0_5 * x0_5 == 16
x0_4 = 28
u0_4 = 2
assert u0_4 * x0_4 == 56
x0_0 = 56
u0_0 = 1
assert u0_0 * x0_0 == 56
x0_1 = 8
u0_1 = 2
assert u0_1 * x0_1 == 16
x0_3 = 3
u0_3 = 1
assert u0_3 * x0_3 == 3
x0_2 = 3
u0_2 = 1
assert u0_2 * x0_2 == 3
DSP_0 = u0_0 * u0_1 * u0_2 * u0_3 * u0_4 * u0_5
x7_1 = 8
u7_1 = 2
assert u7_1 * x7_1 == 16
x7_0 = 28
u7_0 = 2
assert u7_0 * x7_0 == 56
x7_2 = 8
u7_2 = 7
assert u7_2 * x7_2 == 56
DSP_7 = 0
x2_1 = 8
u2_1 = 2
assert u2_1 * x2_1 == 16
x2_0 = 29
u2_0 = 2
assert u2_0 * x2_0 == 58
x2_2 = 58
u2_2 = 1
assert u2_2 * x2_2 == 58
DSP_2 = 0
x4_2 = 8
u4_2 = 2
assert u4_2 * x4_2 == 16
x4_1 = 28
u4_1 = 2
assert u4_1 * x4_1 == 56
x4_0 = 56
u4_0 = 1
assert u4_0 * x4_0 == 56
DSP_4 = 0
x6_0 = 8
u6_0 = 2
assert u6_0 * x6_0 == 16
x6_1 = 29
u6_1 = 2
assert u6_1 * x6_1 == 58
x6_2 = 58
u6_2 = 1
assert u6_2 * x6_2 == 58
DSP_6 = 0
x1_0 = 8
u1_0 = 2
assert u1_0 * x1_0 == 16
x1_1 = 28
u1_1 = 2
assert u1_1 * x1_1 == 56
x1_2 = 56
u1_2 = 1
assert u1_2 * x1_2 == 56
DSP_1 = 0
x8_1 = 8
u8_1 = 2
assert u8_1 * x8_1 == 16
x8_0 = 28
u8_0 = 2
assert u8_0 * x8_0 == 56
x8_2 = 8
u8_2 = 7
assert u8_2 * x8_2 == 56
DSP_8 = 0
x3_2 = 8
u3_2 = 2
assert u3_2 * x3_2 == 16
x3_1 = 28
u3_1 = 2
assert u3_1 * x3_1 == 56
x3_0 = 56
u3_0 = 1
assert u3_0 * x3_0 == 56
DSP_3 = 0
x5_4 = 8
u5_4 = 2
assert u5_4 * x5_4 == 16
x5_2 = 28
u5_2 = 2
assert u5_2 * x5_2 == 56
x5_5 = 8
u5_5 = 7
assert u5_5 * x5_5 == 56
x5_0 = 8
u5_0 = 2
assert u5_0 * x5_0 == 16
x5_3 = 3
u5_3 = 1
assert u5_3 * x5_3 == 3
x5_1 = 3
u5_1 = 1
assert u5_1 * x5_1 == 3
DSP_5 = u5_0 * u5_1 * u5_2 * u5_3 * u5_4 * u5_5
totalDSP = DSP_0 + DSP_7 + DSP_2 + DSP_4 + DSP_6 + DSP_1 + DSP_8 + DSP_3 + DSP_5
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 1 info
# start time
st1 = (0 + fw10000*b10000_0*b1_0)
# relative first write times of inputs
rlr10000_1 = st1
# epilogues
ep10000_1 =  + ((50175) * 1) * b1_0
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + (0) * 1

# node: 6 info
# start time
st6 = (0 + fw10000*b10000_0*b6_0)
# relative first write times of inputs
rlr10000_6 = st6
# epilogues
ep10000_6 =  + ((53823) * 1) * b6_0
# inputs last read/write dependencies
lt10000_6 = max(rlr10000_6, lw10000)
# curr last write times
lw10000_6 = lt10000_6 + ep10000_6
# c_et = max(c_a_et, c_b_et) + 1
lw6 = (lw10000_6)
# node first write time
fw6 = st6 + (0) * 1

# node: 2 info
# start time
st2 = (0 + fw10000*b10000_0*b2_2)
# relative first write times of inputs
rlr10000_2 = st2
# epilogues
ep10000_2 =  + ((53823) * 1) * b2_2
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + (0) * 1

# node: 0 info
# start time
st0 = max(0 + lw1*b1_0*b0_697, 0 + lw2*b2_2*b0_697)
# relative first write times of inputs
rlr1_0 = st0 + ((7225328) * 1) * b0_697
rlr2_0 = st0 + ((7225328) * 1) * b0_697
# epilogues
ep1_0 =  + ((7225343) * 1) * b0_697 - ((7225328) * 1) * b0_697
ep2_0 =  + ((7225343) * 1) * b0_697 - ((7225328) * 1) * b0_697
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt2_0 = max(rlr2_0, lw2)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw2_0 = lt2_0 + ep2_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = max(lw1_0, lw2_0)
# node first write time
fw0 = st0 + (128128) * 1

# node: 3 info
# start time
st3 = (0 + fw0*b0_697*b3_5)
# relative first write times of inputs
rlr0_3 = st3 + ((50175) * 1) * b3_5
# epilogues
ep0_3 =  + ((50175) * 1) * b3_5 - ((50175) * 1) * b3_5
# inputs last read/write dependencies
lt0_3 = max(rlr0_3, lw0)
# curr last write times
lw0_3 = lt0_3 + ep0_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw0_3)
# node first write time
fw3 = st3 + (0) * 1

# node: 4 info
# start time
st4 = (0 + fw3*b3_5*b4_5)
# relative first write times of inputs
rlr3_4 = st4 + ((50175) * 1) * b4_5
# epilogues
ep3_4 =  + ((50175) * 1) * b4_5 - ((50175) * 1) * b4_5
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = (lw3_4)
# node first write time
fw4 = st4 + (0) * 1

# node: 5 info
# start time
st5 = max(0 + lw4*b4_5*b5_547, 0 + lw6*b6_0*b5_547)
# relative first write times of inputs
rlr4_5 = st5 + ((7224503) * 1) * b5_547
rlr6_5 = st5 + ((7224503) * 1) * b5_547
# epilogues
ep4_5 =  + ((7225343) * 1) * b5_547 - ((7224503) * 1) * b5_547
ep6_5 =  + ((7225343) * 1) * b5_547 - ((7224503) * 1) * b5_547
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
lt6_5 = max(rlr6_5, lw6)
# curr last write times
lw4_5 = lt4_5 + ep4_5
lw6_5 = lt6_5 + ep6_5
# c_et = max(c_a_et, c_b_et) + 1
lw5 = max(lw4_5, lw6_5)
# node first write time
fw5 = st5 + (7076608) * 1

# node: 7 info
# start time
st7 = (0 + fw5*b5_547*b7_2)
# relative first write times of inputs
rlr5_7 = st7 + ((50175) * 1) * b7_2
# epilogues
ep5_7 =  + ((50175) * 1) * b7_2 - ((50175) * 1) * b7_2
# inputs last read/write dependencies
lt5_7 = max(rlr5_7, lw5)
# curr last write times
lw5_7 = lt5_7 + ep5_7
# c_et = max(c_a_et, c_b_et) + 1
lw7 = (lw5_7)
# node first write time
fw7 = st7 + (0) * 1

# node: 8 info
# start time
st8 = (0 + fw7*b7_2*b8_2)
# relative first write times of inputs
rlr7_8 = st8 + ((50175) * 1) * b8_2
# epilogues
ep7_8 = 0
# inputs last read/write dependencies
lt7_8 = max(rlr7_8, lw7)
# curr last write times
lw7_8 = lt7_8 + ep7_8
# c_et = max(c_a_et, c_b_et) + 1
lw8 = (lw7_8)


# objective function
latency = lw8
print(latency)
print(totalDSP)
