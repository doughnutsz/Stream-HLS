b0_5 = 1
b2_1 = 1
b10000_0 = 1
b1_1 = 1
x0_2 = 20
u0_2 = 10
assert u0_2 * x0_2 == 200
x0_1 = 22
u0_1 = 10
assert u0_1 * x0_1 == 220
x0_0 = 16
u0_0 = 15
assert u0_0 * x0_0 == 240
DSP_0 = u0_0 * u0_1 * u0_2
x2_1 = 20
u2_1 = 10
assert u2_1 * x2_1 == 200
x2_0 = 22
u2_0 = 10
assert u2_0 * x2_0 == 220
DSP_2 = 0
x1_1 = 20
u1_1 = 10
assert u1_1 * x1_1 == 200
x1_0 = 22
u1_0 = 10
assert u1_0 * x1_0 == 220
DSP_1 = 0
totalDSP = DSP_0 + DSP_2 + DSP_1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 0 info
# start time
st0 = (0 + fw10000*b10000_0*b0_5)
# relative first write times of inputs
rlr10000_0 = st0
# epilogues
ep10000_0 =  + ((10559999) * 1) * b0_5
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + (10516000) * 1

# node: 1 info
# start time
st1 = (0 + fw0*b0_5*b1_1)
# relative first write times of inputs
rlr0_1 = st1 + ((43999) * 1) * b1_1
# epilogues
ep0_1 =  + ((43999) * 1) * b1_1 - ((43999) * 1) * b1_1
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw0_1)
# node first write time
fw1 = st1 + (0) * 1

# node: 2 info
# start time
st2 = (0 + fw1*b1_1*b2_1)
# relative first write times of inputs
rlr1_2 = st2 + ((43999) * 1) * b2_1
# epilogues
ep1_2 = 0
# inputs last read/write dependencies
lt1_2 = max(rlr1_2, lw1)
# curr last write times
lw1_2 = lt1_2 + ep1_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw1_2)


# objective function
latency = lw2
print(latency)
print(totalDSP)
