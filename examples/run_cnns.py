from data import model_configs
import os
import sys

permOpt=1
paralOpt=0
combOpt=0
tilelimit=8
timelimit=20
dsps=512
bufferize=0
conv=1
dbg_point=14
benchmark="cnns"
# outDir=f'experiments/{benchmark}/experiments_{dsps}_{permOpt}_{paralOpt}_{combOpt}_{tilelimit}_{timelimit}'
outDir=f'experiments/{benchmark}/opt2'
kernels = ["DepthwiseSeparableConvBlock"] #model_configs[benchmark]

for kernel in kernels:
  # print(f'Running {kernel}...')
  print(f'{kernel}')
  cmd = f'python run_streamhls.py \
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

  