#map = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 2, d0 floordiv 10, d1 floordiv 2)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 10, d0 floordiv 10, d1 floordiv 10)>
#map3 = affine_map<(d0, d1) -> (d0 mod 10, 0, d0 floordiv 10, d1)>
#map4 = affine_map<(d0, d1) -> (0, d1 mod 10, d0, d1 floordiv 10)>
#set = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 10 - 189 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 10 - 219 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 - 199 == 0)>
module attributes {torch.debug_module_name = "k3mm"} {
  func.func @node0(%arg0: tensor<10x2x!dataflow.stream<f32, 1890>>, %arg1: memref<180x210xf32, #map>) {
    affine.for %arg2 = 0 to 18 {
      affine.for %arg3 = 0 to 105 {
        affine.for %arg4 = 0 to 10 {
          affine.for %arg5 = 0 to 2 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<10x2x!dataflow.stream<f32, 1890>>) -> f32
            affine.store %0, %arg1[%arg4 + %arg2 * 10, %arg5 + %arg3 * 2] : memref<180x210xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: memref<190x210xf32, #map>, %arg1: tensor<10x10x!dataflow.stream<f32, 342>>, %arg2: tensor<10x2x!dataflow.stream<f32, 1890>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x210xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32, #map>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map2>
    affine.for %arg4 = 0 to 18 {
      affine.for %arg5 = 0 to 105 {
        affine.for %arg6 = 0 to 19 {
          affine.for %arg7 = 0 to 10 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 10 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<10x10x!dataflow.stream<f32, 342>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 10, %arg9 + %arg6 * 10] : memref<180x190xf32, #map2>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 10, %arg9 + %arg6 * 10] : memref<180x190xf32, #map2>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %arg0[%arg9 + %arg6 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<180x210xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<180x210xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<180x210xf32, #map>
                affine.if #set2(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<180x210xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<10x2x!dataflow.stream<f32, 1890>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: memref<220x210xf32, #map>, %arg1: memref<190x220xf32, #map2>, %arg2: memref<190x210xf32, #map>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32, #map>
    affine.for %arg4 = 0 to 19 {
      affine.for %arg5 = 0 to 105 {
        affine.for %arg6 = 0 to 22 {
          affine.for %arg7 = 0 to 10 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 10 {
                %0 = affine.load %arg1[%arg7 + %arg4 * 10, %arg9 + %arg6 * 10] : memref<190x220xf32, #map2>
                %1 = affine.load %arg0[%arg9 + %arg6 * 10, %arg8 + %arg5 * 2] : memref<220x210xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                affine.if #set3(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                  affine.store %5, %arg2[%arg7 + %arg4 * 10, %arg8 + %arg5 * 2] : memref<190x210xf32, #map>
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<180x200xf32, #map3>, %arg1: memref<200x190xf32, #map4>, %arg2: tensor<10x10x!dataflow.stream<f32, 342>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map2>
    affine.for %arg4 = 0 to 18 {
      affine.for %arg5 = 0 to 19 {
        affine.for %arg6 = 0 to 200 {
          affine.for %arg7 = 0 to 10 {
            affine.for %arg8 = 0 to 10 {
              affine.for %arg9 = 0 to 1 {
                %0 = affine.load %arg0[%arg7 + %arg4 * 10, %arg6 + %arg9] : memref<180x200xf32, #map3>
                %1 = affine.load %arg1[%arg6 + %arg9, %arg8 + %arg5 * 10] : memref<200x190xf32, #map4>
                affine.if #set4(%arg6, %arg9) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 10] : memref<180x190xf32, #map2>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 10] : memref<180x190xf32, #map2>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 10] : memref<180x190xf32, #map2>
                affine.if #set5(%arg6, %arg9) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 10, %arg8 + %arg5 * 10] : memref<180x190xf32, #map2>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<10x10x!dataflow.stream<f32, 342>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<180x200xf32, #map3>, %arg1: memref<200x190xf32, #map4>, %arg2: memref<190x220xf32, #map2>, %arg3: memref<220x210xf32, #map>, %arg4: memref<180x210xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<10x2x!dataflow.stream<f32, 1890>>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32, #map>
    %1 = dataflow.aofs : tensor<10x10x!dataflow.stream<f32, 342>>
    call @node3(%arg0, %arg1, %1, %cst) : (memref<180x200xf32, #map3>, memref<200x190xf32, #map4>, tensor<10x10x!dataflow.stream<f32, 342>>, f32) -> ()
    call @node2(%arg3, %arg2, %alloc, %cst) : (memref<220x210xf32, #map>, memref<190x220xf32, #map2>, memref<190x210xf32, #map>, f32) -> ()
    call @node1(%alloc, %1, %0, %cst) : (memref<190x210xf32, #map>, tensor<10x10x!dataflow.stream<f32, 342>>, tensor<10x2x!dataflow.stream<f32, 1890>>, f32) -> ()
    call @node0(%0, %arg4) : (tensor<10x2x!dataflow.stream<f32, 1890>>, memref<180x210xf32, #map>) -> ()
    return
  }
}

