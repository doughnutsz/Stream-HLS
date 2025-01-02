from data import model_configs
import os
import sys

permOpt_list=[1]
paralOpt_list=[1]
combOpt_list=[0]
tilelimit=16
timelimit=1
dsps_list=[2560] #, 1280, 2560]
bufferize=0
conv=0
dbg_point=14
benchmark="polybench"
kernels = model_configs[benchmark]
for dsps in dsps_list:
  for combOpt in combOpt_list:
    for permOpt in permOpt_list:
      for paralOpt in paralOpt_list:
        if combOpt == 1 and permOpt + paralOpt != 2:
          continue
        outDir=f'experiments/{benchmark}/opt4'
        # outDir=f'experiments/{benchmark}/opt0'
        for kernel in kernels:
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

      