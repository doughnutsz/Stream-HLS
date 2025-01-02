#set = affine_set<(d0, d1) : (d0 == 0, d1 == 0)>
#set1 = affine_set<(d0, d1) : (d0 - 2 == 0, d1 - 2 == 0)>
#set2 = affine_set<(d0) : (d0 == 0)>
#set3 = affine_set<(d0) : (d0 - 7 == 0)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  func.func @forward(%arg0: memref<1x8x112x112xf32>, %arg1: memref<8x8x1x1xf32>, %arg2: memref<8x3x3xf32>, %arg3: memref<1x8x112x112xf32>) {
    %cst = arith.constant 1.000000e-05 : f64
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x114x114xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 114 {
        affine.for %arg6 = 0 to 114 {
          affine.store %cst_0, %alloc[%arg4, %arg5, %arg6] : memref<8x114x114xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 112 {
          %3 = affine.load %arg0[0, %arg4, %arg5, %arg6] : memref<1x8x112x112xf32>
          affine.store %3, %alloc[%arg4, symbol(%arg5) + 1, symbol(%arg6) + 1] : memref<8x114x114xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<8x112x112xf32>
    %0 = dataflow.stream {depth = 100352 : i32} : <f32, 100352>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<8x112x112xf32>
    affine.for %arg4 = 0 to 112 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 3 {
            affine.for %arg8 = 0 to 3 {
              %3 = affine.load %alloc[%arg6, %arg4 + %arg7, %arg5 + %arg8] : memref<8x114x114xf32>
              %4 = affine.load %arg2[%arg6, %arg7, %arg8] : memref<8x3x3xf32>
              affine.if #set(%arg7, %arg8) {
                affine.store %cst_0, %alloc_2[%arg6, %arg4, %arg5] : memref<8x112x112xf32>
              }
              %5 = affine.load %alloc_2[%arg6, %arg4, %arg5] : memref<8x112x112xf32>
              %6 = arith.mulf %3, %4 : f32
              %7 = arith.addf %5, %6 : f32
              affine.store %7, %alloc_2[%arg6, %arg4, %arg5] : memref<8x112x112xf32>
              affine.if #set1(%arg7, %arg8) {
                %8 = affine.load %alloc_2[%arg6, %arg4, %arg5] : memref<8x112x112xf32>
                dataflow.stream_write %0, %8 : <f32, 100352>, f32
              }
            } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
          }
        }
      }
    }
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x112x112xf32>
    %1 = dataflow.stream {depth = 100352 : i32} : <f32, 100352>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 112 {
          affine.for %arg7 = 0 to 8 {
            affine.if #set2(%arg4) {
              %8 = dataflow.stream_read %0 : (!dataflow.stream<f32, 100352>) -> f32
              affine.store %8, %alloc_3[%arg7, %arg5, %arg6] : memref<8x112x112xf32>
            }
            %3 = affine.load %alloc_3[%arg7, %arg5, %arg6] : memref<8x112x112xf32>
            %4 = affine.load %arg1[%arg4, %arg7, 0, 0] : memref<8x8x1x1xf32>
            affine.if #set2(%arg7) {
              affine.store %cst_0, %alloc_4[%arg4, %arg5, %arg6] : memref<8x112x112xf32>
            }
            %5 = affine.load %alloc_4[%arg4, %arg5, %arg6] : memref<8x112x112xf32>
            %6 = arith.mulf %3, %4 : f32
            %7 = arith.addf %5, %6 : f32
            affine.store %7, %alloc_4[%arg4, %arg5, %arg6] : memref<8x112x112xf32>
            affine.if #set3(%arg7) {
              %8 = affine.load %alloc_4[%arg4, %arg5, %arg6] : memref<8x112x112xf32>
              dataflow.stream_write %1, %8 : <f32, 100352>, f32
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    %2 = dataflow.stream {depth = 100352 : i32} : <f32, 100352>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 112 {
          %3 = dataflow.stream_read %1 : (!dataflow.stream<f32, 100352>) -> f32
          %4 = arith.truncf %cst : f64 to f32
          %5 = arith.addf %4, %cst_1 : f32
          %6 = math.rsqrt %5 : f32
          %7 = arith.mulf %3, %6 : f32
          %8 = arith.addf %7, %cst_0 : f32
          %9 = arith.cmpf ugt, %8, %cst_0 : f32
          %10 = arith.select %9, %8, %cst_0 : f32
          dataflow.stream_write %2, %10 : <f32, 100352>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 112 {
          %3 = dataflow.stream_read %2 : (!dataflow.stream<f32, 100352>) -> f32
          affine.store %3, %arg3[0, %arg4, %arg5, %arg6] : memref<1x8x112x112xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
}

