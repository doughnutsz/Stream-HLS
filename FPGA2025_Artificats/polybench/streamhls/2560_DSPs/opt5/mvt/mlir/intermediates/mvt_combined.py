b0_1 = 1
b2_0 = 1
b10000_0 = 1
b4_0 = 1
b1_0 = 1
b3_1 = 1
x0_1 = 25
u0_1 = 16
assert u0_1 * x0_1 == 400
x0_0 = 25
u0_0 = 16
assert u0_0 * x0_0 == 400
DSP_0 = u0_0 * u0_1
x2_0 = 25
u2_0 = 16
assert u2_0 * x2_0 == 400
x2_1 = 25
u2_1 = 16
assert u2_1 * x2_1 == 400
DSP_2 = 0
x4_0 = 25
u4_0 = 16
assert u4_0 * x4_0 == 400
DSP_4 = 0
x1_0 = 25
u1_0 = 16
assert u1_0 * x1_0 == 400
DSP_1 = 0
x3_1 = 25
u3_1 = 16
assert u3_1 * x3_1 == 400
x3_0 = 25
u3_0 = 16
assert u3_0 * x3_0 == 400
DSP_3 = u3_0 * u3_1
totalDSP = DSP_0 + DSP_2 + DSP_4 + DSP_1 + DSP_3
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
ep10000_2 =  + ((159999) * 1) * b2_0
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + (0) * 1

# node: 3 info
# start time
st3 = (0 + fw2*b2_0*b3_1)
# relative first write times of inputs
rlr2_3 = st3 + ((159999) * 1) * b3_1
# epilogues
ep2_3 =  + ((159999) * 1) * b3_1 - ((159999) * 1) * b3_1
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw2_3)
# node first write time
fw3 = st3 + (159600) * 1

# node: 4 info
# start time
st4 = (0 + fw3*b3_1*b4_0)
# relative first write times of inputs
rlr3_4 = st4 + ((399) * 1) * b4_0
# epilogues
ep3_4 = 0
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = (lw3_4)


# node: 0 info
# start time
st0 = (0 + fw10000*b10000_0*b0_1)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((159999) * 1) * b0_1
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (159600) * 1

# node: 1 info
# start time
st1 = (0 + fw0*b0_1*b1_0)
# relative first write times of inputs
rlr0_1 = st1 + ((399) * 1) * b1_0
# epilogues
ep0_1 = 0
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw0_1)


# objective function
latency = lw1
print(latency)
print(totalDSP)
