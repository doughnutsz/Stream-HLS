x0_0 = 1
x7_0 = 1
x14_0 = 1
x2_0 = 1
x9_0 = 1
x16_0 = 1
x4_0 = 1
x11_0 = 1
x18_0 = 1
x6_0 = 1
x13_0 = 1
x1_0 = 1
x8_0 = 1
x15_0 = 1
x3_0 = 1
x10_0 = 1
x17_0 = 1
x5_0 = 1
x12_0 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 10 info
# start time
st10 = (0)
# relative first write times of inputs
rlr10000_10 = st10 + 0*x10_0
# epilogues
ep10000_10 =  + 8191*x10_0 - 0*x10_0
# inputs last read/write dependencies
lt10000_10 = max(rlr10000_10, lw10000)
# curr last write times
lw10000_10 = lt10000_10 + ep10000_10
# node last write time
lw10 = (lw10000_10)
# node first write time
fw10 = st10 + 0*x10_0

# node: 1 info
# start time
st1 = (0)
# relative first write times of inputs
rlr10000_1 = st1 + 0*x1_0
# epilogues
ep10000_1 =  + 200703*x1_0 - 0*x1_0
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# node last write time
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + 0*x1_0

# node: 13 info
# start time
st13 = (0)
# relative first write times of inputs
rlr10000_13 = st13 + 0*x13_0
# epilogues
ep10000_13 =  + 32767*x13_0 - 0*x13_0
# inputs last read/write dependencies
lt10000_13 = max(rlr10000_13, lw10000)
# curr last write times
lw10000_13 = lt10000_13 + ep10000_13
# node last write time
lw13 = (lw10000_13)
# node first write time
fw13 = st13 + 0*x13_0

# node: 4 info
# start time
st4 = (0)
# relative first write times of inputs
rlr10000_4 = st4 + 0*x4_0
# epilogues
ep10000_4 =  + 32767*x4_0 - 0*x4_0
# inputs last read/write dependencies
lt10000_4 = max(rlr10000_4, lw10000)
# curr last write times
lw10000_4 = lt10000_4 + ep10000_4
# node last write time
lw4 = (lw10000_4)
# node first write time
fw4 = st4 + 0*x4_0

# node: 16 info
# start time
st16 = (0)
# relative first write times of inputs
rlr10000_16 = st16 + 0*x16_0
# epilogues
ep10000_16 =  + 200703*x16_0 - 0*x16_0
# inputs last read/write dependencies
lt10000_16 = max(rlr10000_16, lw10000)
# curr last write times
lw10000_16 = lt10000_16 + ep10000_16
# node last write time
lw16 = (lw10000_16)
# node first write time
fw16 = st16 + 0*x16_0

# node: 7 info
# start time
st7 = (0)
# relative first write times of inputs
rlr10000_7 = st7 + 0*x7_0
# epilogues
ep10000_7 =  + 8191*x7_0 - 0*x7_0
# inputs last read/write dependencies
lt10000_7 = max(rlr10000_7, lw10000)
# curr last write times
lw10000_7 = lt10000_7 + ep10000_7
# node last write time
lw7 = (lw10000_7)
# node first write time
fw7 = st7 + 0*x7_0

# node: 0 info
# start time
st0 = (0 + fw1*x1_0*x0_0)
# relative first write times of inputs
rlr1_0 = st0 + 802812*x0_0
# epilogues
ep1_0 =  + 25690108*x0_0 - 802812*x0_0
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
# curr last write times
lw1_0 = lt1_0 + ep1_0
# node last write time
lw0 = (lw1_0)
# node first write time
fw0 = st0 + 3132*x0_0

# node: 2 info
# start time
st2 = (0 + fw0*x0_0*x2_0)
# relative first write times of inputs
rlr0_2 = st2 + 8191*x2_0
# epilogues
ep0_2 =  + 8191*x2_0 - 8191*x2_0
# inputs last read/write dependencies
lt0_2 = max(rlr0_2, lw0)
# curr last write times
lw0_2 = lt0_2 + ep0_2
# node last write time
lw2 = (lw0_2)
# node first write time
fw2 = st2 + 0*x2_0

# node: 3 info
# start time
st3 = max(0 + fw2*x2_0*x3_0, 0 + fw4*x4_0*x3_0)
# relative first write times of inputs
rlr2_3 = st3 + 4064252*x3_0
rlr4_3 = st3 + 131068*x3_0
# epilogues
ep2_3 =  + 4194300*x3_0 - 4064252*x3_0
ep4_3 =  + 4194300*x3_0 - 131068*x3_0
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
lt4_3 = max(rlr4_3, lw4)
# curr last write times
lw2_3 = lt2_3 + ep2_3
lw4_3 = lt4_3 + ep4_3
# node last write time
lw3 = max(lw2_3, lw4_3)
# node first write time
fw3 = st3 + 1020*x3_0

# node: 5 info
# start time
st5 = (0 + fw3*x3_0*x5_0)
# relative first write times of inputs
rlr3_5 = st5 + 4095*x5_0
# epilogues
ep3_5 =  + 4095*x5_0 - 4095*x5_0
# inputs last read/write dependencies
lt3_5 = max(rlr3_5, lw3)
# curr last write times
lw3_5 = lt3_5 + ep3_5
# node last write time
lw5 = (lw3_5)
# node first write time
fw5 = st5 + 0*x5_0

