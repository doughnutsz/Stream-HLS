#map = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#set = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 4 - 63 == 0)>
module attributes {torch.debug_module_name = "k7mmseq"} {
  func.func @node0(%arg0: tensor<4x4x!dataflow.stream<f32, 256>>, %arg1: memref<64x64xf32, #map>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
            affine.store %0, %arg1[%arg4 + %arg2 * 4, %arg5 + %arg3 * 4] : memref<64x64xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<4x4x!dataflow.stream<f32, 256>>, %arg1: memref<64x64xf32, #map>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: tensor<4x4x!dataflow.stream<f32, 256>>, %arg1: memref<64x64xf32, #map>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: tensor<4x4x!dataflow.stream<f32, 256>>, %arg1: memref<64x64xf32, #map>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node4(%arg0: memref<64x64xf32, #map>, %arg1: tensor<4x4x!dataflow.stream<f32, 256>>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node5(%arg0: tensor<4x4x!dataflow.stream<f32, 256>>, %arg1: memref<64x64xf32, #map>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<64x64xf32, #map>, %arg1: tensor<4x4x!dataflow.stream<f32, 256>>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                }
                %0 = affine.load %alloc_0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node7(%arg0: memref<64x64xf32, #map>, %arg1: memref<64x64xf32, #map>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                %0 = affine.load %arg0[%arg7 + %arg4 * 4, %arg9 + %arg6 * 4] : memref<64x64xf32, #map>
                %1 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                affine.if #set1(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<64x64xf32, #map>, %arg1: memref<64x64xf32, #map>, %arg2: memref<64x64xf32, #map>, %arg3: memref<64x64xf32, #map>, %arg4: memref<64x64xf32, #map>, %arg5: memref<64x64xf32, #map>, %arg6: memref<64x64xf32, #map>, %arg7: memref<64x64xf32, #map>, %arg8: memref<64x64xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    %1 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    %2 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    %3 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    %4 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    %5 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    %6 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    call @node7(%arg0, %arg1, %6, %cst) : (memref<64x64xf32, #map>, memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node6(%arg2, %6, %5, %cst) : (memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node5(%5, %arg3, %4, %cst) : (tensor<4x4x!dataflow.stream<f32, 256>>, memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node4(%arg4, %4, %3, %cst) : (memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node3(%3, %arg5, %2, %cst) : (tensor<4x4x!dataflow.stream<f32, 256>>, memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node2(%2, %arg6, %1, %cst) : (tensor<4x4x!dataflow.stream<f32, 256>>, memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node1(%1, %arg7, %0, %cst) : (tensor<4x4x!dataflow.stream<f32, 256>>, memref<64x64xf32, #map>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node0(%0, %arg8) : (tensor<4x4x!dataflow.stream<f32, 256>>, memref<64x64xf32, #map>) -> ()
    return
  }
}

