from data import model_configs
import os
import sys

permOpt=1
paralOpt=1
combOpt_list=[1]
tilelimit=16
timelimit=10
dsps=512
bufferize=0
conv=0
dbg_point=5
benchmark="synthetic"
kernels = model_configs[benchmark]

for kernel in kernels:
  for combOpt in combOpt_list:
    # outDir=f'experiments/{benchmark}/experiments_{dsps}_{permOpt}_{paralOpt}_{combOpt}_{tilelimit}_{timelimit}'
    outDir=f'experiments/{benchmark}/opt5'

    print(f'Running {kernel}...')
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
      --bufferize={bufferize} \
      --conv={conv} \
      --debug={dbg_point}'
    os.system(cmd)
    print(f'Finished {kernel}...')

  