# node: 6 info
# start time
st6 = max(0 + fw5*x5_0*x6_0, 0 + fw7*x7_0*x6_0)
# relative first write times of inputs
rlr5_6 = st6 + 1016316*x6_0
rlr7_6 = st6 + 32764*x6_0
# epilogues
ep5_6 =  + 1048572*x6_0 - 1016316*x6_0
ep7_6 =  + 1048572*x6_0 - 32764*x6_0
# inputs last read/write dependencies
lt5_6 = max(rlr5_6, lw5)
lt7_6 = max(rlr7_6, lw7)
# curr last write times
lw5_6 = lt5_6 + ep5_6
lw7_6 = lt7_6 + ep7_6
# node last write time
lw6 = max(lw5_6, lw7_6)
# node first write time
fw6 = st6 + 508*x6_0

# node: 8 info
# start time
st8 = (0 + fw6*x6_0*x8_0)
# relative first write times of inputs
rlr6_8 = st8 + 2047*x8_0
# epilogues
ep6_8 =  + 2047*x8_0 - 2047*x8_0
# inputs last read/write dependencies
lt6_8 = max(rlr6_8, lw6)
# curr last write times
lw6_8 = lt6_8 + ep6_8
# node last write time
lw8 = (lw6_8)
# node first write time
fw8 = st8 + 0*x8_0

# node: 9 info
# start time
st9 = max(0 + fw8*x8_0*x9_0, 0 + fw10*x10_0*x9_0)
# relative first write times of inputs
rlr8_9 = st9 + 1016060*x9_0
rlr10_9 = st9 + 32764*x9_0
# epilogues
ep8_9 =  + 1048572*x9_0 - 1016060*x9_0
ep10_9 =  + 1048572*x9_0 - 32764*x9_0
# inputs last read/write dependencies
lt8_9 = max(rlr8_9, lw8)
lt10_9 = max(rlr10_9, lw10)
# curr last write times
lw8_9 = lt8_9 + ep8_9
lw10_9 = lt10_9 + ep10_9
# node last write time
lw9 = max(lw8_9, lw10_9)
# node first write time
fw9 = st9 + 252*x9_0

# node: 11 info
# start time
st11 = (0 + fw9*x9_0*x11_0)
# relative first write times of inputs
rlr9_11 = st11 + 4095*x11_0
# epilogues
ep9_11 =  + 4095*x11_0 - 4095*x11_0
# inputs last read/write dependencies
lt9_11 = max(rlr9_11, lw9)
# curr last write times
lw9_11 = lt9_11 + ep9_11
# node last write time
lw11 = (lw9_11)
# node first write time
fw11 = st11 + 0*x11_0

# node: 12 info
# start time
st12 = max(0 + fw11*x11_0*x12_0, 0 + fw13*x13_0*x12_0)
# relative first write times of inputs
rlr11_12 = st12 + 4063740*x12_0
rlr13_12 = st12 + 131068*x12_0
# epilogues
ep11_12 =  + 4194300*x12_0 - 4063740*x12_0
ep13_12 =  + 4194300*x12_0 - 131068*x12_0
# inputs last read/write dependencies
lt11_12 = max(rlr11_12, lw11)
lt13_12 = max(rlr13_12, lw13)
# curr last write times
lw11_12 = lt11_12 + ep11_12
lw13_12 = lt13_12 + ep13_12
# node last write time
lw12 = max(lw11_12, lw13_12)
# node first write time
fw12 = st12 + 508*x12_0

# node: 14 info
# start time
st14 = (0 + fw12*x12_0*x14_0)
# relative first write times of inputs
rlr12_14 = st14 + 8191*x14_0
# epilogues
ep12_14 =  + 8191*x14_0 - 8191*x14_0
# inputs last read/write dependencies
lt12_14 = max(rlr12_14, lw12)
# curr last write times
lw12_14 = lt12_14 + ep12_14
# node last write time
lw14 = (lw12_14)
# node first write time
fw14 = st14 + 0*x14_0

# node: 15 info
# start time
st15 = max(0 + fw14*x14_0*x15_0, 0 + fw16*x16_0*x15_0)
# relative first write times of inputs
rlr14_15 = st15 + 24888316*x15_0
rlr16_15 = st15 + 802812*x15_0
# epilogues
ep14_15 =  + 25690108*x15_0 - 24888316*x15_0
ep16_15 =  + 25690108*x15_0 - 802812*x15_0
# inputs last read/write dependencies
lt14_15 = max(rlr14_15, lw14)
lt16_15 = max(rlr16_15, lw16)
# curr last write times
lw14_15 = lt14_15 + ep14_15
lw16_15 = lt16_15 + ep16_15
# node last write time
lw15 = max(lw14_15, lw16_15)
# node first write time
fw15 = st15 + 1020*x15_0

# node: 17 info
# start time
st17 = (0 + fw15*x15_0*x17_0)
# relative first write times of inputs
rlr15_17 = st17 + 25087*x17_0
# epilogues
ep15_17 =  + 25087*x17_0 - 25087*x17_0
# inputs last read/write dependencies
lt15_17 = max(rlr15_17, lw15)
# curr last write times
lw15_17 = lt15_17 + ep15_17
# node last write time
lw17 = (lw15_17)
# node first write time
fw17 = st17 + 0*x17_0

# node: 18 info
# start time
st18 = (0 + fw17*x17_0*x18_0)
# relative first write times of inputs
rlr17_18 = st18 + 25087*x18_0
# epilogues
ep17_18 = 0
# inputs last read/write dependencies
lt17_18 = max(rlr17_18, lw17)
# curr last write times
lw17_18 = lt17_18 + ep17_18
# node last write time
lw18 = (lw17_18)


print(lw18)
