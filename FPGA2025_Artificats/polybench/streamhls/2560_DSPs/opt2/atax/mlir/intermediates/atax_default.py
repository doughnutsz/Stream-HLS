x0_0 = 1
x2_0 = 1
x1_0 = 1
x3_0 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 2 info
# start time
st2 = (0)
# relative first write times of inputs
rlr10000_2 = st2 + 0*x2_0
# epilogues
ep10000_2 =  + 159899*x2_0 - 0*x2_0
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# node last write time
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + 0*x2_0

# node: 0 info
# start time
st0 = (0)
# relative first write times of inputs
rlr10000_0 = st0 + 0*x0_0
# epilogues
ep10000_0 =  + 639596*x0_0 - 0*x0_0
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# node last write time
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + 1636*x0_0

# node: 1 info
# start time
st1 = max(0 + fw0*x0_0*x1_0, 0 + lw2*x2_0*x1_0)
# relative first write times of inputs
rlr0_1 = st1 + 1556*x1_0
rlr2_1 = st1 + 639596*x1_0
# epilogues
ep0_1 =  + 639596*x1_0 - 1556*x1_0
ep2_1 =  + 639596*x1_0 - 639596*x1_0
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw0_1 = lt0_1 + ep0_1
lw2_1 = lt2_1 + ep2_1
# node last write time
lw1 = max(lw0_1, lw2_1)
# node first write time
fw1 = st1 + 1556*x1_0

# node: 3 info
# start time
st3 = (0 + fw1*x1_0*x3_0)
# relative first write times of inputs
rlr1_3 = st3 + 409*x3_0
# epilogues
ep1_3 = 0
# inputs last read/write dependencies
lt1_3 = max(rlr1_3, lw1)
# curr last write times
lw1_3 = lt1_3 + ep1_3
# node last write time
lw3 = (lw1_3)


print(lw3)
