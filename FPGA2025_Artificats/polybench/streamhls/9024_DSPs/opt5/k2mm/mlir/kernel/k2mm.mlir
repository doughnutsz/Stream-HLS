#map = affine_map<(d0, d1) -> (d0 mod 9, d1 mod 11, d0 floordiv 9, d1 floordiv 11)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 11, d0 floordiv 10, d1 floordiv 11)>
#map3 = affine_map<(d0, d1) -> (d0 mod 9, d1 mod 10, d0 floordiv 9, d1 floordiv 10)>
#map4 = affine_map<(d0, d1) -> (d0 mod 7, d1 mod 10, d0 floordiv 7, d1 floordiv 10)>
#map5 = affine_map<(d0, d1) -> (d0 mod 9, d1 mod 7, d0 floordiv 9, d1 floordiv 7)>
#set = affine_set<(d0, d1) : (d0 + d1 * 11 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 10 - 189 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 7 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 7 - 209 == 0)>
module attributes {torch.debug_module_name = "k2mm"} {
  func.func @node0(%arg0: tensor<9x11x!dataflow.stream<f32, 400>>, %arg1: memref<180x220xf32, #map>) {
    affine.for %arg2 = 0 to 20 {
      affine.for %arg3 = 0 to 20 {
        affine.for %arg4 = 0 to 9 {
          affine.for %arg5 = 0 to 11 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<9x11x!dataflow.stream<f32, 400>>) -> f32
            affine.store %0, %arg1[%arg4 + %arg2 * 9, %arg5 + %arg3 * 11] : memref<180x220xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<9x11x!dataflow.stream<f32, 400>>, %arg1: memref<180x220xf32, #map>, %arg2: tensor<9x11x!dataflow.stream<f32, 400>>, %arg3: f64, %arg4: f32) {
    affine.for %arg5 = 0 to 20 {
      affine.for %arg6 = 0 to 20 {
        affine.for %arg7 = 0 to 9 {
          affine.for %arg8 = 0 to 11 {
            %0 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<9x11x!dataflow.stream<f32, 400>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 9, %arg8 + %arg6 * 11] : memref<180x220xf32, #map>
            %2 = arith.truncf %arg3 : f64 to f32
            %3 = arith.mulf %1, %2 : f32
            %4 = arith.mulf %0, %arg4 : f32
            %5 = arith.addf %4, %3 : f32
            dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<9x11x!dataflow.stream<f32, 400>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<9x10x!dataflow.stream<f32, 380>>, %arg1: memref<190x220xf32, #map2>, %arg2: tensor<9x11x!dataflow.stream<f32, 400>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x220xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map3>
    affine.for %arg4 = 0 to 20 {
      affine.for %arg5 = 0 to 19 {
        affine.for %arg6 = 0 to 20 {
          affine.for %arg7 = 0 to 9 {
            affine.for %arg8 = 0 to 10 {
              affine.for %arg9 = 0 to 11 {
                affine.if #set(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<9x10x!dataflow.stream<f32, 380>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 9, %arg8 + %arg5 * 10] : memref<180x190xf32, #map3>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 9, %arg8 + %arg5 * 10] : memref<180x190xf32, #map3>
                %1 = affine.load %arg1[%arg8 + %arg5 * 10, %arg9 + %arg6 * 11] : memref<190x220xf32, #map2>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 11] : memref<180x220xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 11] : memref<180x220xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 11] : memref<180x220xf32, #map>
                affine.if #set2(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 11] : memref<180x220xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<9x11x!dataflow.stream<f32, 400>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<210x190xf32, #map4>, %arg1: memref<180x210xf32, #map5>, %arg2: tensor<9x10x!dataflow.stream<f32, 380>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map3>
    affine.for %arg4 = 0 to 20 {
      affine.for %arg5 = 0 to 30 {
        affine.for %arg6 = 0 to 19 {
          affine.for %arg7 = 0 to 9 {
            affine.for %arg8 = 0 to 7 {
              affine.for %arg9 = 0 to 10 {
                %0 = affine.load %arg1[%arg7 + %arg4 * 9, %arg8 + %arg5 * 7] : memref<180x210xf32, #map5>
                %1 = affine.load %arg0[%arg8 + %arg5 * 7, %arg9 + %arg6 * 10] : memref<210x190xf32, #map4>
                affine.if #set3(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 9, %arg9 + %arg6 * 10] : memref<180x190xf32, #map3>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<9x10x!dataflow.stream<f32, 380>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<180x210xf32, #map5>, %arg1: memref<210x190xf32, #map4>, %arg2: memref<190x220xf32, #map2>, %arg3: memref<180x220xf32, #map>, %arg4: memref<180x220xf32, #map>) {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant 1.000000e-01 : f64
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<9x11x!dataflow.stream<f32, 400>>
    %1 = dataflow.aofs : tensor<9x11x!dataflow.stream<f32, 400>>
    %2 = dataflow.aofs : tensor<9x10x!dataflow.stream<f32, 380>>
    call @node3(%arg1, %arg0, %2, %cst_1) : (memref<210x190xf32, #map4>, memref<180x210xf32, #map5>, tensor<9x10x!dataflow.stream<f32, 380>>, f32) -> ()
    call @node2(%2, %arg2, %1, %cst_1) : (tensor<9x10x!dataflow.stream<f32, 380>>, memref<190x220xf32, #map2>, tensor<9x11x!dataflow.stream<f32, 400>>, f32) -> ()
    call @node1(%1, %arg3, %0, %cst_0, %cst) : (tensor<9x11x!dataflow.stream<f32, 400>>, memref<180x220xf32, #map>, tensor<9x11x!dataflow.stream<f32, 400>>, f64, f32) -> ()
    call @node0(%0, %arg4) : (tensor<9x11x!dataflow.stream<f32, 400>>, memref<180x220xf32, #map>) -> ()
    return
  }
}

