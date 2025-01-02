#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 255 == 0)>
#set2 = affine_set<(d0) : (d0 - 127 == 0)>
#set3 = affine_set<(d0) : (d0 - 63 == 0)>
#set4 = affine_set<(d0) : (d0 - 783 == 0)>
module attributes {torch.debug_module_name = "Autoencoder"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 25088>, %arg1: memref<32x784xf32>) {
    affine.for %arg2 = 0 to 32 {
      affine.for %arg3 = 0 to 784 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 25088>) -> f32
        affine.store %0, %arg1[%arg2, %arg3] : memref<32x784xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 25088>, %arg1: memref<784xf32>, %arg2: !dataflow.stream<f32, 25088>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 784 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 25088>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<784xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = arith.negf %2 : f32
        %4 = math.exp %3 : f32
        %5 = arith.addf %4, %arg3 : f32
        %6 = arith.divf %arg3, %5 : f32
        dataflow.stream_write %arg2, %6 : <f32, 25088>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: memref<256x784xf32>, %arg1: !dataflow.stream<f32, 8192>, %arg2: !dataflow.stream<f32, 25088>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x784xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 256 {
        affine.for %arg6 = 0 to 784 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 8192>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<32x256xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<32x256xf32>
          affine.if #set(%arg4) {
            %5 = affine.load %arg0[%arg5, %arg6] : memref<256x784xf32>
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<256x784xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<256x784xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<32x784xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<32x784xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<32x784xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<32x784xf32>
            dataflow.stream_write %arg2, %5 : <f32, 25088>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<784x256xf32>, %arg1: memref<256x784xf32>) {
    affine.for %arg2 = 0 to 784 {
      affine.for %arg3 = 0 to 256 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<784x256xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<256x784xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<256xf32>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 256 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<256xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = arith.cmpf ugt, %2, %arg3 : f32
        %4 = arith.select %3, %2, %arg3 : f32
        dataflow.stream_write %arg2, %4 : <f32, 8192>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: memref<128x256xf32>, %arg1: !dataflow.stream<f32, 4096>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 256 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg6] : memref<32x128xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg6] : memref<32x128xf32>
          affine.if #set(%arg4) {
            %5 = affine.load %arg0[%arg6, %arg5] : memref<128x256xf32>
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<128x256xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<128x256xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<32x256xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<32x256xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<32x256xf32>
          affine.if #set2(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<32x256xf32>
            dataflow.stream_write %arg2, %5 : <f32, 8192>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 256 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<256x128xf32>
        affine.store %0, %arg1[%arg2, %arg3] : memref<128x256xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<128xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = arith.cmpf ugt, %2, %arg3 : f32
        %4 = arith.select %3, %2, %arg3 : f32
        dataflow.stream_write %arg2, %4 : <f32, 4096>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node8(%arg0: memref<64x128xf32>, %arg1: !dataflow.stream<f32, 2048>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 2048>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg6] : memref<32x64xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg6] : memref<32x64xf32>
          affine.if #set(%arg4) {
            %5 = affine.load %arg0[%arg6, %arg5] : memref<64x128xf32>
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<64x128xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<64x128xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<32x128xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<32x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<32x128xf32>
          affine.if #set3(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<32x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: memref<128x64xf32>, %arg1: memref<64x128xf32>) {
    affine.for %arg2 = 0 to 64 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x64xf32>
        affine.store %0, %arg1[%arg2, %arg3] : memref<64x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node10(%arg0: !dataflow.stream<f32, 2048>, %arg1: memref<64xf32>, %arg2: !dataflow.stream<f32, 2048>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 64 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 2048>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<64xf32>
        %2 = arith.addf %0, %1 : f32
        dataflow.stream_write %arg2, %2 : <f32, 2048>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node11(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<128x64xf32>, %arg2: !dataflow.stream<f32, 2048>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg6] : memref<32x128xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg6] : memref<32x128xf32>
          affine.if #set(%arg4) {
            %5 = affine.load %arg1[%arg6, %arg5] : memref<128x64xf32>
            affine.store %5, %alloc_0[%arg6, %arg5] : memref<128x64xf32>
          }
          %1 = affine.load %alloc_0[%arg6, %arg5] : memref<128x64xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<32x64xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<32x64xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<32x64xf32>
          affine.if #set2(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<32x64xf32>
            dataflow.stream_write %arg2, %5 : <f32, 2048>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node12(%arg0: memref<64x128xf32>, %arg1: memref<128x64xf32>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 64 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<64x128xf32>
        affine.store %0, %arg1[%arg2, %arg3] : memref<128x64xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node13(%arg0: !dataflow.stream<f32, 4096>, %arg1: memref<128xf32>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 4096>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = arith.cmpf ugt, %2, %arg3 : f32
        %4 = arith.select %3, %2, %arg3 : f32
        dataflow.stream_write %arg2, %4 : <f32, 4096>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node14(%arg0: !dataflow.stream<f32, 32768>, %arg1: !dataflow.stream<f32, 8192>, %arg2: !dataflow.stream<f32, 4096>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 256 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 8192>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<32x256xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<32x256xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<256x128xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<256x128xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<32x128xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<32x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<32x128xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<32x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 4096>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node15(%arg0: memref<128x256xf32>, %arg1: !dataflow.stream<f32, 32768>) {
    affine.for %arg2 = 0 to 256 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x256xf32>
        dataflow.stream_write %arg1, %0 : <f32, 32768>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node16(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<256xf32>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 256 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<256xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = arith.cmpf ugt, %2, %arg3 : f32
        %4 = arith.select %3, %2, %arg3 : f32
        dataflow.stream_write %arg2, %4 : <f32, 8192>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node17(%arg0: memref<32x784xf32>, %arg1: !dataflow.stream<f32, 200704>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<784x256xf32>
    affine.for %arg4 = 0 to 32 {
      affine.for %arg5 = 0 to 784 {
        affine.for %arg6 = 0 to 256 {
          %0 = affine.load %arg0[%arg4, %arg5] : memref<32x784xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 200704>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<784x256xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<784x256xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<32x256xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<32x256xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<32x256xf32>
          affine.if #set4(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<32x256xf32>
            dataflow.stream_write %arg2, %5 : <f32, 8192>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node18(%arg0: memref<256x784xf32>, %arg1: !dataflow.stream<f32, 200704>) {
    affine.for %arg2 = 0 to 784 {
      affine.for %arg3 = 0 to 256 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<256x784xf32>
        dataflow.stream_write %arg1, %0 : <f32, 200704>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<32x784xf32>, %arg1: memref<256xf32>, %arg2: memref<256x784xf32>, %arg3: memref<128xf32>, %arg4: memref<128x256xf32>, %arg5: memref<64xf32>, %arg6: memref<64x128xf32>, %arg7: memref<128xf32>, %arg8: memref<128x64xf32>, %arg9: memref<256xf32>, %arg10: memref<256x128xf32>, %arg11: memref<784xf32>, %arg12: memref<784x256xf32>, %arg13: memref<32x784xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0 = dataflow.stream {depth = 25088 : i32} : <f32, 25088>
    %1 = dataflow.stream {depth = 25088 : i32} : <f32, 25088>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<256x784xf32>
    %2 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %3 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    %4 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %5 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %6 = dataflow.stream {depth = 2048 : i32} : <f32, 2048>
    %7 = dataflow.stream {depth = 2048 : i32} : <f32, 2048>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32>
    %8 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %9 = dataflow.stream {depth = 4096 : i32} : <f32, 4096>
    %10 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %11 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %12 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %13 = dataflow.stream {depth = 200704 : i32} : <f32, 200704>
    call @node18(%arg2, %13) : (memref<256x784xf32>, !dataflow.stream<f32, 200704>) -> ()
    call @node17(%arg0, %13, %12, %cst) : (memref<32x784xf32>, !dataflow.stream<f32, 200704>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node16(%12, %arg1, %11, %cst) : (!dataflow.stream<f32, 8192>, memref<256xf32>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node15(%arg4, %10) : (memref<128x256xf32>, !dataflow.stream<f32, 32768>) -> ()
    call @node14(%10, %11, %9, %cst) : (!dataflow.stream<f32, 32768>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node13(%9, %arg3, %8, %cst) : (!dataflow.stream<f32, 4096>, memref<128xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node12(%arg6, %alloc_3) : (memref<64x128xf32>, memref<128x64xf32>) -> ()
    call @node11(%8, %alloc_3, %7, %cst) : (!dataflow.stream<f32, 4096>, memref<128x64xf32>, !dataflow.stream<f32, 2048>, f32) -> ()
    call @node10(%7, %arg5, %6) : (!dataflow.stream<f32, 2048>, memref<64xf32>, !dataflow.stream<f32, 2048>) -> ()
    call @node9(%arg8, %alloc_2) : (memref<128x64xf32>, memref<64x128xf32>) -> ()
    call @node8(%alloc_2, %6, %5, %cst) : (memref<64x128xf32>, !dataflow.stream<f32, 2048>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node7(%5, %arg7, %4, %cst) : (!dataflow.stream<f32, 4096>, memref<128xf32>, !dataflow.stream<f32, 4096>, f32) -> ()
    call @node6(%arg10, %alloc_1) : (memref<256x128xf32>, memref<128x256xf32>) -> ()
    call @node5(%alloc_1, %4, %3, %cst) : (memref<128x256xf32>, !dataflow.stream<f32, 4096>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node4(%3, %arg9, %2, %cst) : (!dataflow.stream<f32, 8192>, memref<256xf32>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node3(%arg12, %alloc) : (memref<784x256xf32>, memref<256x784xf32>) -> ()
    call @node2(%alloc, %2, %1, %cst) : (memref<256x784xf32>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 25088>, f32) -> ()
    call @node1(%1, %arg11, %0, %cst_0) : (!dataflow.stream<f32, 25088>, memref<784xf32>, !dataflow.stream<f32, 25088>, f32) -> ()
    call @node0(%0, %arg13) : (!dataflow.stream<f32, 25088>, memref<32x784xf32>) -> ()
    return
  }
}

