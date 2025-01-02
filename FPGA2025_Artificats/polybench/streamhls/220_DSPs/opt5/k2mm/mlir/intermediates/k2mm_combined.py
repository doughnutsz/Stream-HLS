b0_1 = 1
b2_0 = 1
b10000_0 = 1
b1_1 = 1
b3_0 = 1
x0_0 = 180
u0_0 = 1
assert u0_0 * x0_0 == 180
x0_2 = 19
u0_2 = 10
assert u0_2 * x0_2 == 190
x0_1 = 105
u0_1 = 2
assert u0_1 * x0_1 == 210
DSP_0 = u0_0 * u0_1 * u0_2
x2_0 = 180
u2_0 = 1
assert u2_0 * x2_0 == 180
x2_1 = 110
u2_1 = 2
assert u2_1 * x2_1 == 220
DSP_2 = 0
x1_0 = 180
u1_0 = 1
assert u1_0 * x1_0 == 180
x1_2 = 110
u1_2 = 2
assert u1_2 * x1_2 == 220
x1_1 = 19
u1_1 = 10
assert u1_1 * x1_1 == 190
DSP_1 = u1_0 * u1_1 * u1_2
x3_0 = 180
u3_0 = 1
assert u3_0 * x3_0 == 180
x3_1 = 110
u3_1 = 2
assert u3_1 * x3_1 == 220
DSP_3 = 0
totalDSP = DSP_0 + DSP_2 + DSP_1 + DSP_3
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
ep10000_0 =  + ((7181999) * 1) * b0_1
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (39710) * 1

# node: 1 info
# start time
st1 = (0 + fw0*b0_1*b1_1)
# relative first write times of inputs
rlr0_1 = st1 + ((7523780) * 1) * b1_1
# epilogues
ep0_1 =  + ((7523999) * 1) * b1_1 - ((7523780) * 1) * b1_1
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw0_1)
# node first write time
fw1 = st1 + (41580) * 1

# node: 2 info
# start time
st2 = (0 + fw1*b1_1*b2_0)
# relative first write times of inputs
rlr1_2 = st2 + ((39599) * 1) * b2_0
# epilogues
ep1_2 =  + ((39599) * 1) * b2_0 - ((39599) * 1) * b2_0
# inputs last read/write dependencies
lt1_2 = max(rlr1_2, lw1)
# curr last write times
lw1_2 = lt1_2 + ep1_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw1_2)
# node first write time
fw2 = st2 + (0) * 1

# node: 3 info
# start time
st3 = (0 + fw2*b2_0*b3_0)
# relative first write times of inputs
rlr2_3 = st3 + ((39599) * 1) * b3_0
# epilogues
ep2_3 = 0
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw2_3)


# objective function
latency = lw3
print(latency)
print(totalDSP)
