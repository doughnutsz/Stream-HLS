dsps=128
tilingLimit=10
debugPoint=14
streamhls-opt atax.mlir \
  -streamhls-kernel-pipeline="top-func=forward \
    optimize-schedule=true\
    parallelize-nodes=true\
    combined-optimization=true\
    board-dsps=$dsps \
    tiling-limit=$tilingLimit \
    debug-point=$debugPoint" \
  > atax_opt.mlir