#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 7 == 0)>
#set2 = affine_set<(d0, d1) : (d0 == 0, d1 == 0)>
#set3 = affine_set<(d0, d1) : (d0 - 2 >= 0, d1 - 2 >= 0)>
#set4 = affine_set<(d0, d1) : (d0 - 2 == 0, d1 - 2 == 0)>
#set5 = affine_set<(d0, d1) : (d0 - 1 >= 0, d1 - 1 >= 0, -d0 + 112 >= 0, -d1 + 112 >= 0)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 100352>, %arg1: memref<1x8x112x112xf32>) {
    affine.for %arg2 = 0 to 112 {
      affine.for %arg3 = 0 to 112 {
        affine.for %arg4 = 0 to 8 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 100352>) -> f32
          affine.store %0, %arg1[0, %arg4, %arg3, %arg2] : memref<1x8x112x112xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 100352>, %arg1: !dataflow.stream<f32, 100352>, %arg2: f64, %arg3: f32, %arg4: f32) {
    affine.for %arg5 = 0 to 112 {
      affine.for %arg6 = 0 to 112 {
        affine.for %arg7 = 0 to 8 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 100352>) -> f32
          %1 = arith.truncf %arg2 : f64 to f32
          %2 = arith.addf %1, %arg3 : f32
          %3 = math.rsqrt %2 : f32
          %4 = arith.mulf %0, %3 : f32
          %5 = arith.addf %4, %arg4 : f32
          %6 = arith.cmpf ugt, %5, %arg4 : f32
          %7 = arith.select %6, %5, %arg4 : f32
          dataflow.stream_write %arg1, %7 : <f32, 100352>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 100352>, %arg1: memref<8x8x1x1xf32>, %arg2: !dataflow.stream<f32, 100352>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<f32>
    affine.for %arg4 = 0 to 112 {
      affine.for %arg5 = 0 to 112 {
        affine.for %arg6 = 0 to 8 {
          affine.for %arg7 = 0 to 8 {
            affine.if #set(%arg7) {
              %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 100352>) -> f32
              affine.store %5, %alloc_0[] : memref<f32>
            }
            %0 = affine.load %alloc_0[] : memref<f32>
            %1 = affine.load %arg1[%arg7, %arg6, 0, 0] : memref<8x8x1x1xf32>
            affine.if #set(%arg6) {
              affine.store %arg3, %alloc[%arg7] : memref<8xf32>
            }
            %2 = affine.load %alloc[%arg7] : memref<8xf32>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7] : memref<8xf32>
            affine.if #set1(%arg6) {
              %5 = affine.load %alloc[%arg7] : memref<8xf32>
              dataflow.stream_write %arg2, %5 : <f32, 100352>, f32
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    return
  }
  func.func @node3(%arg0: memref<8x3x3xf32>, %arg1: !dataflow.stream<f32, 103968>, %arg2: !dataflow.stream<f32, 100352>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    %alloc_0 = memref.alloc() : memref<8x114x114xf32>
    affine.for %arg4 = 0 to 114 {
      affine.for %arg5 = 0 to 114 {
        affine.for %arg6 = 0 to 3 {
          affine.for %arg7 = 0 to 3 {
            affine.for %arg8 = 0 to 8 {
              affine.if #set2(%arg7, %arg6) {
                %0 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 103968>) -> f32
                affine.store %0, %alloc_0[%arg8, %arg5, %arg4] : memref<8x114x114xf32>
              }
              affine.if #set3(%arg5, %arg4) {
                %0 = affine.load %alloc_0[%arg8, %arg7 + %arg5 - 2, %arg6 + %arg4 - 2] : memref<8x114x114xf32>
                %1 = affine.load %arg0[%arg8, %arg7, %arg6] : memref<8x3x3xf32>
                affine.if #set2(%arg7, %arg6) {
                  affine.store %arg3, %alloc[%arg8] : memref<8xf32>
                }
                %2 = affine.load %alloc[%arg8] : memref<8xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg8] : memref<8xf32>
                affine.if #set4(%arg7, %arg6) {
                  %5 = affine.load %alloc[%arg8] : memref<8xf32>
                  dataflow.stream_write %arg2, %5 : <f32, 100352>, f32
                }
              }
            } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
          }
        }
      }
    }
    return
  }
  func.func @node4(%arg0: memref<1x8x112x112xf32>, %arg1: !dataflow.stream<f32, 103968>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x114x114xf32>
    affine.for %arg3 = 0 to 114 {
      affine.for %arg4 = 0 to 114 {
        affine.for %arg5 = 0 to 8 {
          affine.store %arg2, %alloc[%arg5, %arg4, %arg3] : memref<8x114x114xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg3 = 0 to 114 {
      affine.for %arg4 = 0 to 114 {
        affine.for %arg5 = 0 to 8 {
          affine.if #set5(%arg4, %arg3) {
            %1 = affine.load %arg0[0, %arg5, %arg4 - 1, %arg3 - 1] : memref<1x8x112x112xf32>
            affine.store %1, %alloc[%arg5, %arg4, %arg3] : memref<8x114x114xf32>
          }
          %0 = affine.load %alloc[%arg5, %arg4, %arg3] : memref<8x114x114xf32>
          dataflow.stream_write %arg1, %0 : <f32, 103968>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<1x8x112x112xf32>, %arg1: memref<8x8x1x1xf32>, %arg2: memref<8x3x3xf32>, %arg3: memref<1x8x112x112xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e-05 : f64
    %0 = dataflow.stream {depth = 100352 : i32} : <f32, 100352>
    %1 = dataflow.stream {depth = 100352 : i32} : <f32, 100352>
    %2 = dataflow.stream {depth = 100352 : i32} : <f32, 100352>
    %3 = dataflow.stream {depth = 103968 : i32} : <f32, 103968>
    call @node4(%arg0, %3, %cst_0) : (memref<1x8x112x112xf32>, !dataflow.stream<f32, 103968>, f32) -> ()
    call @node3(%arg2, %3, %2, %cst_0) : (memref<8x3x3xf32>, !dataflow.stream<f32, 103968>, !dataflow.stream<f32, 100352>, f32) -> ()
    call @node2(%2, %arg1, %1, %cst_0) : (!dataflow.stream<f32, 100352>, memref<8x8x1x1xf32>, !dataflow.stream<f32, 100352>, f32) -> ()
    call @node1(%1, %0, %cst_1, %cst, %cst_0) : (!dataflow.stream<f32, 100352>, !dataflow.stream<f32, 100352>, f64, f32, f32) -> ()
    call @node0(%0, %arg3) : (!dataflow.stream<f32, 100352>, memref<1x8x112x112xf32>) -> ()
    return
  }
}

