#!/bin/bash

# translate to MLIR
cgeist test_gemm.c \
    -function=test_gemm \
    -S \
    -memref-fullrank \
    -raise-scf-to-affine > test_gemm.mlir

hida-opt test_gemm.mlir \
    -debug-only=scalehls \
    -scalehls-dse-pipeline="top-func=test_gemm target-spec=../config.json" \
    | hida-translate -scalehls-emit-hlscpp > paper_result/test_gemm_paper.cpp