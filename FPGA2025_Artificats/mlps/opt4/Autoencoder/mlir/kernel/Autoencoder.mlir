#map = affine_map<(d0, d1) -> (d0, d1)>
#set = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 16 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 16 - 255 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 8 - 127 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 4 - 63 == 0)>
#set7 = affine_set<(d0, d1) : (d0 + d1 * 8 - 255 == 0)>
#set8 = affine_set<(d0, d1) : (d0 + d1 * 16 - 783 == 0)>
module attributes {torch.debug_module_name = "Autoencoder"} {
  func.func @node0(%arg0: tensor<1x8x!dataflow.stream<f32, 3136>>, %arg1: memref<32x784xf32>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 98 {
        affine.for %arg4 = 0 to 1 {
          affine.for %arg5 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 3136>>) -> f32
            affine.store %0, %arg1[%arg2 + %arg4, %arg5 + %arg3 * 8] : memref<32x784xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<1x8x!dataflow.stream<f32, 3136>>, %arg1: memref<784xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 3136>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 98 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 3136>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 8] : memref<784xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.negf %2 : f32
            %4 = math.exp %3 : f32
            %5 = arith.addf %4, %arg3 : f32
            %6 = arith.divf %arg3, %5 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %6 {map = #map} : tensor<1x8x!dataflow.stream<f32, 3136>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<1x16x!dataflow.stream<f32, 512>>, %arg1: memref<256x784xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 3136>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x784xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 98 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map} : (tensor<1x16x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x256xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x256xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = affine.load %arg1[%arg8 + %arg5 * 16, %arg9 + %arg6 * 8] : memref<256x784xf32>
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 8] : memref<256x784xf32>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 8] : memref<256x784xf32>
                affine.if #set2(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x784xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x784xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x784xf32>
                affine.if #set3(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x784xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map} : tensor<1x8x!dataflow.stream<f32, 3136>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<784x256xf32>, %arg1: memref<256x784xf32>) {
    affine.for %arg2 = 0 to 98 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 16 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 8, %arg5 + %arg3 * 16] : memref<784x256xf32>
            affine.store %0, %arg1[%arg5 + %arg3 * 16, %arg4 + %arg2 * 8] : memref<256x784xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: tensor<1x16x!dataflow.stream<f32, 512>>, %arg1: memref<256xf32>, %arg2: tensor<1x16x!dataflow.stream<f32, 512>>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 16 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map} : (tensor<1x16x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 16] : memref<256xf32>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map} : tensor<1x16x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: tensor<1x8x!dataflow.stream<f32, 512>>, %arg1: memref<128x256xf32>, %arg2: tensor<1x16x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set2(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = affine.load %arg1[%arg9 + %arg6 * 8, %arg8 + %arg5 * 16] : memref<128x256xf32>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 16] : memref<128x256xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 16] : memref<128x256xf32>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x256xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x256xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x256xf32>
                affine.if #set4(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x256xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x16x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 16 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 16, %arg4 + %arg2 * 8] : memref<256x128xf32>
            affine.store %0, %arg1[%arg4 + %arg2 * 8, %arg5 + %arg3 * 16] : memref<128x256xf32>
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
  func.func @node8(%arg0: tensor<1x4x!dataflow.stream<f32, 512>>, %arg1: memref<64x128xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map} : (tensor<1x4x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x64xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<32x64xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<64x128xf32>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<64x128xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<64x128xf32>
                affine.if #set5(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x128xf32>
                affine.if #set6(%arg9, %arg6) {
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
  func.func @node9(%arg0: memref<128x64xf32>, %arg1: memref<64x128xf32>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 4] : memref<128x64xf32>
            affine.store %0, %arg1[%arg4 + %arg2 * 4, %arg5 + %arg3 * 8] : memref<64x128xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node10(%arg0: tensor<1x4x!dataflow.stream<f32, 512>>, %arg1: memref<64xf32>, %arg2: tensor<1x4x!dataflow.stream<f32, 512>>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 1 {
          affine.for %arg6 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map} : (tensor<1x4x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 4] : memref<64xf32>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map} : tensor<1x4x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node11(%arg0: tensor<1x8x!dataflow.stream<f32, 512>>, %arg1: memref<128x64xf32>, %arg2: tensor<1x4x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set5(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = affine.load %arg1[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<128x64xf32>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<128x64xf32>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 4] : memref<128x64xf32>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x64xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x64xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x64xf32>
                affine.if #set4(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<32x64xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map} : tensor<1x4x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node12(%arg0: memref<64x128xf32>, %arg1: memref<128x64xf32>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 4 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 4, %arg4 + %arg2 * 8] : memref<64x128xf32>
            affine.store %0, %arg1[%arg4 + %arg2 * 8, %arg5 + %arg3 * 4] : memref<128x64xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node13(%arg0: tensor<1x8x!dataflow.stream<f32, 512>>, %arg1: memref<128xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
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
  func.func @node14(%arg0: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg1: tensor<8x8x!dataflow.stream<f32, 512>>, %arg2: tensor<1x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map} : (tensor<1x8x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<32x256xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map} : (tensor<8x8x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 8] : memref<256x128xf32>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 8] : memref<256x128xf32>
                affine.if #set(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                affine.if #set7(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x128xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map} : tensor<1x8x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node15(%arg0: memref<128x256xf32>, %arg1: tensor<8x8x!dataflow.stream<f32, 512>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 8] : memref<128x256xf32>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map} : tensor<8x8x!dataflow.stream<f32, 512>>, f32
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
  func.func @node17(%arg0: tensor<16x8x!dataflow.stream<f32, 1568>>, %arg1: memref<32x784xf32>, %arg2: tensor<1x8x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<784x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 49 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 8 {
                %0 = affine.load %arg1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<32x784xf32>
                affine.if #set1(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg9] {map = #map} : (tensor<16x8x!dataflow.stream<f32, 1568>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 8] : memref<784x256xf32>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 8] : memref<784x256xf32>
                affine.if #set2(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32>
                affine.if #set8(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 8] : memref<32x256xf32>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map} : tensor<1x8x!dataflow.stream<f32, 1024>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node18(%arg0: memref<256x784xf32>, %arg1: tensor<16x8x!dataflow.stream<f32, 1568>>) {
    affine.for %arg2 = 0 to 49 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 16 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 16] : memref<256x784xf32>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map} : tensor<16x8x!dataflow.stream<f32, 1568>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<32x784xf32>, %arg1: memref<256xf32>, %arg2: memref<256x784xf32>, %arg3: memref<128xf32>, %arg4: memref<128x256xf32>, %arg5: memref<64xf32>, %arg6: memref<64x128xf32>, %arg7: memref<128xf32>, %arg8: memref<128x64xf32>, %arg9: memref<256xf32>, %arg10: memref<256x128xf32>, %arg11: memref<784xf32>, %arg12: memref<784x256xf32>, %arg13: memref<32x784xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 3136>>
    %1 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 3136>>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32>
    %2 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 512>>
    %3 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 512>>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    %4 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %5 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %6 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 512>>
    %7 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 512>>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32>
    %8 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %9 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 512>>
    %10 = dataflow.aofs : tensor<8x8x!dataflow.stream<f32, 512>>
    %11 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 1024>>
    %12 = dataflow.aofs : tensor<1x8x!dataflow.stream<f32, 1024>>
    %13 = dataflow.aofs : tensor<16x8x!dataflow.stream<f32, 1568>>
    call @node18(%arg2, %13) : (memref<256x784xf32>, tensor<16x8x!dataflow.stream<f32, 1568>>) -> ()
    call @node17(%13, %arg0, %12, %cst) : (tensor<16x8x!dataflow.stream<f32, 1568>>, memref<32x784xf32>, tensor<1x8x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node16(%12, %arg1, %11, %cst) : (tensor<1x8x!dataflow.stream<f32, 1024>>, memref<256xf32>, tensor<1x8x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node15(%arg4, %10) : (memref<128x256xf32>, tensor<8x8x!dataflow.stream<f32, 512>>) -> ()
    call @node14(%11, %10, %9, %cst) : (tensor<1x8x!dataflow.stream<f32, 1024>>, tensor<8x8x!dataflow.stream<f32, 512>>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node13(%9, %arg3, %8, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, memref<128xf32>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node12(%arg6, %alloc_3) : (memref<64x128xf32>, memref<128x64xf32>) -> ()
    call @node11(%8, %alloc_3, %7, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, memref<128x64xf32>, tensor<1x4x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node10(%7, %arg5, %6) : (tensor<1x4x!dataflow.stream<f32, 512>>, memref<64xf32>, tensor<1x4x!dataflow.stream<f32, 512>>) -> ()
    call @node9(%arg8, %alloc_2) : (memref<128x64xf32>, memref<64x128xf32>) -> ()
    call @node8(%6, %alloc_2, %5, %cst) : (tensor<1x4x!dataflow.stream<f32, 512>>, memref<64x128xf32>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node7(%5, %arg7, %4, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, memref<128xf32>, tensor<1x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node6(%arg10, %alloc_1) : (memref<256x128xf32>, memref<128x256xf32>) -> ()
    call @node5(%4, %alloc_1, %3, %cst) : (tensor<1x8x!dataflow.stream<f32, 512>>, memref<128x256xf32>, tensor<1x16x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node4(%3, %arg9, %2, %cst) : (tensor<1x16x!dataflow.stream<f32, 512>>, memref<256xf32>, tensor<1x16x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node3(%arg12, %alloc) : (memref<784x256xf32>, memref<256x784xf32>) -> ()
    call @node2(%2, %alloc, %1, %cst) : (tensor<1x16x!dataflow.stream<f32, 512>>, memref<256x784xf32>, tensor<1x8x!dataflow.stream<f32, 3136>>, f32) -> ()
    call @node1(%1, %arg11, %0, %cst_0) : (tensor<1x8x!dataflow.stream<f32, 3136>>, memref<784xf32>, tensor<1x8x!dataflow.stream<f32, 3136>>, f32) -> ()
    call @node0(%0, %arg13) : (tensor<1x8x!dataflow.stream<f32, 3136>>, memref<32x784xf32>) -> ()
    return
  }
}

