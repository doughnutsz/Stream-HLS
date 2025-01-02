#map = affine_map<(d0, d1) -> (d0, d1)>
#set = affine_set<(d0, d1) : (d0 + d1 * 49 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 4 - 255 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 8 - 127 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set7 = affine_set<(d0, d1) : (d0 + d1 * 2 - 63 == 0)>
#set8 = affine_set<(d0, d1) : (d0 + d1 * 4 - 127 == 0)>
#set9 = affine_set<(d0, d1) : (d0 + d1 * 8 - 255 == 0)>
#set10 = affine_set<(d0, d1) : (d0 + d1 * 28 == 0)>
#set11 = affine_set<(d0, d1) : (d0 + d1 * 28 - 783 == 0)>
module attributes {torch.debug_module_name = "Autoencoder"} {
  func.func @node0(%arg0: tensor<1x49x!dataflow.stream<f32, 512>>, %arg1: memref<32x784xf32>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 1 {
          affine.for %arg5 = 0 to 49 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map} : (tensor<1x49x!dataflow.stream<f32, 512>>) -> f32
            affine.store %0, %arg1[%arg2 + %arg4, %arg5 + %arg3 * 49] : memref<32x784xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<1x49x!dataflow.stream<f32, 512>>, %arg1: memref<784xf32>, %arg2: tensor<1x49x!dataflow.stream<f32, 512>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 49 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x49x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 49] : memref<784xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.negf %2 : f32
            %4 = math.exp %3 : f32
            %5 = arith.addf %4, %arg3 : f32
            %6 = arith.divf %arg3, %5 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %6 {map = #map} : tensor<1x49x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg1: tensor<4x49x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x49x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x784xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 64 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 49 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map} : (tensor<1x4x!dataflow.stream<f32, 2048>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x256xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x256xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg9, %arg8] {map = #map} : (tensor<4x49x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 49] : memref<256x784xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 49] : memref<256x784xf32>
                affine.if #set2(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 49] : memref<32x784xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 49] : memref<32x784xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 49] : memref<32x784xf32>
                affine.if #set3(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 49] : memref<32x784xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x49x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<784x256xf32>, %arg1: tensor<4x49x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 64 {
        affine.for %arg4 = 0 to 49 {
          affine.for %arg5 = 0 to 4 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 49, %arg5 + %arg3 * 4] : memref<784x256xf32>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map} : tensor<4x49x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg1: memref<256xf32>, %arg2: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x4x!dataflow.stream<f32, 2048>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 4] : memref<256xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map} : tensor<1x4x!dataflow.stream<f32, 2048>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: tensor<1x8x!dataflow.stream<f32, 512>>, %arg1: tensor<8x4x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x4x!dataflow.stream<f32, 2048>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set2(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg9, %arg8] {map = #map} : (tensor<8x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<128x256xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<128x256xf32>
                affine.if #set4(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x256xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x256xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x256xf32>
                affine.if #set5(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x256xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x4x!dataflow.stream<f32, 2048>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x128xf32>, %arg1: tensor<8x4x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 64 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 4, %arg5 + %arg3 * 8] : memref<256x128xf32>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map} : tensor<8x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: tensor<1x8x!dataflow.stream<f32, 512>>, %arg1: memref<128xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 8] : memref<128xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map} : tensor<1x8x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node8(%arg0: tensor<2x8x!dataflow.stream<f32, 512>>, %arg1: tensor<1x2x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 2 {
                affine.if #set4(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map} : (tensor<1x2x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<32x64xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 2] : memref<32x64xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg9, %arg8] {map = #map} : (tensor<2x8x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32>
                affine.if #set6(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                affine.if #set7(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x8x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: memref<128x64xf32>, %arg1: tensor<2x8x!dataflow.stream<f32, 512>>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 2 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 8, %arg5 + %arg3 * 2] : memref<128x64xf32>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map} : tensor<2x8x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node10(%arg0: tensor<1x2x!dataflow.stream<f32, 1024>>, %arg1: memref<64xf32>, %arg2: tensor<1x2x!dataflow.stream<f32, 1024>>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 1 {
          affine.for %arg6 = 0 to 2 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map} : (tensor<1x2x!dataflow.stream<f32, 1024>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 2] : memref<64xf32>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map} : tensor<1x2x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node11(%arg0: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg1: tensor<4x2x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x2x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set6(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map} : (tensor<1x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x128xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x128xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg9, %arg8] {map = #map} : (tensor<4x2x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 2] : memref<128x64xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 2] : memref<128x64xf32>
                affine.if #set2(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<32x64xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<32x64xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<32x64xf32>
                affine.if #set8(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 2] : memref<32x64xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x2x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node12(%arg0: memref<64x128xf32>, %arg1: tensor<4x2x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 2 {
          affine.for %arg5 = 0 to 4 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 2, %arg5 + %arg3 * 4] : memref<64x128xf32>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map} : tensor<4x2x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node13(%arg0: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg1: memref<128xf32>, %arg2: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x4x!dataflow.stream<f32, 1024>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 4] : memref<128xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map} : tensor<1x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node14(%arg0: tensor<8x4x!dataflow.stream<f32, 1024>>, %arg1: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg2: tensor<1x4x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set2(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg9, %arg8] {map = #map} : (tensor<8x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<256x128xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<256x128xf32>
                affine.if #set4(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x128xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x128xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x128xf32>
                affine.if #set9(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x128xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x4x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node15(%arg0: memref<128x256xf32>, %arg1: tensor<8x4x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 4, %arg5 + %arg3 * 8] : memref<128x256xf32>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map} : tensor<8x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node16(%arg0: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg1: memref<256xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 1024>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 8] : memref<256xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map} : tensor<1x8x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node17(%arg0: memref<32x784xf32>, %arg1: tensor<28x8x!dataflow.stream<f32, 896>>, %arg2: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<784x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 28 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 28 {
                %0 = affine.load %arg0[%arg4 + %arg7, %arg9 + %arg6 * 28] : memref<32x784xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg9, %arg8] {map = #map} : (tensor<28x8x!dataflow.stream<f32, 896>>) -> f32
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 28, %arg8 + %arg5 * 8] : memref<784x256xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 28, %arg8 + %arg5 * 8] : memref<784x256xf32>
                affine.if #set10(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32>
                affine.if #set11(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x8x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node18(%arg0: memref<256x784xf32>, %arg1: tensor<28x8x!dataflow.stream<f32, 896>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 28 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 28 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 8, %arg5 + %arg3 * 28] : memref<256x784xf32>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map} : tensor<28x8x!dataflow.stream<f32, 896>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<32x784xf32>, %arg1: memref<256xf32>, %arg2: memref<256x784xf32>, %arg3: memref<128xf32>, %arg4: memref<128x256xf32>, %arg5: memref<64xf32>, %arg6: memref<64x128xf32>, %arg7: memref<128xf32>, %arg8: memref<128x64xf32>, %arg9: memref<256xf32>, %arg10: memref<256x128xf32>, %arg11: memref<784xf32>, %arg12: memref<784x256xf32>, %arg13: memref<32x784xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0 = dataflow.aofs : tensor<1x49x!dataflow.stream<f32, 512>>
    %1 = dataflow.aofs : tensor<1x49x!dataflow.stream<f32, 512>>
    %2 = dataflow.aofs : tensor<4x49x!dataflow.stream<f32, 1024>>
    %3 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 2048>>
    %4 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 2048>>
    %5 = dataflow.aofs : tensor<8x4x!dataflow.stream<f32, 1024>>
    %6 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %7 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %8 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 512>>
    %9 = dataflow.aofs : tensor<1x2x!dataflow.stream<f32, 1024>>
    %10 = dataflow.aofs : tensor<1x2x!dataflow.stream<f32, 1024>>
    %11 = dataflow.aofs : tensor<4x2x!dataflow.stream<f32, 1024>>
    %12 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 1024>>
    %13 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 1024>>
    %14 = dataflow.aofs : tensor<8x4x!dataflow.stream<f32, 1024>>
    %15 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 1024>>
    %16 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 1024>>
    %17 = dataflow.aofs : tensor<28x8x!dataflow.stream<f32, 896>>
    call @node18(%arg2, %17) : (memref<256x784xf32>, tensor<28x8x!dataflow.stream<f32, 896>>) -> ()
    call @node17(%arg0, %17, %16, %cst) : (memref<32x784xf32>, tensor<28x8x!dataflow.stream<f32, 896>>, tensor<1x8x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node16(%16, %arg1, %15, %cst) : (tensor<1x8x!dataflow.stream<f32, 1024>>, memref<256xf32>, tensor<1x8x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node15(%arg4, %14) : (memref<128x256xf32>, tensor<8x4x!dataflow.stream<f32, 1024>>) -> ()
    call @node14(%14, %15, %13, %cst) : (tensor<8x4x!dataflow.stream<f32, 1024>>, tensor<1x8x!dataflow.stream<f32, 1024>>, tensor<1x4x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node13(%13, %arg3, %12, %cst) : (tensor<1x4x!dataflow.stream<f32, 1024>>, memref<128xf32>, tensor<1x4x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node12(%arg6, %11) : (memref<64x128xf32>, tensor<4x2x!dataflow.stream<f32, 1024>>) -> ()
    call @node11(%12, %11, %10, %cst) : (tensor<1x4x!dataflow.stream<f32, 1024>>, tensor<4x2x!dataflow.stream<f32, 1024>>, tensor<1x2x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node10(%10, %arg5, %9) : (tensor<1x2x!dataflow.stream<f32, 1024>>, memref<64xf32>, tensor<1x2x!dataflow.stream<f32, 1024>>) -> ()
    call @node9(%arg8, %8) : (memref<128x64xf32>, tensor<2x8x!dataflow.stream<f32, 512>>) -> ()
    call @node8(%8, %9, %7, %cst) : (tensor<2x8x!dataflow.stream<f32, 512>>, tensor<1x2x!dataflow.stream<f32, 1024>>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node7(%7, %arg7, %6, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, memref<128xf32>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node6(%arg10, %5) : (memref<256x128xf32>, tensor<8x4x!dataflow.stream<f32, 1024>>) -> ()
    call @node5(%6, %5, %4, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, tensor<8x4x!dataflow.stream<f32, 1024>>, tensor<1x4x!dataflow.stream<f32, 2048>>, f32) -> ()
    call @node4(%4, %arg9, %3, %cst) : (tensor<1x4x!dataflow.stream<f32, 2048>>, memref<256xf32>, tensor<1x4x!dataflow.stream<f32, 2048>>, f32) -> ()
    call @node3(%arg12, %2) : (memref<784x256xf32>, tensor<4x49x!dataflow.stream<f32, 1024>>) -> ()
    call @node2(%3, %2, %1, %cst) : (tensor<1x4x!dataflow.stream<f32, 2048>>, tensor<4x49x!dataflow.stream<f32, 1024>>, tensor<1x49x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node1(%1, %arg11, %0, %cst_0) : (tensor<1x49x!dataflow.stream<f32, 512>>, memref<784xf32>, tensor<1x49x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node0(%0, %arg13) : (tensor<1x49x!dataflow.stream<f32, 512>>, memref<32x784xf32>) -> ()
    return
  }
}

