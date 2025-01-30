# Running Examples

This project focuses on converting PyTorch models into MLIR (Multi-Level Intermediate Representation) and running Stream-HLS to evaluate different optimization strategies. If you run into problems or bugs, please open an issue.

# 1. Directory Files and Folders

- **[pymodels](./pymodels/)**: Contains PyTorch models used as test benchmarks.
- **[gen_mlir_designs.py](gen_mlir_designs.py)**: Converts PyTorch models into MLIR and initializes the project structure.
- **[data.py](data.py)**: Configuration and initialization data for the PyTorch models.
- **[streamhls_pipeline.py](streamhls_pipeline.py)**: Script to convert PyTorch models into MLIR (using gen_mlir_designs.py), call Stream-HLS kernel and host pipelines, and compile the code for csim (software simulation).
- **[run_streamhls.py](run_streamhls.py)**: Runs Stream-HLS on an application from a test benchmark.


# 2. How to run current PyTorch models (in Pymodels)

Running an example involves two steps which are pretty much automated using scripts above. We start with the non-automated way, and then show the simple script afterwards.

## A. Manual Flow (more details)  

### Step 1: Convert PyTorch Models to MLIR

This is done using the [gen_mlir_designs script](gen_mlir_designs.py).

**Example Command:**

```bash
python gen_mlir_designs.py --benchmark polybench --model gemm --model-folder pymodels --output-path ./designs
```

This command should create a ./designs directory and a create an empty project for Stream-HLS (./designs/gemm)

The new project (./designs/gemm) structure is as follows:

```bash
.
├── hls               # HLS project related files
│   ├── data          # model golden data extracted from the PyTorch model
│   │   ├── input_0.bin
│   │   ├── input_1.bin
│   │   ├── input_2.bin
│   │   └── output_0.bin
│   └── src           # this is where the HLS C++ files will be generated
└── mlir              # MLIR related files
    ├── graphs        # dataflow graph of the application
    ├── host          # mlir for the host code
    ├── input         # input mlir generated from Torch-MLIR
    │   └── gemm.mlir # input mlir generated from Torch-MLIR
    ├── intermediates # performance and MINLP models
    └── kernel        # mlir for the kernel code
```

### Step 2: Run Stream-HLS Host and Kernel Pipelines
Before running these commands, make sure Stream-HLS executables are added to the PATH variable. You can source the env.sh script as follows:
```bash
source env.sh
```
#### Step 2.1: Stream-HLS Kernel Pipeline:

```bash
# streamhls-opt to generate the optimized dataflow design as an mlir file under gemm/mlir/kernel/gemm.mlir
streamhls-opt ./designs/gemm/mlir/input/gemm.mlir \
  -streamhls-kernel-pipeline="top-func=forward \
  graph-file=./designs/gemm/mlir/graphs/graph \
  report-file=./designs/gemm/mlir/intermediates/gemm \
  optimize-schedule=true \
  parallelize-nodes=true \
  combined-optimization=true \
  board-dsps=2560 \
  tiling-limit=10 \
  time-limit-minutes=1 \
  bufferize-func-args=0 \
  optimize-conv-reuse=0 \
  debug-point=14" \
  > ./designs/gemm/mlir/kernel/gemm.mlir

# Expected output:
Permutation DesignSpaceSize: 24
Parallelization DesignSpaceSize: 59719680
Total DesignSpaceSize: 1433272320
Combined solver: Combined Latency: 21999
Total DSPs: 2560

# Project tree now:
.
├── hls
│   ├── data
│   │   ├── input_0.bin
│   │   ├── input_1.bin
│   │   ├── input_2.bin
│   │   └── output_0.bin
│   └── src
└── mlir
    ├── graphs
    │   ├── graph.dot          # new
    │   └── graph_merged.dot   # new
    ├── host
    ├── input
    │   └── gemm.mlir          
    ├── intermediates
    │   ├── gemm_combined.mod  # new
    │   ├── gemm_combined.py   # new
    │   └── gemm_parallel.dot  # new
    └── kernel
        └── gemm.mlir          # new

# streamhls-translate to translate the kernel.mlir to HLS C++ code
streamhls-translate ./designs/gemm/mlir/kernel/gemm.mlir \
  -emit-vivado-hls \
  -o ./designs/gemm/hls/src/gemm.cpp

# Project tree now:
.
├── hls
│   ├── data
│   │   ├── input_0.bin
│   │   ├── input_1.bin
│   │   ├── input_2.bin
│   │   └── output_0.bin
│   └── src
│       └── gemm.cpp    # new
└── mlir
    ├── graphs
    │   ├── graph.dot
    │   └── graph_merged.dot
    ├── host
    ├── input
    │   └── gemm.mlir
    ├── intermediates
    │   ├── gemm_combined.mod
    │   ├── gemm_combined.py
    │   └── gemm_parallel.dot
    └── kernel
        └── gemm.mlir

```

