#map = affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, 0, d0, d1, d2 floordiv 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, 0, d2 mod 2, d3 mod 14, d0, d1, d2 floordiv 2, d3 floordiv 14)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#set = affine_set<(d0, d1, d2, d3) : (d0 + d1 == 0, d2 + d3 == 0)>
#set1 = affine_set<(d0, d1, d2, d3) : (d0 + d1 - 2 == 0, d2 + d3 - 2 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 - 7 == 0)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  func.func @forward(%arg0: memref<1x8x112x112xf32, #map>, %arg1: memref<8x8x1x1xf32>, %arg2: memref<8x3x3xf32>, %arg3: memref<1x8x112x112xf32, #map1>) {
    %cst = arith.constant 1.000000e-05 : f64
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x114x114xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 57 {
        affine.for %arg6 = 0 to 114 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                affine.store %cst_0, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 2, %arg6 + %arg9] : memref<8x114x114xf32>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 112 {
          affine.for %arg7 = 0 to 1 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                %3 = affine.load %arg0[0, %arg4 + %arg7, %arg8 + %arg5 * 2, %arg6 + %arg9] : memref<1x8x112x112xf32, #map>
                affine.store %3, %alloc[%arg4 + %arg7, %arg8 + %arg5 * 2 + 1, %arg6 + %arg9 + 1] : memref<8x114x114xf32>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<8x112x112xf32>
    %0 = dataflow.aofs : tensor<1x2x14x!dataflow.stream<f32, 3584>>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<8x112x112xf32>
    affine.for %arg4 = 0 to 56 {
      affine.for %arg5 = 0 to 8 {
        affine.for %arg6 = 0 to 3 {
          affine.for %arg7 = 0 to 3 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 2 {
                affine.for %arg10 = 0 to 1 {
                  affine.for %arg11 = 0 to 1 {
                    affine.for %arg12 = 0 to 1 {
                      affine.for %arg13 = 0 to 14 {
                        %3 = affine.load %alloc[%arg5 + %arg10, %arg9 + %arg4 * 2 + %arg6 + %arg11, %arg13 + %arg8 * 14 + %arg7 + %arg12] : memref<8x114x114xf32>
                        %4 = affine.load %arg2[%arg5 + %arg10, %arg6 + %arg11, %arg7 + %arg12] : memref<8x3x3xf32>
                        affine.if #set(%arg6, %arg11, %arg7, %arg12) {
                          affine.store %cst_0, %alloc_2[%arg5 + %arg10, %arg9 + %arg4 * 2, %arg13 + %arg8 * 14] : memref<8x112x112xf32>
                        }
                        %5 = affine.load %alloc_2[%arg5 + %arg10, %arg9 + %arg4 * 2, %arg13 + %arg8 * 14] : memref<8x112x112xf32>
                        %6 = arith.mulf %3, %4 : f32
                        %7 = arith.addf %5, %6 : f32
                        affine.store %7, %alloc_2[%arg5 + %arg10, %arg9 + %arg4 * 2, %arg13 + %arg8 * 14] : memref<8x112x112xf32>
                        affine.if #set1(%arg6, %arg11, %arg7, %arg12) {
                          %8 = affine.load %alloc_2[%arg5 + %arg10, %arg9 + %arg4 * 2, %arg13 + %arg8 * 14] : memref<8x112x112xf32>
                          dataflow.aofs_write %0[%arg10, %arg9, %arg13], %8 {map = #map2} : tensor<1x2x14x!dataflow.stream<f32, 3584>>, f32
                        }
                      }
                    }
                  }
                }
              }
            } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
          }
        }
      }
    }
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x112x112xf32>
    %1 = dataflow.aofs : tensor<1x2x14x!dataflow.stream<f32, 3584>>
    affine.for %arg4 = 0 to 56 {
      affine.for %arg5 = 0 to 8 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                affine.for %arg10 = 0 to 14 {
                  affine.for %arg11 = 0 to 1 {
                    affine.if #set2(%arg7, %arg11) {
                      %8 = dataflow.aofs_read %0[%arg9, %arg8, %arg10] {map = #map2} : (tensor<1x2x14x!dataflow.stream<f32, 3584>>) -> f32
                      affine.store %8, %alloc_3[%arg5 + %arg9, %arg8 + %arg4 * 2, %arg10 + %arg6 * 14] : memref<8x112x112xf32>
                    }
                    %3 = affine.load %alloc_3[%arg5 + %arg9, %arg8 + %arg4 * 2, %arg10 + %arg6 * 14] : memref<8x112x112xf32>
                    %4 = affine.load %arg1[%arg7 + %arg11, %arg5 + %arg9, 0, 0] : memref<8x8x1x1xf32>
                    affine.if #set2(%arg5, %arg9) {
                      affine.store %cst_0, %alloc_4[%arg7 + %arg11, %arg8 + %arg4 * 2, %arg10 + %arg6 * 14] : memref<8x112x112xf32>
                    }
                    %5 = affine.load %alloc_4[%arg7 + %arg11, %arg8 + %arg4 * 2, %arg10 + %arg6 * 14] : memref<8x112x112xf32>
                    %6 = arith.mulf %3, %4 : f32
                    %7 = arith.addf %5, %6 : f32
                    affine.store %7, %alloc_4[%arg7 + %arg11, %arg8 + %arg4 * 2, %arg10 + %arg6 * 14] : memref<8x112x112xf32>
                    affine.if #set3(%arg5, %arg9) {
                      %8 = affine.load %alloc_4[%arg7 + %arg11, %arg8 + %arg4 * 2, %arg10 + %arg6 * 14] : memref<8x112x112xf32>
                      dataflow.aofs_write %1[%arg11, %arg8, %arg10], %8 {map = #map2} : tensor<1x2x14x!dataflow.stream<f32, 3584>>, f32
                    }
                  }
                }
              }
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    %2 = dataflow.aofs : tensor<1x2x14x!dataflow.stream<f32, 3584>>
    affine.for %arg4 = 0 to 56 {
      affine.for %arg5 = 0 to 8 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 14 {
              affine.for %arg9 = 0 to 1 {
                %3 = dataflow.aofs_read %1[%arg9, %arg7, %arg8] {map = #map2} : (tensor<1x2x14x!dataflow.stream<f32, 3584>>) -> f32
                %4 = arith.truncf %cst : f64 to f32
                %5 = arith.addf %4, %cst_1 : f32
                %6 = math.rsqrt %5 : f32
                %7 = arith.mulf %3, %6 : f32
                %8 = arith.addf %7, %cst_0 : f32
                %9 = arith.cmpf ugt, %8, %cst_0 : f32
                %10 = arith.select %9, %8, %cst_0 : f32
                dataflow.aofs_write %2[%arg9, %arg7, %arg8], %10 {map = #map2} : tensor<1x2x14x!dataflow.stream<f32, 3584>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 56 {
      affine.for %arg5 = 0 to 8 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 14 {
              affine.for %arg9 = 0 to 1 {
                %3 = dataflow.aofs_read %2[%arg9, %arg7, %arg8] {map = #map2} : (tensor<1x2x14x!dataflow.stream<f32, 3584>>) -> f32
                affine.store %3, %arg3[0, %arg6 + %arg9, %arg7 + %arg4 * 2, %arg8 + %arg5 * 14] : memref<1x8x112x112xf32, #map1>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
}

