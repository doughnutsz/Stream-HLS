b0_1 = 1
b7_0 = 1
b2_1 = 1
b10000_0 = 1
b4_1 = 1
b6_1 = 1
b1_1 = 1
b3_1 = 1
b5_1 = 1
x0_0 = 16
u0_0 = 4
assert u0_0 * x0_0 == 64
x0_2 = 16
u0_2 = 4
assert u0_2 * x0_2 == 64
x0_1 = 16
u0_1 = 2
assert u0_1 * x0_1 == 32
DSP_0 = u0_0 * u0_1 * u0_2
x7_0 = 16
u7_0 = 4
assert u7_0 * x7_0 == 64
x7_1 = 16
u7_1 = 1
assert u7_1 * x7_1 == 16
DSP_7 = 0
x2_0 = 16
u2_0 = 4
assert u2_0 * x2_0 == 64
x2_2 = 32
u2_2 = 4
assert u2_2 * x2_2 == 128
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
u4_1 = 8
assert u4_1 * x4_1 == 128
DSP_4 = u4_0 * u4_1 * u4_2
x6_0 = 16
u6_0 = 4
assert u6_0 * x6_0 == 64
x6_2 = 16
u6_2 = 1
assert u6_2 * x6_2 == 16
x6_1 = 16
u6_1 = 2
assert u6_1 * x6_1 == 32
DSP_6 = u6_0 * u6_1 * u6_2
x1_0 = 16
u1_0 = 4
assert u1_0 * x1_0 == 64
x1_2 = 16
u1_2 = 4
assert u1_2 * x1_2 == 64
x1_1 = 16
u1_1 = 4
assert u1_1 * x1_1 == 64
DSP_1 = u1_0 * u1_1 * u1_2
x3_0 = 16
u3_0 = 4
assert u3_0 * x3_0 == 64
x3_2 = 16
u3_2 = 8
assert u3_2 * x3_2 == 128
x3_1 = 32
u3_1 = 4
assert u3_1 * x3_1 == 128
DSP_3 = u3_0 * u3_1 * u3_2
x5_0 = 16
u5_0 = 4
assert u5_0 * x5_0 == 64
x5_2 = 16
u5_2 = 2
assert u5_2 * x5_2 == 32
x5_1 = 16
u5_1 = 4
assert u5_1 * x5_1 == 64
DSP_5 = u5_0 * u5_1 * u5_2
totalDSP = DSP_0 + DSP_7 + DSP_2 + DSP_4 + DSP_6 + DSP_1 + DSP_3 + DSP_5
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 0 info
# start time
st0 = (0 + fw10000*b10000_0*b0_1)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((131071) * 1) * b0_1
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (1984) * 1

# node: 1 info
# start time
st1 = (0 + fw0*b0_1*b1_1)
# relative first write times of inputs
rlr0_1 = st1 + ((262080) * 1) * b1_1
# epilogues
ep0_1 =  + ((262143) * 1) * b1_1 - ((262080) * 1) * b1_1
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw0_1)
# node first write time
fw1 = st1 + (4032) * 1

# node: 2 info
# start time
st2 = (0 + fw1*b1_1*b2_1)
# relative first write times of inputs
rlr1_2 = st2 + ((524160) * 1) * b2_1
# epilogues
ep1_2 =  + ((524287) * 1) * b2_1 - ((524160) * 1) * b2_1
# inputs last read/write dependencies
lt1_2 = max(rlr1_2, lw1)
# curr last write times
lw1_2 = lt1_2 + ep1_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw1_2)
# node first write time
fw2 = st2 + (8064) * 1

# node: 3 info
# start time
st3 = (0 + fw2*b2_1*b3_1)
# relative first write times of inputs
rlr2_3 = st3 + ((1048448) * 1) * b3_1
# epilogues
ep2_3 =  + ((1048575) * 1) * b3_1 - ((1048448) * 1) * b3_1
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw2_3)
# node first write time
fw3 = st3 + (16256) * 1

# node: 4 info
# start time
st4 = (0 + fw3*b3_1*b4_1)
# relative first write times of inputs
rlr3_4 = st4 + ((524224) * 1) * b4_1
# epilogues
ep3_4 =  + ((524287) * 1) * b4_1 - ((524224) * 1) * b4_1
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = (lw3_4)
# node first write time
fw4 = st4 + (8128) * 1

# node: 5 info
# start time
st5 = (0 + fw4*b4_1*b5_1)
# relative first write times of inputs
rlr4_5 = st5 + ((131040) * 1) * b5_1
# epilogues
ep4_5 =  + ((131071) * 1) * b5_1 - ((131040) * 1) * b5_1
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
# curr last write times
lw4_5 = lt4_5 + ep4_5
# c_et = max(c_a_et, c_b_et) + 1
lw5 = (lw4_5)
# node first write time
fw5 = st5 + (2016) * 1

# node: 6 info
# start time
st6 = (0 + fw5*b5_1*b6_1)
# relative first write times of inputs
rlr5_6 = st6 + ((32752) * 1) * b6_1
# epilogues
ep5_6 =  + ((32767) * 1) * b6_1 - ((32752) * 1) * b6_1
# inputs last read/write dependencies
lt5_6 = max(rlr5_6, lw5)
# curr last write times
lw5_6 = lt5_6 + ep5_6
# c_et = max(c_a_et, c_b_et) + 1
lw6 = (lw5_6)
# node first write time
fw6 = st6 + (496) * 1

# node: 7 info
# start time
st7 = (0 + fw6*b6_1*b7_0)
# relative first write times of inputs
rlr6_7 = st7 + ((1023) * 1) * b7_0
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
