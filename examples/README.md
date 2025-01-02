# Running Examples

This project focuses on converting PyTorch models into MLIR (Multi-Level Intermediate Representation) and running StreamHLS to evaluate different optimization strategies.

## Directory Structure

- **pymodels**: Contains PyTorch models used as test benchmarks.
- **gen_mlir_designs.py**: Converts PyTorch models into MLIR and initialize the project structure.
- **data.py**: Configuration and initialization data for the PyTorch models.
- **run_baseline.sh**: Baseline experiments script.
- **run_opt1.sh**: First optimization script without scheduling.
- **run_opt2.sh**: Second optimization script with scheduling.

## How to Run the Examples

## Step 1: Convert PyTorch Models to MLIR

To convert the PyTorch models into MLIR, use the `gen_mlir_designs.py` script. You can specify the benchmark, model, model folder, and output path.

**Example Command:**

```bash
python gen_mlir_designs.py --benchmark polybench --model gemm --model-folder pymodels --output-path ./models
```

## Adding a New Test Case

1. Add your PyTorch model to the `pymodels` directory.
2. Update `data.py` with the new model configuration.

**Example configuration in `data.py`:**

```python
model_configs = {
  "new_benchmark": {
    "new_model": {
      "config": {},
      "input": (
        randTensor(32, 32, dtype=dtype),
        randTensor(32, 32, dtype=dtype)
      )
    }
  }
}
```

## Step 2: Run StreamHLS

After generating the models in MLIR format, run StreamHLS using one of the three provided bash scripts:

- **run_baseline.sh**: For baseline experiments.
- **run_opt1.sh**: For the first optimization without scheduling.
- **run_opt2.sh**: For the second optimization with scheduling.

**Example Command:**

```bash
./run_baseline.sh -d models/polybench/ -m gemm
```
