b0_4 = 1
b2_1 = 1
b10000_0 = 1
b1_3 = 1
b3_0 = 1
x0_2 = 18
u0_2 = 10
assert u0_2 * x0_2 == 180
x0_0 = 19
u0_0 = 10
assert u0_0 * x0_0 == 190
x0_1 = 40
u0_1 = 5
assert u0_1 * x0_1 == 200
DSP_0 = u0_0 * u0_1 * u0_2
x2_0 = 19
u2_0 = 10
assert u2_0 * x2_0 == 190
x2_2 = 35
u2_2 = 6
assert u2_2 * x2_2 == 210
x2_1 = 20
u2_1 = 11
assert u2_1 * x2_1 == 220
DSP_2 = u2_0 * u2_1 * u2_2
x1_1 = 18
u1_1 = 10
assert u1_1 * x1_1 == 180
x1_2 = 35
u1_2 = 6
assert u1_2 * x1_2 == 210
x1_0 = 19
u1_0 = 10
assert u1_0 * x1_0 == 190
DSP_1 = u1_0 * u1_1 * u1_2
x3_0 = 18
u3_0 = 10
assert u3_0 * x3_0 == 180
x3_1 = 35
u3_1 = 6
assert u3_1 * x3_1 == 210
DSP_3 = 0
totalDSP = DSP_0 + DSP_2 + DSP_1 + DSP_3
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 2 info
# start time
st2 = (0 + fw10000*b10000_0*b2_1)
# relative first write times of inputs
rlr10000_2 = st2
# epilogues
ep10000_2 =  + ((8777999) * 1) * b2_1
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + (45990) * 1

# node: 0 info
# start time
st0 = (0 + fw10000*b10000_0*b0_4)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((6839999) * 1) * b0_4
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (35820) * 1

# node: 1 info
# start time
st1 = max(0 + fw0*b0_4*b1_3, 0 + fw2*b2_1*b1_3)
# relative first write times of inputs
rlr0_1 = st1 + ((7181790) * 1) * b1_3
rlr2_1 = st1 + ((7144409) * 1) * b1_3
# epilogues
ep0_1 =  + ((7181999) * 1) * b1_3 - ((7181790) * 1) * b1_3
ep2_1 =  + ((7181999) * 1) * b1_3 - ((7144409) * 1) * b1_3
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw0_1 = lt0_1 + ep0_1
lw2_1 = lt2_1 + ep2_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = max(lw0_1, lw2_1)
# node first write time
fw1 = st1 + (7144200) * 1

# node: 3 info
# start time
st3 = (0 + fw1*b1_3*b3_0)
# relative first write times of inputs
rlr1_3 = st3 + ((37799) * 1) * b3_0
# epilogues
ep1_3 = 0
# inputs last read/write dependencies
lt1_3 = max(rlr1_3, lw1)
# curr last write times
lw1_3 = lt1_3 + ep1_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw1_3)


# objective function
latency = lw3
print(latency)
print(totalDSP)
