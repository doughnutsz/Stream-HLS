#map = affine_map<(d0, d1) -> (d0 mod 4, 0, d0 floordiv 4, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 mod 8, 0, d0 floordiv 8, d1)>
#map3 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 8, d0 floordiv 4, d1 floordiv 8)>
#set = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 8 - 239 == 0)>
module attributes {torch.debug_module_name = "gemm"} {
  func.func @node0(%arg0: tensor<4x1x!dataflow.stream<f32, 11000>>, %arg1: memref<200x220xf32, #map>) {
    affine.for %arg2 = 0 to 50 {
      affine.for %arg3 = 0 to 220 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 1 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<4x1x!dataflow.stream<f32, 11000>>) -> f32
            affine.store %0, %arg1[%arg4 + %arg2 * 4, %arg3 + %arg5] : memref<200x220xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<4x1x!dataflow.stream<f32, 11000>>, %arg1: memref<200x220xf32, #map>, %arg2: tensor<4x1x!dataflow.stream<f32, 11000>>, %arg3: f64, %arg4: f32) {
    affine.for %arg5 = 0 to 50 {
      affine.for %arg6 = 0 to 220 {
        affine.for %arg7 = 0 to 4 {
          affine.for %arg8 = 0 to 1 {
            %0 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<4x1x!dataflow.stream<f32, 11000>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 4, %arg6 + %arg8] : memref<200x220xf32, #map>
            %2 = arith.truncf %arg3 : f64 to f32
            %3 = arith.mulf %1, %2 : f32
            %4 = arith.mulf %0, %arg4 : f32
            %5 = arith.addf %4, %3 : f32
            dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x1x!dataflow.stream<f32, 11000>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: memref<240x220xf32, #map2>, %arg1: memref<200x240xf32, #map3>, %arg2: tensor<4x1x!dataflow.stream<f32, 11000>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<200x220xf32, #map>
    affine.for %arg4 = 0 to 30 {
      affine.for %arg5 = 0 to 50 {
        affine.for %arg6 = 0 to 220 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 1 {
                %0 = affine.load %arg1[%arg8 + %arg5 * 4, %arg7 + %arg4 * 8] : memref<200x240xf32, #map3>
                %1 = affine.load %arg0[%arg7 + %arg4 * 8, %arg6 + %arg9] : memref<240x220xf32, #map2>
                affine.if #set(%arg7, %arg4) {
                  affine.store %arg3, %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<200x220xf32, #map>
                }
                %2 = affine.load %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<200x220xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<200x220xf32, #map>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<200x220xf32, #map>
                  dataflow.aofs_write %arg2[%arg8, %arg9], %5 {map = #map1} : tensor<4x1x!dataflow.stream<f32, 11000>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<200x240xf32, #map3>, %arg1: memref<240x220xf32, #map2>, %arg2: memref<200x220xf32, #map>, %arg3: memref<200x220xf32, #map>) {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant 1.000000e-01 : f64
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<4x1x!dataflow.stream<f32, 11000>>
    %1 = dataflow.aofs : tensor<4x1x!dataflow.stream<f32, 11000>>
    call @node2(%arg1, %arg0, %1, %cst_1) : (memref<240x220xf32, #map2>, memref<200x240xf32, #map3>, tensor<4x1x!dataflow.stream<f32, 11000>>, f32) -> ()
    call @node1(%1, %arg2, %0, %cst_0, %cst) : (tensor<4x1x!dataflow.stream<f32, 11000>>, memref<200x220xf32, #map>, tensor<4x1x!dataflow.stream<f32, 11000>>, f64, f32) -> ()
    call @node0(%0, %arg3) : (tensor<4x1x!dataflow.stream<f32, 11000>>, memref<200x220xf32, #map>) -> ()
    return
  }
}

