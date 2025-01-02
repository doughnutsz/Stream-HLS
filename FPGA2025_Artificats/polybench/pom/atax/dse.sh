#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_atax.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_atax target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > atax.cpp
  