#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_3mm.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_3mm target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > 3mm.cpp
  