#!/bin/bash

# translate to MLIR
cgeist test_2mm.c \
    -function=test_2mm \
    -S \
    -memref-fullrank \
    -raise-scf-to-affine > test_2mm.mlir

hida-opt test_2mm.mlir \
    -debug-only=scalehls \
    -scalehls-dse-pipeline="top-func=test_2mm target-spec=../config.json" \
    | hida-translate -scalehls-emit-hlscpp > paper_result/test_2mm_paper.cpp