#### Step 2.2: Stream-HLS Host Pipeline:

```bash
# streamhls-opt to generate the host code as an mlir file under gemm/mlir/host/gemm.mlir
streamhls-opt ./designs/gemm/mlir/input/gemm.mlir \
  -streamhls-host-pipeline \
  > ./designs/gemm/mlir/host/gemm.mlir

# Project tree now:
.
├── hls
│   ├── data
│   │   ├── input_0.bin
│   │   ├── input_1.bin
│   │   ├── input_2.bin
│   │   └── output_0.bin
│   └── src
│       └── gemm.cpp
└── mlir
    ├── graphs
    │   ├── graph.dot
    │   └── graph_merged.dot
    ├── host
    │   └── gemm.mlir    # new
    ├── input
    │   └── gemm.mlir
    ├── intermediates
    │   ├── gemm_combined.mod
    │   ├── gemm_combined.py
    │   └── gemm_parallel.dot
    └── kernel
        └── gemm.mlir

streamhls-translate ./designs/gemm/mlir/host/gemm.mlir \
  -emit-vivado-hls \
  -vitis-hls-weights-dir="./designs/gemm/hls/data" \
  -vitis-hls-is-host=true  \
  -o ./designs/gemm/hls/src/gemm_tb.cpp

# Project tree now:
.
├── hls
│   ├── data
│   │   ├── input_0.bin
│   │   ├── input_1.bin
│   │   ├── input_2.bin
│   │   └── output_0.bin
│   └── src
│       ├── gemm.cpp
│       └── gemm_tb.cpp   # new (host/testbench code)
└── mlir
    ├── graphs
    │   ├── graph.dot
    │   └── graph_merged.dot
    ├── host
    │   └── gemm.mlir
    ├── input
    │   └── gemm.mlir
    ├── intermediates
    │   ├── gemm_combined.mod
    │   ├── gemm_combined.py
    │   └── gemm_parallel.dot
    └── kernel
        └── gemm.mlir

```

### Optional: You can compile the code for functional verification (csim) as follows:
```bash
export PRJ_PATH=./designs/gemm/hls
# make sure to source Xilixn tools and Vitis HLS scripts 
g++ ./designs/gemm/hls/src/gemm_tb.cpp ./designs/gemm/hls/src/gemm.cpp -lm -I${XILINX_HLS}/include -o ./designs/gemm/hls/gemm.bin 
# run the host code
./designs/gemm/hls/gemm.bin 

# expected output if no errors found:
PRJ_PATH: ./designs/gemm/hls

# otherwise, an "Error!" assertion will be raised
```

## B. Automated Flow (less details)
The previous two steps are further automated for testing purposes, but can also be used for convenience as follows:
```bash
# Performs Step 1, Step 2, and compiles the code for verification
python run_streamhls.py -b polybench -k gemm
```

# 3. Adding and running a new PyTorch model

### Step 1: Create add a PyTorch model
```bash
mkdir ./pymodels/test
```

We create new python script, name it MLP.py, and put it in ./pymodels/test/

```python
import torch
import torch.nn as nn

class MLP(nn.Module):
  def __init__(self):
    super(MLP, self).__init__()
    self.fc1 = nn.Linear(784, 256)
    self.fc2 = nn.Linear(256, 10)

  def forward(self, x):
    x = x.view(-1, 784)
    x = self.fc1(x)
    x = torch.relu(x)
    x = self.fc2(x)
    return x

```

**Note:** Torch-MLIR may fail in lowering some PyTorch model since it is still a work-in-progress and is continuously updates. If Torch-MLIR fails in generating the MLIR code, try read the reason of failure (some can be solved by simplifying the code) and open an issue under Torch-MLIR's github repo.

### Step 2: Add the model configuration in [data.py](./data.py)

```python
model_configs = {
  "test" : {           # folder name
    "MLP" : {          # file name
      "class": "MLP",  # class name
      "config" : {},
      "input" : ( # sampel input batch 16
        randTensor(16, 784, dtype=dtype),
      )
    }
  },...
```

### Step 3: Run Torch-MLIR and Stream-HLS
You can follow the same steps as in the previous section or use the automated flow:
```bash
python run_streamhls.py -b test -k MLP
```