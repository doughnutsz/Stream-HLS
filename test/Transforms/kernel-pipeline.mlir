// RUN: streamhls-opt %s -streamhls-kernel-pipeline="top-func=forward graph-file=/tmp/streamhls report-file=/tmp/streamhls optimize-schedule=true parallelize-nodes=true combined-optimization=true board-dsps=2560 tiling-limit=10 time-limit-minutes=1 bufferize-func-args=0 optimize-conv-reuse=0 debug-point=14" | FileCheck %s

#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
module attributes {torch.debug_module_name = "gemm"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<200x240xf32>, %arg1: tensor<240x220xf32>, %arg2: tensor<200x220xf32>) -> tensor<200x220xf32> {
    %cst = arith.constant dense<1.000000e-01> : tensor<f64>
    %cst_0 = arith.constant dense<5.000000e-01> : tensor<f64>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<200x220xf32>
    %1 = linalg.fill ins(%cst_1 : f32) outs(%0 : tensor<200x220xf32>) -> tensor<200x220xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<200x240xf32>, tensor<240x220xf32>) outs(%1 : tensor<200x220xf32>) -> tensor<200x220xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %cst_0 : tensor<200x220xf32>, tensor<f64>) outs(%0 : tensor<200x220xf32>) {
    ^bb0(%in: f32, %in_2: f64, %out: f32):
      %6 = arith.truncf %in_2 : f64 to f32
      %7 = arith.mulf %in, %6 : f32
      linalg.yield %7 : f32
    } -> tensor<200x220xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg2, %cst : tensor<200x220xf32>, tensor<f64>) outs(%0 : tensor<200x220xf32>) {
    ^bb0(%in: f32, %in_2: f64, %out: f32):
      %6 = arith.truncf %in_2 : f64 to f32
      %7 = arith.mulf %in, %6 : f32
      linalg.yield %7 : f32
    } -> tensor<200x220xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%3, %4 : tensor<200x220xf32>, tensor<200x220xf32>) outs(%0 : tensor<200x220xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %6 = arith.addf %in, %in_2 : f32
      linalg.yield %6 : f32
    } -> tensor<200x220xf32>
    return %5 : tensor<200x220xf32>
  }
}


