#set = affine_set<(d0, d1, d2) : (d0 == 0, d1 == 0, d2 == 0)>
#set1 = affine_set<(d0, d1, d2) : (d0 - 15 == 0, d1 - 2 == 0, d2 - 2 == 0)>
module attributes {torch.debug_module_name = "ResidualBlock"} {
  func.func @forward(%arg0: memref<1x16x56x56xf32>, %arg1: memref<16x16x3x3xf32>, %arg2: memref<16x16x3x3xf32>, %arg3: memref<1x16x56x56xf32>) {
    %cst = arith.constant 1.000000e-05 : f64
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x58x58xf32>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 58 {
        affine.for %arg6 = 0 to 58 {
          affine.store %cst_0, %alloc[%arg4, %arg5, %arg6] : memref<16x58x58xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          %4 = affine.load %arg0[0, %arg4, %arg5, %arg6] : memref<1x16x56x56xf32>
          affine.store %4, %alloc[%arg4, symbol(%arg5) + 1, symbol(%arg6) + 1] : memref<16x58x58xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<16x56x56xf32>
    %0 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          affine.for %arg7 = 0 to 16 {
            affine.for %arg8 = 0 to 3 {
              affine.for %arg9 = 0 to 3 {
                %4 = affine.load %alloc[%arg7, %arg5 + %arg8, %arg6 + %arg9] : memref<16x58x58xf32>
                %5 = affine.load %arg1[%arg4, %arg7, %arg8, %arg9] : memref<16x16x3x3xf32>
                affine.if #set(%arg7, %arg8, %arg9) {
                  affine.store %cst_0, %alloc_2[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                }
                %6 = affine.load %alloc_2[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                %7 = arith.mulf %4, %5 : f32
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %alloc_2[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                affine.if #set1(%arg7, %arg8, %arg9) {
                  %9 = affine.load %alloc_2[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                  dataflow.stream_write %0, %9 : <f32, 50176>, f32
                }
              } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
            }
          }
        }
      }
    }
    %1 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          %4 = dataflow.stream_read %0 : (!dataflow.stream<f32, 50176>) -> f32
          %5 = arith.truncf %cst : f64 to f32
          %6 = arith.addf %5, %cst_1 : f32
          %7 = math.rsqrt %6 : f32
          %8 = arith.mulf %4, %7 : f32
          %9 = arith.addf %8, %cst_0 : f32
          %10 = arith.cmpf ugt, %9, %cst_0 : f32
          %11 = arith.select %10, %9, %cst_0 : f32
          dataflow.stream_write %1, %11 : <f32, 50176>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<16x58x58xf32>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 58 {
        affine.for %arg6 = 0 to 58 {
          affine.store %cst_0, %alloc_3[%arg4, %arg5, %arg6] : memref<16x58x58xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          %4 = dataflow.stream_read %1 : (!dataflow.stream<f32, 50176>) -> f32
          affine.store %4, %alloc_3[%arg4, symbol(%arg5) + 1, symbol(%arg6) + 1] : memref<16x58x58xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<16x56x56xf32>
    %2 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          affine.for %arg7 = 0 to 16 {
            affine.for %arg8 = 0 to 3 {
              affine.for %arg9 = 0 to 3 {
                %4 = affine.load %alloc_3[%arg7, %arg5 + %arg8, %arg6 + %arg9] : memref<16x58x58xf32>
                %5 = affine.load %arg2[%arg4, %arg7, %arg8, %arg9] : memref<16x16x3x3xf32>
                affine.if #set(%arg7, %arg8, %arg9) {
                  affine.store %cst_0, %alloc_4[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                }
                %6 = affine.load %alloc_4[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                %7 = arith.mulf %4, %5 : f32
                %8 = arith.addf %6, %7 : f32
                affine.store %8, %alloc_4[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                affine.if #set1(%arg7, %arg8, %arg9) {
                  %9 = affine.load %alloc_4[%arg4, %arg5, %arg6] : memref<16x56x56xf32>
                  dataflow.stream_write %2, %9 : <f32, 50176>, f32
                }
              } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
            }
          }
        }
      }
    }
    %3 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          %4 = dataflow.stream_read %2 : (!dataflow.stream<f32, 50176>) -> f32
          %5 = affine.load %arg0[0, %arg4, %arg5, %arg6] : memref<1x16x56x56xf32>
          %6 = arith.truncf %cst : f64 to f32
          %7 = arith.addf %6, %cst_1 : f32
          %8 = math.rsqrt %7 : f32
          %9 = arith.mulf %4, %8 : f32
          %10 = arith.addf %9, %cst_0 : f32
          %11 = arith.addf %10, %5 : f32
          %12 = arith.cmpf ugt, %11, %cst_0 : f32
          %13 = arith.select %12, %11, %cst_0 : f32
          dataflow.stream_write %3, %13 : <f32, 50176>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 56 {
        affine.for %arg6 = 0 to 56 {
          %4 = dataflow.stream_read %3 : (!dataflow.stream<f32, 50176>) -> f32
          affine.store %4, %arg3[0, %arg4, %arg5, %arg6] : memref<1x16x56x56xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
}

