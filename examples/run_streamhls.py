from data import model_configs
import os
import sys
import argparse 

parser = argparse.ArgumentParser(description='Run a single experiment')
parser.add_argument('-b', '--benchmark', type=str, help='Benchmark to run')
parser.add_argument('-k', '--kernel', type=str, help='Kernel to run')
parser.add_argument('-O', '--opt', type=int, default=0, help='Optimization level')
parser.add_argument('-c', '--compile_only', type=int, default=0, help='Compile only')
args = parser.parse_args()


tilelimit=10
timelimit=20
dsps=2560
# bufferize function arguments flag
bufferize=0
# minimize_on_chip_buffers function arguments flag
minimize_on_chip_buffers=0
dbg_point=14
benchmark=args.benchmark
kernel = args.kernel
compile_only = args.compile_only
opt = args.opt

if opt == 5:
  permOpt=1
  paralOpt=1
  combOpt=1
elif opt == 4:
  permOpt=1
  paralOpt=1
  combOpt=0
elif opt == 3:
  permOpt=0
  paralOpt=1
  combOpt=0
elif opt == 2:
  permOpt=1
  paralOpt=0
  combOpt=0
elif opt == 1:
  permOpt=0
  paralOpt=0  
  combOpt=0


outDir=f'designs/{benchmark}/opt{opt}/{kernel}'

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
  --bufferize={bufferize}\
  --minimize-on-chip-buffers={minimize_on_chip_buffers}\
  --debug={dbg_point}\
  --compile_only={compile_only}'
os.system(cmd)
print(f'Finished {kernel}...')

  