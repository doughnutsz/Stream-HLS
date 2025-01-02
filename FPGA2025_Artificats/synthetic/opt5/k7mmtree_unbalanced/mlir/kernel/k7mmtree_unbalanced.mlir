#map = affine_map<(d0, d1) -> (d0 mod 4, 0, d0 floordiv 4, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 mod 8, 0, d0 floordiv 8, d1)>
#map3 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 8, d0 floordiv 4, d1 floordiv 8)>
#map4 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 4, d0 floordiv 8, d1 floordiv 4)>
#map5 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 4, d0 floordiv 4, d1 floordiv 4)>
#map6 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>
#map7 = affine_map<(d0, d1) -> (d0 mod 2, 0, d0 floordiv 2, d1)>
#map8 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>
#set = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 8 - 127 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 4 - 63 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 2 - 31 == 0)>
#set7 = affine_set<(d0, d1) : (d0 + d1 * 4 - 127 == 0)>
module attributes {torch.debug_module_name = "k7mmtree"} {
  func.func @node0(%arg0: tensor<4x1x!dataflow.stream<f32, 256>>, %arg1: memref<64x16xf32, #map>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 1 {
          affine.for %arg5 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg4] {map = #map1} : (tensor<4x1x!dataflow.stream<f32, 256>>) -> f32
            affine.store %0, %arg1[%arg5 + %arg3 * 4, %arg2 + %arg4] : memref<64x16xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<4x8x!dataflow.stream<f32, 256>>, %arg1: tensor<8x1x!dataflow.stream<f32, 256>>, %arg2: tensor<4x1x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x16xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x16xf32, #map2>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 1 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg5, %arg8) {
                  %5 = dataflow.aofs_read %arg0[%arg9, %arg7] {map = #map1} : (tensor<4x8x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_1[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                }
                %0 = affine.load %alloc_1[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                affine.if #set1(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg8] {map = #map1} : (tensor<8x1x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 8, %arg5 + %arg8] : memref<128x16xf32, #map2>
                }
                %1 = affine.load %alloc_0[%arg7 + %arg4 * 8, %arg5 + %arg8] : memref<128x16xf32, #map2>
                affine.if #set2(%arg7, %arg4) {
                  affine.store %arg3, %alloc[%arg9 + %arg6 * 4, %arg5 + %arg8] : memref<64x16xf32, #map>
                }
                %2 = affine.load %alloc[%arg9 + %arg6 * 4, %arg5 + %arg8] : memref<64x16xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg9 + %arg6 * 4, %arg5 + %arg8] : memref<64x16xf32, #map>
                affine.if #set3(%arg7, %arg4) {
                  %5 = affine.load %alloc[%arg9 + %arg6 * 4, %arg5 + %arg8] : memref<64x16xf32, #map>
                  dataflow.aofs_write %arg2[%arg9, %arg8], %5 {map = #map1} : tensor<4x1x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: tensor<8x4x!dataflow.stream<f32, 256>>, %arg1: tensor<4x1x!dataflow.stream<f32, 256>>, %arg2: tensor<8x1x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x16xf32, #map2>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x16xf32, #map>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32, #map4>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 1 {
                affine.if #set(%arg6, %arg9) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<8x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 8, %arg8 + %arg5 * 4] : memref<128x64xf32, #map4>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 8, %arg8 + %arg5 * 4] : memref<128x64xf32, #map4>
                affine.if #set2(%arg7, %arg4) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map1} : (tensor<4x1x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<64x16xf32, #map>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<64x16xf32, #map>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 8, %arg6 + %arg9] : memref<128x16xf32, #map2>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 8, %arg6 + %arg9] : memref<128x16xf32, #map2>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 8, %arg6 + %arg9] : memref<128x16xf32, #map2>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 8, %arg6 + %arg9] : memref<128x16xf32, #map2>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<8x1x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: tensor<4x8x!dataflow.stream<f32, 256>>, %arg1: tensor<4x4x!dataflow.stream<f32, 256>>, %arg2: tensor<4x8x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map5>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set2(%arg7, %arg4) {
                  %5 = dataflow.aofs_read %arg1[%arg9, %arg8] {map = #map1} : (tensor<4x4x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map5>
                }
                %0 = affine.load %alloc_1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map5>
                affine.if #set1(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg7] {map = #map1} : (tensor<4x8x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                }
                %2 = affine.load %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                  dataflow.aofs_write %arg2[%arg9, %arg7], %5 {map = #map1} : tensor<4x8x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node4(%arg0: memref<64x32xf32, #map6>, %arg1: memref<32x16xf32, #map7>, %arg2: tensor<4x1x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x16xf32, #map>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 1 {
                %0 = affine.load %arg0[%arg8 + %arg5 * 4, %arg7 + %arg4 * 2] : memref<64x32xf32, #map6>
                %1 = affine.load %arg1[%arg7 + %arg4 * 2, %arg6 + %arg9] : memref<32x16xf32, #map7>
                affine.if #set5(%arg7, %arg4) {
                  affine.store %arg3, %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<64x16xf32, #map>
                }
                %2 = affine.load %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<64x16xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<64x16xf32, #map>
                affine.if #set6(%arg7, %arg4) {
                  %5 = affine.load %alloc[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<64x16xf32, #map>
                  dataflow.aofs_write %arg2[%arg8, %arg9], %5 {map = #map1} : tensor<4x1x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node5(%arg0: memref<128x128xf32, #map4>, %arg1: memref<128x64xf32, #map5>, %arg2: tensor<8x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32, #map4>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                %0 = affine.load %arg0[%arg7 + %arg4 * 8, %arg8 + %arg5 * 4] : memref<128x128xf32, #map4>
                %1 = affine.load %arg1[%arg8 + %arg5 * 4, %arg9 + %arg6 * 4] : memref<128x64xf32, #map5>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 8, %arg9 + %arg6 * 4] : memref<128x64xf32, #map4>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 8, %arg9 + %arg6 * 4] : memref<128x64xf32, #map4>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 8, %arg9 + %arg6 * 4] : memref<128x64xf32, #map4>
                affine.if #set7(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 8, %arg9 + %arg6 * 4] : memref<128x64xf32, #map4>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<8x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<64x64xf32, #map5>, %arg1: memref<64x128xf32, #map3>, %arg2: tensor<4x8x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 4 {
                %0 = affine.load %arg0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 4] : memref<64x64xf32, #map5>
                %1 = affine.load %arg1[%arg8 + %arg5 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                }
                %2 = affine.load %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 8] : memref<64x128xf32, #map3>
                  dataflow.aofs_write %arg2[%arg9, %arg7], %5 {map = #map1} : tensor<4x8x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node7(%arg0: memref<64x32xf32, #map6>, %arg1: memref<32x64xf32, #map8>, %arg2: tensor<4x4x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32, #map5>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 4 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 4 {
                %0 = affine.load %arg0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 2] : memref<64x32xf32, #map6>
                %1 = affine.load %arg1[%arg8 + %arg5 * 2, %arg7 + %arg4 * 4] : memref<32x64xf32, #map8>
                affine.if #set5(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 4] : memref<64x64xf32, #map5>
                }
                %2 = affine.load %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 4] : memref<64x64xf32, #map5>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 4] : memref<64x64xf32, #map5>
                affine.if #set6(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg9 + %arg6 * 4, %arg7 + %arg4 * 4] : memref<64x64xf32, #map5>
                  dataflow.aofs_write %arg2[%arg9, %arg7], %5 {map = #map1} : tensor<4x4x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<64x32xf32, #map6>, %arg1: memref<32x64xf32, #map8>, %arg2: memref<64x64xf32, #map5>, %arg3: memref<64x128xf32, #map3>, %arg4: memref<128x128xf32, #map4>, %arg5: memref<128x64xf32, #map5>, %arg6: memref<64x32xf32, #map6>, %arg7: memref<32x16xf32, #map7>, %arg8: memref<64x16xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<4x1x!dataflow.stream<f32, 256>>
    %1 = dataflow.aofs : tensor<8x1x!dataflow.stream<f32, 256>>
    %2 = dataflow.aofs : tensor<4x8x!dataflow.stream<f32, 256>>
    %3 = dataflow.aofs : tensor<4x1x!dataflow.stream<f32, 256>>
    %4 = dataflow.aofs : tensor<8x4x!dataflow.stream<f32, 256>>
    %5 = dataflow.aofs : tensor<4x8x!dataflow.stream<f32, 256>>
    %6 = dataflow.aofs : tensor<4x4x!dataflow.stream<f32, 256>>
    call @node7(%arg0, %arg1, %6, %cst) : (memref<64x32xf32, #map6>, memref<32x64xf32, #map8>, tensor<4x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node6(%arg2, %arg3, %5, %cst) : (memref<64x64xf32, #map5>, memref<64x128xf32, #map3>, tensor<4x8x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node5(%arg4, %arg5, %4, %cst) : (memref<128x128xf32, #map4>, memref<128x64xf32, #map5>, tensor<8x4x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node4(%arg6, %arg7, %3, %cst) : (memref<64x32xf32, #map6>, memref<32x16xf32, #map7>, tensor<4x1x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node3(%5, %6, %2, %cst) : (tensor<4x8x!dataflow.stream<f32, 256>>, tensor<4x4x!dataflow.stream<f32, 256>>, tensor<4x8x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node2(%4, %3, %1, %cst) : (tensor<8x4x!dataflow.stream<f32, 256>>, tensor<4x1x!dataflow.stream<f32, 256>>, tensor<8x1x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node1(%2, %1, %0, %cst) : (tensor<4x8x!dataflow.stream<f32, 256>>, tensor<8x1x!dataflow.stream<f32, 256>>, tensor<4x1x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node0(%0, %arg8) : (tensor<4x1x!dataflow.stream<f32, 256>>, memref<64x16xf32, #map>) -> ()
    return
  }
}

