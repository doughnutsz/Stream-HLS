x0_0 = 1
x7_0 = 1
x2_0 = 1
x9_0 = 1
x4_0 = 1
x11_0 = 1
x6_0 = 1
x13_0 = 1
x1_0 = 1
x8_0 = 1
x3_0 = 1
x10_0 = 1
x5_0 = 1
x12_0 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 8 info
# start time
st8 = (0)
# relative first write times of inputs
rlr10000_8 = st8 + 0*x8_0
# epilogues
ep10000_8 =  + 131071*x8_0 - 0*x8_0
# inputs last read/write dependencies
lt10000_8 = max(rlr10000_8, lw10000)
# curr last write times
lw10000_8 = lt10000_8 + ep10000_8
# node last write time
lw8 = (lw10000_8)
# node first write time
fw8 = st8 + 0*x8_0

# node: 1 info
# start time
st1 = (0)
# relative first write times of inputs
rlr10000_1 = st1 + 0*x1_0
# epilogues
ep10000_1 =  + 524287*x1_0 - 0*x1_0
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
ep10000_6 =  + 262143*x6_0 - 0*x6_0
# inputs last read/write dependencies
lt10000_6 = max(rlr10000_6, lw10000)
# curr last write times
lw10000_6 = lt10000_6 + ep10000_6
# node last write time
lw6 = (lw10000_6)
# node first write time
fw6 = st6 + 0*x6_0

# node: 11 info
# start time
st11 = (0)
# relative first write times of inputs
rlr10000_11 = st11 + 0*x11_0
# epilogues
ep10000_11 =  + 2559*x11_0 - 0*x11_0
# inputs last read/write dependencies
lt10000_11 = max(rlr10000_11, lw10000)
# curr last write times
lw10000_11 = lt10000_11 + ep10000_11
# node last write time
lw11 = (lw10000_11)
# node first write time
fw11 = st11 + 0*x11_0

# node: 0 info
# start time
st0 = (0 + fw1*x1_0*x0_0)
# relative first write times of inputs
rlr1_0 = st0 + 2097148*x0_0
# epilogues
ep1_0 =  + 16777212*x0_0 - 2097148*x0_0
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
# curr last write times
lw1_0 = lt1_0 + ep1_0
# node last write time
lw0 = (lw1_0)
# node first write time
fw0 = st0 + 4092*x0_0

# node: 2 info
# start time
st2 = (0 + fw0*x0_0*x2_0)
# relative first write times of inputs
rlr0_2 = st2 + 4095*x2_0
# epilogues
ep0_2 =  + 4095*x2_0 + 4095*x2_0 - 4095*x2_0
# inputs last read/write dependencies
lt0_2 = max(rlr0_2, lw0)
# curr last write times
lw0_2 = lt0_2 + ep0_2
# node last write time
lw2 = (lw0_2)
# node first write time
fw2 = st2 + 0*x2_0 + 0*x2_0

# node: 3 info
# start time
st3 = (0 + fw2*x2_0*x3_0)
# relative first write times of inputs
rlr2_3 = st3 + 4095*x3_0
# epilogues
ep2_3 =  + 4095*x3_0 - 4095*x3_0
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# node last write time
lw3 = (lw2_3)
# node first write time
fw3 = st3 + 0*x3_0

# node: 5 info
# start time
st5 = max(0 + fw3*x3_0*x5_0, 0 + fw6*x6_0*x5_0)
# relative first write times of inputs
rlr3_5 = st5 + 7342076*x5_0
rlr6_5 = st5 + 1048572*x5_0
# epilogues
ep3_5 =  + 8388604*x5_0 - 7342076*x5_0
ep6_5 =  + 8388604*x5_0 - 1048572*x5_0
# inputs last read/write dependencies
lt3_5 = max(rlr3_5, lw3)
lt6_5 = max(rlr6_5, lw6)
# curr last write times
lw3_5 = lt3_5 + ep3_5
lw6_5 = lt6_5 + ep6_5
# node last write time
lw5 = max(lw3_5, lw6_5)
# node first write time
fw5 = st5 + 2044*x5_0

