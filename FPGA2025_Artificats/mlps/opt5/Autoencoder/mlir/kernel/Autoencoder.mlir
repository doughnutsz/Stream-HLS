#map = affine_map<(d0, d1) -> (0, d1 mod 28, d0, d1 floordiv 28)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0 mod 28, d0 floordiv 28)>
#map3 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 28, d0 floordiv 8, d1 floordiv 28)>
#map4 = affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>
#map5 = affine_map<(d0, d1) -> (d0 mod 28, d1 mod 8, d0 floordiv 28, d1 floordiv 8)>
#map6 = affine_map<(d0) -> (d0 mod 8, d0 floordiv 8)>
#map7 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 8, d0 floordiv 4, d1 floordiv 8)>
#map8 = affine_map<(d0, d1) -> (0, d1 mod 4, d0, d1 floordiv 4)>
#map9 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 4, d0 floordiv 8, d1 floordiv 4)>
#map10 = affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>
#map11 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>
#map12 = affine_map<(d0, d1) -> (0, d1 mod 2, d0, d1 floordiv 2)>
#map13 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 2, d0 floordiv 4, d1 floordiv 2)>
#map14 = affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>
#map15 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 2, d0 floordiv 8, d1 floordiv 2)>
#map16 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>
#map17 = affine_map<(d0, d1) -> (0, d1 mod 49, d0, d1 floordiv 49)>
#map18 = affine_map<(d0, d1) -> (d0 mod 49, d1 mod 4, d0 floordiv 49, d1 floordiv 4)>
#map19 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 49, d0 floordiv 4, d1 floordiv 49)>
#set = affine_set<(d0, d1) : (d0 + d1 * 28 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 8 - 255 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 4 - 127 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set7 = affine_set<(d0, d1) : (d0 + d1 * 2 - 63 == 0)>
#set8 = affine_set<(d0, d1) : (d0 + d1 * 8 - 127 == 0)>
#set9 = affine_set<(d0, d1) : (d0 + d1 * 4 - 255 == 0)>
#set10 = affine_set<(d0, d1) : (d0 + d1 * 49 == 0)>
#set11 = affine_set<(d0, d1) : (d0 + d1 * 49 - 783 == 0)>
module attributes {torch.debug_module_name = "Autoencoder"} {
  func.func @node0(%arg0: tensor<1x28x!dataflow.stream<f32, 896>>, %arg1: memref<32x784xf32, #map>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 28 {
        affine.for %arg4 = 0 to 1 {
          affine.for %arg5 = 0 to 28 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<1x28x!dataflow.stream<f32, 896>>) -> f32
            affine.store %0, %arg1[%arg2 + %arg4, %arg5 + %arg3 * 28] : memref<32x784xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<1x28x!dataflow.stream<f32, 896>>, %arg1: memref<784xf32, #map2>, %arg2: tensor<1x28x!dataflow.stream<f32, 896>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 28 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<1x28x!dataflow.stream<f32, 896>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 28] : memref<784xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.negf %2 : f32
            %4 = math.exp %3 : f32
            %5 = arith.addf %4, %arg3 : f32
            %6 = arith.divf %arg3, %5 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %6 {map = #map1} : tensor<1x28x!dataflow.stream<f32, 896>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg1: memref<256x784xf32>, %arg2: tensor<1x28x!dataflow.stream<f32, 896>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x784xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32, #map3>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32, #map4>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 28 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 28 {
                affine.if #set(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x8x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32, #map4>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32, #map4>
                affine.if #set1(%arg4, %arg7) {
                  %5 = affine.load %arg1[%arg8 + %arg5 * 8, %arg9 + %arg6 * 28] : memref<256x784xf32>
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 28] : memref<256x784xf32, #map3>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 28] : memref<256x784xf32, #map3>
                affine.if #set2(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 28] : memref<32x784xf32, #map>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 28] : memref<32x784xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 28] : memref<32x784xf32, #map>
                affine.if #set3(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 28] : memref<32x784xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x28x!dataflow.stream<f32, 896>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<784x256xf32, #map5>, %arg1: memref<256x784xf32>) {
    affine.for %arg2 = 0 to 28 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 28 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 28, %arg5 + %arg3 * 8] : memref<784x256xf32, #map5>
            affine.store %0, %arg1[%arg5 + %arg3 * 8, %arg4 + %arg2 * 28] : memref<256x784xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg1: memref<256xf32, #map6>, %arg2: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<1x8x!dataflow.stream<f32, 1024>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 8] : memref<256xf32, #map6>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map1} : tensor<1x8x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg1: tensor<4x8x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32, #map4>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32, #map7>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #map8>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set2(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x128xf32, #map8>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x128xf32, #map8>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map1} : (tensor<4x8x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 4, %arg9 + %arg6 * 8] : memref<128x256xf32, #map7>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 4, %arg9 + %arg6 * 8] : memref<128x256xf32, #map7>
                affine.if #set4(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32, #map4>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32, #map4>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32, #map4>
                affine.if #set5(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32, #map4>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x8x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x128xf32, #map9>, %arg1: tensor<4x8x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 4] : memref<256x128xf32, #map9>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<4x8x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg1: memref<128xf32, #map10>, %arg2: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<1x4x!dataflow.stream<f32, 1024>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 4] : memref<128xf32, #map10>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map1} : tensor<1x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node8(%arg0: tensor<1x2x!dataflow.stream<f32, 1024>>, %arg1: tensor<2x4x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #map8>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map11>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #map12>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set4(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x2x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<32x64xf32, #map12>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<32x64xf32, #map12>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map1} : (tensor<2x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map11>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map11>
                affine.if #set6(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x128xf32, #map8>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x128xf32, #map8>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x128xf32, #map8>
                affine.if #set7(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x128xf32, #map8>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x4x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: memref<128x64xf32, #map13>, %arg1: tensor<2x4x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 2 {
          affine.for %arg5 = 0 to 4 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 4, %arg4 + %arg2 * 2] : memref<128x64xf32, #map13>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<2x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node10(%arg0: tensor<1x2x!dataflow.stream<f32, 1024>>, %arg1: memref<64xf32, #map14>, %arg2: tensor<1x2x!dataflow.stream<f32, 1024>>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 1 {
          affine.for %arg6 = 0 to 2 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<1x2x!dataflow.stream<f32, 1024>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 2] : memref<64xf32, #map14>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map1} : tensor<1x2x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node11(%arg0: tensor<8x2x!dataflow.stream<f32, 512>>, %arg1: tensor<1x8x!dataflow.stream<f32, 512>>, %arg2: tensor<1x2x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32, #map12>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32, #map15>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #map4>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 2 {
                affine.if #set6(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg8] {map = #map1} : (tensor<1x8x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32, #map4>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32, #map4>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg9] {map = #map1} : (tensor<8x2x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 2] : memref<128x64xf32, #map15>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 2] : memref<128x64xf32, #map15>
                affine.if #set2(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<32x64xf32, #map12>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<32x64xf32, #map12>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<32x64xf32, #map12>
                affine.if #set8(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<32x64xf32, #map12>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x2x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node12(%arg0: memref<64x128xf32, #map16>, %arg1: tensor<8x2x!dataflow.stream<f32, 512>>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 2 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 2, %arg4 + %arg2 * 8] : memref<64x128xf32, #map16>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<8x2x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node13(%arg0: tensor<1x8x!dataflow.stream<f32, 512>>, %arg1: memref<128xf32, #map6>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<1x8x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 8] : memref<128xf32, #map6>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map1} : tensor<1x8x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node14(%arg0: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg1: tensor<4x8x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32, #map4>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32, #map7>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32, #map8>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set2(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x4x!dataflow.stream<f32, 2048>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x256xf32, #map8>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x256xf32, #map8>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map1} : (tensor<4x8x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 4, %arg9 + %arg6 * 8] : memref<256x128xf32, #map7>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 4, %arg9 + %arg6 * 8] : memref<256x128xf32, #map7>
                affine.if #set4(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32, #map4>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32, #map4>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32, #map4>
                affine.if #set9(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32, #map4>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x8x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node15(%arg0: memref<128x256xf32, #map9>, %arg1: tensor<4x8x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 64 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 4] : memref<128x256xf32, #map9>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<4x8x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node16(%arg0: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg1: memref<256xf32, #map10>, %arg2: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<1x4x!dataflow.stream<f32, 2048>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 4] : memref<256xf32, #map10>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map1} : tensor<1x4x!dataflow.stream<f32, 2048>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node17(%arg0: tensor<49x4x!dataflow.stream<f32, 1024>>, %arg1: memref<32x784xf32, #map17>, %arg2: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32, #map8>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<784x256xf32, #map18>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 64 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 49 {
              affine.for %arg9 = 0 to 4 {
                %0 = affine.load %arg1[%arg4 + %arg7, %arg8 + %arg5 * 49] : memref<32x784xf32, #map17>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg9] {map = #map1} : (tensor<49x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 49, %arg9 + %arg6 * 4] : memref<784x256xf32, #map18>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 49, %arg9 + %arg6 * 4] : memref<784x256xf32, #map18>
                affine.if #set10(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x256xf32, #map8>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x256xf32, #map8>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x256xf32, #map8>
                affine.if #set11(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x256xf32, #map8>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x4x!dataflow.stream<f32, 2048>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node18(%arg0: memref<256x784xf32, #map19>, %arg1: tensor<49x4x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 64 {
        affine.for %arg4 = 0 to 49 {
          affine.for %arg5 = 0 to 4 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 4, %arg4 + %arg2 * 49] : memref<256x784xf32, #map19>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<49x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<32x784xf32, #map17>, %arg1: memref<256xf32, #map10>, %arg2: memref<256x784xf32, #map19>, %arg3: memref<128xf32, #map6>, %arg4: memref<128x256xf32, #map9>, %arg5: memref<64xf32, #map14>, %arg6: memref<64x128xf32, #map16>, %arg7: memref<128xf32, #map10>, %arg8: memref<128x64xf32, #map13>, %arg9: memref<256xf32, #map6>, %arg10: memref<256x128xf32, #map9>, %arg11: memref<784xf32, #map2>, %arg12: memref<784x256xf32, #map5>, %arg13: memref<32x784xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0 = dataflow.aofs : tensor<1x28x!dataflow.stream<f32, 896>>
    %1 = dataflow.aofs : tensor<1x28x!dataflow.stream<f32, 896>>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32>
    %2 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 1024>>
    %3 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 1024>>
    %4 = dataflow.aofs : tensor<4x8x!dataflow.stream<f32, 1024>>
    %5 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 1024>>
    %6 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 1024>>
    %7 = dataflow.aofs : tensor<2x4x!dataflow.stream<f32, 1024>>
    %8 = dataflow.aofs : tensor<1x2x!dataflow.stream<f32, 1024>>
    %9 = dataflow.aofs : tensor<1x2x!dataflow.stream<f32, 1024>>
    %10 = dataflow.aofs : tensor<8x2x!dataflow.stream<f32, 512>>
    %11 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %12 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %13 = dataflow.aofs : tensor<4x8x!dataflow.stream<f32, 1024>>
    %14 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 2048>>
    %15 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 2048>>
    %16 = dataflow.aofs : tensor<49x4x!dataflow.stream<f32, 1024>>
    call @node18(%arg2, %16) : (memref<256x784xf32, #map19>, tensor<49x4x!dataflow.stream<f32, 1024>>) -> ()
    call @node17(%16, %arg0, %15, %cst) : (tensor<49x4x!dataflow.stream<f32, 1024>>, memref<32x784xf32, #map17>, tensor<1x4x!dataflow.stream<f32, 2048>>, f32) -> ()
    call @node16(%15, %arg1, %14, %cst) : (tensor<1x4x!dataflow.stream<f32, 2048>>, memref<256xf32, #map10>, tensor<1x4x!dataflow.stream<f32, 2048>>, f32) -> ()
    call @node15(%arg4, %13) : (memref<128x256xf32, #map9>, tensor<4x8x!dataflow.stream<f32, 1024>>) -> ()
    call @node14(%14, %13, %12, %cst) : (tensor<1x4x!dataflow.stream<f32, 2048>>, tensor<4x8x!dataflow.stream<f32, 1024>>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node13(%12, %arg3, %11, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, memref<128xf32, #map6>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node12(%arg6, %10) : (memref<64x128xf32, #map16>, tensor<8x2x!dataflow.stream<f32, 512>>) -> ()
    call @node11(%10, %11, %9, %cst) : (tensor<8x2x!dataflow.stream<f32, 512>>, tensor<1x8x!dataflow.stream<f32, 512>>, tensor<1x2x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node10(%9, %arg5, %8) : (tensor<1x2x!dataflow.stream<f32, 1024>>, memref<64xf32, #map14>, tensor<1x2x!dataflow.stream<f32, 1024>>) -> ()
    call @node9(%arg8, %7) : (memref<128x64xf32, #map13>, tensor<2x4x!dataflow.stream<f32, 1024>>) -> ()
    call @node8(%8, %7, %6, %cst) : (tensor<1x2x!dataflow.stream<f32, 1024>>, tensor<2x4x!dataflow.stream<f32, 1024>>, tensor<1x4x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node7(%6, %arg7, %5, %cst) : (tensor<1x4x!dataflow.stream<f32, 1024>>, memref<128xf32, #map10>, tensor<1x4x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node6(%arg10, %4) : (memref<256x128xf32, #map9>, tensor<4x8x!dataflow.stream<f32, 1024>>) -> ()
    call @node5(%5, %4, %3, %cst) : (tensor<1x4x!dataflow.stream<f32, 1024>>, tensor<4x8x!dataflow.stream<f32, 1024>>, tensor<1x8x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node4(%3, %arg9, %2, %cst) : (tensor<1x8x!dataflow.stream<f32, 1024>>, memref<256xf32, #map6>, tensor<1x8x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node3(%arg12, %alloc) : (memref<784x256xf32, #map5>, memref<256x784xf32>) -> ()
    call @node2(%2, %alloc, %1, %cst) : (tensor<1x8x!dataflow.stream<f32, 1024>>, memref<256x784xf32>, tensor<1x28x!dataflow.stream<f32, 896>>, f32) -> ()
    call @node1(%1, %arg11, %0, %cst_0) : (tensor<1x28x!dataflow.stream<f32, 896>>, memref<784xf32, #map2>, tensor<1x28x!dataflow.stream<f32, 896>>, f32) -> ()
    call @node0(%0, %arg13) : (tensor<1x28x!dataflow.stream<f32, 896>>, memref<32x784xf32, #map>) -> ()
    return
  }
}

