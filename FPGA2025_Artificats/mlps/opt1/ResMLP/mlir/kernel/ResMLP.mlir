#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 255 == 0)>
#set2 = affine_set<(d0) : (d0 - 511 == 0)>
#set3 = affine_set<(d0) : (d0 - 1023 == 0)>
module attributes {torch.debug_module_name = "ResMLP"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 80>, %arg1: memref<8x10xf32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 10 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 80>) -> f32
        affine.store %0, %arg1[%arg2, %arg3] : memref<8x10xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 80>, %arg1: memref<10xf32>, %arg2: !dataflow.stream<f32, 80>) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 10 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 80>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<10xf32>
        %2 = arith.addf %0, %1 : f32
        dataflow.stream_write %arg2, %2 : <f32, 80>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 2560>, %arg1: !dataflow.stream<f32, 2048>, %arg2: !dataflow.stream<f32, 80>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x10xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x10xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x256xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 10 {
        affine.for %arg6 = 0 to 256 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 2048>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg6] : memref<8x256xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg6] : memref<8x256xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 2560>) -> f32
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<256x10xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<256x10xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<8x10xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<8x10xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<8x10xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<8x10xf32>
            dataflow.stream_write %arg2, %5 : <f32, 80>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<10x256xf32>, %arg1: !dataflow.stream<f32, 2560>) {
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 256 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<10x256xf32>
        dataflow.stream_write %arg1, %0 : <f32, 2560>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: !dataflow.stream<f32, 2048>, %arg1: memref<256xf32>, %arg2: !dataflow.stream<f32, 2048>) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 256 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 2048>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<256xf32>
        %2 = arith.addf %0, %1 : f32
        dataflow.stream_write %arg2, %2 : <f32, 2048>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: !dataflow.stream<f32, 4096>, %arg1: !dataflow.stream<f32, 131072>, %arg2: !dataflow.stream<f32, 2048>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<512x256xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 256 {
        affine.for %arg6 = 0 to 512 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg6] : memref<8x512xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg6] : memref<8x512xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 131072>) -> f32
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<512x256xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<512x256xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<8x256xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<8x256xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<8x256xf32>
          affine.if #set2(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<8x256xf32>
            dataflow.stream_write %arg2, %5 : <f32, 2048>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x512xf32>, %arg1: !dataflow.stream<f32, 131072>) {
    affine.for %arg2 = 0 to 256 {
      affine.for %arg3 = 0 to 512 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        dataflow.stream_write %arg1, %0 : <f32, 131072>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<512xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: !dataflow.stream<f32, 4096>, %arg4: f32) {
    affine.for %arg5 = 0 to 8 {
      affine.for %arg6 = 0 to 512 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
        %1 = affine.load %arg1[%arg6] : memref<512xf32>
        %2 = dataflow.stream_read %arg2 : (!dataflow.stream<f32, 4096>) -> f32
        %3 = arith.addf %0, %1 : f32
        %4 = arith.addf %3, %2 : f32
        %5 = arith.cmpf ugt, %4, %arg4 : f32
        %6 = arith.select %5, %4, %arg4 : f32
        dataflow.stream_write %arg3, %6 : <f32, 4096>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node8(%arg0: !dataflow.stream<f32, 262144>, %arg1: !dataflow.stream<f32, 4096>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<512x512xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 512 {
        affine.for %arg6 = 0 to 512 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg6] : memref<8x512xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg6] : memref<8x512xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 262144>) -> f32
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<512x512xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<512x512xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<8x512xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<8x512xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<8x512xf32>
          affine.if #set2(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<8x512xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: memref<512x512xf32>, %arg1: !dataflow.stream<f32, 262144>) {
    affine.for %arg2 = 0 to 512 {
      affine.for %arg3 = 0 to 512 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<512x512xf32>
        dataflow.stream_write %arg1, %0 : <f32, 262144>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node10(%arg0: !dataflow.stream<f32, 4096>, %arg1: !dataflow.stream<f32, 4096>, %arg2: f32) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 512 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
        %1 = arith.cmpf ugt, %0, %arg2 : f32
        %2 = arith.select %1, %0, %arg2 : f32
        dataflow.stream_write %arg1, %2 : <f32, 4096>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node11(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<512xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: !dataflow.stream<f32, 4096>) {
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 512 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<512xf32>
        %2 = arith.addf %0, %1 : f32
        dataflow.stream_write %arg2, %2 : <f32, 4096>, f32
        dataflow.stream_write %arg3, %2 : <f32, 4096>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node12(%arg0: memref<8x1024xf32>, %arg1: !dataflow.stream<f32, 524288>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x512xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1024x512xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 512 {
        affine.for %arg6 = 0 to 1024 {
          %0 = affine.load %arg0[%arg4, %arg6] : memref<8x1024xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 524288>) -> f32
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<1024x512xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<1024x512xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<8x512xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<8x512xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<8x512xf32>
          affine.if #set3(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<8x512xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node13(%arg0: memref<512x1024xf32>, %arg1: !dataflow.stream<f32, 524288>) {
    affine.for %arg2 = 0 to 512 {
      affine.for %arg3 = 0 to 1024 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<512x1024xf32>
        dataflow.stream_write %arg1, %0 : <f32, 524288>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<8x1024xf32>, %arg1: memref<512xf32>, %arg2: memref<512x1024xf32>, %arg3: memref<512xf32>, %arg4: memref<512x512xf32>, %arg5: memref<256xf32>, %arg6: memref<256x512xf32>, %arg7: memref<10xf32>, %arg8: memref<10x256xf32>, %arg9: memref<8x10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 80 : i32} : <f32, 80>
    %1 = dataflow.stream {depth = 80 : i32} : <f32, 80>
    %2 = dataflow.stream {depth = 2560 : i32} : <f32, 2560>
    %3 = dataflow.stream {depth = 2048 : i32} : <f32, 2048>
    %4 = dataflow.stream {depth = 2048 : i32} : <f32, 2048>
    %5 = dataflow.stream {depth = 131072 : i32} : <f32, 131072>
    %6 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %7 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %8 = dataflow.stream {depth = 262144 : i32} : <f32, 262144>
    %9 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %10 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %11 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %12 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %13 = dataflow.stream {depth = 524288 : i32} : <f32, 524288>
    call @node13(%arg2, %13) : (memref<512x1024xf32>, !dataflow.stream<f32, 524288>) -> ()
    call @node12(%arg0, %13, %12, %cst) : (memref<8x1024xf32>, !dataflow.stream<f32, 524288>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node11(%12, %arg1, %11, %10) : (!dataflow.stream<f32, 4096>, memref<512xf32>, !dataflow.stream<f32, 4096>, !dataflow.stream<f32, 4096>) -> ()
    call @node10(%11, %9, %cst) : (!dataflow.stream<f32, 4096>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node9(%arg4, %8) : (memref<512x512xf32>, !dataflow.stream<f32, 262144>) -> ()
    call @node8(%8, %9, %7, %cst) : (!dataflow.stream<f32, 262144>, !dataflow.stream<f32, 4096>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node7(%7, %arg3, %10, %6, %cst) : (!dataflow.stream<f32, 4096>, memref<512xf32>, !dataflow.stream<f32, 4096>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node6(%arg6, %5) : (memref<256x512xf32>, !dataflow.stream<f32, 131072>) -> ()
    call @node5(%6, %5, %4, %cst) : (!dataflow.stream<f32, 4096>, !dataflow.stream<f32, 131072>, !dataflow.stream<f32, 2048>, f32) -> ()
    call @node4(%4, %arg5, %3) : (!dataflow.stream<f32, 2048>, memref<256xf32>, !dataflow.stream<f32, 2048>) -> ()
    call @node3(%arg8, %2) : (memref<10x256xf32>, !dataflow.stream<f32, 2560>) -> ()
    call @node2(%2, %3, %1, %cst) : (!dataflow.stream<f32, 2560>, !dataflow.stream<f32, 2048>, !dataflow.stream<f32, 80>, f32) -> ()
    call @node1(%1, %arg7, %0) : (!dataflow.stream<f32, 80>, memref<10xf32>, !dataflow.stream<f32, 80>) -> ()
    call @node0(%0, %arg9) : (!dataflow.stream<f32, 80>, memref<8x10xf32>) -> ()
    return
  }
}

