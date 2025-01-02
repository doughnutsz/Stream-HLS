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

# node: 0 info
# start time
st0 = (0)
# relative first write times of inputs
rlr10000_0 = st0 + 0*x0_0
# epilogues
ep10000_0 =  + 524284*x0_0 - 0*x0_0
# inputs last read/write dependencies
lt10000_0 = max(rlr10000_0, lw10000)
# curr last write times
lw10000_0 = lt10000_0 + ep10000_0
# node last write time
lw0 = (lw10000_0)
# node first write time
fw0 = st0 + 124*x0_0

# node: 1 info
# start time
st1 = (0 + fw0*x0_0*x1_0)
# relative first write times of inputs
rlr0_1 = st1 + 1032444*x1_0
# epilogues
ep0_1 =  + 1048572*x1_0 - 1032444*x1_0
# inputs last read/write dependencies
lt0_1 = max(rlr0_1, lw0)
# curr last write times
lw0_1 = lt0_1 + ep0_1
# node last write time
lw1 = (lw0_1)
# node first write time
fw1 = st1 + 252*x1_0

# node: 2 info
# start time
st2 = (0 + fw1*x1_0*x2_0)
# relative first write times of inputs
rlr1_2 = st2 + 2064636*x2_0
# epilogues
ep1_2 =  + 2097148*x2_0 - 2064636*x2_0
# inputs last read/write dependencies
lt1_2 = max(rlr1_2, lw1)
# curr last write times
lw1_2 = lt1_2 + ep1_2
# node last write time
lw2 = (lw1_2)
# node first write time
fw2 = st2 + 252*x2_0

# node: 3 info
# start time
st3 = (0 + fw2*x2_0*x3_0)
# relative first write times of inputs
rlr2_3 = st3 + 4129276*x3_0
# epilogues
ep2_3 =  + 4194300*x3_0 - 4129276*x3_0
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# node last write time
lw3 = (lw2_3)
# node first write time
fw3 = st3 + 508*x3_0

# node: 4 info
# start time
st4 = (0 + fw3*x3_0*x4_0)
# relative first write times of inputs
rlr3_4 = st4 + 2064892*x4_0
# epilogues
ep3_4 =  + 2097148*x4_0 - 2064892*x4_0
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# node last write time
lw4 = (lw3_4)
# node first write time
fw4 = st4 + 508*x4_0

# node: 5 info
# start time
st5 = (0 + fw4*x4_0*x5_0)
# relative first write times of inputs
rlr4_5 = st5 + 516348*x5_0
# epilogues
ep4_5 =  + 524284*x5_0 - 516348*x5_0
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
# curr last write times
lw4_5 = lt4_5 + ep4_5
# node last write time
lw5 = (lw4_5)
# node first write time
fw5 = st5 + 252*x5_0

# node: 6 info
# start time
st6 = (0 + fw5*x5_0*x6_0)
# relative first write times of inputs
rlr5_6 = st6 + 129148*x6_0
# epilogues
ep5_6 =  + 131068*x6_0 - 129148*x6_0
# inputs last read/write dependencies
lt5_6 = max(rlr5_6, lw5)
# curr last write times
lw5_6 = lt5_6 + ep5_6
# node last write time
lw6 = (lw5_6)
# node first write time
fw6 = st6 + 124*x6_0

# node: 7 info
# start time
st7 = (0 + fw6*x6_0*x7_0)
# relative first write times of inputs
rlr6_7 = st7 + 1023*x7_0
# epilogues
ep6_7 = 0
# inputs last read/write dependencies
lt6_7 = max(rlr6_7, lw6)
# curr last write times
lw6_7 = lt6_7 + ep6_7
# node last write time
lw7 = (lw6_7)


print(lw7)
