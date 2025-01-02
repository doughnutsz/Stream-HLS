b0_4 = 1
b7_0 = 1
b2_1 = 1
b10000_0 = 1
b4_3 = 1
b6_0 = 1
b1_1 = 1
b3_1 = 1
b5_0 = 1
x0_2 = 16
u0_2 = 32
assert u0_2 * x0_2 == 512
x0_0 = 256
u0_0 = 1
assert u0_0 * x0_0 == 256
x0_1 = 16
u0_1 = 8
assert u0_1 * x0_1 == 128
DSP_0 = u0_0 * u0_1 * u0_2
x7_0 = 16
u7_0 = 32
assert u7_0 * x7_0 == 512
x7_1 = 16
u7_1 = 8
assert u7_1 * x7_1 == 128
DSP_7 = 0
x2_1 = 16
u2_1 = 8
assert u2_1 * x2_1 == 128
x2_0 = 256
u2_0 = 1
assert u2_0 * x2_0 == 256
DSP_2 = 0
x4_1 = 16
u4_1 = 32
assert u4_1 * x4_1 == 512
x4_2 = 16
u4_2 = 8
assert u4_2 * x4_2 == 128
x4_0 = 256
u4_0 = 1
assert u4_0 * x4_0 == 256
DSP_4 = u4_0 * u4_1 * u4_2
x6_0 = 16
u6_0 = 32
assert u6_0 * x6_0 == 512
x6_1 = 16
u6_1 = 8
assert u6_1 * x6_1 == 128
DSP_6 = 0
x1_1 = 16
u1_1 = 32
assert u1_1 * x1_1 == 512
x1_0 = 16
u1_0 = 8
assert u1_0 * x1_0 == 128
DSP_1 = 0
x3_1 = 16
u3_1 = 32
assert u3_1 * x3_1 == 512
x3_0 = 256
u3_0 = 1
assert u3_0 * x3_0 == 256
DSP_3 = 0
x5_0 = 256
u5_0 = 1
assert u5_0 * x5_0 == 256
x5_1 = 16
u5_1 = 8
assert u5_1 * x5_1 == 128
DSP_5 = 0
totalDSP = DSP_0 + DSP_7 + DSP_2 + DSP_4 + DSP_6 + DSP_1 + DSP_3 + DSP_5
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 5 info
# start time
st5 = (0 + fw10000*b10000_0*b5_0)
# relative first write times of inputs
rlr10000_5 = st5
# epilogues
ep10000_5 =  + ((32767) * 1) * b5_0
# inputs last read/write dependencies
lt10000_5 = max(rlr10000_5, lw10000)
# curr last write times
lw10000_5 = lt10000_5 + ep10000_5
# c_et = max(c_a_et, c_b_et) + 1
lw5 = (lw10000_5)
# node first write time
fw5 = st5 + (0) * 1

# node: 1 info
# start time
st1 = (0 + fw10000*b10000_0*b1_1)
# relative first write times of inputs
rlr10000_1 = st1
# epilogues
ep10000_1 =  + ((65535) * 1) * b1_1
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + (0) * 1

# node: 2 info
# start time
st2 = (0 + fw10000*b10000_0*b2_1)
# relative first write times of inputs
rlr10000_2 = st2
# epilogues
ep10000_2 =  + ((32767) * 1) * b2_1
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
st0 = max(0 + fw1*b1_1*b0_4, 0 + fw2*b2_1*b0_4)
# relative first write times of inputs
rlr1_0 = st0 + ((65535) * 1) * b0_4
rlr2_0 = st0 + ((16776704) * 1) * b0_4
# epilogues
ep1_0 =  + ((16777215) * 1) * b0_4 - ((65535) * 1) * b0_4
ep2_0 =  + ((16777215) * 1) * b0_4 - ((16776704) * 1) * b0_4
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt2_0 = max(rlr2_0, lw2)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw2_0 = lt2_0 + ep2_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = max(lw1_0, lw2_0)
# node first write time
fw0 = st0 + (65024) * 1

# node: 3 info
# start time
st3 = (0 + fw0*b0_4*b3_1)
# relative first write times of inputs
rlr0_3 = st3 + ((131071) * 1) * b3_1
# epilogues
ep0_3 =  + ((131071) * 1) * b3_1 - ((131071) * 1) * b3_1
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
st4 = max(0 + fw3*b3_1*b4_3, 0 + fw5*b5_0*b4_3)
# relative first write times of inputs
rlr3_4 = st4 + ((16777088) * 1) * b4_3
rlr5_4 = st4 + ((16711807) * 1) * b4_3
# epilogues
ep3_4 =  + ((16777215) * 1) * b4_3 - ((16777088) * 1) * b4_3
ep5_4 =  + ((16777215) * 1) * b4_3 - ((16711807) * 1) * b4_3
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
lt5_4 = max(rlr5_4, lw5)
# curr last write times
lw3_4 = lt3_4 + ep3_4
lw5_4 = lt5_4 + ep5_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = max(lw3_4, lw5_4)
# node first write time
fw4 = st4 + (16711680) * 1

# node: 6 info
# start time
st6 = (0 + fw4*b4_3*b6_0)
# relative first write times of inputs
rlr4_6 = st6 + ((65535) * 1) * b6_0
# epilogues
ep4_6 =  + ((65535) * 1) * b6_0 - ((65535) * 1) * b6_0
# inputs last read/write dependencies
lt4_6 = max(rlr4_6, lw4)
# curr last write times
lw4_6 = lt4_6 + ep4_6
# c_et = max(c_a_et, c_b_et) + 1
lw6 = (lw4_6)
# node first write time
fw6 = st6 + (0) * 1

# node: 7 info
# start time
st7 = (0 + fw6*b6_0*b7_0)
# relative first write times of inputs
rlr6_7 = st7 + ((65535) * 1) * b7_0
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
