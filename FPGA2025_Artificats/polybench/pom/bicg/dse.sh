#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_bicg.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_bicg target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > bicg.cpp
  