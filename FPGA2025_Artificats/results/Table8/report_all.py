import os
import re
import xml.dom.minidom as minidom
import pandas as pd
import json
def getResources(report_path):
  board_resources = {
    "BRAM_18K" : 4032,
    "DSP" : 9024,
    "FF" : 2607360,
    "LUT" : 1303680,
    "URAM" : 960
  }
  # syn report
  if os.path.exists(report_path):
    syn_rpt = minidom.parse(open(report_path, "r"))
    performance = syn_rpt.getElementsByTagName("PerformanceEstimates")[0].getElementsByTagName("SummaryOfOverallLatency")[0]
    cycles_avg = int(performance.getElementsByTagName("Average-caseLatency")[0].childNodes[0].data)
    latency_avg = performance.getElementsByTagName("Average-caseRealTimeLatency")[0].childNodes[0].data
    # latency_avg is in the form "float ms|us|s|ns"
    # convert to ns
    if "ns" in latency_avg:
      latency_avg = float(latency_avg.replace("ns", ""))
    elif "us" in latency_avg:
      latency_avg = float(latency_avg.replace("us", "")) * 1e3
    elif "ms" in latency_avg:
      latency_avg = float(latency_avg.replace("ms", "")) * 1e6
    elif "sec" in latency_avg:
      latency_avg = float(latency_avg.replace("sec", "")) * 1e9
    else:
      print(f"Error: {latency_avg} is not a valid time unit")
      return None
    resources = syn_rpt.getElementsByTagName("AreaEstimates")[0].getElementsByTagName("Resources")[0]
    bram = resources.getElementsByTagName("BRAM_18K")[0].childNodes[0].data
    dsp = resources.getElementsByTagName("DSP")[0].childNodes[0].data
    ff = resources.getElementsByTagName("FF")[0].childNodes[0].data
    lut = resources.getElementsByTagName("LUT")[0].childNodes[0].data
    uram = resources.getElementsByTagName("URAM")[0].childNodes[0].data

    # Calculate resource utilization
    bram_util = (int(bram) / board_resources["BRAM_18K"])*100
    dsp_util = (int(dsp) / board_resources["DSP"])*100
    ff_util = (int(ff) / board_resources["FF"])*100
    lut_util = (int(lut) / board_resources["LUT"])*100
    uram_util = (int(uram) / board_resources["URAM"])*100

    return {
      "cycles_avg" : cycles_avg,
      "latency_avg" : latency_avg,
      "bram" : bram,
      "dsp" : dsp,
      "ff" : ff,
      "lut" : lut,
      "uram" : uram,
      "bram_util" : bram_util,
      "dsp_util" : dsp_util,
      "ff_util" : ff_util,
      "lut_util" : lut_util,
      "uram_util" : uram_util
    }
  
frameworks = {
  "streamhls_220" : "StreamHLS 220",
  "streamhls_2560" : "StreamHLS 2560",
  "streamhls_9024" : "StreamHLS 9024",
	"hida" : "HIDA Default",
  "pom" : "POM Default",
}

kernels = [
	"2mm",
	"3mm",
	"atax",
	"bicg",
	"gemm",
	"gesummv",
	"mvt"
]

# dse_runtimes = pd.DataFrame(columns=[
#   "Kernel", 
#   "StreamHLS 640 DSE Time",
#   "StreamHLS 1280 DSE Time",
#   "StreamHLS 2560 DSE Time",
#   "HIDA Default DSE Time",
#   "HIDA 128 DSE Time",
#   "HIDA 256 DSE Time",
#   "HIDA 512 DSE Time",
# ])

results_dict = {}
for framework in frameworks:
  results_dict[framework] = {}
  for kernel in kernels:
    print(framework, kernel)
    results_dict[framework][kernel] = {}
    hls_rpt_path = f'{framework}/hls/{kernel}.xml'
    dse_time_path = f'{framework}/dse/{kernel}.json'
    if os.path.exists(hls_rpt_path):
      hls_resources = getResources(hls_rpt_path)
    else:
      hls_resources = {
        "dsp" : 0,
        "dsp_util" : 0
      }
    DSE_time = None
    with open(dse_time_path) as f:
      dse_json = json.load(f)
      if 'hida' in framework or 'pom' in framework:
        DSE_time = dse_json["time"]
      else:
        DSE_time = dse_json["Compilation Time (s)"]
    
    DSP_count = hls_resources["dsp"]
    DSP_util = hls_resources["dsp_util"]
    results_dict[framework][kernel] = {
      "DSE Time" : DSE_time,
      "DSPs" : DSP_count,
      "DSP Util" : DSP_util
    }

