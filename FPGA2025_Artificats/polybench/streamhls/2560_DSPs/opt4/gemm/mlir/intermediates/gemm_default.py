x0_0 = 1
x2_0 = 1
x1_0 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 0 info
# start time
st0 = (0)
# relative first write times of inputs
rlr10000_0 = st0 + 0*x0_0
# epilogues
ep10000_0 =  + 42239996*x0_0 - 0*x0_0
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# node last write time
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + 956*x0_0

# node: 1 info
# start time
st1 = (0 + fw0*x0_0*x1_0)
# relative first write times of inputs
rlr0_1 = st1 + 43999*x1_0
# epilogues
ep0_1 =  + 43999*x1_0 - 43999*x1_0
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# node last write time
lw1 = (lw0_1)
# node first write time
fw1 = st1 + 0*x1_0

# node: 2 info
# start time
st2 = (0 + fw1*x1_0*x2_0)
# relative first write times of inputs
rlr1_2 = st2 + 43999*x2_0
# epilogues
ep1_2 = 0
# inputs last read/write dependencies
lt1_2 = max(rlr1_2, lw1)
# curr last write times
lw1_2 = lt1_2 + ep1_2
# node last write time
lw2 = (lw1_2)


print(lw2)
