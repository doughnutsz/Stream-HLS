#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_gemm.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_gemm target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > gemm.cpp
  