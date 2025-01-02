import os
import re
import xml.dom.minidom as minidom
from tabulate import tabulate
import pandas as pd
import json
frameworks = {
	"opt1" : "Opt1",
	"opt2" : "Opt2",
	"opt3" : "Opt3",
	"opt4" : "Opt4",
	"opt5" : "Opt5"
}

kernels = [
	"Autoencoder",
	"ResMLP",
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
		cycles_avg = -1
		latency_avg = -1
		bram = -1
		dsp = -1
		ff = -1
		lut = -1
		uram = -1

		# Calculate resource utilization
		bram_util = -1
		dsp_util = -1
		ff_util = -1
		lut_util = -1
		uram_util = -1
		
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
		else:
			streamhls_cycles = -1

		results = results._append({
			"Framework": frameworks[framework],
			"Kernel": kernel,
			"RTL Status": rtl_status,
			"RTL Cycles": rlt_cycles_avg,
			"StreamHLS Cycles": streamhls_cycles,
			"Vitis Cycles": cycles_avg,
			"Latency (ns)": latency_avg,
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
results.to_csv("mlps.csv", index=False)

# from matplotlib import pyplot as plt
# import seaborn as sns

# # plot rtl cycles for each kernel and framework
# plt.figure(figsize=(12, 6))
# sns.barplot(x="Kernel", y="Speedup", hue="Framework", data=results)
# plt.title("RTL Cycles for each kernel and framework")
# # y axis in log scale
# plt.yscale("log")
# plt.xticks(rotation=45)
# plt.tight_layout()
# plt.savefig("rtl_cycles.png")

# results = []
# all_latency = []
# all_dsp = []
# for framework in frameworks:
#     for i, benchmark in enumerate(benchmarks):
#         if framework == "scalehls":
#             path = f"{framework}/{benchmark}/paper_result/{benchmark}.prj/solution1/syn/report/"
#             name = f"{path}/test_{benchmark}_csynth.xml"
#         else:
#             path = f"{framework}/{benchmark}/{benchmark}.prj/solution1/syn/report"
#             name = f"{path}/kernel_{benchmark}_csynth.xml"
#         report = minidom.parse(open(name, "r"))
#         clock = (
#             report.getElementsByTagName("UserAssignments")[0]
#             .getElementsByTagName("TargetClockPeriod")[0]
#             .childNodes[0]
#             .data
#         )
#         overall_lat = report.getElementsByTagName("PerformanceEstimates")[
#             0
#         ].getElementsByTagName("SummaryOfOverallLatency")[0]
#         if (
#             len(overall_lat.getElementsByTagName("Average-caseLatency")) > 0
#             and overall_lat.getElementsByTagName("Average-caseLatency")[0]
#             .childNodes[0]
#             .data
#             != "undef"
#         ):
#             avg_lat = (
#                 overall_lat.getElementsByTagName("Average-caseLatency")[0]
#                 .childNodes[0]
#                 .data
#             )
#         else:
#             avg_lat = (
#                 overall_lat.getElementsByTagName("Worst-caseLatency")[0]
#                 .childNodes[0]
#                 .data
#             )
#         dsp = (
#             report.getElementsByTagName("AreaEstimates")[0]
#             .getElementsByTagName("Resources")[0]
#             .getElementsByTagName("DSP")[0]
#             .childNodes[0]
#             .data
#         )
#         if framework != "scalehls":
#             dsp_ratio = "N/A"
#         else:
#             dsp_ratio = f"1/{all_dsp[-5] / int(dsp):.1f}x"
#         all_dsp.append(int(dsp))
#         latency = int(avg_lat) * 1e-3
#         if framework != "scalehls":
#             speedup = "N/A"
#         else:
#             speedup = f"{latency / all_latency[-5]:.1f}x"
#         all_latency.append(latency)
#         logfilename = f"{framework}/pnr/{benchmark}/vitis_hls.log"
#         if not os.path.exists(logfilename):
#             print(f"Error: {logfilename} does not exist")
#             continue
#         with open(logfilename, "r") as logfile:
#             lines = logfile.readlines()
#             for line in lines:
#                 if not line.startswith("CP achieved post-implementation:"):
#                     continue
#                 p_lat = float(line.split(":")[1].strip())
#                 freq = 1000.0 / p_lat
#                 break
#         rpt = open(f"{path}/csynth.rpt", "r").read()
#         ii = max(list(map(int, re.findall(r"II=([0-9]*)", rpt))))
#         if framework == "scalehls":
#             loc = "N/A"
#         else:
#             with open(f"{framework}/{benchmark}/{benchmark}.cpp", "r") as cppfile:
#                 loc = 0
#                 for line in cppfile:
#                     if line.startswith("//"):
#                         continue
#                     if line.strip() == "":
#                         continue
#                     loc += 1
#         results.append(
#             (framework, benchmark, f"{latency:.1f}K ({speedup})", ii, f"{dsp} ({dsp_ratio})", f"{freq:.0f}", loc)
#         )

# headers = ["Framework", "Benchmark", "Latency (ms)", "II", "DSP", "PnR Freq. (MHz)", "Opt. HLS"]
# table = tabulate(results, headers=headers)
# print(table)
