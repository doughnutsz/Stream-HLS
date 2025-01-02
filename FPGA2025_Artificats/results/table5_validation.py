import pandas as pd
import numpy as np


opts = ["Opt1", "Opt5"]
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
# load data
data = pd.read_csv("tmp/combined_data.csv")

# filter data by framework
for opt_name in opts:
  error_table = pd.DataFrame(columns=["Kernel", f"{opt_name} RTL Cycles", f"{opt_name} StreamHLS Cycles", f"{opt_name} Vitis HLS Cycles", 'empty'])
  errors = {}
  for kernel in kernels:
    kernel_data = data[data["Kernel"] == kernel]
    opt = kernel_data[kernel_data["Framework"] == opt_name]

    rtl_cycles = int(opt["RTL Cycles"].values[0])
    streamhls_cycles = int(opt["StreamHLS Cycles"].values[0])
    vitis_cycles = int(opt["Vitis Cycles"].values[0])
    # print(rtl_cycles, streamhls_cycles, vitis_cycles)
    stream_hls_error = streamhls_cycles/rtl_cycles
    vitis_error = vitis_cycles/rtl_cycles
    errors[kernel] = {
      "StreamHLS": stream_hls_error,
      "Vitis": vitis_error
    }
    # use scientific notation for large numbers

    # new column with [streamhls_cycles (error)]
    if abs(rtl_cycles - streamhls_cycles) < abs(rtl_cycles - vitis_cycles):
      streamhls_cycles_and_error  = f'\\textbf{{{streamhls_cycles:.2E} (${stream_hls_error:.2f}\\times$)}}'
      vitis_cycles_and_error      = f'{vitis_cycles:.2E} (${vitis_error:.2f}\\times$)'
    else:
      streamhls_cycles_and_error  = f'{streamhls_cycles:.2E} (${stream_hls_error:.2f}\\times$)'
      vitis_cycles_and_error      = f'\\textbf{{{vitis_cycles:.2E} (${vitis_error:.2f}\\times$)}}'

    rtl_cycles = f'{rtl_cycles:.2E}'
    error_table = error_table._append({
      "Kernel": kernels[kernel],
      f"{opt_name} RTL Cycles": rtl_cycles,
      f"{opt_name} StreamHLS Cycles": streamhls_cycles_and_error,
      f"{opt_name} Vitis HLS Cycles": vitis_cycles_and_error,
      'empty': ''
    }, ignore_index=True)

  # error geo mean
  geo_mean = {}
  for error_type in ["StreamHLS", "Vitis"]:
    errors_list = [errors[kernel][error_type] for kernel in kernels]
    geo_mean[error_type] = np.prod(errors_list) ** (1/len(errors_list))
  error_table = error_table._append({
    "Kernel": "Geo. Mean",
    f"{opt_name} RTL Cycles": "",
    f"{opt_name} StreamHLS Cycles": f'${geo_mean["StreamHLS"]:.2f}\\times$',
    f"{opt_name} Vitis HLS Cycles": f'${geo_mean["Vitis"]:.2f}\\times$'
  }, ignore_index=True)
  error_table.to_csv(f"tables/{opt_name}_error_table.csv", index=False)
