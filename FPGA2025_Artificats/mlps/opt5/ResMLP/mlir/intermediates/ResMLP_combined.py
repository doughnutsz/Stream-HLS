b0_1 = 1
b7_1 = 1
b2_0 = 1
b9_0 = 1
b10000_0 = 1
b4_0 = 1
b11_1 = 1
b6_1 = 1
b13_0 = 1
b1_1 = 1
b8_1 = 1
b3_0 = 1
b10_1 = 1
b5_1 = 1
b12_0 = 1
x0_0 = 8
u0_0 = 1
assert u0_0 * x0_0 == 8
x0_2 = 32
u0_2 = 16
assert u0_2 * x0_2 == 512
x0_1 = 128
u0_1 = 8
assert u0_1 * x0_1 == 1024
DSP_0 = u0_0 * u0_1 * u0_2
x7_0 = 8
u7_0 = 1
assert u7_0 * x7_0 == 8
x7_2 = 64
u7_2 = 4
assert u7_2 * x7_2 == 256
x7_1 = 32
u7_1 = 16
assert u7_1 * x7_1 == 512
DSP_7 = u7_0 * u7_1 * u7_2
x2_0 = 8
u2_0 = 1
assert u2_0 * x2_0 == 8
x2_1 = 32
u2_1 = 16
assert u2_1 * x2_1 == 512
DSP_2 = 0
x9_0 = 8
u9_0 = 1
assert u9_0 * x9_0 == 8
x9_1 = 64
u9_1 = 4
assert u9_1 * x9_1 == 256
DSP_9 = 0
x4_0 = 8
u4_0 = 1
assert u4_0 * x4_0 == 8
x4_1 = 32
u4_1 = 16
assert u4_1 * x4_1 == 512
DSP_4 = 0
x11_1 = 10
u11_1 = 1
assert u11_1 * x11_1 == 10
x11_0 = 64
u11_0 = 4
assert u11_0 * x11_0 == 256
DSP_11 = 0
x6_1 = 32
u6_1 = 16
assert u6_1 * x6_1 == 512
x6_0 = 32
u6_0 = 16
assert u6_0 * x6_0 == 512
DSP_6 = 0
x13_0 = 8
u13_0 = 1
assert u13_0 * x13_0 == 8
x13_1 = 10
u13_1 = 1
assert u13_1 * x13_1 == 10
DSP_13 = 0
x1_1 = 32
u1_1 = 16
assert u1_1 * x1_1 == 512
x1_0 = 128
u1_0 = 8
assert u1_0 * x1_0 == 1024
DSP_1 = 0
x8_1 = 64
u8_1 = 4
assert u8_1 * x8_1 == 256
x8_0 = 32
u8_0 = 16
assert u8_0 * x8_0 == 512
DSP_8 = 0
x3_0 = 8
u3_0 = 1
assert u3_0 * x3_0 == 8
x3_1 = 32
u3_1 = 16
assert u3_1 * x3_1 == 512
DSP_3 = 0
x10_0 = 8
u10_0 = 1
assert u10_0 * x10_0 == 8
x10_2 = 10
u10_2 = 1
assert u10_2 * x10_2 == 10
x10_1 = 64
u10_1 = 4
assert u10_1 * x10_1 == 256
DSP_10 = u10_0 * u10_1 * u10_2
x5_0 = 8
u5_0 = 1
assert u5_0 * x5_0 == 8
x5_2 = 32
u5_2 = 16
assert u5_2 * x5_2 == 512
x5_1 = 32
u5_1 = 16
assert u5_1 * x5_1 == 512
DSP_5 = u5_0 * u5_1 * u5_2
x12_0 = 8
u12_0 = 1
assert u12_0 * x12_0 == 8
x12_1 = 10
u12_1 = 1
assert u12_1 * x12_1 == 10
DSP_12 = 0
totalDSP = DSP_0 + DSP_7 + DSP_2 + DSP_9 + DSP_4 + DSP_11 + DSP_6 + DSP_13 + DSP_1 + DSP_8 + DSP_3 + DSP_10 + DSP_5 + DSP_12
# node: 10000 info
st10000 = 0
fw10000 = 0
lw10000 = 0
# node: 8 info
# start time
st8 = (0 + fw10000*b10000_0*b8_1)
# relative first write times of inputs
rlr10000_8 = st8
# epilogues
ep10000_8 =  + ((131071) * 1) * b8_1
# inputs last read/write dependencies
lt10000_8 = max(rlr10000_8, lw10000)
# curr last write times
lw10000_8 = lt10000_8 + ep10000_8
# c_et = max(c_a_et, c_b_et) + 1
lw8 = (lw10000_8)
# node first write time
fw8 = st8 + (0) * 1

