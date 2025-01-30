from data import model_configs
import os
import sys

permOpt=1
paralOpt=1
combOpt=1
tilelimit=16
timelimit=20
dsps=512
bufferize=0
conv=0
dbg_point=14
benchmark="mlps"
# outDir=f'experiments/{benchmark}/experiments_{dsps}_{permOpt}_{paralOpt}_{combOpt}_{tilelimit}_{timelimit}_batch32_{dbg_point}'
outDir=f'experiments/{benchmark}/opt5'
# outDir=f'experiments/{benchmark}/test'
kernels = ["ResMLP", "Autoencoder"] #model_configs[benchmark]

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

  