# node: 4 info
# start time
st4 = max(0 + fw2*x2_0*x4_0, 0 + fw5*x5_0*x4_0)
# relative first write times of inputs
rlr2_4 = st4 + 4095*x4_0
rlr5_4 = st4 + 4095*x4_0
# epilogues
ep2_4 =  + 4095*x4_0 - 4095*x4_0
ep5_4 =  + 4095*x4_0 - 4095*x4_0
# inputs last read/write dependencies
lt2_4 = max(rlr2_4, lw2)
lt5_4 = max(rlr5_4, lw5)
# curr last write times
lw2_4 = lt2_4 + ep2_4
lw5_4 = lt5_4 + ep5_4
# node last write time
lw4 = max(lw2_4, lw5_4)
# node first write time
fw4 = st4 + 0*x4_0

# node: 7 info
# start time
st7 = max(0 + fw4*x4_0*x7_0, 0 + fw8*x8_0*x7_0)
# relative first write times of inputs
rlr4_7 = st7 + 3672060*x7_0
rlr8_7 = st7 + 524284*x7_0
# epilogues
ep4_7 =  + 4194300*x7_0 - 3672060*x7_0
ep8_7 =  + 4194300*x7_0 - 524284*x7_0
# inputs last read/write dependencies
lt4_7 = max(rlr4_7, lw4)
lt8_7 = max(rlr8_7, lw8)
# curr last write times
lw4_7 = lt4_7 + ep4_7
lw8_7 = lt8_7 + ep8_7
# node last write time
lw7 = max(lw4_7, lw8_7)
# node first write time
fw7 = st7 + 2044*x7_0

# node: 9 info
# start time
st9 = (0 + fw7*x7_0*x9_0)
# relative first write times of inputs
rlr7_9 = st9 + 2047*x9_0
# epilogues
ep7_9 =  + 2047*x9_0 - 2047*x9_0
# inputs last read/write dependencies
lt7_9 = max(rlr7_9, lw7)
# curr last write times
lw7_9 = lt7_9 + ep7_9
# node last write time
lw9 = (lw7_9)
# node first write time
fw9 = st9 + 0*x9_0

# node: 10 info
# start time
st10 = max(0 + fw9*x9_0*x10_0, 0 + fw11*x11_0*x10_0)
# relative first write times of inputs
rlr9_10 = st10 + 72700*x10_0
rlr11_10 = st10 + 10236*x10_0
# epilogues
ep9_10 =  + 81916*x10_0 - 72700*x10_0
ep11_10 =  + 81916*x10_0 - 10236*x10_0
# inputs last read/write dependencies
lt9_10 = max(rlr9_10, lw9)
lt11_10 = max(rlr11_10, lw11)
# curr last write times
lw9_10 = lt9_10 + ep9_10
lw11_10 = lt11_10 + ep11_10
# node last write time
lw10 = max(lw9_10, lw11_10)
# node first write time
fw10 = st10 + 1020*x10_0

# node: 12 info
# start time
st12 = (0 + fw10*x10_0*x12_0)
# relative first write times of inputs
rlr10_12 = st12 + 79*x12_0
# epilogues
ep10_12 =  + 79*x12_0 - 79*x12_0
# inputs last read/write dependencies
lt10_12 = max(rlr10_12, lw10)
# curr last write times
lw10_12 = lt10_12 + ep10_12
# node last write time
lw12 = (lw10_12)
# node first write time
fw12 = st12 + 0*x12_0

# node: 13 info
# start time
st13 = (0 + fw12*x12_0*x13_0)
# relative first write times of inputs
rlr12_13 = st13 + 79*x13_0
# epilogues
ep12_13 = 0
# inputs last read/write dependencies
lt12_13 = max(rlr12_13, lw12)
# curr last write times
lw12_13 = lt12_13 + ep12_13
# node last write time
lw13 = (lw12_13)


print(lw13)