# node: 1 info
# start time
st1 = (0 + fw10000*b10000_0*b1_1)
# relative first write times of inputs
rlr10000_1 = st1
# epilogues
ep10000_1 =  + ((524287) * 1) * b1_1
# inputs last read/write dependencies
lt10000_1 = max(rlr10000_1, lw10000)
# curr last write times
lw10000_1 = lt10000_1 + ep10000_1
# c_et = max(c_a_et, c_b_et) + 1
lw1 = (lw10000_1)
# node first write time
fw1 = st1 + (0) * 1

# node: 6 info
# start time
st6 = (0 + fw10000*b10000_0*b6_1)
# relative first write times of inputs
rlr10000_6 = st6
# epilogues
ep10000_6 =  + ((262143) * 1) * b6_1
# inputs last read/write dependencies
lt10000_6 = max(rlr10000_6, lw10000)
# curr last write times
lw10000_6 = lt10000_6 + ep10000_6
# c_et = max(c_a_et, c_b_et) + 1
lw6 = (lw10000_6)
# node first write time
fw6 = st6 + (0) * 1

# node: 11 info
# start time
st11 = (0 + fw10000*b10000_0*b11_1)
# relative first write times of inputs
rlr10000_11 = st11
# epilogues
ep10000_11 =  + ((2559) * 1) * b11_1
# inputs last read/write dependencies
lt10000_11 = max(rlr10000_11, lw10000)
# curr last write times
lw10000_11 = lt10000_11 + ep10000_11
# c_et = max(c_a_et, c_b_et) + 1
lw11 = (lw10000_11)
# node first write time
fw11 = st11 + (0) * 1

# node: 0 info
# start time
st0 = (0 + fw1*b1_1*b0_1)
# relative first write times of inputs
rlr1_0 = st0 + ((524287) * 1) * b0_1
# epilogues
ep1_0 =  + ((4194303) * 1) * b0_1 - ((524287) * 1) * b0_1
# inputs last read/write dependencies
lt1_0 = max(rlr1_0, lw1)
# curr last write times
lw1_0 = lt1_0 + ep1_0
# c_et = max(c_a_et, c_b_et) + 1
lw0 = (lw1_0)
# node first write time
fw0 = st0 + (523776) * 1

# node: 2 info
# start time
st2 = (0 + fw0*b0_1*b2_0)
# relative first write times of inputs
rlr0_2 = st2 + ((4095) * 1) * b2_0
# epilogues
ep0_2 =  + ((4095) * 1) * b2_0 + ((4095) * 1) * b2_0 - ((4095) * 1) * b2_0
# inputs last read/write dependencies
lt0_2 = max(rlr0_2, lw0)
# curr last write times
lw0_2 = lt0_2 + ep0_2
# c_et = max(c_a_et, c_b_et) + 1
lw2 = (lw0_2)
# node first write time
fw2 = st2 + (0) * 1 + (0) * 1

# node: 3 info
# start time
st3 = (0 + fw2*b2_0*b3_0)
# relative first write times of inputs
rlr2_3 = st3 + ((4095) * 1) * b3_0
# epilogues
ep2_3 =  + ((4095) * 1) * b3_0 - ((4095) * 1) * b3_0
# inputs last read/write dependencies
lt2_3 = max(rlr2_3, lw2)
# curr last write times
lw2_3 = lt2_3 + ep2_3
# c_et = max(c_a_et, c_b_et) + 1
lw3 = (lw2_3)
# node first write time
fw3 = st3 + (0) * 1

# node: 5 info
# start time
st5 = max(0 + fw3*b3_0*b5_1, 0 + fw6*b6_1*b5_1)
# relative first write times of inputs
rlr3_5 = st5 + ((2096640) * 1) * b5_1
rlr6_5 = st5 + ((262143) * 1) * b5_1
# epilogues
ep3_5 =  + ((2097151) * 1) * b5_1 - ((2096640) * 1) * b5_1
ep6_5 =  + ((2097151) * 1) * b5_1 - ((262143) * 1) * b5_1
# inputs last read/write dependencies
lt3_5 = max(rlr3_5, lw3)
lt6_5 = max(rlr6_5, lw6)
# curr last write times
lw3_5 = lt3_5 + ep3_5
lw6_5 = lt6_5 + ep6_5
# c_et = max(c_a_et, c_b_et) + 1
lw5 = max(lw3_5, lw6_5)
# node first write time
fw5 = st5 + (261632) * 1

