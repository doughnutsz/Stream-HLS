b0_5 = 1
b7_1 = 1
b2_4 = 1
b10000_0 = 1
b4_1 = 1
b6_5 = 1
b1_4 = 1
b3_3 = 1
b5_3 = 1
x0_2 = 16
u0_2 = 4
assert u0_2 * x0_2 == 64
x0_1 = 16
u0_1 = 4
assert u0_1 * x0_1 == 64
x0_0 = 16
u0_0 = 4
assert u0_0 * x0_0 == 64
DSP_0 = u0_0 * u0_1 * u0_2
x7_1 = 16
u7_1 = 4
assert u7_1 * x7_1 == 64
x7_0 = 16
u7_0 = 4
assert u7_0 * x7_0 == 64
DSP_7 = 0
x2_2 = 16
u2_2 = 4
assert u2_2 * x2_2 == 64
x2_0 = 16
u2_0 = 4
assert u2_0 * x2_0 == 64
x2_1 = 16
u2_1 = 4
assert u2_1 * x2_1 == 64
DSP_2 = u2_0 * u2_1 * u2_2
x4_0 = 16
u4_0 = 4
assert u4_0 * x4_0 == 64
x4_2 = 16
u4_2 = 4
assert u4_2 * x4_2 == 64
x4_1 = 16
u4_1 = 4
assert u4_1 * x4_1 == 64
DSP_4 = u4_0 * u4_1 * u4_2
x6_2 = 16
u6_2 = 4
assert u6_2 * x6_2 == 64
x6_1 = 16
u6_1 = 4
assert u6_1 * x6_1 == 64
x6_0 = 16
u6_0 = 4
assert u6_0 * x6_0 == 64
DSP_6 = u6_0 * u6_1 * u6_2
x1_2 = 16
u1_2 = 4
assert u1_2 * x1_2 == 64
x1_0 = 16
u1_0 = 4
assert u1_0 * x1_0 == 64
x1_1 = 16
u1_1 = 4
assert u1_1 * x1_1 == 64
DSP_1 = u1_0 * u1_1 * u1_2
x3_1 = 16
u3_1 = 4
assert u3_1 * x3_1 == 64
x3_2 = 16
u3_2 = 4
assert u3_2 * x3_2 == 64
x3_0 = 16
u3_0 = 4
assert u3_0 * x3_0 == 64
DSP_3 = u3_0 * u3_1 * u3_2
x5_1 = 16
u5_1 = 4
assert u5_1 * x5_1 == 64
x5_2 = 16
u5_2 = 4
assert u5_2 * x5_2 == 64
x5_0 = 16
u5_0 = 4
assert u5_0 * x5_0 == 64
DSP_5 = u5_0 * u5_1 * u5_2
totalDSP = DSP_0 + DSP_7 + DSP_2 + DSP_4 + DSP_6 + DSP_1 + DSP_3 + DSP_5
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 5 info
# start time
st5 = (0 + fw10000*b10000_0*b5_3)
# relative first write times of inputs
rlr10000_5 = st5
# epilogues
ep10000_5 =  + ((262143) * 1) * b5_3
# inputs last read/write dependencies
lt10000_5 = max(rlr10000_5, lw10000)
# curr last write times
lw10000_5 = lt10000_5 + ep10000_5
# c_et = max(c_a_et, c_b_et) + 1
lw5 = (lw10000_5)
# node first write time
fw5 = st5 + (258048) * 1

# node: 3 info
# start time
st3 = (0 + fw10000*b10000_0*b3_3)
# relative first write times of inputs
rlr10000_3 = st3
# epilogues
ep10000_3 =  + ((262143) * 1) * b3_3
# inputs last read/write dependencies
lt10000_3 = max(rlr10000_3, lw10000)
# curr last write times
lw10000_3 = lt10000_3 + ep10000_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw10000_3)
# node first write time
fw3 = st3 + (258048) * 1

# node: 4 info
# start time
st4 = max(0 + fw3*b3_3*b4_1, 0 + fw5*b5_3*b4_1)
# relative first write times of inputs
rlr3_4 = st4 + ((262080) * 1) * b4_1
rlr5_4 = st4 + ((4095) * 1) * b4_1
# epilogues
ep3_4 =  + ((262143) * 1) * b4_1 - ((262080) * 1) * b4_1
ep5_4 =  + ((262143) * 1) * b4_1 - ((4095) * 1) * b4_1
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
lt5_4 = max(rlr5_4, lw5)
# curr last write times
lw3_4 = lt3_4 + ep3_4
lw5_4 = lt5_4 + ep5_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = max(lw3_4, lw5_4)
# node first write time
fw4 = st4 + (4032) * 1

# node: 2 info
# start time
st2 = (0 + fw10000*b10000_0*b2_4)
# relative first write times of inputs
rlr10000_2 = st2
# epilogues
ep10000_2 =  + ((262143) * 1) * b2_4
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + (4032) * 1

# node: 0 info
# start time
st0 = (0 + fw10000*b10000_0*b0_5)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((262143) * 1) * b0_5
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (258048) * 1

# node: 1 info
# start time
st1 = max(0 + fw0*b0_5*b1_4, 0 + fw2*b2_4*b1_4)
# relative first write times of inputs
rlr0_1 = st1 + ((4095) * 1) * b1_4
rlr2_1 = st1 + ((262080) * 1) * b1_4
# epilogues
ep0_1 =  + ((262143) * 1) * b1_4 - ((4095) * 1) * b1_4
ep2_1 =  + ((262143) * 1) * b1_4 - ((262080) * 1) * b1_4
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw0_1 = lt0_1 + ep0_1
lw2_1 = lt2_1 + ep2_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = max(lw0_1, lw2_1)
# node first write time
fw1 = st1 + (4032) * 1

# node: 6 info
# start time
st6 = max(0 + fw1*b1_4*b6_5, 0 + fw4*b4_1*b6_5)
# relative first write times of inputs
rlr1_6 = st6 + ((258111) * 1) * b6_5
rlr4_6 = st6 + ((262080) * 1) * b6_5
# epilogues
ep1_6 =  + ((262143) * 1) * b6_5 - ((258111) * 1) * b6_5
ep4_6 =  + ((262143) * 1) * b6_5 - ((262080) * 1) * b6_5
# inputs last read/write dependencies
lt1_6 = max(rlr1_6, lw1)
lt4_6 = max(rlr4_6, lw4)
# curr last write times
lw1_6 = lt1_6 + ep1_6
lw4_6 = lt4_6 + ep4_6
# c_et = max(c_a_et, c_b_et) + 1
lw6 = max(lw1_6, lw4_6)
# node first write time
fw6 = st6 + (258048) * 1

# node: 7 info
# start time
st7 = (0 + fw6*b6_5*b7_1)
# relative first write times of inputs
rlr6_7 = st7 + ((4095) * 1) * b7_1
# epilogues
ep6_7 = 0
# inputs last read/write dependencies
lt6_7 = max(rlr6_7, lw6)
# curr last write times
lw6_7 = lt6_7 + ep6_7
# c_et = max(c_a_et, c_b_et) + 1
lw7 = (lw6_7)


# objective function
latency = lw7
print(latency)
print(totalDSP)
