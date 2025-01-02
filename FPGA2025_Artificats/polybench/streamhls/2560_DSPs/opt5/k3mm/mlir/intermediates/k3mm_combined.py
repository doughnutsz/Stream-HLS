b0_4 = 1
b2_1 = 1
b10000_0 = 1
b1_5 = 1
b3_1 = 1
x0_2 = 60
u0_2 = 3
assert u0_2 * x0_2 == 180
x0_0 = 38
u0_0 = 5
assert u0_0 * x0_0 == 190
x0_1 = 20
u0_1 = 10
assert u0_1 * x0_1 == 200
DSP_0 = u0_0 * u0_1 * u0_2
x2_0 = 38
u2_0 = 5
assert u2_0 * x2_0 == 190
x2_2 = 21
u2_2 = 10
assert u2_2 * x2_2 == 210
x2_1 = 55
u2_1 = 4
assert u2_1 * x2_1 == 220
DSP_2 = u2_0 * u2_1 * u2_2
x1_2 = 60
u1_2 = 3
assert u1_2 * x1_2 == 180
x1_1 = 21
u1_1 = 10
assert u1_1 * x1_1 == 210
x1_0 = 38
u1_0 = 5
assert u1_0 * x1_0 == 190
DSP_1 = u1_0 * u1_1 * u1_2
x3_1 = 60
u3_1 = 3
assert u3_1 * x3_1 == 180
x3_0 = 21
u3_0 = 10
assert u3_0 * x3_0 == 210
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
st1 = max(0 + fw0*b0_4*b1_5, 0 + fw2*b2_1*b1_5)
# relative first write times of inputs
rlr0_1 = st1 + ((7144379) * 1) * b1_5
rlr2_1 = st1 + ((7181820) * 1) * b1_5
# epilogues
ep0_1 =  + ((7181999) * 1) * b1_5 - ((7144379) * 1) * b1_5
ep2_1 =  + ((7181999) * 1) * b1_5 - ((7181820) * 1) * b1_5
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
st3 = (0 + fw1*b1_5*b3_1)
# relative first write times of inputs
rlr1_3 = st3 + ((37799) * 1) * b3_1
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