# node: 4 info
# start time
st4 = max(0 + fw2*b2_0*b4_0, 0 + fw5*b5_1*b4_0)
# relative first write times of inputs
rlr2_4 = st4 + ((4095) * 1) * b4_0
rlr5_4 = st4 + ((4095) * 1) * b4_0
# epilogues
ep2_4 =  + ((4095) * 1) * b4_0 - ((4095) * 1) * b4_0
ep5_4 =  + ((4095) * 1) * b4_0 - ((4095) * 1) * b4_0
# inputs last read/write dependencies
lt2_4 = max(rlr2_4, lw2)
lt5_4 = max(rlr5_4, lw5)
# curr last write times
lw2_4 = lt2_4 + ep2_4
lw5_4 = lt5_4 + ep5_4
# c_et = max(c_a_et, c_b_et) + 1
lw4 = max(lw2_4, lw5_4)
# node first write time
fw4 = st4 + (0) * 1

# node: 7 info
# start time
st7 = max(0 + fw4*b4_0*b7_1, 0 + fw8*b8_1*b7_1)
# relative first write times of inputs
rlr4_7 = st7 + ((1048320) * 1) * b7_1
rlr8_7 = st7 + ((131071) * 1) * b7_1
# epilogues
ep4_7 =  + ((1048575) * 1) * b7_1 - ((1048320) * 1) * b7_1
ep8_7 =  + ((1048575) * 1) * b7_1 - ((131071) * 1) * b7_1
# inputs last read/write dependencies
lt4_7 = max(rlr4_7, lw4)
lt8_7 = max(rlr8_7, lw8)
# curr last write times
lw4_7 = lt4_7 + ep4_7
lw8_7 = lt8_7 + ep8_7
# c_et = max(c_a_et, c_b_et) + 1
lw7 = max(lw4_7, lw8_7)
# node first write time
fw7 = st7 + (130816) * 1

# node: 9 info
# start time
st9 = (0 + fw7*b7_1*b9_0)
# relative first write times of inputs
rlr7_9 = st9 + ((2047) * 1) * b9_0
# epilogues
ep7_9 =  + ((2047) * 1) * b9_0 - ((2047) * 1) * b9_0
# inputs last read/write dependencies
lt7_9 = max(rlr7_9, lw7)
# curr last write times
lw7_9 = lt7_9 + ep7_9
# c_et = max(c_a_et, c_b_et) + 1
lw9 = (lw7_9)
# node first write time
fw9 = st9 + (0) * 1

# node: 10 info
# start time
st10 = max(0 + fw9*b9_0*b10_1, 0 + fw11*b11_1*b10_1)
# relative first write times of inputs
rlr9_10 = st10 + ((20470) * 1) * b10_1
rlr11_10 = st10 + ((2559) * 1) * b10_1
# epilogues
ep9_10 =  + ((20479) * 1) * b10_1 - ((20470) * 1) * b10_1
ep11_10 =  + ((20479) * 1) * b10_1 - ((2559) * 1) * b10_1
# inputs last read/write dependencies
lt9_10 = max(rlr9_10, lw9)
lt11_10 = max(rlr11_10, lw11)
# curr last write times
lw9_10 = lt9_10 + ep9_10
lw11_10 = lt11_10 + ep11_10
# c_et = max(c_a_et, c_b_et) + 1
lw10 = max(lw9_10, lw11_10)
# node first write time
fw10 = st10 + (2550) * 1

# node: 12 info
# start time
st12 = (0 + fw10*b10_1*b12_0)
# relative first write times of inputs
rlr10_12 = st12 + ((79) * 1) * b12_0
# epilogues
ep10_12 =  + ((79) * 1) * b12_0 - ((79) * 1) * b12_0
# inputs last read/write dependencies
lt10_12 = max(rlr10_12, lw10)
# curr last write times
lw10_12 = lt10_12 + ep10_12
# c_et = max(c_a_et, c_b_et) + 1
lw12 = (lw10_12)
# node first write time
fw12 = st12 + (0) * 1

# node: 13 info
# start time
st13 = (0 + fw12*b12_0*b13_0)
# relative first write times of inputs
rlr12_13 = st13 + ((79) * 1) * b13_0
# epilogues
ep12_13 = 0
# inputs last read/write dependencies
lt12_13 = max(rlr12_13, lw12)
# curr last write times
lw12_13 = lt12_13 + ep12_13
# c_et = max(c_a_et, c_b_et) + 1
lw13 = (lw12_13)


# objective function
latency = lw13
print(latency)
print(totalDSP)
