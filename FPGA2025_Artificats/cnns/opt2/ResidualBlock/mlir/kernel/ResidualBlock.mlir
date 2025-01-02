#set = affine_set<(d0, d1, d2) : (d0 == 0, d1 == 0, d2 == 0)>
#set1 = affine_set<(d0, d1) : (d0 - 2 >= 0, d1 - 2 >= 0)>
#set2 = affine_set<(d0, d1, d2) : (d0 - 15 == 0, d1 - 2 == 0, d2 - 2 == 0)>
#set3 = affine_set<(d0, d1) : (d0 - 1 >= 0, d1 - 1 >= 0, -d0 + 56 >= 0, -d1 + 56 >= 0)>
module attributes {torch.debug_module_name = "ResidualBlock"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 50176>, %arg1: memref<1x16x56x56xf32>) {
    affine.for %arg2 = 0 to 56 {
      affine.for %arg3 = 0 to 56 {
        affine.for %arg4 = 0 to 16 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 50176>) -> f32
          affine.store %0, %arg1[0, %arg4, %arg2, %arg3] : memref<1x16x56x56xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node1(%arg0: memref<1x16x56x56xf32>, %arg1: !dataflow.stream<f32, 50176>, %arg2: !dataflow.stream<f32, 50176>, %arg3: f64, %arg4: f32, %arg5: f32) {
    affine.for %arg6 = 0 to 56 {
      affine.for %arg7 = 0 to 56 {
        affine.for %arg8 = 0 to 16 {
          %0 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 50176>) -> f32
          %1 = affine.load %arg0[0, %arg8, %arg6, %arg7] : memref<1x16x56x56xf32>
          %2 = arith.truncf %arg3 : f64 to f32
          %3 = arith.addf %2, %arg5 : f32
          %4 = math.rsqrt %3 : f32
          %5 = arith.mulf %0, %4 : f32
          %6 = arith.addf %5, %arg4 : f32
          %7 = arith.addf %6, %1 : f32
          %8 = arith.cmpf ugt, %7, %arg4 : f32
          %9 = arith.select %8, %7, %arg4 : f32
          dataflow.stream_write %arg2, %9 : <f32, 50176>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 53824>, %arg1: memref<16x16x3x3xf32>, %arg2: !dataflow.stream<f32, 50176>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16xf32>
    %alloc_0 = memref.alloc() : memref<16x58x58xf32>
    affine.for %arg4 = 0 to 58 {
      affine.for %arg5 = 0 to 58 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 3 {
            affine.for %arg8 = 0 to 3 {
              affine.for %arg9 = 0 to 16 {
                affine.if #set(%arg9, %arg7, %arg8) {
                  %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 53824>) -> f32
                  affine.store %0, %alloc_0[%arg6, %arg4, %arg5] : memref<16x58x58xf32>
                }
                affine.if #set1(%arg4, %arg5) {
                  %0 = affine.load %alloc_0[%arg6, %arg7 + %arg4 - 2, %arg8 + %arg5 - 2] : memref<16x58x58xf32>
                  %1 = affine.load %arg1[%arg9, %arg6, %arg7, %arg8] : memref<16x16x3x3xf32>
                  affine.if #set(%arg6, %arg7, %arg8) {
                    affine.store %arg3, %alloc[%arg9] : memref<16xf32>
                  }
                  %2 = affine.load %alloc[%arg9] : memref<16xf32>
                  %3 = arith.mulf %0, %1 : f32
                  %4 = arith.addf %2, %3 : f32
                  affine.store %4, %alloc[%arg9] : memref<16xf32>
                  affine.if #set2(%arg6, %arg7, %arg8) {
                    %5 = affine.load %alloc[%arg9] : memref<16xf32>
                    dataflow.stream_write %arg2, %5 : <f32, 50176>, f32
                  }
                }
              } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
            }
          }
        }
      }
    }
    return
  }
  func.func @node3(%arg0: !dataflow.stream<f32, 50176>, %arg1: !dataflow.stream<f32, 53824>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x58x58xf32>
    affine.for %arg3 = 0 to 58 {
      affine.for %arg4 = 0 to 58 {
        affine.for %arg5 = 0 to 16 {
          affine.store %arg2, %alloc[%arg5, %arg3, %arg4] : memref<16x58x58xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg3 = 0 to 58 {
      affine.for %arg4 = 0 to 58 {
        affine.for %arg5 = 0 to 16 {
          affine.if #set3(%arg3, %arg4) {
            %1 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 50176>) -> f32
            affine.store %1, %alloc[%arg5, %arg3, %arg4] : memref<16x58x58xf32>
          }
          %0 = affine.load %alloc[%arg5, %arg3, %arg4] : memref<16x58x58xf32>
          dataflow.stream_write %arg1, %0 : <f32, 53824>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node4(%arg0: !dataflow.stream<f32, 50176>, %arg1: !dataflow.stream<f32, 50176>, %arg2: f64, %arg3: f32, %arg4: f32) {
    affine.for %arg5 = 0 to 56 {
      affine.for %arg6 = 0 to 56 {
        affine.for %arg7 = 0 to 16 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 50176>) -> f32
          %1 = arith.truncf %arg2 : f64 to f32
          %2 = arith.addf %1, %arg3 : f32
          %3 = math.rsqrt %2 : f32
          %4 = arith.mulf %0, %3 : f32
          %5 = arith.addf %4, %arg4 : f32
          %6 = arith.cmpf ugt, %5, %arg4 : f32
          %7 = arith.select %6, %5, %arg4 : f32
          dataflow.stream_write %arg1, %7 : <f32, 50176>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node5(%arg0: memref<16x16x3x3xf32>, %arg1: !dataflow.stream<f32, 53824>, %arg2: !dataflow.stream<f32, 50176>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16xf32>
    %alloc_0 = memref.alloc() : memref<16x58x58xf32>
    affine.for %arg4 = 0 to 58 {
      affine.for %arg5 = 0 to 58 {
        affine.for %arg6 = 0 to 3 {
          affine.for %arg7 = 0 to 3 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 16 {
                affine.if #set(%arg9, %arg6, %arg7) {
                  %0 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 53824>) -> f32
                  affine.store %0, %alloc_0[%arg8, %arg4, %arg5] : memref<16x58x58xf32>
                }
                affine.if #set1(%arg4, %arg5) {
                  %0 = affine.load %alloc_0[%arg8, %arg6 + %arg4 - 2, %arg7 + %arg5 - 2] : memref<16x58x58xf32>
                  %1 = affine.load %arg0[%arg9, %arg8, %arg6, %arg7] : memref<16x16x3x3xf32>
                  affine.if #set(%arg8, %arg6, %arg7) {
                    affine.store %arg3, %alloc[%arg9] : memref<16xf32>
                  }
                  %2 = affine.load %alloc[%arg9] : memref<16xf32>
                  %3 = arith.mulf %0, %1 : f32
                  %4 = arith.addf %2, %3 : f32
                  affine.store %4, %alloc[%arg9] : memref<16xf32>
                  affine.if #set2(%arg8, %arg6, %arg7) {
                    %5 = affine.load %alloc[%arg9] : memref<16xf32>
                    dataflow.stream_write %arg2, %5 : <f32, 50176>, f32
                  }
                }
              } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
            }
          }
        }
      }
    }
    return
  }
  func.func @node6(%arg0: memref<1x16x56x56xf32>, %arg1: !dataflow.stream<f32, 53824>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x58x58xf32>
    affine.for %arg3 = 0 to 58 {
      affine.for %arg4 = 0 to 58 {
        affine.for %arg5 = 0 to 16 {
          affine.store %arg2, %alloc[%arg5, %arg3, %arg4] : memref<16x58x58xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg3 = 0 to 58 {
      affine.for %arg4 = 0 to 58 {
        affine.for %arg5 = 0 to 16 {
          affine.if #set3(%arg3, %arg4) {
            %1 = affine.load %arg0[0, %arg5, %arg3 - 1, %arg4 - 1] : memref<1x16x56x56xf32>
            affine.store %1, %alloc[%arg5, %arg3, %arg4] : memref<16x58x58xf32>
          }
          %0 = affine.load %alloc[%arg5, %arg3, %arg4] : memref<16x58x58xf32>
          dataflow.stream_write %arg1, %0 : <f32, 53824>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<1x16x56x56xf32>, %arg1: memref<16x16x3x3xf32>, %arg2: memref<16x16x3x3xf32>, %arg3: memref<1x16x56x56xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e-05 : f64
    %0 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    %1 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    %2 = dataflow.stream {depth = 53824 : i32} : <f32, 53824>
    %3 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    %4 = dataflow.stream {depth = 50176 : i32} : <f32, 50176>
    %5 = dataflow.stream {depth = 53824 : i32} : <f32, 53824>
    call @node6(%arg0, %5, %cst_0) : (memref<1x16x56x56xf32>, !dataflow.stream<f32, 53824>, f32) -> ()
    call @node5(%arg1, %5, %4, %cst_0) : (memref<16x16x3x3xf32>, !dataflow.stream<f32, 53824>, !dataflow.stream<f32, 50176>, f32) -> ()
    call @node4(%4, %3, %cst_1, %cst, %cst_0) : (!dataflow.stream<f32, 50176>, !dataflow.stream<f32, 50176>, f64, f32, f32) -> ()
    call @node3(%3, %2, %cst_0) : (!dataflow.stream<f32, 50176>, !dataflow.stream<f32, 53824>, f32) -> ()
    call @node2(%2, %arg2, %1, %cst_0) : (!dataflow.stream<f32, 53824>, memref<16x16x3x3xf32>, !dataflow.stream<f32, 50176>, f32) -> ()
    call @node1(%arg0, %1, %0, %cst_1, %cst_0, %cst) : (memref<1x16x56x56xf32>, !dataflow.stream<f32, 50176>, !dataflow.stream<f32, 50176>, f64, f32, f32) -> ()
    call @node0(%0, %arg3) : (!dataflow.stream<f32, 50176>, memref<1x16x56x56xf32>) -> ()
    return
  }
}