// CHECK-DAG: #map[[MAPVAR:[0-9]*]] = affine_map<(d0, d1) -> (d0 mod 5, d1 mod 4, d0 floordiv 5, d1 floordiv 4)>
// CHECK-DAG: #map[[MAPVAR1:[0-9]*]] = affine_map<(d0, d1) -> (d0, d1)>
// CHECK-DAG: #map[[MAPVAR2:[0-9]*]] = affine_map<(d0, d1) -> (d0 mod 5, d1 mod 24, d0 floordiv 5, d1 floordiv 24)>
// CHECK-DAG: #map[[MAPVAR3:[0-9]*]] = affine_map<(d0, d1) -> (d0 mod 24, d1 mod 4, d0 floordiv 24, d1 floordiv 4)>
// CHECK-DAG: #set[[SETVAR:[0-9]*]] = affine_set<(d0, d1) : (d0 + d1 * 24 == 0)>
// CHECK-DAG: #set[[SETVAR1:[0-9]*]] = affine_set<(d0, d1) : (d0 + d1 * 24 - 239 == 0)>
// CHECK: module attributes {torch.debug_module_name = "gemm"} {
// CHECK:   func.func @node0(%arg0: tensor<5x4x!dataflow.stream<f32, 2200>>, %arg1: memref<200x220xf32, #map[[MAPVAR]]>) {
// CHECK:     affine.for %arg2 = 0 to 40 {
// CHECK:       affine.for %arg3 = 0 to 55 {
// CHECK:         affine.for %arg4 = 0 to 5 {
// CHECK:           affine.for %arg5 = 0 to 4 {
// CHECK:             %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map[[MAPVAR1]]} : (tensor<5x4x!dataflow.stream<f32, 2200>>) -> f32
// CHECK:             affine.store %0, %arg1[%arg4 + %arg2 * 5, %arg5 + %arg3 * 4] : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:           }
// CHECK:         }
// CHECK:       } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
// CHECK:     }
// CHECK:     return
// CHECK:   }
// CHECK:   func.func @node1(%arg0: tensor<5x4x!dataflow.stream<f32, 2200>>, %arg1: memref<200x220xf32, #map[[MAPVAR]]>, %arg2: tensor<5x4x!dataflow.stream<f32, 2200>>, %arg3: f64, %arg4: f32) {
// CHECK:     affine.for %arg5 = 0 to 40 {
// CHECK:       affine.for %arg6 = 0 to 55 {
// CHECK:         affine.for %arg7 = 0 to 5 {
// CHECK:           affine.for %arg8 = 0 to 4 {
// CHECK:             %0 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map[[MAPVAR1]]} : (tensor<5x4x!dataflow.stream<f32, 2200>>) -> f32
// CHECK:             %1 = affine.load %arg1[%arg7 + %arg5 * 5, %arg8 + %arg6 * 4] : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:             %2 = arith.truncf %arg3 : f64 to f32
// CHECK:             %3 = arith.mulf %1, %2 : f32
// CHECK:             %4 = arith.mulf %0, %arg4 : f32
// CHECK:             %5 = arith.addf %4, %3 : f32
// CHECK:             dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map[[MAPVAR1]]} : tensor<5x4x!dataflow.stream<f32, 2200>>, f32
// CHECK:           }
// CHECK:         }
// CHECK:       } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
// CHECK:     }
// CHECK:     return
// CHECK:   }
// CHECK:   func.func @node2(%arg0: memref<200x240xf32, #map[[MAPVAR2]]>, %arg1: memref<240x220xf32, #map[[MAPVAR3]]>, %arg2: tensor<5x4x!dataflow.stream<f32, 2200>>, %arg3: f32) {
// CHECK:     %alloc = memref.alloc() {alignment = 64 : i64} : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:     affine.for %arg4 = 0 to 40 {
// CHECK:       affine.for %arg5 = 0 to 10 {
// CHECK:         affine.for %arg6 = 0 to 55 {
// CHECK:           affine.for %arg7 = 0 to 5 {
// CHECK:             affine.for %arg8 = 0 to 24 {
// CHECK:               affine.for %arg9 = 0 to 4 {
// CHECK:                 %0 = affine.load %arg0[%arg7 + %arg4 * 5, %arg8 + %arg5 * 24] : memref<200x240xf32, #map[[MAPVAR2]]>
// CHECK:                 %1 = affine.load %arg1[%arg8 + %arg5 * 24, %arg9 + %arg6 * 4] : memref<240x220xf32, #map[[MAPVAR3]]>
// CHECK:                 affine.if #set[[SETVAR]](%arg8, %arg5) {
// CHECK:                   affine.store %arg3, %alloc[%arg7 + %arg4 * 5, %arg9 + %arg6 * 4] : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:                 }
// CHECK:                 %2 = affine.load %alloc[%arg7 + %arg4 * 5, %arg9 + %arg6 * 4] : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:                 %3 = arith.mulf %0, %1 : f32
// CHECK:                 %4 = arith.addf %2, %3 : f32
// CHECK:                 affine.store %4, %alloc[%arg7 + %arg4 * 5, %arg9 + %arg6 * 4] : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:                 affine.if #set[[SETVAR1]](%arg8, %arg5) {
// CHECK:                   %5 = affine.load %alloc[%arg7 + %arg4 * 5, %arg9 + %arg6 * 4] : memref<200x220xf32, #map[[MAPVAR]]>
// CHECK:                   dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map[[MAPVAR1]]} : tensor<5x4x!dataflow.stream<f32, 2200>>, f32
// CHECK:                 }
// CHECK:               }
// CHECK:             }
// CHECK:           }
// CHECK:         } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
// CHECK:       }
// CHECK:     }
// CHECK:     return
// CHECK:   }
// CHECK:   func.func @forward(%arg0: memref<200x240xf32, #map[[MAPVAR2]]>, %arg1: memref<240x220xf32, #map[[MAPVAR3]]>, %arg2: memref<200x220xf32, #map[[MAPVAR]]>, %arg3: memref<200x220xf32, #map[[MAPVAR]]>) {
// CHECK:     %cst = arith.constant 5.000000e-01 : f32
// CHECK:     %cst_0 = arith.constant 1.000000e-01 : f64
// CHECK:     %cst_1 = arith.constant 0.000000e+00 : f32
// CHECK:     %0 = dataflow.aofs : tensor<5x4x!dataflow.stream<f32, 2200>>
// CHECK:     %1 = dataflow.aofs : tensor<5x4x!dataflow.stream<f32, 2200>>
// CHECK:     call @node2(%arg0, %arg1, %1, %cst_1) : (memref<200x240xf32, #map[[MAPVAR2]]>, memref<240x220xf32, #map[[MAPVAR3]]>, tensor<5x4x!dataflow.stream<f32, 2200>>, f32) -> ()
// CHECK:     call @node1(%1, %arg2, %0, %cst_0, %cst) : (tensor<5x4x!dataflow.stream<f32, 2200>>, memref<200x220xf32, #map[[MAPVAR]]>, tensor<5x4x!dataflow.stream<f32, 2200>>, f64, f32) -> ()
// CHECK:     call @node0(%0, %arg3) : (tensor<5x4x!dataflow.stream<f32, 2200>>, memref<200x220xf32, #map[[MAPVAR]]>) -> ()
// CHECK:     return
// CHECK:   }
// CHECK: }


