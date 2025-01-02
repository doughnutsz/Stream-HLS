import pandas as pd

data = pd.read_csv(f"data/compare.csv")

frameworks = [
  "Allo",
  "HeteroCL",
  "HIDA",
  "ScaleHLS",
  "POM",
  "Vitis",
]

new_table = pd.DataFrame(columns=["Kernel", "Opt5", "Allo", "HeteroCL", "HIDA", "ScaleHLS", "POM", "Vitis"])

speedups = {}
for kernel in data["Kernel"].unique():

  kernel_data = data[data["Kernel"] == kernel]

  opt5_128 = kernel_data[kernel_data["Framework"] == "Opt5_220"]
  opt5_256 = kernel_data[kernel_data["Framework"] == "Opt5_2560"]
  opt5_512 = kernel_data[kernel_data["Framework"] == "Opt5_9024"]
  allo = kernel_data[kernel_data["Framework"] == "Allo"]
  heterocl = kernel_data[kernel_data["Framework"] == "HeteroCL"]
  hida = kernel_data[kernel_data["Framework"] == "HIDA"]
  scalehls = kernel_data[kernel_data["Framework"] == "ScaleHLS"]
  pom = kernel_data[kernel_data["Framework"] == "POM"]
  vitis = kernel_data[kernel_data["Framework"] == "Vitis"]

  opt5_128_cycles = opt5_128["RTL Cycles"].values[0]
  opt5_256_cycles = opt5_256["RTL Cycles"].values[0]
  opt5_512_cycles = opt5_512["RTL Cycles"].values[0]
  allo_cycles = allo["RTL Cycles"].values[0]
  heterocl_cycles = heterocl["RTL Cycles"].values[0]
  hida_cycles = hida["RTL Cycles"].values[0]
  scalehls_cycles = scalehls["RTL Cycles"].values[0]
  if pom["RTL Status"].values[0] == "Fail":
    pom_cycles = -1
  else:
    pom_cycles = pom["RTL Cycles"].values[0]
  vitis_cycles = vitis["RTL Cycles"].values[0]
  # print(opt5_128_cycles, opt5_256_cycles, opt5_512_cycles, allo_cycles, heterocl_cycles, hida_cycles, scalehls_cycles, vitis_cycles)
  # opt5_over_opt5 = f'{(opt5_cycles / opt5_cycles):.2f}'
  # opt5_over_allo = f'{(allo_cycles / opt5_256_cycles):.2f}'
  # opt5_over_heterocl = f'{(heterocl_cycles / opt5_256_cycles):.2f}'
  # opt5_over_hida = f'{(hida_cycles / opt5_256_cycles):.2f}'
  # opt5_over_scalehls = f'{(scalehls_cycles / opt5_256_cycles):.2f}'
  # opt5_over_vitis = f'{(vitis_cycles / opt5_256_cycles):.2f}'

  opt5_128_over_allo = f'{(allo_cycles / opt5_128_cycles):.2f}'
  opt5_128_over_heterocl = f'{(heterocl_cycles / opt5_128_cycles):.2f}'
  opt5_128_over_hida = f'{(hida_cycles / opt5_128_cycles):.2f}'
  opt5_128_over_scalehls = f'{(scalehls_cycles / opt5_128_cycles):.2f}'
  opt5_128_over_pom = f'{(pom_cycles / opt5_128_cycles):.2f}'
  opt5_128_over_vitis = f'{(vitis_cycles / opt5_128_cycles):.2f}'

  opt5_256_over_allo = f'{(allo_cycles / opt5_256_cycles):.2f}'
  opt5_256_over_heterocl = f'{(heterocl_cycles / opt5_256_cycles):.2f}'
  opt5_256_over_hida = f'{(hida_cycles / opt5_256_cycles):.2f}'
  opt5_256_over_scalehls = f'{(scalehls_cycles / opt5_256_cycles):.2f}'
  opt5_256_over_pom = f'{(pom_cycles / opt5_256_cycles):.2f}'
  opt5_256_over_vitis = f'{(vitis_cycles / opt5_256_cycles):.2f}'
  

  opt5_512_over_allo = f'{(allo_cycles / opt5_512_cycles):.2f}'
  opt5_512_over_heterocl = f'{(heterocl_cycles / opt5_512_cycles):.2f}'
  opt5_512_over_hida = f'{(hida_cycles / opt5_512_cycles):.2f}'
  opt5_512_over_scalehls = f'{(scalehls_cycles / opt5_512_cycles):.2f}'
  opt5_512_over_pom = f'{(pom_cycles / opt5_512_cycles):.2f}'
  opt5_512_over_vitis = f'{(vitis_cycles / opt5_512_cycles):.2f}'


  # print(opt5_over_allo, opt5_over_heterocl, opt5_over_hida, opt5_over_scalehls, opt5_over_vitis)

  opt5_128 = f'{opt5_128_cycles:.2E}'
  opt5_256 = f'{opt5_256_cycles:.2E}'
  opt5_512 = f'{opt5_512_cycles:.2E}'
  opt5 = f'{opt5_128} | {opt5_256} | {opt5_512}'
  allo = f'{allo_cycles:.2E} (${opt5_256_over_allo}\\times$)'
  heterocl = f'{heterocl_cycles:.2E} (${opt5_256_over_heterocl}\\times$)'
  hida = f'{hida_cycles:.2E} (${opt5_256_over_hida}\\times$)'
  scalehls = f'{scalehls_cycles:.2E} (${opt5_256_over_scalehls}\\times$)'
  pom = f'{pom_cycles:.2E} (${opt5_256_over_pom}\\times$)'
  vitis = f'{vitis_cycles:.2E} (${opt5_256_over_vitis}\\times$)'
  # print(opt5_128, opt5_256, opt5_512, allo, heterocl, hida, scalehls, vitis)
  if kernel == 'bicg' or kernel == 'atax':
    speedups[kernel] = {}
    for dsp in ["128", "256", "512"]:
      speedups[kernel][dsp] = {
        "Allo": eval(f"opt5_{dsp}_over_allo"),
        "HeteroCL": eval(f"opt5_{dsp}_over_heterocl"),
        "HIDA": eval(f"opt5_{dsp}_over_hida"),
        "ScaleHLS": eval(f"opt5_{dsp}_over_scalehls"),
        "Vitis": eval(f"opt5_{dsp}_over_vitis")
      }
  else:
    speedups[kernel] = {}
    for dsp in ["128", "256", "512"]:
      speedups[kernel][dsp] = {
        "Allo": eval(f"opt5_{dsp}_over_allo"),
        "HeteroCL": eval(f"opt5_{dsp}_over_heterocl"),
        "HIDA": eval(f"opt5_{dsp}_over_hida"),
        "ScaleHLS": eval(f"opt5_{dsp}_over_scalehls"),
        "POM": eval(f"opt5_{dsp}_over_pom"),
        "Vitis": eval(f"opt5_{dsp}_over_vitis")
      }
  # speedups[kernel] = {
  #   "Allo": opt5_over_allo,
  #   "HeteroCL": opt5_over_heterocl,
  #   "HIDA": opt5_over_hida,
  #   "ScaleHLS": opt5_over_scalehls,
  #   "Vitis": opt5_over_vitis
  # }
  new_table = new_table._append({
    "Kernel": kernel,
    "Opt5": opt5,
    "Allo": allo,
    "HeteroCL": heterocl,
    "HIDA": hida,
    "ScaleHLS": scalehls,
    "POM": pom,
    "Vitis": vitis
  }, ignore_index=True)
  
