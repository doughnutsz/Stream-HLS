x0_0 = 1
x7_0 = 1
x2_0 = 1
x4_0 = 1
x6_0 = 1
x1_0 = 1
x3_0 = 1
x5_0 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 5 info
# start time
st5 = (0)
# relative first write times of inputs
rlr10000_5 = st5 + 0*x5_0
# epilogues
ep10000_5 =  + 32767*x5_0 - 0*x5_0
# inputs last read/write dependencies
lt10000_5 = max(rlr10000_5, lw10000)
# curr last write times
lw10000_5 = lt10000_5 + ep10000_5
# node last write time
lw5 = (lw10000_5)
# node first write time
fw5 = st5 + 0*x5_0

# node: 1 info
# start time
st1 = (0)
# relative first write times of inputs
rlr10000_1 = st1 + 0*x1_0
# epilogues
ep10000_1 =  + 65535*x1_0 - 0*x1_0
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# node last write time
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + 0*x1_0

# node: 2 info
# start time
st2 = (0)
# relative first write times of inputs
rlr10000_2 = st2 + 0*x2_0
# epilogues
ep10000_2 =  + 32767*x2_0 - 0*x2_0
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
st0 = max(0 + fw1*x1_0*x0_0, 0 + lw2*x2_0*x0_0)
# relative first write times of inputs
rlr1_0 = st0 + 66978300*x0_0
rlr2_0 = st0 + 131068*x0_0
# epilogues
ep1_0 =  + 67108860*x0_0 - 66978300*x0_0
ep2_0 =  + 67108860*x0_0 - 131068*x0_0
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt2_0 = max(rlr2_0, lw2)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw2_0 = lt2_0 + ep2_0
# node last write time
lw0 = max(lw1_0, lw2_0)
# node first write time
fw0 = st0 + 508*x0_0

# node: 3 info
# start time
st3 = (0 + fw0*x0_0*x3_0)
# relative first write times of inputs
rlr0_3 = st3 + 131071*x3_0
# epilogues
ep0_3 =  + 131071*x3_0 - 131071*x3_0
# inputs last read/write dependencies
lt0_3 = max(rlr0_3, lw0)
# curr last write times
lw0_3 = lt0_3 + ep0_3
# node last write time
lw3 = (lw0_3)
# node first write time
fw3 = st3 + 0*x3_0

# node: 4 info
# start time
st4 = max(0 + fw3*x3_0*x4_0, 0 + lw5*x5_0*x4_0)
# relative first write times of inputs
rlr3_4 = st4 + 66978812*x4_0
rlr5_4 = st4 + 131068*x4_0
# epilogues
ep3_4 =  + 67108860*x4_0 - 66978812*x4_0
ep5_4 =  + 67108860*x4_0 - 131068*x4_0
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
lt5_4 = max(rlr5_4, lw5)
# curr last write times
lw3_4 = lt3_4 + ep3_4
lw5_4 = lt5_4 + ep5_4
# node last write time
lw4 = max(lw3_4, lw5_4)
# node first write time
fw4 = st4 + 1020*x4_0

# node: 6 info
# start time
st6 = (0 + fw4*x4_0*x6_0)
# relative first write times of inputs
rlr4_6 = st6 + 65535*x6_0
# epilogues
ep4_6 =  + 65535*x6_0 - 65535*x6_0
# inputs last read/write dependencies
lt4_6 = max(rlr4_6, lw4)
# curr last write times
lw4_6 = lt4_6 + ep4_6
# node last write time
lw6 = (lw4_6)
# node first write time
fw6 = st6 + 0*x6_0

# node: 7 info
# start time
st7 = (0 + fw6*x6_0*x7_0)
# relative first write times of inputs
rlr6_7 = st7 + 65535*x7_0
# epilogues
ep6_7 = 0
# inputs last read/write dependencies
lt6_7 = max(rlr6_7, lw6)
# curr last write times
lw6_7 = lt6_7 + ep6_7
# node last write time
lw7 = (lw6_7)


print(lw7)
