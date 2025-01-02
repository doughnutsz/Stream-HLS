x0_0 = 1
x7_0 = 1
x14_0 = 1
x21_0 = 1
x2_0 = 1
x9_0 = 1
x16_0 = 1
x23_0 = 1
x4_0 = 1
x11_0 = 1
x18_0 = 1
x25_0 = 1
x6_0 = 1
x13_0 = 1
x20_0 = 1
x1_0 = 1
x8_0 = 1
x15_0 = 1
x22_0 = 1
x3_0 = 1
x10_0 = 1
x17_0 = 1
x24_0 = 1
x5_0 = 1
x12_0 = 1
x19_0 = 1
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
ep10000_10 =  + 16383*x10_0 - 0*x10_0
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
ep10000_1 =  + 8191*x1_0 + 8191*x1_0 + 8191*x1_0 - 0*x1_0
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# node last write time
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + 0*x1_0 + 0*x1_0 + 0*x1_0

# node: 4 info
# start time
st4 = (0)
# relative first write times of inputs
rlr10000_4 = st4 + 0*x4_0
# epilogues
ep10000_4 =  + 16383*x4_0 - 0*x4_0
# inputs last read/write dependencies
lt10000_4 = max(rlr10000_4, lw10000)
# curr last write times
lw10000_4 = lt10000_4 + ep10000_4
# node last write time
lw4 = (lw10000_4)
# node first write time
fw4 = st4 + 0*x4_0

# node: 3 info
# start time
st3 = max(0 + fw1*x1_0*x3_0, 0 + lw4*x4_0*x3_0)
# relative first write times of inputs
rlr1_3 = st3 + 4129276*x3_0
rlr4_3 = st3 + 65532*x3_0
# epilogues
ep1_3 =  + 4194300*x3_0 - 4129276*x3_0
ep4_3 =  + 4194300*x3_0 - 65532*x3_0
# inputs last read/write dependencies
lt1_3 = max(rlr1_3, lw1)
lt4_3 = max(rlr4_3, lw4)
# curr last write times
lw1_3 = lt1_3 + ep1_3
lw4_3 = lt4_3 + ep4_3
# node last write time
lw3 = max(lw1_3, lw4_3)
# node first write time
fw3 = st3 + 508*x3_0

# node: 5 info
# start time
st5 = (0 + fw3*x3_0*x5_0)
# relative first write times of inputs
rlr3_5 = st5 + 8191*x5_0
# epilogues
ep3_5 =  + 8191*x5_0 - 8191*x5_0
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
st6 = (0 + lw5*x5_0*x6_0)
# relative first write times of inputs
rlr5_6 = st6 + 8191*x6_0
# epilogues
ep5_6 =  + 8191*x6_0 - 8191*x6_0
# inputs last read/write dependencies
lt5_6 = max(rlr5_6, lw5)
# curr last write times
lw5_6 = lt5_6 + ep5_6
# node last write time
lw6 = (lw5_6)
# node first write time
fw6 = st6 + 0*x6_0

# node: 23 info
# start time
st23 = (0)
# relative first write times of inputs
rlr10000_23 = st23 + 0*x23_0
# epilogues
ep10000_23 =  + 16383*x23_0 - 0*x23_0
# inputs last read/write dependencies
lt10000_23 = max(rlr10000_23, lw10000)
# curr last write times
lw10000_23 = lt10000_23 + ep10000_23
# node last write time
lw23 = (lw10000_23)
# node first write time
fw23 = st23 + 0*x23_0

# node: 7 info
# start time
st7 = (0)
# relative first write times of inputs
rlr10000_7 = st7 + 0*x7_0
# epilogues
ep10000_7 =  + 16383*x7_0 - 0*x7_0
# inputs last read/write dependencies
lt10000_7 = max(rlr10000_7, lw10000)
# curr last write times
lw10000_7 = lt10000_7 + ep10000_7
# node last write time
lw7 = (lw10000_7)
# node first write time
fw7 = st7 + 0*x7_0

# node: 2 info
# start time
st2 = max(0 + fw1*x1_0*x2_0, 0 + lw7*x7_0*x2_0)
# relative first write times of inputs
rlr1_2 = st2 + 4129276*x2_0
rlr7_2 = st2 + 65532*x2_0
# epilogues
ep1_2 =  + 4194300*x2_0 - 4129276*x2_0
ep7_2 =  + 4194300*x2_0 - 65532*x2_0
# inputs last read/write dependencies
lt1_2 = max(rlr1_2, lw1)
lt7_2 = max(rlr7_2, lw7)
# curr last write times
lw1_2 = lt1_2 + ep1_2
lw7_2 = lt7_2 + ep7_2
# node last write time
lw2 = max(lw1_2, lw7_2)
# node first write time
fw2 = st2 + 508*x2_0

# node: 8 info
# start time
st8 = (0 + fw2*x2_0*x8_0)
# relative first write times of inputs
rlr2_8 = st8 + 8191*x8_0
# epilogues
ep2_8 =  + 8191*x8_0 - 8191*x8_0
# inputs last read/write dependencies
lt2_8 = max(rlr2_8, lw2)
# curr last write times
lw2_8 = lt2_8 + ep2_8
# node last write time
lw8 = (lw2_8)
# node first write time
fw8 = st8 + 0*x8_0

