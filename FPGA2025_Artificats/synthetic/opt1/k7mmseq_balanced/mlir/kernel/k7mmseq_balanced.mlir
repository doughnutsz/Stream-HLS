#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 63 == 0)>
module attributes {torch.debug_module_name = "k7mmseq"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>) {
    affine.for %arg2 = 0 to 64 {
      affine.for %arg3 = 0 to 64 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
        affine.store %0, %arg1[%arg2, %arg3] : memref<64x64xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node4(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node5(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node7(%arg0: memref<64x64xf32>, %arg1: memref<64x64xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          %0 = affine.load %arg0[%arg4, %arg6] : memref<64x64xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<64x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<64x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<64x64xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<64x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<64x64xf32>, %arg1: memref<64x64xf32>, %arg2: memref<64x64xf32>, %arg3: memref<64x64xf32>, %arg4: memref<64x64xf32>, %arg5: memref<64x64xf32>, %arg6: memref<64x64xf32>, %arg7: memref<64x64xf32>, %arg8: memref<64x64xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %1 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %2 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %3 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %4 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %5 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %6 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    call @node7(%arg0, %arg1, %6, %cst) : (memref<64x64xf32>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node6(%6, %arg2, %5, %cst) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node5(%5, %arg3, %4, %cst) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node4(%4, %arg4, %3, %cst) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node3(%3, %arg5, %2, %cst) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node2(%2, %arg6, %1, %cst) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node1(%1, %arg7, %0, %cst) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node0(%0, %arg8) : (!dataflow.stream<f32, 4096>, memref<64x64xf32>) -> ()
    return
  }
}

