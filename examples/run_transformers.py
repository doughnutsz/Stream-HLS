from data import model_configs
import os
import sys

permOpt_list=[0]
paralOpt_list=[0]
combOpt_list=[0]
tilelimit=1
timelimit=20
dsps=512
bufferize=0
conv=0
dbg_point=5
benchmark="transformers"
kernels = ["FeedForward", "MultiHeadSelfAttention"] # model_configs[benchmark]
for combOpt in combOpt_list:
  for permOpt in permOpt_list:
    for paralOpt in paralOpt_list:
      for kernel in kernels:
        if combOpt == 1 and permOpt + paralOpt != 2:
          continue
        outDir=f'experiments/{benchmark}/experiments_{dsps}_{permOpt}_{paralOpt}_{combOpt}_{tilelimit}_{timelimit}'
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

