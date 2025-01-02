#!/bin/bash

# translate to MLIR
cgeist test_mvt.c \
    -function=test_mvt \
    -S \
    -memref-fullrank \
    -raise-scf-to-affine > test_mvt.mlir

hida-opt test_mvt.mlir \
    -debug-only=scalehls \
    -scalehls-dse-pipeline="top-func=test_mvt target-spec=../config.json" \
    | hida-translate -scalehls-emit-hlscpp > paper_result/test_mvt_paper.cpp