# node: 9 info
# start time
st9 = (0 + lw8*x8_0*x9_0)
# relative first write times of inputs
rlr8_9 = st9 + 8191*x9_0
# epilogues
ep8_9 =  + 8191*x9_0 - 8191*x9_0
# inputs last read/write dependencies
lt8_9 = max(rlr8_9, lw8)
# curr last write times
lw8_9 = lt8_9 + ep8_9
# node last write time
lw9 = (lw8_9)
# node first write time
fw9 = st9 + 0*x9_0

# node: 13 info
# start time
st13 = max(0 + fw6*x6_0*x13_0, 0 + lw9*x9_0*x13_0)
# relative first write times of inputs
rlr6_13 = st13 + 2093116*x13_0
rlr9_13 = st13 + 1839100*x13_0
# epilogues
ep6_13 =  + 2097148*x13_0 - 2093116*x13_0
ep9_13 =  + 2097148*x13_0 - 1839100*x13_0
# inputs last read/write dependencies
lt6_13 = max(rlr6_13, lw6)
lt9_13 = max(rlr9_13, lw9)
# curr last write times
lw6_13 = lt6_13 + ep6_13
lw9_13 = lt9_13 + ep9_13
# node last write time
lw13 = max(lw6_13, lw9_13)
# node first write time
fw13 = st13 + 60*x13_0

# node: 14 info
# start time
st14 = (0 + fw13*x13_0*x14_0)
# relative first write times of inputs
rlr13_14 = st14 + 32767*x14_0
# epilogues
ep13_14 =  + 32767*x14_0 + 32767*x14_0 - 32767*x14_0
# inputs last read/write dependencies
lt13_14 = max(rlr13_14, lw13)
# curr last write times
lw13_14 = lt13_14 + ep13_14
# node last write time
lw14 = (lw13_14)
# node first write time
fw14 = st14 + 0*x14_0 + 0*x14_0

# node: 15 info
# start time
st15 = (0 + fw14*x14_0*x15_0)
# relative first write times of inputs
rlr14_15 = st15 + 65534*x15_0
# epilogues
ep14_15 =  + 65534*x15_0 - 65534*x15_0
# inputs last read/write dependencies
lt14_15 = max(rlr14_15, lw14)
# curr last write times
lw14_15 = lt14_15 + ep14_15
# node last write time
lw15 = (lw14_15)
# node first write time
fw15 = st15 + 126*x15_0

# node: 16 info
# start time
st16 = max(0 + fw14*x14_0*x16_0, 0 + fw15*x15_0*x16_0)
# relative first write times of inputs
rlr14_16 = st16 + 32767*x16_0
rlr15_16 = st16 + 32704*x16_0
# epilogues
ep14_16 =  + 32767*x16_0 + 32767*x16_0 - 32767*x16_0
ep15_16 =  + 32767*x16_0 + 32767*x16_0 - 32704*x16_0
# inputs last read/write dependencies
lt14_16 = max(rlr14_16, lw14)
lt15_16 = max(rlr15_16, lw15)
# curr last write times
lw14_16 = lt14_16 + ep14_16
lw15_16 = lt15_16 + ep15_16
# node last write time
lw16 = max(lw14_16, lw15_16)
# node first write time
fw16 = st16 + 0*x16_0 + 0*x16_0

# node: 17 info
# start time
st17 = (0 + fw16*x16_0*x17_0)
# relative first write times of inputs
rlr16_17 = st17 + 131068*x17_0
# epilogues
ep16_17 =  + 131068*x17_0 - 131068*x17_0
# inputs last read/write dependencies
lt16_17 = max(rlr16_17, lw16)
# curr last write times
lw16_17 = lt16_17 + ep16_17
# node last write time
lw17 = (lw16_17)
# node first write time
fw17 = st17 + 252*x17_0

# node: 18 info
# start time
st18 = max(0 + fw16*x16_0*x18_0, 0 + fw17*x17_0*x18_0)
# relative first write times of inputs
rlr16_18 = st18 + 32767*x18_0
rlr17_18 = st18 + 32704*x18_0
# epilogues
ep16_18 =  + 32767*x18_0 - 32767*x18_0
ep17_18 =  + 32767*x18_0 - 32704*x18_0
# inputs last read/write dependencies
lt16_18 = max(rlr16_18, lw16)
lt17_18 = max(rlr17_18, lw17)
# curr last write times
lw16_18 = lt16_18 + ep16_18
lw17_18 = lt17_18 + ep17_18
# node last write time
lw18 = max(lw16_18, lw17_18)
# node first write time
fw18 = st18 + 0*x18_0

