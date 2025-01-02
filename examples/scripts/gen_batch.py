import sys
import os

kernel = sys.argv[1]
prj_path = sys.argv[2]
tasks = ['csim', 'syn', 'toCosim', 'cosim', 'pnr', 'all']
for task in tasks:
  batch_template = f'''#!/bin/bash
#SBATCH -J st_{kernel}
#SBATCH -o {task}_%x.%J.out # <JOB_NAME>.<JOB_ID>.out
#SBATCH -p batch
#SBATCH -p batch -c4 --mem=16GB

work_dir=$(pwd)
scratch_dir=/scratch/$USER/${{SLURM_JOB_NAME}}.${{SLURM_JOB_ID}}

mkdir $scratch_dir && cd $scratch_dir
rsync -av --exclude='*.log' --exclude='*.out' $work_dir/* $scratch_dir

ml load xilinx/vivado/2023.2
export PRJ_PATH=$PWD

vitis_hls hls.tcl {kernel} {task} -l {task}.log

rsync -av $scratch_dir/* $work_dir

'''
  fileName = f'{prj_path}/{task}.batch'
  # save to vitis.sh and make it executable
  with open(fileName, "w") as f:
    f.write(batch_template)
  os.system(f"chmod +x {fileName}")
