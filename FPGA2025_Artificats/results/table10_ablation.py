import pandas as pd
import numpy as np
data = pd.read_csv("tmp/combined_data.csv")

kernels = {
  "Autoencoder" : "Autoencoder",
  "ResMLP" : "Residual MLP",
  "ResidualBlock" : "Residual Block",
  "DepthwiseSeparableConvBlock" : "DWSConv. Block",
  "FeedForward" : "Feed Forward",
  "MultiHeadSelfAttention1" : "Multi-Head Self Attention",
  "3mm" : "3mm",
  "atax" : "atax",
  "k7mmseq_balanced" : "7mm Balanced",
  "k7mmseq_unbalanced" : "7mm Imbalanced",
}
# new table layout for RTL Cycles:
# Kernel | Opt1 | Opt2 | Opt3 | Opt4 | Opt5

# create a new table
ablation_table = pd.DataFrame(columns=["Kernel", "Opt1", "Opt2", "Opt3", "Opt4", "Opt5"])
speedups = {}
# filter data by framework
for kernel in kernels:
  kernel_data = data[data["Kernel"] == kernel]
  opt1 = kernel_data[kernel_data["Framework"] == "Opt1"]
  opt2 = kernel_data[kernel_data["Framework"] == "Opt2"]
  opt3 = kernel_data[kernel_data["Framework"] == "Opt3"]
  opt4 = kernel_data[kernel_data["Framework"] == "Opt4"]
  opt5 = kernel_data[kernel_data["Framework"] == "Opt5"]

  opt1_speedup = f'{(opt1["RTL Cycles"].values[0] / opt1["RTL Cycles"].values[0]):.2f}'
  opt2_speedup = f'{(opt1["RTL Cycles"].values[0] / opt2["RTL Cycles"].values[0]):.2f}'
  opt3_speedup = f'{(opt1["RTL Cycles"].values[0] / opt3["RTL Cycles"].values[0]):.2f}'
  opt4_speedup = f'{(opt1["RTL Cycles"].values[0] / opt4["RTL Cycles"].values[0]):.2f}'
  opt5_speedup = f'{(opt1["RTL Cycles"].values[0] / opt5["RTL Cycles"].values[0]):.2f}'

  speedups[kernel] = {
    "Opt1": opt1_speedup,
    "Opt2": opt2_speedup,
    "Opt3": opt3_speedup,
    "Opt4": opt4_speedup,
    "Opt5": opt5_speedup
  }

  opt4_over_opt3 = f'{(opt3["RTL Cycles"].values[0] / opt4["RTL Cycles"].values[0]):.2f}'
  opt5_over_opt3 = f'{(opt3["RTL Cycles"].values[0] / opt5["RTL Cycles"].values[0]):.2f}'
  opt5_over_opt4 = f'{(opt4["RTL Cycles"].values[0] / opt5["RTL Cycles"].values[0]):.2f}'

  # # use scientific notation for large numbers
  # if opt0["RTL Status"].values[0] == "Fail":
  #   opt0 = "Failed"
  # else:
  #   opt0 = f'{opt0["RTL Cycles"].values[0]:.2E} (${opt0_speedup}\\times$)'
  
  opt1 = f'{opt1["RTL Cycles"].values[0]:.2E} (${opt1_speedup}\\times$)'
  opt2 = f'{opt2["RTL Cycles"].values[0]:.2E} (${opt2_speedup}\\times$)'
  opt3 = f'{opt3["RTL Cycles"].values[0]:.2E} (${opt3_speedup}\\times$)'
  opt4 = f'{opt4["RTL Cycles"].values[0]:.2E} (${opt4_speedup}\\times$)'
  opt5 = f'{opt5["RTL Cycles"].values[0]:.2E} (${opt5_speedup}\\times$)'
  ablation_table = ablation_table._append({
    "Kernel": kernels[kernel],
    # "Opt0": opt0,
    "Opt1": opt1,
    "Opt2": opt2,
    "Opt3": opt3,
    "Opt4": opt4,
    "Opt5": opt5,
    "Opt4 over Opt3": opt4_over_opt3,
    "Opt5 over Opt3": opt5_over_opt3,
    "Opt5 over Opt4": opt5_over_opt4
  }, ignore_index=True)

# geo mean
geomean = {}
for opt in ["Opt1", "Opt2", "Opt3", "Opt4", "Opt5"]:
  speedup = 1
  for kernel in kernels:
    speedup *= float(speedups[kernel][opt])
  geomean[opt] = f'${speedup ** (1/len(kernels)):.2f}\\times$'
ablation_table = ablation_table._append({
  "Kernel": "Geo. Mean",
  "Opt0": "",
  "Opt1": geomean["Opt1"],
  "Opt2": geomean["Opt2"],
  "Opt3": geomean["Opt3"],
  "Opt4": geomean["Opt4"],
  "Opt5": geomean["Opt5"]
}, ignore_index=True)
ablation_table.to_csv("tables/table10.csv", index=False)