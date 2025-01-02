#!/bin/bash

# translate to MLIR
cgeist test_bicg.c \
    -function=test_bicg \
    -S \
    -memref-fullrank \
    -raise-scf-to-affine > test_bicg.mlir

hida-opt test_bicg.mlir \
    -debug-only=scalehls \
    -scalehls-dse-pipeline="top-func=test_bicg target-spec=../config.json" \
    | hida-translate -scalehls-emit-hlscpp > paper_result/test_bicg_paper.cpp