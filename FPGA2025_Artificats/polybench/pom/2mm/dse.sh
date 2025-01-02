#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_2mm.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_2mm target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > 2mm.cpp
  