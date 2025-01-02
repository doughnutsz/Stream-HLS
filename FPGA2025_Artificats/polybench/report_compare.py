import os
import re
import xml.dom.minidom as minidom
from tabulate import tabulate
import pandas as pd
import json
frameworks = {
	"allo" : "Allo", 
	"heterocl" : "HeteroCL",
	"hida" : "HIDA",
	"scalehls" : "ScaleHLS",
	"pom" : "POM",
	"vitis" : "Vitis",
	"streamhls/220_DSPs/opt5"  : "Opt5_220",
	"streamhls/2560_DSPs/opt5" : "Opt5_2560",
	"streamhls/9024_DSPs/opt5" : "Opt5_9024",
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
# <AvailableResources>
# <BRAM_18K>4032</BRAM_18K>
# <DSP>9024</DSP>
# <FF>2607360</FF>
# <LUT>1303680</LUT>
# <URAM>960</URAM>
board_resources = {
	"BRAM_18K" : 4032,
	"DSP" : 9024,
	"FF" : 2607360,
	"LUT" : 1303680,
	"URAM" : 960
}

results = pd.DataFrame(columns=[
	"Framework", 
	"Kernel", 
	"RTL Status",
	"RTL Cycles",
	"StreamHLS Cycles",
	"Vitis Cycles", 
	"Latency (ns)", 
	"BRAM", 
	"DSP", 
	"FF", 
	"LUT", 
	"URAM", 
	"BRAM Util", 
	"DSP Util", 
	"FF Util", 
	"LUT Util", 
	"URAM Util",
])
for framework in frameworks:
	cmd = f'cd {framework} && \
		bash collect_rpts.sh && \
		cd ..'
	os.system(cmd)

for kernel in kernels:
	for framework in frameworks:

		syn_rpt_path = f'{framework}/results_syn/{kernel}.xml'
		rtl_rpt_path = f'{framework}/results_rtl/{kernel}.rpt'
		streamhls_rpt_path = f'{framework}/results_streamhls/{kernel}.json'


		cycles_avg = 0
		latency_avg = 0

		bram = 0
		dsp = 0
		ff = 0
		lut = 0
		uram = 0

		# Calculate resource utilization
		bram_util = 0
		dsp_util = 0
		ff_util = 0
		lut_util = 0
		uram_util = 0
		# syn report
		if os.path.exists(syn_rpt_path):
			syn_rpt = minidom.parse(open(syn_rpt_path, "r"))
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
				continue
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


		streamhls_cycles = -1
		if os.path.exists(streamhls_rpt_path):
			json_file = open(streamhls_rpt_path, "r")
			streamhls_rpt = json.load(json_file)
			sequential_cycles = streamhls_rpt["Sequential Cycles"]
			parallel_cycles = streamhls_rpt["Parallel Cycles"]
			combined_cycles = streamhls_rpt["Combined Cycles"]
			is_combined = streamhls_rpt["Config"]["Combined Optimization"]
			is_permutation = streamhls_rpt["Config"]["Permutation Optimization"]
			is_parallel = streamhls_rpt["Config"]["Parallelization Optimization"]
			if is_combined:
				streamhls_cycles = combined_cycles
			else:
				if is_parallel:
					streamhls_cycles = parallel_cycles
				else:
					streamhls_cycles = sequential_cycles

				# rtl report
		rlt_cycles_avg = 0
		rtl_status = "Fail"
		if os.path.exists(rtl_rpt_path):
			with open(rtl_rpt_path, "r") as rtl_rpt_file:
				lines = rtl_rpt_file.readlines()
				for line in lines:
					# if line starts with "|   Verilog|"
					if line.startswith("|   Verilog|"):
						# tokenize line to get status and avg latency:
						# |   Verilog|      Pass|         268436|         268436|         268436|             NA|             NA|             NA|                268436|
						tokens = line.split("|")
						# remove whitespace from tokens
						tokens = [token.strip() for token in tokens]
						# get avg latency
						rtl_status = tokens[2]
						if rtl_status == "Pass":
							rlt_cycles_avg = int(tokens[3])
						else:
							rlt_cycles_avg = 0
		else:
			rlt_cycles_avg = streamhls_cycles
		results = results._append({
			"Framework": frameworks[framework],
			"Kernel": kernel,
			"RTL Status": rtl_status,
			"RTL Cycles": rlt_cycles_avg,
			"StreamHLS Cycles": streamhls_cycles,
			"Vitis Cycles": cycles_avg,
			"Latency (ns)": latency_avg,
			"BRAM": bram,
			"DSP": dsp,
			"FF": ff,
			"LUT": lut,
			"URAM": uram,
			"BRAM Util": f'{bram_util:.2f}%',
			"DSP Util": f'{dsp_util:.2f}%',
			"FF Util": f'{ff_util:.2f}%',
			"LUT Util": f'{lut_util:.2f}%',
			"URAM Util": f'{uram_util:.2f}%'
		}, ignore_index=True)

# add new column for speedup over vitis
# results["Speedup"] = results.apply(lambda row: row["Vitis Cycles"] / row["RTL Cycles"] if row["RTL Status"] == "Pass" else "N/A", axis=1)

# add new column of difference between RTL and Vitis cycles
# results["Diff"] = results.apply(lambda row: row["Vitis Cycles"] - row["RTL Cycles"], axis=1)
# save to csv
results.to_csv("compare.csv", index=False)
