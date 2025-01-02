#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_mvt.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_mvt target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > mvt.cpp
  