# node: 0 info
# start time
st0 = max(0 + fw1*x1_0*x0_0, 0 + lw10*x10_0*x0_0)
# relative first write times of inputs
rlr1_0 = st0 + 4129276*x0_0
rlr10_0 = st0 + 65532*x0_0
# epilogues
ep1_0 =  + 4194300*x0_0 - 4129276*x0_0
ep10_0 =  + 4194300*x0_0 - 65532*x0_0
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
lt10_0 = max(rlr10_0, lw10)
# curr last write times
lw1_0 = lt1_0 + ep1_0
lw10_0 = lt10_0 + ep10_0
# node last write time
lw0 = max(lw1_0, lw10_0)
# node first write time
fw0 = st0 + 508*x0_0

# node: 11 info
# start time
st11 = (0 + fw0*x0_0*x11_0)
# relative first write times of inputs
rlr0_11 = st11 + 8191*x11_0
# epilogues
ep0_11 =  + 8191*x11_0 - 8191*x11_0
# inputs last read/write dependencies
lt0_11 = max(rlr0_11, lw0)
# curr last write times
lw0_11 = lt0_11 + ep0_11
# node last write time
lw11 = (lw0_11)
# node first write time
fw11 = st11 + 0*x11_0

# node: 12 info
# start time
st12 = (0 + lw11*x11_0*x12_0)
# relative first write times of inputs
rlr11_12 = st12 + 8191*x12_0
# epilogues
ep11_12 =  + 8191*x12_0 - 8191*x12_0
# inputs last read/write dependencies
lt11_12 = max(rlr11_12, lw11)
# curr last write times
lw11_12 = lt11_12 + ep11_12
# node last write time
lw12 = (lw11_12)
# node first write time
fw12 = st12 + 0*x12_0

# node: 19 info
# start time
st19 = max(0 + fw18*x18_0*x19_0, 0 + lw12*x12_0*x19_0)
# relative first write times of inputs
rlr18_19 = st19 + 2093308*x19_0
rlr12_19 = st19 + 1839100*x19_0
# epilogues
ep18_19 =  + 2097148*x19_0 - 2093308*x19_0
ep12_19 =  + 2097148*x19_0 - 1839100*x19_0
# inputs last read/write dependencies
lt18_19 = max(rlr18_19, lw18)
lt12_19 = max(rlr12_19, lw12)
# curr last write times
lw18_19 = lt18_19 + ep18_19
lw12_19 = lt12_19 + ep12_19
# node last write time
lw19 = max(lw18_19, lw12_19)
# node first write time
fw19 = st19 + 252*x19_0

# node: 20 info
# start time
st20 = (0 + fw19*x19_0*x20_0)
# relative first write times of inputs
rlr19_20 = st20 + 8191*x20_0
# epilogues
ep19_20 =  + 8191*x20_0 - 8191*x20_0
# inputs last read/write dependencies
lt19_20 = max(rlr19_20, lw19)
# curr last write times
lw19_20 = lt19_20 + ep19_20
# node last write time
lw20 = (lw19_20)
# node first write time
fw20 = st20 + 0*x20_0

# node: 21 info
# start time
st21 = (0 + lw20*x20_0*x21_0)
# relative first write times of inputs
rlr20_21 = st21 + 8191*x21_0
# epilogues
ep20_21 =  + 8191*x21_0 - 8191*x21_0
# inputs last read/write dependencies
lt20_21 = max(rlr20_21, lw20)
# curr last write times
lw20_21 = lt20_21 + ep20_21
# node last write time
lw21 = (lw20_21)
# node first write time
fw21 = st21 + 0*x21_0

# node: 22 info
# start time
st22 = max(0 + fw21*x21_0*x22_0, 0 + lw23*x23_0*x22_0)
# relative first write times of inputs
rlr21_22 = st22 + 4129276*x22_0
rlr23_22 = st22 + 65532*x22_0
# epilogues
ep21_22 =  + 4194300*x22_0 - 4129276*x22_0
ep23_22 =  + 4194300*x22_0 - 65532*x22_0
# inputs last read/write dependencies
lt21_22 = max(rlr21_22, lw21)
lt23_22 = max(rlr23_22, lw23)
# curr last write times
lw21_22 = lt21_22 + ep21_22
lw23_22 = lt23_22 + ep23_22
# node last write time
lw22 = max(lw21_22, lw23_22)
# node first write time
fw22 = st22 + 508*x22_0

# node: 24 info
# start time
st24 = (0 + fw22*x22_0*x24_0)
# relative first write times of inputs
rlr22_24 = st24 + 8191*x24_0
# epilogues
ep22_24 =  + 8191*x24_0 - 8191*x24_0
# inputs last read/write dependencies
lt22_24 = max(rlr22_24, lw22)
# curr last write times
lw22_24 = lt22_24 + ep22_24
# node last write time
lw24 = (lw22_24)
# node first write time
fw24 = st24 + 0*x24_0

# node: 25 info
# start time
st25 = (0 + fw24*x24_0*x25_0)
# relative first write times of inputs
rlr24_25 = st25 + 8191*x25_0
# epilogues
ep24_25 = 0
# inputs last read/write dependencies
lt24_25 = max(rlr24_25, lw24)
# curr last write times
lw24_25 = lt24_25 + ep24_25
# node last write time
lw25 = (lw24_25)


print(lw25)
