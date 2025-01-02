#map = affine_map<(d0, d1, d2, d3) -> (0, d1 mod 2, d2 mod 2, 0, d0, d1 floordiv 2, d2 floordiv 2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, d1 mod 2, d2 mod 2, d3 mod 7, d0, d1 floordiv 2, d2 floordiv 2, d3 floordiv 7)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#set = affine_set<(d0, d1, d2, d3, d4, d5) : (d0 + d1 * 2 == 0, d2 + d3 == 0, d4 + d5 == 0)>
#set1 = affine_set<(d0, d1, d2, d3, d4, d5) : (d0 + d1 * 2 - 15 == 0, d2 + d3 - 2 == 0, d4 + d5 - 2 == 0)>
module attributes {torch.debug_module_name = "ResidualBlock"} {
  func.func @forward(%arg0: memref<1x16x56x56xf32, #map>, %arg1: memref<16x16x3x3xf32>, %arg2: memref<16x16x3x3xf32>, %arg3: memref<1x16x56x56xf32, #map1>) {
    %cst = arith.constant 1.000000e-05 : f64
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x58x58xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 29 {
        affine.for %arg6 = 0 to 58 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                affine.store %cst_0, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 2, %arg6 + %arg9] : memref<16x58x58xf32>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 56 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                %4 = affine.load %arg0[0, %arg7 + %arg4 * 2, %arg8 + %arg5 * 2, %arg6 + %arg9] : memref<1x16x56x56xf32, #map>
                affine.store %4, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 2 + 1, %arg6 + %arg9 + 1] : memref<16x58x58xf32>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<16x56x56xf32>
    %0 = dataflow.aofs : tensor<2x2x1x!dataflow.stream<f32, 12544>>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 56 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 3 {
              affine.for %arg9 = 0 to 3 {
                affine.for %arg10 = 0 to 2 {
                  affine.for %arg11 = 0 to 2 {
                    affine.for %arg12 = 0 to 1 {
                      affine.for %arg13 = 0 to 2 {
                        affine.for %arg14 = 0 to 1 {
                          affine.for %arg15 = 0 to 1 {
                            %4 = affine.load %alloc[%arg13 + %arg7 * 2, %arg11 + %arg5 * 2 + %arg8 + %arg14, %arg6 + %arg12 + %arg9 + %arg15] : memref<16x58x58xf32>
                            %5 = affine.load %arg1[%arg10 + %arg4 * 2, %arg13 + %arg7 * 2, %arg8 + %arg14, %arg9 + %arg15] : memref<16x16x3x3xf32>
                            affine.if #set(%arg13, %arg7, %arg8, %arg14, %arg9, %arg15) {
                              affine.store %cst_0, %alloc_2[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg6 + %arg12] : memref<16x56x56xf32>
                            }
                            %6 = affine.load %alloc_2[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg6 + %arg12] : memref<16x56x56xf32>
                            %7 = arith.mulf %4, %5 : f32
                            %8 = arith.addf %6, %7 : f32
                            affine.store %8, %alloc_2[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg6 + %arg12] : memref<16x56x56xf32>
                            affine.if #set1(%arg13, %arg7, %arg8, %arg14, %arg9, %arg15) {
                              %9 = affine.load %alloc_2[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg6 + %arg12] : memref<16x56x56xf32>
                              dataflow.aofs_write %0[%arg10, %arg11, %arg12], %9 {map = #map2} : tensor<2x2x1x!dataflow.stream<f32, 12544>>, f32
                            }
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
    }
    %1 = dataflow.aofs : tensor<2x2x1x!dataflow.stream<f32, 12544>>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 56 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                %4 = dataflow.aofs_read %0[%arg7, %arg8, %arg9] {map = #map2} : (tensor<2x2x1x!dataflow.stream<f32, 12544>>) -> f32
                %5 = arith.truncf %cst : f64 to f32
                %6 = arith.addf %5, %cst_1 : f32
                %7 = math.rsqrt %6 : f32
                %8 = arith.mulf %4, %7 : f32
                %9 = arith.addf %8, %cst_0 : f32
                %10 = arith.cmpf ugt, %9, %cst_0 : f32
                %11 = arith.select %10, %9, %cst_0 : f32
                dataflow.aofs_write %1[%arg7, %arg8, %arg9], %11 {map = #map2} : tensor<2x2x1x!dataflow.stream<f32, 12544>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<16x58x58xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 29 {
        affine.for %arg6 = 0 to 58 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                affine.store %cst_0, %alloc_3[%arg7 + %arg4 * 2, %arg8 + %arg5 * 2, %arg6 + %arg9] : memref<16x58x58xf32>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 56 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 1 {
                %4 = dataflow.aofs_read %1[%arg7, %arg8, %arg9] {map = #map2} : (tensor<2x2x1x!dataflow.stream<f32, 12544>>) -> f32
                affine.store %4, %alloc_3[%arg7 + %arg4 * 2, %arg8 + %arg5 * 2 + 1, %arg6 + %arg9 + 1] : memref<16x58x58xf32>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<16x56x56xf32>
    %2 = dataflow.aofs : tensor<2x2x7x!dataflow.stream<f32, 1792>>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 8 {
            affine.for %arg8 = 0 to 3 {
              affine.for %arg9 = 0 to 3 {
                affine.for %arg10 = 0 to 2 {
                  affine.for %arg11 = 0 to 2 {
                    affine.for %arg12 = 0 to 7 {
                      affine.for %arg13 = 0 to 2 {
                        affine.for %arg14 = 0 to 1 {
                          affine.for %arg15 = 0 to 1 {
                            %4 = affine.load %alloc_3[%arg13 + %arg7 * 2, %arg11 + %arg5 * 2 + %arg8 + %arg14, %arg12 + %arg6 * 7 + %arg9 + %arg15] : memref<16x58x58xf32>
                            %5 = affine.load %arg2[%arg10 + %arg4 * 2, %arg13 + %arg7 * 2, %arg8 + %arg14, %arg9 + %arg15] : memref<16x16x3x3xf32>
                            affine.if #set(%arg13, %arg7, %arg8, %arg14, %arg9, %arg15) {
                              affine.store %cst_0, %alloc_4[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg12 + %arg6 * 7] : memref<16x56x56xf32>
                            }
                            %6 = affine.load %alloc_4[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg12 + %arg6 * 7] : memref<16x56x56xf32>
                            %7 = arith.mulf %4, %5 : f32
                            %8 = arith.addf %6, %7 : f32
                            affine.store %8, %alloc_4[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg12 + %arg6 * 7] : memref<16x56x56xf32>
                            affine.if #set1(%arg13, %arg7, %arg8, %arg14, %arg9, %arg15) {
                              %9 = affine.load %alloc_4[%arg10 + %arg4 * 2, %arg11 + %arg5 * 2, %arg12 + %arg6 * 7] : memref<16x56x56xf32>
                              dataflow.aofs_write %2[%arg10, %arg11, %arg12], %9 {map = #map2} : tensor<2x2x7x!dataflow.stream<f32, 1792>>, f32
                            }
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
    }
    %3 = dataflow.aofs : tensor<2x2x7x!dataflow.stream<f32, 1792>>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 7 {
                %4 = dataflow.aofs_read %2[%arg7, %arg8, %arg9] {map = #map2} : (tensor<2x2x7x!dataflow.stream<f32, 1792>>) -> f32
                %5 = affine.load %arg0[0, %arg7 + %arg4 * 2, %arg8 + %arg5 * 2, %arg9 + %arg6 * 7] : memref<1x16x56x56xf32, #map>
                %6 = arith.truncf %cst : f64 to f32
                %7 = arith.addf %6, %cst_1 : f32
                %8 = math.rsqrt %7 : f32
                %9 = arith.mulf %4, %8 : f32
                %10 = arith.addf %9, %cst_0 : f32
                %11 = arith.addf %10, %5 : f32
                %12 = arith.cmpf ugt, %11, %cst_0 : f32
                %13 = arith.select %12, %11, %cst_0 : f32
                dataflow.aofs_write %3[%arg7, %arg8, %arg9], %13 {map = #map2} : tensor<2x2x7x!dataflow.stream<f32, 1792>>, f32
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 28 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 2 {
              affine.for %arg9 = 0 to 7 {
                %4 = dataflow.aofs_read %3[%arg7, %arg8, %arg9] {map = #map2} : (tensor<2x2x7x!dataflow.stream<f32, 1792>>) -> f32
                affine.store %4, %arg3[0, %arg7 + %arg4 * 2, %arg8 + %arg5 * 2, %arg9 + %arg6 * 7] : memref<1x16x56x56xf32, #map1>
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
}

