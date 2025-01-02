import sys
import os

kernel = sys.argv[1]
fileName = sys.argv[2]

bash_file = f'''
#!/bin/bash
# options: -t <task> | csim, syn, cosim, pnr, all

# take argument from command line, default is csim
task=csim

# if an argument is provided, then set task to that argument
if [ $# -eq 1 ]; then
  task=$1
fi

# make sure the task is one of the five options
if [ $task != "csim" ] && [ $task != "syn" ] && [ $task != "cosim" ] && [ $task != "pnr" ] && [ $task != "all" ] && [ $task != "toCosim" ]; then
  echo "Invalid task: $task"
  echo "Usage: ./run.sh [csim|syn|cosim|pnr|all]"
  exit
fi

# command
ml load xilinx/vivado/2023.2
# set env variable
export PRJ_PATH=$PWD
# run base kernel
# srun -c8 --mem=16GB vitis_hls hls_base.tcl {kernel} $task -l ${{task}}_base.log
srun -J {kernel} -c4 --mem=16GB vitis_hls hls.tcl {kernel} $task -l $task.log
'''
# save to vitis.sh and make it executable
with open(fileName, "w") as f:
  f.write(bash_file)
os.system(f"chmod +x {fileName}")
