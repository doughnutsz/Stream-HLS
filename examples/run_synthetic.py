from data import model_configs
import os
import sys

permOpt=0
paralOpt=0
combOpt_list=[0]
tilelimit=16
timelimit=10
dsps=512
bufferize=0
conv=0
dbg_point=5
benchmark="synthetic"
kernels = ["k7mmseq_balanced", "k7mmseq_unbalanced"] #model_configs[benchmark]

for kernel in kernels:
  for combOpt in combOpt_list:
    # outDir=f'experiments/{benchmark}/experiments_{dsps}_{permOpt}_{paralOpt}_{combOpt}_{tilelimit}_{timelimit}'
    outDir=f'experiments/{benchmark}/opt0'

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

  