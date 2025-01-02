#map = affine_map<(d0, d1, d2) -> (0, d1 mod 8, d2 mod 8, d0, d1 floordiv 8, d2 floordiv 8)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0 mod 8, d0 floordiv 8)>
#map3 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>
#map4 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 8, d0 floordiv 8, d1 floordiv 8)>
#map5 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 2, d0 floordiv 8, d1 floordiv 2)>
#map6 = affine_map<(d0, d1, d2) -> (d0 mod 8, d1 mod 2, d2 mod 2, d0 floordiv 8, d1 floordiv 2, d2 floordiv 2)>
#map7 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map8 = affine_map<(d0, d1) -> (d0 mod 4, d1 mod 8, d0 floordiv 4, d1 floordiv 8)>
#map9 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 4, d0 floordiv 2, d1 floordiv 4)>
#map10 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 4, d0 floordiv 8, d1 floordiv 4)>
#map11 = affine_map<(d0, d1, d2) -> (0, d1 mod 2, d2 mod 4, d0, d1 floordiv 2, d2 floordiv 4)>
#set = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 2 - 127 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 2 - 63 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 2 - 15 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 4 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 4 - 127 == 0)>
module attributes {torch.debug_module_name = "MultiHeadSelfAttention"} {
  func.func @node0(%arg0: tensor<8x8x!dataflow.stream<f32, 128>>, %arg1: memref<1x64x128xf32, #map>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<8x8x!dataflow.stream<f32, 128>>) -> f32
            affine.store %0, %arg1[0, %arg4 + %arg2 * 8, %arg5 + %arg3 * 8] : memref<1x64x128xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<8x8x!dataflow.stream<f32, 128>>, %arg1: memref<128xf32, #map2>, %arg2: tensor<8x8x!dataflow.stream<f32, 128>>) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 8 {
          affine.for %arg6 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<8x8x!dataflow.stream<f32, 128>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 8] : memref<128xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map1} : tensor<8x8x!dataflow.stream<f32, 128>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<8x2x!dataflow.stream<f32, 512>>, %arg1: memref<128x128xf32, #map3>, %arg2: tensor<8x8x!dataflow.stream<f32, 128>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map4>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map3>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map5>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 64 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 2 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map1} : (tensor<8x2x!dataflow.stream<f32, 512>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 8, %arg9 + %arg6 * 2] : memref<64x128xf32, #map5>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 8, %arg9 + %arg6 * 2] : memref<64x128xf32, #map5>
                affine.if #set(%arg7, %arg4) {
                  %5 = affine.load %arg1[%arg9 + %arg6 * 2, %arg8 + %arg5 * 8] : memref<128x128xf32, #map3>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 2, %arg8 + %arg5 * 8] : memref<128x128xf32, #map3>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 2, %arg8 + %arg5 * 8] : memref<128x128xf32, #map3>
                affine.if #set1(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 8, %arg8 + %arg5 * 8] : memref<64x128xf32, #map4>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 8, %arg8 + %arg5 * 8] : memref<64x128xf32, #map4>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 8, %arg8 + %arg5 * 8] : memref<64x128xf32, #map4>
                affine.if #set2(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 8, %arg8 + %arg5 * 8] : memref<64x128xf32, #map4>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<8x8x!dataflow.stream<f32, 128>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<128x128xf32, #map5>, %arg1: memref<128x128xf32, #map3>) {
    affine.for %arg2 = 0 to 64 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 2 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 2] : memref<128x128xf32, #map5>
            affine.store %0, %arg1[%arg4 + %arg2 * 2, %arg5 + %arg3 * 8] : memref<128x128xf32, #map3>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: memref<64x8x16xf32, #map6>, %arg1: tensor<8x2x!dataflow.stream<f32, 512>>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 64 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 2 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 8, %arg3 floordiv 8, (%arg5 + %arg3 * 2) mod 16] : memref<64x8x16xf32, #map6>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<8x2x!dataflow.stream<f32, 512>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: memref<8x64x16xf32, #map6>, %arg1: memref<64x8x16xf32, #map6>) {
    affine.for %arg2 = 0 to 4 {
      affine.for %arg3 = 0 to 8 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 2 {
            affine.for %arg6 = 0 to 8 {
              affine.for %arg7 = 0 to 2 {
                %0 = affine.load %arg0[%arg5 + %arg2 * 2, %arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64x16xf32, #map6>
                affine.store %0, %arg1[%arg6 + %arg3 * 8, %arg5 + %arg2 * 2, %arg7 + %arg4 * 2] : memref<64x8x16xf32, #map6>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg1: memref<8x64x16xf32, #map6>, %arg2: memref<8x64x16xf32, #map6>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32, #map6>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32, #map6>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x64x64xf32, #map6>
    affine.for %arg4 = 0 to 1 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 32 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 2 {
                affine.for %arg10 = 0 to 2 {
                  affine.for %arg11 = 0 to 2 {
                    affine.if #set1(%arg10, %arg6) {
                      %5 = dataflow.aofs_read %arg0[%arg8, %arg9, %arg11] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> f32
                      affine.store %5, %alloc_1[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg11 + %arg7 * 2] : memref<8x64x64xf32, #map6>
                    }
                    %0 = affine.load %alloc_1[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg11 + %arg7 * 2] : memref<8x64x64xf32, #map6>
                    affine.if #set1(%arg9, %arg5) {
                      %5 = affine.load %arg1[%arg8 + %arg4 * 8, %arg11 + %arg7 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                      affine.store %5, %alloc_0[%arg8 + %arg4 * 8, %arg11 + %arg7 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                    }
                    %1 = affine.load %alloc_0[%arg8 + %arg4 * 8, %arg11 + %arg7 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                    affine.if #set1(%arg11, %arg7) {
                      affine.store %arg3, %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                    }
                    %2 = affine.load %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                    %3 = arith.mulf %0, %1 : f32
                    %4 = arith.addf %2, %3 : f32
                    affine.store %4, %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                    affine.if #set3(%arg11, %arg7) {
                      %5 = affine.load %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                      affine.store %5, %arg2[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x16xf32, #map6>
                    }
                  }
                }
              }
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    return
  }
  func.func @node7(%arg0: memref<64x128xf32, #map3>, %arg1: memref<8x64x16xf32, #map6>) {
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 8 {
            affine.for %arg6 = 0 to 2 {
              affine.for %arg7 = 0 to 2 {
                %0 = affine.load %arg0[%arg6 + %arg3 * 2, %arg5 * 16 + %arg2 * 128 + %arg7 + %arg4 * 2] : memref<64x128xf32, #map3>
                affine.store %0, %arg1[%arg5 + %arg2 * 8, %arg6 + %arg3 * 2, %arg7 + %arg4 * 2] : memref<8x64x16xf32, #map6>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node8(%arg0: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg1: tensor<8x2x!dataflow.stream<f32, 32>>, %arg2: tensor<8x2x2x!dataflow.stream<f32, 1024>>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32, #map5>
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          affine.for %arg6 = 0 to 8 {
            affine.for %arg7 = 0 to 2 {
              affine.for %arg8 = 0 to 2 {
                %0 = dataflow.aofs_read %arg0[%arg6, %arg7, %arg8] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> f32
                affine.if #set1(%arg8, %arg5) {
                  %3 = dataflow.aofs_read %arg1[%arg6, %arg7] {map = #map1} : (tensor<8x2x!dataflow.stream<f32, 32>>) -> f32
                  affine.store %3, %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                }
                %1 = affine.load %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                %2 = arith.divf %0, %1 : f32
                dataflow.aofs_write %arg2[%arg6, %arg7, %arg8], %2 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg1: tensor<8x2x!dataflow.stream<f32, 32>>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32, #map5>
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          affine.for %arg6 = 0 to 8 {
            affine.for %arg7 = 0 to 2 {
              affine.for %arg8 = 0 to 2 {
                %0 = dataflow.aofs_read %arg0[%arg6, %arg7, %arg8] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> f32
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg2, %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                }
                %1 = affine.load %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                %2 = arith.addf %0, %1 : f32
                affine.store %2, %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                affine.if #set3(%arg8, %arg5) {
                  %3 = affine.load %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                  dataflow.aofs_write %arg1[%arg6, %arg7], %3 {map = #map1} : tensor<8x2x!dataflow.stream<f32, 32>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node10(%arg0: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg1: tensor<8x2x!dataflow.stream<f32, 32>>, %arg2: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg3: tensor<8x2x2x!dataflow.stream<f32, 1024>>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32, #map5>
    affine.for %arg4 = 0 to 1 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 2 {
                %0 = dataflow.aofs_read %arg0[%arg7, %arg8, %arg9] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> f32
                affine.if #set1(%arg9, %arg6) {
                  %4 = dataflow.aofs_read %arg1[%arg7, %arg8] {map = #map1} : (tensor<8x2x!dataflow.stream<f32, 32>>) -> f32
                  affine.store %4, %alloc[%arg7 + %arg4 * 8, %arg8 + %arg5 * 2] : memref<8x64xf32, #map5>
                }
                %1 = affine.load %alloc[%arg7 + %arg4 * 8, %arg8 + %arg5 * 2] : memref<8x64xf32, #map5>
                %2 = arith.subf %0, %1 : f32
                %3 = math.exp %2 : f32
                dataflow.aofs_write %arg2[%arg7, %arg8, %arg9], %3 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32
                dataflow.aofs_write %arg3[%arg7, %arg8, %arg9], %3 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node11(%arg0: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg1: tensor<8x2x!dataflow.stream<f32, 32>>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32, #map5>
    affine.for %arg3 = 0 to 1 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          affine.for %arg6 = 0 to 8 {
            affine.for %arg7 = 0 to 2 {
              affine.for %arg8 = 0 to 2 {
                %0 = dataflow.aofs_read %arg0[%arg6, %arg7, %arg8] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> f32
                affine.if #set1(%arg8, %arg5) {
                  affine.store %arg2, %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                }
                %1 = affine.load %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                %2 = arith.maximumf %0, %1 : f32
                affine.store %2, %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                affine.if #set3(%arg8, %arg5) {
                  %3 = affine.load %alloc[%arg6 + %arg3 * 8, %arg7 + %arg4 * 2] : memref<8x64xf32, #map5>
                  dataflow.aofs_write %arg1[%arg6, %arg7], %3 {map = #map1} : tensor<8x2x!dataflow.stream<f32, 32>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node12(%arg0: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg1: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg2: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    affine.for %arg4 = 0 to 1 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 2 {
                %0 = dataflow.aofs_read %arg0[%arg7, %arg8, %arg9] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> f32
                %1 = arith.divf %0, %arg3 : f32
                dataflow.aofs_write %arg1[%arg7, %arg8, %arg9], %1 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32
                dataflow.aofs_write %arg2[%arg7, %arg8, %arg9], %1 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node13(%arg0: tensor<8x2x2x!dataflow.stream<f32, 256>>, %arg1: memref<8x16x64xf32, #map6>, %arg2: tensor<8x2x2x!dataflow.stream<f32, 1024>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64x64xf32, #map6>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8x16x64xf32, #map6>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32, #map6>
    affine.for %arg4 = 0 to 1 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 2 {
                affine.for %arg10 = 0 to 2 {
                  affine.for %arg11 = 0 to 2 {
                    affine.if #set1(%arg10, %arg6) {
                      %5 = dataflow.aofs_read %arg0[%arg8, %arg9, %arg11] {map = #map7} : (tensor<8x2x2x!dataflow.stream<f32, 256>>) -> f32
                      affine.store %5, %alloc_1[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg11 + %arg7 * 2] : memref<8x64x16xf32, #map6>
                    }
                    %0 = affine.load %alloc_1[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg11 + %arg7 * 2] : memref<8x64x16xf32, #map6>
                    affine.if #set1(%arg9, %arg5) {
                      %5 = affine.load %arg1[%arg8 + %arg4 * 8, %arg11 + %arg7 * 2, %arg10 + %arg6 * 2] : memref<8x16x64xf32, #map6>
                      affine.store %5, %alloc_0[%arg8 + %arg4 * 8, %arg11 + %arg7 * 2, %arg10 + %arg6 * 2] : memref<8x16x64xf32, #map6>
                    }
                    %1 = affine.load %alloc_0[%arg8 + %arg4 * 8, %arg11 + %arg7 * 2, %arg10 + %arg6 * 2] : memref<8x16x64xf32, #map6>
                    affine.if #set1(%arg11, %arg7) {
                      affine.store %arg3, %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x64xf32, #map6>
                    }
                    %2 = affine.load %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x64xf32, #map6>
                    %3 = arith.mulf %0, %1 : f32
                    %4 = arith.addf %2, %3 : f32
                    affine.store %4, %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x64xf32, #map6>
                    affine.if #set4(%arg11, %arg7) {
                      %5 = affine.load %alloc[%arg8 + %arg4 * 8, %arg9 + %arg5 * 2, %arg10 + %arg6 * 2] : memref<8x64x64xf32, #map6>
                      dataflow.aofs_write %arg2[%arg8, %arg9, %arg10], %5 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32
                    }
                  }
                }
              }
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    return
  }
  func.func @node14(%arg0: memref<64x128xf32, #map3>, %arg1: memref<8x16x64xf32, #map6>) {
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 8 {
        affine.for %arg4 = 0 to 32 {
          affine.for %arg5 = 0 to 8 {
            affine.for %arg6 = 0 to 2 {
              affine.for %arg7 = 0 to 2 {
                %0 = affine.load %arg0[%arg7 + %arg4 * 2, %arg5 * 16 + %arg2 * 128 + %arg6 + %arg3 * 2] : memref<64x128xf32, #map3>
                affine.store %0, %arg1[%arg5 + %arg2 * 8, %arg6 + %arg3 * 2, %arg7 + %arg4 * 2] : memref<8x16x64xf32, #map6>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node15(%arg0: memref<64x128xf32, #map3>, %arg1: tensor<8x2x2x!dataflow.stream<f32, 256>>) {
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 32 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 8 {
            affine.for %arg6 = 0 to 2 {
              affine.for %arg7 = 0 to 2 {
                %0 = affine.load %arg0[%arg6 + %arg3 * 2, %arg5 * 16 + %arg2 * 128 + %arg7 + %arg4 * 2] : memref<64x128xf32, #map3>
                dataflow.aofs_write %arg1[%arg5, %arg6, %arg7], %0 {map = #map7} : tensor<8x2x2x!dataflow.stream<f32, 256>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node16(%arg0: tensor<2x8x!dataflow.stream<f32, 512>>, %arg1: memref<128xf32, #map2>, %arg2: memref<64x128xf32, #map3>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 2 {
          affine.for %arg6 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<2x8x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 8] : memref<128xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            affine.store %2, %arg2[%arg5 + %arg3 * 2, %arg6 + %arg4 * 8] : memref<64x128xf32, #map3>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node17(%arg0: tensor<2x4x!dataflow.stream<f32, 1024>>, %arg1: memref<128x128xf32, #map8>, %arg2: tensor<2x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map8>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map9>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg0[%arg7, %arg9] {map = #map1} : (tensor<2x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map9>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map9>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %arg1[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                affine.if #set5(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                affine.if #set6(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<2x8x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node18(%arg0: memref<128x128xf32, #map10>, %arg1: memref<128x128xf32, #map8>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 4] : memref<128x128xf32, #map10>
            affine.store %0, %arg1[%arg4 + %arg2 * 4, %arg5 + %arg3 * 8] : memref<128x128xf32, #map8>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node19(%arg0: tensor<2x8x!dataflow.stream<f32, 512>>, %arg1: memref<128xf32, #map2>, %arg2: memref<64x128xf32, #map3>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 2 {
          affine.for %arg6 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<2x8x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 8] : memref<128xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            affine.store %2, %arg2[%arg5 + %arg3 * 2, %arg6 + %arg4 * 8] : memref<64x128xf32, #map3>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node20(%arg0: memref<128x128xf32, #map8>, %arg1: tensor<2x4x!dataflow.stream<f32, 1024>>, %arg2: tensor<2x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map8>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map9>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<2x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map9>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map9>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %arg0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                affine.if #set5(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                affine.if #set6(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<2x8x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node21(%arg0: memref<128x128xf32, #map10>, %arg1: memref<128x128xf32, #map8>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 4] : memref<128x128xf32, #map10>
            affine.store %0, %arg1[%arg4 + %arg2 * 4, %arg5 + %arg3 * 8] : memref<128x128xf32, #map8>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node22(%arg0: tensor<2x8x!dataflow.stream<f32, 512>>, %arg1: memref<128xf32, #map2>, %arg2: memref<64x128xf32, #map3>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 2 {
          affine.for %arg6 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<2x8x!dataflow.stream<f32, 512>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 8] : memref<128xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            affine.store %2, %arg2[%arg5 + %arg3 * 2, %arg6 + %arg4 * 8] : memref<64x128xf32, #map3>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node23(%arg0: memref<128x128xf32, #map8>, %arg1: tensor<2x4x!dataflow.stream<f32, 1024>>, %arg2: tensor<2x8x!dataflow.stream<f32, 512>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map8>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map9>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 32 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 4 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<2x4x!dataflow.stream<f32, 1024>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map9>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 4] : memref<64x128xf32, #map9>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %arg0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 4, %arg8 + %arg5 * 8] : memref<128x128xf32, #map8>
                affine.if #set5(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                affine.if #set6(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<64x128xf32, #map3>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<2x8x!dataflow.stream<f32, 512>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node24(%arg0: memref<128x128xf32, #map10>, %arg1: memref<128x128xf32, #map8>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 4 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 4] : memref<128x128xf32, #map10>
            affine.store %0, %arg1[%arg4 + %arg2 * 4, %arg5 + %arg3 * 8] : memref<128x128xf32, #map8>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node25(%arg0: memref<1x64x128xf32, #map11>, %arg1: tensor<2x4x!dataflow.stream<f32, 1024>>, %arg2: tensor<2x4x!dataflow.stream<f32, 1024>>, %arg3: tensor<2x4x!dataflow.stream<f32, 1024>>) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 32 {
        affine.for %arg6 = 0 to 2 {
          affine.for %arg7 = 0 to 4 {
            %0 = affine.load %arg0[0, %arg6 + %arg4 * 2, %arg7 + %arg5 * 4] : memref<1x64x128xf32, #map11>
            dataflow.aofs_write %arg1[%arg6, %arg7], %0 {map = #map1} : tensor<2x4x!dataflow.stream<f32, 1024>>, f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %0 {map = #map1} : tensor<2x4x!dataflow.stream<f32, 1024>>, f32
            dataflow.aofs_write %arg3[%arg6, %arg7], %0 {map = #map1} : tensor<2x4x!dataflow.stream<f32, 1024>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<1x64x128xf32, #map11>, %arg1: memref<128xf32, #map2>, %arg2: memref<128x128xf32, #map10>, %arg3: memref<128xf32, #map2>, %arg4: memref<128x128xf32, #map10>, %arg5: memref<128xf32, #map2>, %arg6: memref<128x128xf32, #map10>, %arg7: memref<128xf32, #map2>, %arg8: memref<128x128xf32, #map5>, %arg9: memref<1x64x128xf32, #map>) {
    %cst = arith.constant 4.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 0xFF800000 : f32
    %0 = dataflow.aofs : tensor<8x8x!dataflow.stream<f32, 128>>
    %1 = dataflow.aofs : tensor<8x8x!dataflow.stream<f32, 128>>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map3>
    %2 = dataflow.aofs : tensor<8x2x!dataflow.stream<f32, 512>>
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<64x8x16xf32, #map6>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32, #map6>
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32, #map6>
    %3 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 1024>>
    %4 = dataflow.aofs : tensor<8x2x!dataflow.stream<f32, 32>>
    %5 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 1024>>
    %6 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 1024>>
    %7 = dataflow.aofs : tensor<8x2x!dataflow.stream<f32, 32>>
    %8 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 1024>>
    %9 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 1024>>
    %10 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 1024>>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<8x16x64xf32, #map6>
    %11 = dataflow.aofs : tensor<8x2x2x!dataflow.stream<f32, 256>>
    %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %12 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 512>>
    %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map8>
    %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %13 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 512>>
    %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map8>
    %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32, #map3>
    %14 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 512>>
    %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32, #map8>
    %15 = dataflow.aofs : tensor<2x4x!dataflow.stream<f32, 1024>>
    %16 = dataflow.aofs : tensor<2x4x!dataflow.stream<f32, 1024>>
    %17 = dataflow.aofs : tensor<2x4x!dataflow.stream<f32, 1024>>
    call @node25(%arg0, %17, %16, %15) : (memref<1x64x128xf32, #map11>, tensor<2x4x!dataflow.stream<f32, 1024>>, tensor<2x4x!dataflow.stream<f32, 1024>>, tensor<2x4x!dataflow.stream<f32, 1024>>) -> ()
    call @node24(%arg2, %alloc_11) : (memref<128x128xf32, #map10>, memref<128x128xf32, #map8>) -> ()
    call @node23(%alloc_11, %15, %14, %cst_0) : (memref<128x128xf32, #map8>, tensor<2x4x!dataflow.stream<f32, 1024>>, tensor<2x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node22(%14, %arg1, %alloc_10) : (tensor<2x8x!dataflow.stream<f32, 512>>, memref<128xf32, #map2>, memref<64x128xf32, #map3>) -> ()
    call @node21(%arg4, %alloc_9) : (memref<128x128xf32, #map10>, memref<128x128xf32, #map8>) -> ()
    call @node20(%alloc_9, %16, %13, %cst_0) : (memref<128x128xf32, #map8>, tensor<2x4x!dataflow.stream<f32, 1024>>, tensor<2x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node19(%13, %arg3, %alloc_8) : (tensor<2x8x!dataflow.stream<f32, 512>>, memref<128xf32, #map2>, memref<64x128xf32, #map3>) -> ()
    call @node18(%arg6, %alloc_7) : (memref<128x128xf32, #map10>, memref<128x128xf32, #map8>) -> ()
    call @node17(%17, %alloc_7, %12, %cst_0) : (tensor<2x4x!dataflow.stream<f32, 1024>>, memref<128x128xf32, #map8>, tensor<2x8x!dataflow.stream<f32, 512>>, f32) -> ()
    call @node16(%12, %arg5, %alloc_6) : (tensor<2x8x!dataflow.stream<f32, 512>>, memref<128xf32, #map2>, memref<64x128xf32, #map3>) -> ()
    call @node15(%alloc_10, %11) : (memref<64x128xf32, #map3>, tensor<8x2x2x!dataflow.stream<f32, 256>>) -> ()
    call @node14(%alloc_8, %alloc_5) : (memref<64x128xf32, #map3>, memref<8x16x64xf32, #map6>) -> ()
    call @node13(%11, %alloc_5, %10, %cst_0) : (tensor<8x2x2x!dataflow.stream<f32, 256>>, memref<8x16x64xf32, #map6>, tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node12(%10, %9, %8, %cst) : (tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x2x!dataflow.stream<f32, 1024>>, f32) -> ()
    call @node11(%9, %7, %cst_1) : (tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x!dataflow.stream<f32, 32>>, f32) -> ()
    call @node10(%8, %7, %6, %5) : (tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x!dataflow.stream<f32, 32>>, tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> ()
    call @node9(%6, %4, %cst_0) : (tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x!dataflow.stream<f32, 32>>, f32) -> ()
    call @node8(%5, %4, %3) : (tensor<8x2x2x!dataflow.stream<f32, 1024>>, tensor<8x2x!dataflow.stream<f32, 32>>, tensor<8x2x2x!dataflow.stream<f32, 1024>>) -> ()
    call @node7(%alloc_6, %alloc_4) : (memref<64x128xf32, #map3>, memref<8x64x16xf32, #map6>) -> ()
    call @node6(%3, %alloc_4, %alloc_3, %cst_0) : (tensor<8x2x2x!dataflow.stream<f32, 1024>>, memref<8x64x16xf32, #map6>, memref<8x64x16xf32, #map6>, f32) -> ()
    call @node5(%alloc_3, %alloc_2) : (memref<8x64x16xf32, #map6>, memref<64x8x16xf32, #map6>) -> ()
    call @node4(%alloc_2, %2) : (memref<64x8x16xf32, #map6>, tensor<8x2x!dataflow.stream<f32, 512>>) -> ()
    call @node3(%arg8, %alloc) : (memref<128x128xf32, #map5>, memref<128x128xf32, #map3>) -> ()
    call @node2(%2, %alloc, %1, %cst_0) : (tensor<8x2x!dataflow.stream<f32, 512>>, memref<128x128xf32, #map3>, tensor<8x8x!dataflow.stream<f32, 128>>, f32) -> ()
    call @node1(%1, %arg7, %0) : (tensor<8x8x!dataflow.stream<f32, 128>>, memref<128xf32, #map2>, tensor<8x8x!dataflow.stream<f32, 128>>) -> ()
    call @node0(%0, %arg9) : (tensor<8x8x!dataflow.stream<f32, 128>>, memref<1x64x128xf32, #map>) -> ()
    return
  }
}

