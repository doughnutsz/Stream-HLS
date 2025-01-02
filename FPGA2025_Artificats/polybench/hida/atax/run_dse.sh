#!/bin/bash

# translate to MLIR
cgeist test_atax.c \
    -function=test_atax \
    -S \
    -memref-fullrank \
    -raise-scf-to-affine > test_atax.mlir

hida-opt test_atax.mlir \
    -debug-only=scalehls \
    -scalehls-dse-pipeline="top-func=test_atax target-spec=../config.json" \
    | hida-translate -scalehls-emit-hlscpp > paper_result/test_atax_paper.cpp