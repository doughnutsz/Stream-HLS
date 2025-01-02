import pandas as pd
import numpy as np
# this file combines from all benchmarks into one csv file
benchmarks = ["mlps", "cnns", "transformers", "polybench", "synthetic"]

# combine all benchmarks into one csv file
combined_data = pd.DataFrame()
for benchmark in benchmarks:
  data = pd.read_csv(f"data/{benchmark}.csv")
  data["Benchmark"] = benchmark
  # put in the first column
  data = data[["Benchmark"] + [col for col in data.columns if col != "Benchmark"]]
  combined_data = pd.concat([combined_data, data], ignore_index=True)

combined_data.to_csv("tmp/combined_data.csv", index=False)