hida_geomean = []
pom_geomean = []
for kernel in kernels:

  stream_hls_220_dse_time = round(results_dict["streamhls_220"][kernel]["DSE Time"])
  stream_hls_2560_dse_time = round(results_dict["streamhls_2560"][kernel]["DSE Time"])
  stream_hls_9024_dse_time = round(results_dict["streamhls_9024"][kernel]["DSE Time"])
  hida_dse_time = round(results_dict["hida"][kernel]["DSE Time"])
  pom_dse_time = round(results_dict["pom"][kernel]["DSE Time"])
  # hida_128_dse_time = round(results_dict["hida_128"][kernel]["DSE Time"])
  # hida_256_dse_time = round(results_dict["hida_256"][kernel]["DSE Time"])
  # hida_512_dse_time = round(results_dict["hida_512"][kernel]["DSE Time"])

  stream_hls_220_dsp = int(results_dict["streamhls_220"][kernel]["DSPs"])
  stream_hls_2560_dsp = int(results_dict["streamhls_2560"][kernel]["DSPs"])
  stream_hls_9024_dsp = int(results_dict["streamhls_9024"][kernel]["DSPs"])
  hida_dsp = int(results_dict["hida"][kernel]["DSPs"])
  pom_dsp = int(results_dict["pom"][kernel]["DSPs"])

  stream_hls_220_dsp_percent = (results_dict["streamhls_220"][kernel]["DSP Util"])
  stream_hls_2560_dsp_percent = (results_dict["streamhls_2560"][kernel]["DSP Util"])
  stream_hls_9024_dsp_percent = (results_dict["streamhls_9024"][kernel]["DSP Util"])
  hida_dsp_percent = (results_dict["hida"][kernel]["DSP Util"])
  pom_dsp_percent = (results_dict["pom"][kernel]["DSP Util"])

  stream_hls_over_hida = f'{(hida_dse_time / stream_hls_9024_dse_time):.1f}'
  hida_geomean.append(results_dict["hida"][kernel]["DSE Time"] / results_dict["streamhls_9024"][kernel]["DSE Time"])

  stream_hls_over_pom = f'{(pom_dse_time / stream_hls_9024_dse_time):.1f}'
  if pom_dsp != 0:
    pom_geomean.append(results_dict["pom"][kernel]["DSE Time"] / results_dict["streamhls_9024"][kernel]["DSE Time"])

  col1 = f'{kernel}'
  # comma separated values 1000 -> 1,000
  col2 = f'({stream_hls_220_dse_time}, {stream_hls_2560_dse_time}, {stream_hls_9024_dse_time})'

  # col3 = f'({stream_hls_220_dsp}, {stream_hls_2560_dsp}, {stream_hls_9024_dsp})'
  col3 = f'({stream_hls_220_dsp_percent:.1f}, {stream_hls_2560_dsp_percent:.1f}, {stream_hls_9024_dsp_percent:.1f})'

  col4 = f'{hida_dse_time}'

  # col5 = f'{hida_dsp}'
  col5 = f'{hida_dsp_percent:.1f}'

  col6 = f'{pom_dse_time}'

  # col7 = f'{pom_dsp}'
  col7 = f'{pom_dsp_percent:.1f}'
  # align columns
  print(col1, col2, col3, col4, col5, col6, col7, sep="& ", end="\\\\\n", flush=True)
  # dse_runtimes = dse_runtimes._append({
  #   "Kernel": kernel,
  #   "StreamHLS 640 DSE Time": stream_hls_128_dse_time,
  #   "StreamHLS 1280 DSE Time": stream_hls_256_dse_time,
  #   "StreamHLS 2560 DSE Time": stream_hls_2560_dse_time,
  #   "HIDA Default DSE Time": hida_dse_time,
  #   "HIDA 128 DSE Time": hida_128_dse_time,
  #   "HIDA 256 DSE Time": hida_256_dse_time,
  #   "HIDA 512 DSE Time": hida_512_dse_time,
  # }, ignore_index=True)
print(hida_geomean)
print(pom_geomean)
import numpy as np
geomean_hida = np.prod(hida_geomean) ** (1/len(hida_geomean))
print(f'Geomean hida: {geomean_hida:.2f}')
geomean_pom = np.prod(pom_geomean) ** (1/len(pom_geomean))
print(f'Geomean pom: {geomean_pom:.2f}')

# dse_runtimes = dse_runtimes.set_index("Kernel")
    
# dse_runtimes.to_csv(f"dse_time.csv")
