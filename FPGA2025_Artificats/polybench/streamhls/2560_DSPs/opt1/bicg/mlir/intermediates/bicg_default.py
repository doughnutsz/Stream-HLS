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
ep10000_2 =  + 639596*x2_0 - 0*x2_0
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# node last write time
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + 1556*x2_0

# node: 3 info
# start time
st3 = (0 + fw2*x2_0*x3_0)
# relative first write times of inputs
rlr2_3 = st3 + 409*x3_0
# epilogues
ep2_3 = 0
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# node last write time
lw3 = (lw2_3)


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
st1 = (0 + fw0*x0_0*x1_0)
# relative first write times of inputs
rlr0_1 = st1 + 389*x1_0
# epilogues
ep0_1 = 0
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# node last write time
lw1 = (lw0_1)


print(lw1)
