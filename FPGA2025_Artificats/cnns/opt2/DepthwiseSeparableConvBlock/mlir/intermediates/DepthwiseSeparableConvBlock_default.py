x0 = 1
x120 = 1
x126 = 1
x132 = 1
x138 = 1
x162 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 2 info
# start time
st2 = (0)
# relative first write times of inputs
rlr10000_2 = st2 + 0*x120
# epilogues
ep10000_2 =  + 103967*x120 - 0*x120
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# node last write time
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + 0*x120

# node: 1 info
# start time
st1 = (0 + fw2*x120*x132)
# relative first write times of inputs
rlr2_1 = st1 + 103967*x132
# epilogues
ep2_1 =  + 103967*x132 - 103967*x132
# inputs last read/write dependencies
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw2_1 = lt2_1 + ep2_1
# node last write time
lw1 = (lw2_1)
# node first write time
fw1 = st1 + 0*x132

# node: 0 info
# start time
st0 = (0 + lw1*x132*x0)
# relative first write times of inputs
rlr1_0 = st0 + 3742812*x0
# epilogues
ep1_0 =  + 3742844*x0 - 3742812*x0
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
# curr last write times
lw1_0 = lt1_0 + ep1_0
# node last write time
lw0 = (lw1_0)
# node first write time
fw0 = st0 + 32*x0

# node: 3 info
# start time
st3 = (0 + fw0*x0*x138)
# relative first write times of inputs
rlr0_3 = st3 + 401404*x138
# epilogues
ep0_3 =  + 3211260*x138 - 401404*x138
# inputs last read/write dependencies
lt0_3 = max(rlr0_3, lw0)
# curr last write times
lw0_3 = lt0_3 + ep0_3
# node last write time
lw3 = (lw0_3)
# node first write time
fw3 = st3 + 28*x138

# node: 4 info
# start time
st4 = (0 + fw3*x138*x126)
# relative first write times of inputs
rlr3_4 = st4 + 100351*x126
# epilogues
ep3_4 =  + 100351*x126 - 100351*x126
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
# curr last write times
lw3_4 = lt3_4 + ep3_4
# node last write time
lw4 = (lw3_4)
# node first write time
fw4 = st4 + 0*x126

# node: 5 info
# start time
st5 = (0 + fw4*x126*x162)
# relative first write times of inputs
rlr4_5 = st5 + 100351*x162
# epilogues
ep4_5 = 0
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
# curr last write times
lw4_5 = lt4_5 + ep4_5
# node last write time
lw5 = (lw4_5)


print(lw5)
