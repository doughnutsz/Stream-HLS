#!/bin/bash
  srun -c32 --mem=32GB hida-opt test_gesummv.mlir     -debug-only=scalehls     -scalehls-dse-pipeline="top-func=test_gesummv target-spec=../config.json"     | hida-translate -scalehls-emit-hlscpp > gesummv.cpp
  