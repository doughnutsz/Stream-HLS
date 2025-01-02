x0_0 = 1
x7_0 = 1
x2_0 = 1
x4_0 = 1
x6_0 = 1
x1_0 = 1
x8_0 = 1
x3_0 = 1
x5_0 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 1 info
# start time
st1 = (0)
# relative first write times of inputs
rlr10000_1 = st1 + 0*x1_0
# epilogues
ep10000_1 =  + 50175*x1_0 - 0*x1_0
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# node last write time
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + 0*x1_0

# node: 6 info
# start time
st6 = (0)
# relative first write times of inputs
rlr10000_6 = st6 + 0*x6_0
# epilogues
ep10000_6 =  + 53823*x6_0 - 0*x6_0
# inputs last read/write dependencies
lt10000_6 = max(rlr10000_6, lw10000)
# curr last write times
lw10000_6 = lt10000_6 + ep10000_6
# node last write time
lw6 = (lw10000_6)
# node first write time
fw6 = st6 + 0*x6_0

# node: 2 info
# start time
st2 = (0)
# relative first write times of inputs
rlr10000_2 = st2 + 0*x2_0
# epilogues
ep10000_2 =  + 53823*x2_0 - 0*x2_0
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
st0 = max(0 + lw1*x1_0*x0_0, 0 + lw2*x2_0*x0_0)
# relative first write times of inputs
rlr1_0 = st0 + 1806332*x0_0
rlr2_0 = st0 + 1806332*x0_0
# epilogues
ep1_0 =  + 28901372*x0_0 - 1806332*x0_0
ep2_0 =  + 28901372*x0_0 - 1806332*x0_0
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt2_0 = max(rlr2_0, lw2)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw2_0 = lt2_0 + ep2_0
# node last write time
lw0 = max(lw1_0, lw2_0)
# node first write time
fw0 = st0 + 572*x0_0

# node: 3 info
# start time
st3 = (0 + fw0*x0_0*x3_0)
# relative first write times of inputs
rlr0_3 = st3 + 50175*x3_0
# epilogues
ep0_3 =  + 50175*x3_0 - 50175*x3_0
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
st4 = (0 + fw3*x3_0*x4_0)
# relative first write times of inputs
rlr3_4 = st4 + 50175*x4_0
# epilogues
ep3_4 =  + 50175*x4_0 - 50175*x4_0
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# node last write time
lw4 = (lw3_4)
# node first write time
fw4 = st4 + 0*x4_0

# node: 5 info
# start time
st5 = max(0 + lw4*x4_0*x5_0, 0 + lw6*x6_0*x5_0)
# relative first write times of inputs
rlr4_5 = st5 + 1806332*x5_0
rlr6_5 = st5 + 1806332*x5_0
# epilogues
ep4_5 =  + 28901372*x5_0 - 1806332*x5_0
ep6_5 =  + 28901372*x5_0 - 1806332*x5_0
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
lt6_5 = max(rlr6_5, lw6)
# curr last write times
lw4_5 = lt4_5 + ep4_5
lw6_5 = lt6_5 + ep6_5
# node last write time
lw5 = max(lw4_5, lw6_5)
# node first write time
fw5 = st5 + 572*x5_0

# node: 7 info
# start time
st7 = (0 + fw5*x5_0*x7_0)
# relative first write times of inputs
rlr5_7 = st7 + 50175*x7_0
# epilogues
ep5_7 =  + 50175*x7_0 - 50175*x7_0
# inputs last read/write dependencies
lt5_7 = max(rlr5_7, lw5)
# curr last write times
lw5_7 = lt5_7 + ep5_7
# node last write time
lw7 = (lw5_7)
# node first write time
fw7 = st7 + 0*x7_0

# node: 8 info
# start time
st8 = (0 + fw7*x7_0*x8_0)
# relative first write times of inputs
rlr7_8 = st8 + 50175*x8_0
# epilogues
ep7_8 = 0
# inputs last read/write dependencies
lt7_8 = max(rlr7_8, lw7)
# curr last write times
lw7_8 = lt7_8 + ep7_8
# node last write time
lw8 = (lw7_8)


print(lw8)
