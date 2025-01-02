
gemm1 = {
  "ops" : 180*190*200*2,
  "streamhls_2560" : {
    "time" : 45640,
    "dsps" : 752,
  },
  "streamhls_220" : 
  {
    "time" : 570026,
    "dsps" : 63,
  },
  "hida" : {
    "time" : 114018,
    "dsps" : 303,
  },
  "pom" : {
    "time" : 855025,
    "dsps" : 43,
  },
}

gemm2 = {
  "ops" : 190*210*220*2,
  "streamhls_2560" : {
    "time" : 43918,
    "dsps" : 1001,
  },
  "streamhls_220" : 
  {
    "time" : 438938,
    "dsps" : 101,
  },
  "hida" : {
    "time" : 146324,
    "dsps" : 33,
  },
  "pom" : {
    "time" : 1097275,
    "dsps" : 3,
  },
}

gemm3 = {
  "ops" : 180*210*190*2,
  "streamhls_2560" : {
    "time" : 47913,
    "dsps" : 753,
  },
  "streamhls_220" : 
  {
    "time" : 598518,
    "dsps" : 62,
  },
  "hida" : {
    "time" : 133029,
    "dsps" : 17,
  },
  "pom" : {
    "time" : 897775,
    "dsps" : 3,
  },
}

total = {
  "ops" : gemm1["ops"] + gemm2["ops"] + gemm3["ops"],
  "streamhls_2560" : {
    "time" : 49092,
    "dsps" : 2507
  },
  "streamhls_220" : {
    "time" : 601511,
    "dsps" : 227
  },
  "hida" : {
    "time" : 279370,
    "dsps" : 623
  },
  "pom" : {
    "time" : 2034985,
    "dsps" : 92
  },
}

print(f'Gemm 1 ({gemm1["ops"]:.2E}) & {gemm1["streamhls_2560"]["time"]:.2E} ({gemm1["streamhls_2560"]["dsps"]}) & {gemm1["hida"]["time"]:.2E} ({gemm1["hida"]["dsps"]}) & {gemm1["streamhls_220"]["time"]:.2E} ({gemm1["streamhls_220"]["dsps"]}) & {gemm1["pom"]["time"]:.2E} ({gemm1["pom"]["dsps"]}) \\\\')
print(f'Gemm 2 ({gemm2["ops"]:.2E}) & {gemm2["streamhls_2560"]["time"]:.2E} ({gemm2["streamhls_2560"]["dsps"]}) & {gemm2["hida"]["time"]:.2E} ({gemm2["hida"]["dsps"]}) & {gemm2["streamhls_220"]["time"]:.2E} ({gemm2["streamhls_220"]["dsps"]}) & {gemm2["pom"]["time"]:.2E} ({gemm2["pom"]["dsps"]}) \\\\')
print(f'Gemm 3 ({gemm3["ops"]:.2E}) & {gemm3["streamhls_2560"]["time"]:.2E} ({gemm3["streamhls_2560"]["dsps"]}) & {gemm3["hida"]["time"]:.2E} ({gemm3["hida"]["dsps"]}) & {gemm3["streamhls_220"]["time"]:.2E} ({gemm3["streamhls_220"]["dsps"]}) & {gemm3["pom"]["time"]:.2E} ({gemm3["pom"]["dsps"]}) \\\\')
print('\\hline')
print(f'Total ({total["ops"]:.2E}) & {total["streamhls_2560"]["time"]:.2E} ({total["streamhls_2560"]["dsps"]}) & {total["hida"]["time"]:.2E} ({total["hida"]["dsps"]}) & {total["streamhls_220"]["time"]:.2E} ({total["streamhls_220"]["dsps"]}) & {total["pom"]["time"]:.2E} ({total["pom"]["dsps"]}) \\\\')