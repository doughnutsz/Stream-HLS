#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 255 == 0)>
#set2 = affine_set<(d0) : (d0 - 127 == 0)>
module attributes {torch.debug_module_name = "FeedForward"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 65536>, %arg1: memref<1x512x128xf32>) {
    affine.for %arg2 = 0 to 512 {
      affine.for %arg3 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 65536>) -> f32
        affine.store %0, %arg1[0, %arg2, %arg3] : memref<1x512x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 65536>, %arg1: memref<128xf32>, %arg2: !dataflow.stream<f32, 65536>) {
    affine.for %arg3 = 0 to 512 {
      affine.for %arg4 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 65536>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        dataflow.stream_write %arg2, %2 : <f32, 65536>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 131072>, %arg1: !dataflow.stream<f32, 32768>, %arg2: !dataflow.stream<f32, 65536>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<512x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<512x256xf32>
    affine.for %arg4 = 0 to 512 {
      affine.for %arg5 = 0 to 256 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 131072>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<512x256xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<512x256xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 32768>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<256x128xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<256x128xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<512x128xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<512x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<512x128xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<512x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 65536>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<128x256xf32>, %arg1: !dataflow.stream<f32, 32768>) {
    affine.for %arg2 = 0 to 256 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x256xf32>
        dataflow.stream_write %arg1, %0 : <f32, 32768>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: !dataflow.stream<f32, 131072>, %arg1: memref<256xf32>, %arg2: !dataflow.stream<f32, 131072>, %arg3: f32) {
    affine.for %arg4 = 0 to 512 {
      affine.for %arg5 = 0 to 256 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 131072>) -> f32
        %1 = affine.load %arg1[%arg5] : memref<256xf32>
        %2 = arith.addf %0, %1 : f32
        %3 = arith.cmpf ugt, %2, %arg3 : f32
        %4 = arith.select %3, %2, %arg3 : f32
        dataflow.stream_write %arg2, %4 : <f32, 131072>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: !dataflow.stream<f32, 65536>, %arg1: !dataflow.stream<f32, 32768>, %arg2: !dataflow.stream<f32, 131072>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<512x256xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<512x128xf32>
    affine.for %arg4 = 0 to 512 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 256 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 65536>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<512x128xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<512x128xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 32768>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<128x256xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<128x256xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<512x256xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<512x256xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<512x256xf32>
          affine.if #set2(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<512x256xf32>
            dataflow.stream_write %arg2, %5 : <f32, 131072>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x128xf32>, %arg1: !dataflow.stream<f32, 32768>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 256 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<256x128xf32>
        dataflow.stream_write %arg1, %0 : <f32, 32768>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: memref<1x512x128xf32>, %arg1: !dataflow.stream<f32, 65536>) {
    affine.for %arg2 = 0 to 512 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[0, %arg2, %arg3] : memref<1x512x128xf32>
        dataflow.stream_write %arg1, %0 : <f32, 65536>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<1x512x128xf32>, %arg1: memref<256xf32>, %arg2: memref<256x128xf32>, %arg3: memref<128xf32>, %arg4: memref<128x256xf32>, %arg5: memref<1x512x128xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 65536 : i32} : <f32, 65536>
    %1 = dataflow.stream {depth = 65536 : i32} : <f32, 65536>
    %2 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %3 = dataflow.stream {depth = 131072 : i32} : <f32, 131072>
    %4 = dataflow.stream {depth = 131072 : i32} : <f32, 131072>
    %5 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %6 = dataflow.stream {depth = 65536 : i32} : <f32, 65536>
    call @node7(%arg0, %6) : (memref<1x512x128xf32>, !dataflow.stream<f32, 65536>) -> ()
    call @node6(%arg2, %5) : (memref<256x128xf32>, !dataflow.stream<f32, 32768>) -> ()
    call @node5(%6, %5, %4, %cst) : (!dataflow.stream<f32, 65536>, !dataflow.stream<f32, 32768>, !dataflow.stream<f32, 131072>, f32) -> ()
    call @node4(%4, %arg1, %3, %cst) : (!dataflow.stream<f32, 131072>, memref<256xf32>, !dataflow.stream<f32, 131072>, f32) -> ()
    call @node3(%arg4, %2) : (memref<128x256xf32>, !dataflow.stream<f32, 32768>) -> ()
    call @node2(%3, %2, %1, %cst) : (!dataflow.stream<f32, 131072>, !dataflow.stream<f32, 32768>, !dataflow.stream<f32, 65536>, f32) -> ()
    call @node1(%1, %arg3, %0) : (!dataflow.stream<f32, 65536>, memref<128xf32>, !dataflow.stream<f32, 65536>) -> ()
    call @node0(%0, %arg5) : (!dataflow.stream<f32, 65536>, memref<1x512x128xf32>) -> ()
    return
  }
}

