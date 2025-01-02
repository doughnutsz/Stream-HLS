#map = affine_map<(d0, d1) -> (0, 0, d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (0, d0)>
#map3 = affine_map<(d0, d1) -> (d0 mod 4, 0, d0 floordiv 4, d1)>
#map4 = affine_map<(d0, d1) -> (0, d1 mod 4, d0, d1 floordiv 4)>
#map5 = affine_map<(d0) -> (d0 mod 4, d0 floordiv 4)>
#map6 = affine_map<(d0, d1) -> (d0 mod 16, d1 mod 4, d0 floordiv 16, d1 floordiv 4)>
#map7 = affine_map<(d0, d1) -> (0, d1 mod 16, d0, d1 floordiv 16)>
#map8 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 16, d0 floordiv 4, d1 floordiv 16)>
#map9 = affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>
#map10 = affine_map<(d0, d1) -> (d0 mod 16, d1 mod 16, d0 floordiv 16, d1 floordiv 16)>
#map11 = affine_map<(d0, d1) -> (0, d1 mod 8, d0, d1 floordiv 8)>
#map12 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 16, d0 floordiv 8, d1 floordiv 16)>
#map13 = affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>
#set = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 4 - 255 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 16 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 16 - 511 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 8 - 1023 == 0)>
module attributes {torch.debug_module_name = "ResMLP"} {
  func.func @node0(%arg0: tensor<1x1x!dataflow.stream<f32, 80>>, %arg1: memref<8x10xf32, #map>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 0 to 1 {
          affine.for %arg5 = 0 to 1 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<1x1x!dataflow.stream<f32, 80>>) -> f32
            affine.store %0, %arg1[%arg2 + %arg4, %arg3 + %arg5] : memref<8x10xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<1x1x!dataflow.stream<f32, 80>>, %arg1: memref<10xf32, #map2>, %arg2: tensor<1x1x!dataflow.stream<f32, 80>>) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 10 {
        affine.for %arg5 = 0 to 1 {
          affine.for %arg6 = 0 to 1 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<1x1x!dataflow.stream<f32, 80>>) -> f32
            %1 = affine.load %arg1[%arg4 + %arg6] : memref<10xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map1} : tensor<1x1x!dataflow.stream<f32, 80>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<1x4x!dataflow.stream<f32, 512>>, %arg1: tensor<4x1x!dataflow.stream<f32, 640>>, %arg2: tensor<1x1x!dataflow.stream<f32, 80>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x10xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x10xf32, #map3>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x256xf32, #map4>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 10 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 4 {
              affine.for %arg9 = 0 to 1 {
                affine.if #set(%arg6, %arg9) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x4x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<8x256xf32, #map4>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 4] : memref<8x256xf32, #map4>
                affine.if #set(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map1} : (tensor<4x1x!dataflow.stream<f32, 640>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<256x10xf32, #map3>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 4, %arg6 + %arg9] : memref<256x10xf32, #map3>
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg6 + %arg9] : memref<8x10xf32, #map>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg6 + %arg9] : memref<8x10xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg6 + %arg9] : memref<8x10xf32, #map>
                affine.if #set2(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg6 + %arg9] : memref<8x10xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x1x!dataflow.stream<f32, 80>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<10x256xf32, #map4>, %arg1: tensor<4x1x!dataflow.stream<f32, 640>>) {
    affine.for %arg2 = 0 to 64 {
      affine.for %arg3 = 0 to 10 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 1 {
            %0 = affine.load %arg0[%arg3 + %arg5, %arg4 + %arg2 * 4] : memref<10x256xf32, #map4>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<4x1x!dataflow.stream<f32, 640>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: tensor<1x4x!dataflow.stream<f32, 512>>, %arg1: memref<256xf32, #map5>, %arg2: tensor<1x4x!dataflow.stream<f32, 512>>) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 64 {
        affine.for %arg5 = 0 to 1 {
          affine.for %arg6 = 0 to 4 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<1x4x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 4] : memref<256xf32, #map5>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map1} : tensor<1x4x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: tensor<16x4x!dataflow.stream<f32, 2048>>, %arg1: tensor<1x16x!dataflow.stream<f32, 256>>, %arg2: tensor<1x4x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x256xf32, #map4>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<512x256xf32, #map6>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32, #map7>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 64 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set1(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg8] {map = #map1} : (tensor<1x16x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<8x512xf32, #map7>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<8x512xf32, #map7>
                affine.if #set(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg9] {map = #map1} : (tensor<16x4x!dataflow.stream<f32, 2048>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 4] : memref<512x256xf32, #map6>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 4] : memref<512x256xf32, #map6>
                affine.if #set3(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<8x256xf32, #map4>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<8x256xf32, #map4>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<8x256xf32, #map4>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 4] : memref<8x256xf32, #map4>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x4x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x512xf32, #map8>, %arg1: tensor<16x4x!dataflow.stream<f32, 2048>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 64 {
        affine.for %arg4 = 0 to 16 {
          affine.for %arg5 = 0 to 4 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 4, %arg4 + %arg2 * 16] : memref<256x512xf32, #map8>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<16x4x!dataflow.stream<f32, 2048>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: tensor<1x16x!dataflow.stream<f32, 256>>, %arg1: memref<512xf32, #map9>, %arg2: tensor<1x16x!dataflow.stream<f32, 256>>, %arg3: tensor<1x16x!dataflow.stream<f32, 256>>, %arg4: f32) {
    affine.for %arg5 = 0 to 8 {
      affine.for %arg6 = 0 to 32 {
        affine.for %arg7 = 0 to 1 {
          affine.for %arg8 = 0 to 16 {
            %0 = dataflow.aofs_read %arg0[%arg7, %arg8] {map = #map1} : (tensor<1x16x!dataflow.stream<f32, 256>>) -> f32
            %1 = affine.load %arg1[%arg8 + %arg6 * 16] : memref<512xf32, #map9>
            %2 = dataflow.aofs_read %arg2[%arg7, %arg8] {map = #map1} : (tensor<1x16x!dataflow.stream<f32, 256>>) -> f32
            %3 = arith.addf %0, %1 : f32
            %4 = arith.addf %3, %2 : f32
            %5 = arith.cmpf ugt, %4, %arg4 : f32
            %6 = arith.select %5, %4, %arg4 : f32
            dataflow.aofs_write %arg3[%arg7, %arg8], %6 {map = #map1} : tensor<1x16x!dataflow.stream<f32, 256>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node8(%arg0: tensor<16x16x!dataflow.stream<f32, 1024>>, %arg1: tensor<1x16x!dataflow.stream<f32, 256>>, %arg2: tensor<1x16x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32, #map7>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<512x512xf32, #map10>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32, #map7>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 16 {
                affine.if #set3(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg8] {map = #map1} : (tensor<1x16x!dataflow.stream<f32, 256>>) -> f32
                  affine.store %5, %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<8x512xf32, #map7>
                }
                %0 = affine.load %alloc_1[%arg4 + %arg7, %arg8 + %arg5 * 16] : memref<8x512xf32, #map7>
                affine.if #set(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg9] {map = #map1} : (tensor<16x16x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 16] : memref<512x512xf32, #map10>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 16, %arg9 + %arg6 * 16] : memref<512x512xf32, #map10>
                affine.if #set3(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x16x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: memref<512x512xf32, #map10>, %arg1: tensor<16x16x!dataflow.stream<f32, 1024>>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 16 {
          affine.for %arg5 = 0 to 16 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 16, %arg4 + %arg2 * 16] : memref<512x512xf32, #map10>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<16x16x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node10(%arg0: tensor<1x16x!dataflow.stream<f32, 256>>, %arg1: tensor<1x16x!dataflow.stream<f32, 256>>, %arg2: f32) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 1 {
          affine.for %arg6 = 0 to 16 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<1x16x!dataflow.stream<f32, 256>>) -> f32
            %1 = arith.cmpf ugt, %0, %arg2 : f32
            %2 = arith.select %1, %0, %arg2 : f32
            dataflow.aofs_write %arg1[%arg5, %arg6], %2 {map = #map1} : tensor<1x16x!dataflow.stream<f32, 256>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node11(%arg0: tensor<1x16x!dataflow.stream<f32, 256>>, %arg1: memref<512xf32, #map9>, %arg2: tensor<1x16x!dataflow.stream<f32, 256>>, %arg3: tensor<1x16x!dataflow.stream<f32, 256>>) {
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 1 {
          affine.for %arg7 = 0 to 16 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<1x16x!dataflow.stream<f32, 256>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 16] : memref<512xf32, #map9>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %2 {map = #map1} : tensor<1x16x!dataflow.stream<f32, 256>>, f32
            dataflow.aofs_write %arg3[%arg6, %arg7], %2 {map = #map1} : tensor<1x16x!dataflow.stream<f32, 256>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node12(%arg0: memref<8x1024xf32, #map11>, %arg1: tensor<8x16x!dataflow.stream<f32, 4096>>, %arg2: tensor<1x16x!dataflow.stream<f32, 256>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32, #map7>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1024x512xf32, #map12>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 16 {
                %0 = affine.load %arg0[%arg4 + %arg7, %arg8 + %arg5 * 8] : memref<8x1024xf32, #map11>
                affine.if #set(%arg4, %arg7) {
                  %5 = dataflow.aofs_read %arg1[%arg8, %arg9] {map = #map1} : (tensor<8x16x!dataflow.stream<f32, 4096>>) -> f32
                  affine.store %5, %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 16] : memref<1024x512xf32, #map12>
                }
                %1 = affine.load %alloc_0[%arg8 + %arg5 * 8, %arg9 + %arg6 * 16] : memref<1024x512xf32, #map12>
                affine.if #set5(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                }
                %2 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                affine.if #set6(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg4 + %arg7, %arg9 + %arg6 * 16] : memref<8x512xf32, #map7>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<1x16x!dataflow.stream<f32, 256>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node13(%arg0: memref<512x1024xf32, #map13>, %arg1: tensor<8x16x!dataflow.stream<f32, 4096>>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 16 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 16, %arg4 + %arg2 * 8] : memref<512x1024xf32, #map13>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<8x16x!dataflow.stream<f32, 4096>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<8x1024xf32, #map11>, %arg1: memref<512xf32, #map9>, %arg2: memref<512x1024xf32, #map13>, %arg3: memref<512xf32, #map9>, %arg4: memref<512x512xf32, #map10>, %arg5: memref<256xf32, #map5>, %arg6: memref<256x512xf32, #map8>, %arg7: memref<10xf32, #map2>, %arg8: memref<10x256xf32, #map4>, %arg9: memref<8x10xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<1x1x!dataflow.stream<f32, 80>>
    %1 = dataflow.aofs : tensor<1x1x!dataflow.stream<f32, 80>>
    %2 = dataflow.aofs : tensor<4x1x!dataflow.stream<f32, 640>>
    %3 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 512>>
    %4 = dataflow.aofs : tensor<1x4x!dataflow.stream<f32, 512>>
    %5 = dataflow.aofs : tensor<16x4x!dataflow.stream<f32, 2048>>
    %6 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 256>>
    %7 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 256>>
    %8 = dataflow.aofs : tensor<16x16x!dataflow.stream<f32, 1024>>
    %9 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 256>>
    %10 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 256>>
    %11 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 256>>
    %12 = dataflow.aofs : tensor<1x16x!dataflow.stream<f32, 256>>
    %13 = dataflow.aofs : tensor<8x16x!dataflow.stream<f32, 4096>>
    call @node13(%arg2, %13) : (memref<512x1024xf32, #map13>, tensor<8x16x!dataflow.stream<f32, 4096>>) -> ()
    call @node12(%arg0, %13, %12, %cst) : (memref<8x1024xf32, #map11>, tensor<8x16x!dataflow.stream<f32, 4096>>, tensor<1x16x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node11(%12, %arg1, %11, %10) : (tensor<1x16x!dataflow.stream<f32, 256>>, memref<512xf32, #map9>, tensor<1x16x!dataflow.stream<f32, 256>>, tensor<1x16x!dataflow.stream<f32, 256>>) -> ()
    call @node10(%11, %9, %cst) : (tensor<1x16x!dataflow.stream<f32, 256>>, tensor<1x16x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node9(%arg4, %8) : (memref<512x512xf32, #map10>, tensor<16x16x!dataflow.stream<f32, 1024>>) -> ()
    call @node8(%8, %9, %7, %cst) : (tensor<16x16x!dataflow.stream<f32, 1024>>, tensor<1x16x!dataflow.stream<f32, 256>>, tensor<1x16x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node7(%7, %arg3, %10, %6, %cst) : (tensor<1x16x!dataflow.stream<f32, 256>>, memref<512xf32, #map9>, tensor<1x16x!dataflow.stream<f32, 256>>, tensor<1x16x!dataflow.stream<f32, 256>>, f32) -> ()
    call @node6(%arg6, %5) : (memref<256x512xf32, #map8>, tensor<16x4x!dataflow.stream<f32, 2048>>) -> ()
    call @node5(%5, %6, %4, %cst) : (tensor<16x4x!dataflow.stream<f32, 2048>>, tensor<1x16x!dataflow.stream<f32, 256>>, tensor<1x4x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node4(%4, %arg5, %3) : (tensor<1x4x!dataflow.stream<f32, 512>>, memref<256xf32, #map5>, tensor<1x4x!dataflow.stream<f32, 512>>) -> ()
    call @node3(%arg8, %2) : (memref<10x256xf32, #map4>, tensor<4x1x!dataflow.stream<f32, 640>>) -> ()
    call @node2(%3, %2, %1, %cst) : (tensor<1x4x!dataflow.stream<f32, 512>>, tensor<4x1x!dataflow.stream<f32, 640>>, tensor<1x1x!dataflow.stream<f32, 80>>, f32) -> ()
    call @node1(%1, %arg7, %0) : (tensor<1x1x!dataflow.stream<f32, 80>>, memref<10xf32, #map2>, tensor<1x1x!dataflow.stream<f32, 80>>) -> ()
    call @node0(%0, %arg9) : (tensor<1x1x!dataflow.stream<f32, 80>>, memref<8x10xf32, #map>) -> ()
    return
  }
}

