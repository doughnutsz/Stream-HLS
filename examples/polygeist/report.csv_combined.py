b0_1 = 1
b2_1 = 1
b10000_0 = 1
b4_0 = 1
b1_0 = 1
b3_1 = 1
x0_1 = 13
u0_1 = 30
assert u0_1 * x0_1 == 390
x0_0 = 205
u0_0 = 2
assert u0_0 * x0_0 == 410
DSP_0 = u0_0 * u0_1
x2_1 = 13
u2_1 = 30
assert u2_1 * x2_1 == 390
x2_0 = 205
u2_0 = 2
assert u2_0 * x2_0 == 410
DSP_2 = 0
x4_0 = 205
u4_0 = 2
assert u4_0 * x4_0 == 410
DSP_4 = 0
x1_0 = 205
u1_0 = 2
assert u1_0 * x1_0 == 410
DSP_1 = 0
x3_1 = 205
u3_1 = 2
assert u3_1 * x3_1 == 410
x3_0 = 13
u3_0 = 30
assert u3_0 * x3_0 == 390
DSP_3 = u3_0 * u3_1
totalDSP = DSP_0 + DSP_2 + DSP_4 + DSP_1 + DSP_3
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
ep10000_1 =  + ((409) * 1) * b1_0
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
ep10000_2 =  + ((159899) * 1) * b2_1 + ((159899) * 1) * b2_1
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + (0) * 1 + (0) * 1

# node: 0 info
# start time
st0 = max(0 + fw1*b1_0*b0_1, 0 + fw2*b2_1*b0_1)
# relative first write times of inputs
rlr1_0 = st0 + ((159510) * 1) * b0_1
rlr2_0 = st0 + ((159899) * 1) * b0_1
# epilogues
ep1_0 =  + ((159899) * 1) * b0_1 - ((159510) * 1) * b0_1
ep2_0 =  + ((159899) * 1) * b0_1 - ((159899) * 1) * b0_1
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt2_0 = max(rlr2_0, lw2)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw2_0 = lt2_0 + ep2_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = max(lw1_0, lw2_0)
# node first write time
fw0 = st0 + (159510) * 1

# node: 3 info
# start time
st3 = max(0 + lw2*b2_1*b3_1, 0 + fw0*b0_1*b3_1)
# relative first write times of inputs
rlr2_3 = st3 + ((159899) * 1) * b3_1
rlr0_3 = st3 + ((159490) * 1) * b3_1
# epilogues
ep2_3 =  + ((159899) * 1) * b3_1 - ((159899) * 1) * b3_1
ep0_3 =  + ((159899) * 1) * b3_1 - ((159490) * 1) * b3_1
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
lt0_3 = max(rlr0_3, lw0)
# curr last write times
lw2_3 = lt2_3 + ep2_3
lw0_3 = lt0_3 + ep0_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = max(lw2_3, lw0_3)
# node first write time
fw3 = st3 + (159490) * 1

# node: 4 info
# start time
st4 = (0 + fw3*b3_1*b4_0)
# relative first write times of inputs
rlr3_4 = st4 + ((409) * 1) * b4_0
# epilogues
ep3_4 = 0
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = (lw3_4)


# objective function
latency = lw4
print(latency)
print(totalDSP)