# speedups geomean 
geomean = {}
for dsp in ["128", "256", "512"]:
  geomean[dsp] = {}
  for framework in frameworks:
    speedup = 1
    if framework == "POM":
      for kernel in ["2mm", "3mm", "gemm",  "gesummv", "mvt"]:
        speedup *= float(speedups[kernel][dsp][framework])
      geomean[dsp][framework] = f'{speedup**(1/5):.2f}'
    else:
      for kernel in ["2mm", "3mm", "atax", "bicg", "gemm",  "gesummv", "mvt"]:
        speedup *= float(speedups[kernel][dsp][framework])
      geomean[dsp][framework] = f'{speedup**(1/len(speedups)):.2f}'
  new_table = new_table._append({
    "Kernel": f"Geo. Mean ({dsp})",
    "Opt5": '',
    "Allo": f'${geomean[dsp]["Allo"]}\\times$',
    "HeteroCL": f'${geomean[dsp]["HeteroCL"]}\\times$',
    "HIDA": f'${geomean[dsp]["HIDA"]}\\times$',
    "ScaleHLS": f'${geomean[dsp]["ScaleHLS"]}\\times$',
    "POM": f'${geomean[dsp]["POM"]}\\times$',
    "Vitis": f'${geomean[dsp]["Vitis"]}\\times$',
  }, ignore_index=True)
new_table.to_csv(f"tables/compare_all.csv", index=False)