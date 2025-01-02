b0_18 = 1
b2_0 = 1
b10000_0 = 1
b4_4 = 1
b1_0 = 1
b3_19 = 1
b5_4 = 1
x0_0 = 56
u0_0 = 2
assert u0_0 * x0_0 == 112
x0_4 = 8
u0_4 = 14
assert u0_4 * x0_4 == 112
x0_1 = 8
u0_1 = 1
assert u0_1 * x0_1 == 8
x0_2 = 3
u0_2 = 1
assert u0_2 * x0_2 == 3
x0_3 = 3
u0_3 = 1
assert u0_3 * x0_3 == 3
DSP_0 = u0_0 * u0_1 * u0_2 * u0_3 * u0_4
x2_0 = 8
u2_0 = 1
assert u2_0 * x2_0 == 8
x2_1 = 57
u2_1 = 2
assert u2_1 * x2_1 == 114
x2_2 = 114
u2_2 = 1
assert u2_2 * x2_2 == 114
DSP_2 = 0
x4_2 = 8
u4_2 = 1
assert u4_2 * x4_2 == 8
x4_0 = 56
u4_0 = 2
assert u4_0 * x4_0 == 112
x4_1 = 8
u4_1 = 14
assert u4_1 * x4_1 == 112
DSP_4 = 0
x1_0 = 8
u1_0 = 1
assert u1_0 * x1_0 == 8
x1_1 = 56
u1_1 = 2
assert u1_1 * x1_1 == 112
x1_2 = 112
u1_2 = 1
assert u1_2 * x1_2 == 112
DSP_1 = 0
x3_3 = 8
u3_3 = 1
assert u3_3 * x3_3 == 8
x3_0 = 56
u3_0 = 2
assert u3_0 * x3_0 == 112
x3_2 = 8
u3_2 = 14
assert u3_2 * x3_2 == 112
x3_1 = 8
u3_1 = 1
assert u3_1 * x3_1 == 8
DSP_3 = u3_0 * u3_1 * u3_2 * u3_3
x5_2 = 8
u5_2 = 1
assert u5_2 * x5_2 == 8
x5_0 = 56
u5_0 = 2
assert u5_0 * x5_0 == 112
x5_1 = 8
u5_1 = 14
assert u5_1 * x5_1 == 112
DSP_5 = 0
totalDSP = DSP_0 + DSP_2 + DSP_4 + DSP_1 + DSP_3 + DSP_5
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
ep10000_1 =  + ((100351) * 1) * b1_0
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
st2 = (0 + fw10000*b10000_0*b2_0)
# relative first write times of inputs
rlr10000_2 = st2
# epilogues
ep10000_2 =  + ((103967) * 1) * b2_0
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
st0 = max(0 + lw1*b1_0*b0_18, 0 + lw2*b2_0*b0_18)
# relative first write times of inputs
rlr1_0 = st0 + ((903167) * 1) * b0_18
rlr2_0 = st0 + ((903167) * 1) * b0_18
# epilogues
ep1_0 =  + ((903167) * 1) * b0_18 - ((903167) * 1) * b0_18
ep2_0 =  + ((903167) * 1) * b0_18 - ((903167) * 1) * b0_18
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt2_0 = max(rlr2_0, lw2)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw2_0 = lt2_0 + ep2_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = max(lw1_0, lw2_0)
# node first write time
fw0 = st0 + (896) * 1

# node: 3 info
# start time
st3 = (0 + fw0*b0_18*b3_19)
# relative first write times of inputs
rlr0_3 = st3 + ((802808) * 1) * b3_19
# epilogues
ep0_3 =  + ((802815) * 1) * b3_19 - ((802808) * 1) * b3_19
# inputs last read/write dependencies
lt0_3 = max(rlr0_3, lw0)
# curr last write times
lw0_3 = lt0_3 + ep0_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw0_3)
# node first write time
fw3 = st3 + (6272) * 1

# node: 4 info
# start time
st4 = (0 + fw3*b3_19*b4_4)
# relative first write times of inputs
rlr3_4 = st4 + ((100351) * 1) * b4_4
# epilogues
ep3_4 =  + ((100351) * 1) * b4_4 - ((100351) * 1) * b4_4
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
st5 = (0 + fw4*b4_4*b5_4)
# relative first write times of inputs
rlr4_5 = st5 + ((100351) * 1) * b5_4
# epilogues
ep4_5 = 0
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
# curr last write times
lw4_5 = lt4_5 + ep4_5
# c_et = max(c_a_et, c_b_et) + 1
lw5 = (lw4_5)


# objective function
latency = lw5
print(latency)
print(totalDSP)
