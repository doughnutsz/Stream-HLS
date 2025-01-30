from data import model_configs
import os
import sys
import argparse 

parser = argparse.ArgumentParser(description='Run a single experiment')
parser.add_argument('-b', '--benchmark', type=str, help='Benchmark to run')
parser.add_argument('-k', '--kernel', type=str, help='Kernel to run')

args = parser.parse_args()

permOpt=1
paralOpt=1
combOpt=1
tilelimit=10
timelimit=1
dsps=2560
dbg_point=14
benchmark=args.benchmark
kernel = args.kernel
outDir=f'designs'

cmd = f'python streamhls_pipeline.py \
  --prjsdir={outDir} \
  --bench={benchmark} \
  --model={kernel} \
  --permOpt={permOpt} \
  --paralOpt={paralOpt} \
  --combOpt={combOpt} \
  --dsps={dsps} \
  --tilelimit={tilelimit} \
  --timelimit={timelimit} \
  --debug={dbg_point}'
os.system(cmd)
print(f'Finished {kernel}...')

  