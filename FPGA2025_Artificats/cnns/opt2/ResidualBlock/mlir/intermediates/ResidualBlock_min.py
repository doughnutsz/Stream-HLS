x19 = 1
x28 = 1
x34 = 1
x40 = 1
x46 = 1
x52 = 1
x58 = 1
x64 = 1
x84 = 1
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0

# node: 6 info
# start time
st6 = (0)
# relative first write times of inputs
rlr10000_6 = st6 + 0*x46
# epilogues
ep10000_6 =  + 53823*x46 - 0*x46
# inputs last read/write dependencies
lt10000_6 = max(rlr10000_6, lw10000)
# curr last write times
lw10000_6 = lt10000_6 + ep10000_6
# node last write time
lw6 = (lw10000_6)
# node first write time
fw6 = st6 + 0*x46

# node: 2 info
# start time
st2 = (0)
# relative first write times of inputs
rlr10000_2 = st2 + 0*x34
# epilogues
ep10000_2 =  + 53823*x34 - 0*x34
# inputs last read/write dependencies
lt10000_2 = max(rlr10000_2, lw10000)
# curr last write times
lw10000_2 = lt10000_2 + ep10000_2
# node last write time
lw2 = (lw10000_2)
# node first write time
fw2 = st2 + 0*x34

# node: 1 info
# start time
st1 = (0 + fw2*x34*x52)
# relative first write times of inputs
rlr2_1 = st1 + 53823*x52
# epilogues
ep2_1 =  + 53823*x52 - 53823*x52
# inputs last read/write dependencies
lt2_1 = max(rlr2_1, lw2)
# curr last write times
lw2_1 = lt2_1 + ep2_1
# node last write time
lw1 = (lw2_1)
# node first write time
fw1 = st1 + 0*x52

# node: 0 info
# start time
st0 = (0 + fw1*x52*x19)
# relative first write times of inputs
rlr1_0 = st0 + 7748592*x19
# epilogues
ep1_0 =  + 7750655*x19 - 7748592*x19
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
# curr last write times
lw1_0 = lt1_0 + ep1_0
# node last write time
lw0 = (lw1_0)
# node first write time
fw0 = st0 + 2288*x19

# node: 3 info
# start time
st3 = (0 + fw0*x19*x64)
# relative first write times of inputs
rlr0_3 = st3 + 50175*x64
# epilogues
ep0_3 =  + 50175*x64 - 50175*x64
# inputs last read/write dependencies
lt0_3 = max(rlr0_3, lw0)
# curr last write times
lw0_3 = lt0_3 + ep0_3
# node last write time
lw3 = (lw0_3)
# node first write time
fw3 = st3 + 0*x64

# node: 4 info
# start time
st4 = max(0 + fw3*x64*x40, 0 + fw6*x46*x40)
# relative first write times of inputs
rlr3_4 = st4 + 53823*x40
rlr6_4 = st4 + 53823*x40
# epilogues
ep3_4 =  + 53823*x40 - 53823*x40
ep6_4 =  + 53823*x40 - 53823*x40
# inputs last read/write dependencies
lt3_4 = max(rlr3_4, lw3)
lt6_4 = max(rlr6_4, lw6)
# curr last write times
lw3_4 = lt3_4 + ep3_4
lw6_4 = lt6_4 + ep6_4
# node last write time
lw4 = max(lw3_4, lw6_4)
# node first write time
fw4 = st4 + 0*x40

# node: 5 info
# start time
st5 = (0 + fw4*x40*x84)
# relative first write times of inputs
rlr4_5 = st5 + 7750512*x84
# epilogues
ep4_5 =  + 7750655*x84 - 7750512*x84
# inputs last read/write dependencies
lt4_5 = max(rlr4_5, lw4)
# curr last write times
lw4_5 = lt4_5 + ep4_5
# node last write time
lw5 = (lw4_5)
# node first write time
fw5 = st5 + 2288*x84

# node: 7 info
# start time
st7 = (0 + fw5*x84*x28)
# relative first write times of inputs
rlr5_7 = st7 + 50175*x28
# epilogues
ep5_7 =  + 50175*x28 - 50175*x28
# inputs last read/write dependencies
lt5_7 = max(rlr5_7, lw5)
# curr last write times
lw5_7 = lt5_7 + ep5_7
# node last write time
lw7 = (lw5_7)
# node first write time
fw7 = st7 + 0*x28

# node: 8 info
# start time
st8 = (0 + fw7*x28*x58)
# relative first write times of inputs
rlr7_8 = st8 + 50175*x58
# epilogues
ep7_8 = 0
# inputs last read/write dependencies
lt7_8 = max(rlr7_8, lw7)
# curr last write times
lw7_8 = lt7_8 + ep7_8
# node last write time
lw8 = (lw7_8)


print(lw8)
