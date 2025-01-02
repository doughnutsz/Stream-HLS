b0_1 = 1
b2_1 = 1
b10000_0 = 1
b1_0 = 1
b3_0 = 1
x0_1 = 125
u0_1 = 2
assert u0_1 * x0_1 == 250
x0_0 = 25
u0_0 = 10
assert u0_0 * x0_0 == 250
DSP_0 = u0_0 * u0_1
x2_1 = 125
u2_1 = 2
assert u2_1 * x2_1 == 250
x2_0 = 25
u2_0 = 10
assert u2_0 * x2_0 == 250
DSP_2 = u2_0 * u2_1
x1_0 = 125
u1_0 = 2
assert u1_0 * x1_0 == 250
DSP_1 = 0
x3_0 = 125
u3_0 = 2
assert u3_0 * x3_0 == 250
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
ep10000_2 =  + ((62499) * 1) * b2_1
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + (62250) * 1

# node: 0 info
# start time
st0 = (0 + fw10000*b10000_0*b0_1)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((62499) * 1) * b0_1
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (62250) * 1

# node: 1 info
# start time
st1 = max(0 + fw0*b0_1*b1_0, 0 + fw2*b2_1*b1_0)
# relative first write times of inputs
rlr0_1 = st1 + ((249) * 1) * b1_0
rlr2_1 = st1 + ((249) * 1) * b1_0
# epilogues
ep0_1 =  + ((249) * 1) * b1_0 - ((249) * 1) * b1_0
ep2_1 =  + ((249) * 1) * b1_0 - ((249) * 1) * b1_0
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw0_1 = lt0_1 + ep0_1
lw2_1 = lt2_1 + ep2_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = max(lw0_1, lw2_1)
# node first write time
fw1 = st1 + (0) * 1

# node: 3 info
# start time
st3 = (0 + fw1*b1_0*b3_0)
# relative first write times of inputs
rlr1_3 = st3 + ((249) * 1) * b3_0
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
