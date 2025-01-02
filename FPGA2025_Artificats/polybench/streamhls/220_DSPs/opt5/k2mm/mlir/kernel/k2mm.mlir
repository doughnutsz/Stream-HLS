#map = affine_map<(d0, d1) -> (0, d1 mod 2, d0, d1 floordiv 2)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 2, d0 floordiv 10, d1 floordiv 2)>
#map3 = affine_map<(d0, d1) -> (0, d1 mod 10, d0, d1 floordiv 10)>
#map4 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 10, d0 floordiv 2, d1 floordiv 10)>
#set = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 10 - 189 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 2 - 209 == 0)>
module attributes {torch.debug_module_name = "k2mm"} {
  func.func @node0(%arg0: tensor<1x2x!dataflow.stream<f32, 19800>>, %arg1: memref<180x220xf32, #map>) {
    affine.for %arg2 = 0 to 180 {
      affine.for %arg3 = 0 to 110 {
        affine.for %arg4 = 0 to 1 {
          affine.for %arg5 = 0 to 2 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<1x2x!dataflow.stream<f32, 19800>>) -> f32
            affine.store %0, %arg1[%arg2 + %arg4, %arg5 + %arg3 * 2] : memref<180x220xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<1x2x!dataflow.stream<f32, 19800>>, %arg1: memref<180x220xf32, #map>, %arg2: tensor<1x2x!dataflow.stream<f32, 19800>>, %arg3: f64, %arg4: f32) {
    affine.for %arg5 = 0 to 180 {
      affine.for %arg6 = 0 to 110 {
        affine.for %arg7 = 0 to 1 {
          affine.for %arg8 = 0 to 2 {
            %0 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x2x!dataflow.stream<f32, 19800>>) -> f32
            %1 = affine.load %arg1[%arg5 + %arg7, %arg8 + %arg6 * 2] : memref<180x220xf32, #map>
            %2 = arith.truncf %arg3 : f64 to f32
            %3 = arith.mulf %1, %2 : f32
            %4 = arith.mulf %0, %arg4 : f32
            %5 = arith.addf %4, %3 : f32
            dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<1x2x!dataflow.stream<f32, 19800>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: memref<190x220xf32, #map2>, %arg1: tensor<1x10x!dataflow.stream<f32, 3420>>, %arg2: tensor<1x2x!dataflow.stream<f32, 19800>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x220xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map3>
    affine.for %arg4 = 0 to 180 {
      affine.for %arg5 = 0 to 19 {
        affine.for %arg6 = 0 to 110 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 10 {
              affine.for %arg9 = 0 to 2 {
                affine.if #set(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg8] {map = #map1} : (tensor<1x10x!dataflow.stream<f32, 3420>>) -> f32
                  affine.store %5, %alloc_0[%arg4 + %arg7, %arg8 + %arg5 * 10] : memref<180x190xf32, #map3>
                }
                %0 = affine.load %alloc_0[%arg4 + %arg7, %arg8 + %arg5 * 10] : memref<180x190xf32, #map3>
                %1 = affine.load %arg0[%arg8 + %arg5 * 10, %arg9 + %arg6 * 2] : memref<190x220xf32, #map2>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<180x220xf32, #map>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<180x220xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<180x220xf32, #map>
                affine.if #set2(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<180x220xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x2x!dataflow.stream<f32, 19800>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<210x190xf32, #map4>, %arg1: memref<180x210xf32, #map>, %arg2: tensor<1x10x!dataflow.stream<f32, 3420>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map3>
    affine.for %arg4 = 0 to 180 {
      affine.for %arg5 = 0 to 105 {
        affine.for %arg6 = 0 to 19 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 10 {
                %0 = affine.load %arg1[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<180x210xf32, #map>
                %1 = affine.load %arg0[%arg8 + %arg5 * 2, %arg9 + %arg6 * 10] : memref<210x190xf32, #map4>
                affine.if #set(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                affine.if #set3(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x10x!dataflow.stream<f32, 3420>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<180x210xf32, #map>, %arg1: memref<210x190xf32, #map4>, %arg2: memref<190x220xf32, #map2>, %arg3: memref<180x220xf32, #map>, %arg4: memref<180x220xf32, #map>) {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant 1.000000e-01 : f64
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<1x2x!dataflow.stream<f32, 19800>>
    %1 = dataflow.aofs : tensor<1x2x!dataflow.stream<f32, 19800>>
    %2 = dataflow.aofs : tensor<1x10x!dataflow.stream<f32, 3420>>
    call @node3(%arg1, %arg0, %2, %cst_1) : (memref<210x190xf32, #map4>, memref<180x210xf32, #map>, tensor<1x10x!dataflow.stream<f32, 3420>>, f32) -> ()
    call @node2(%arg2, %2, %1, %cst_1) : (memref<190x220xf32, #map2>, tensor<1x10x!dataflow.stream<f32, 3420>>, tensor<1x2x!dataflow.stream<f32, 19800>>, f32) -> ()
    call @node1(%1, %arg3, %0, %cst_0, %cst) : (tensor<1x2x!dataflow.stream<f32, 19800>>, memref<180x220xf32, #map>, tensor<1x2x!dataflow.stream<f32, 19800>>, f64, f32) -> ()
    call @node0(%0, %arg4) : (tensor<1x2x!dataflow.stream<f32, 19800>>, memref<180x220xf32, #map>) -> ()
    return
  }
}

