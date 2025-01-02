b0_1 = 1
b2_0 = 1
b10000_0 = 1
b1_1 = 1
b3_0 = 1
x0_1 = 26
u0_1 = 15
assert u0_1 * x0_1 == 390
x0_0 = 41
u0_0 = 10
assert u0_0 * x0_0 == 410
DSP_0 = u0_0 * u0_1
x2_0 = 26
u2_0 = 15
assert u2_0 * x2_0 == 390
x2_1 = 41
u2_1 = 10
assert u2_1 * x2_1 == 410
DSP_2 = 0
x1_1 = 41
u1_1 = 10
assert u1_1 * x1_1 == 410
x1_0 = 26
u1_0 = 15
assert u1_0 * x1_0 == 390
DSP_1 = u1_0 * u1_1
x3_0 = 41
u3_0 = 10
assert u3_0 * x3_0 == 410
DSP_3 = 0
totalDSP = DSP_0 + DSP_2 + DSP_1 + DSP_3
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 2 info
# start time
st2 = (0 + fw10000*b10000_0*b2_0)
# relative first write times of inputs
rlr10000_2 = st2
# epilogues
ep10000_2 =  + ((159899) * 1) * b2_0
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
st0 = (0 + fw10000*b10000_0*b0_1)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((159899) * 1) * b0_1
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (159510) * 1

# node: 1 info
# start time
st1 = max(0 + fw0*b0_1*b1_1, 0 + fw2*b2_0*b1_1)
# relative first write times of inputs
rlr0_1 = st1 + ((159490) * 1) * b1_1
rlr2_1 = st1 + ((159899) * 1) * b1_1
# epilogues
ep0_1 =  + ((159899) * 1) * b1_1 - ((159490) * 1) * b1_1
ep2_1 =  + ((159899) * 1) * b1_1 - ((159899) * 1) * b1_1
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw0_1 = lt0_1 + ep0_1
lw2_1 = lt2_1 + ep2_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = max(lw0_1, lw2_1)
# node first write time
fw1 = st1 + (159490) * 1

# node: 3 info
# start time
st3 = (0 + fw1*b1_1*b3_0)
# relative first write times of inputs
rlr1_3 = st3 + ((409) * 1) * b3_0
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
