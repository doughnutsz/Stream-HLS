#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 399 == 0)>
module attributes {torch.debug_module_name = "mvt"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 400>, %arg1: memref<400xf32>) {
    affine.for %arg2 = 0 to 400 {
      %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 400>) -> f32
      affine.store %0, %arg1[%arg2] : memref<400xf32>
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 400>, %arg1: memref<400xf32>) {
    affine.for %arg2 = 0 to 400 {
      %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 400>) -> f32
      affine.store %0, %arg1[%arg2] : memref<400xf32>
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node2(%arg0: memref<400x400xf32>, %arg1: memref<400xf32>, %arg2: !dataflow.stream<f32, 400>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<400xf32>
    affine.for %arg4 = 0 to 400 {
      affine.for %arg5 = 0 to 400 {
        %0 = affine.load %arg0[%arg4, %arg5] : memref<400x400xf32>
        %1 = affine.load %arg1[%arg5] : memref<400xf32>
        affine.if #set(%arg5) {
          affine.store %arg3, %alloc[%arg4] : memref<400xf32>
        }
        %2 = affine.load %alloc[%arg4] : memref<400xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %alloc[%arg4] : memref<400xf32>
        affine.if #set1(%arg5) {
          %5 = affine.load %alloc[%arg4] : memref<400xf32>
          dataflow.stream_write %arg2, %5 : <f32, 400>, f32
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<400x400xf32>, %arg1: memref<400x400xf32>) {
    affine.for %arg2 = 0 to 400 {
      affine.for %arg3 = 0 to 400 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<400x400xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<400x400xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: memref<400x400xf32>, %arg1: memref<400xf32>, %arg2: !dataflow.stream<f32, 400>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<400xf32>
    affine.for %arg4 = 0 to 400 {
      affine.for %arg5 = 0 to 400 {
        %0 = affine.load %arg0[%arg4, %arg5] : memref<400x400xf32>
        %1 = affine.load %arg1[%arg5] : memref<400xf32>
        affine.if #set(%arg5) {
          affine.store %arg3, %alloc[%arg4] : memref<400xf32>
        }
        %2 = affine.load %alloc[%arg4] : memref<400xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %alloc[%arg4] : memref<400xf32>
        affine.if #set1(%arg5) {
          %5 = affine.load %alloc[%arg4] : memref<400xf32>
          dataflow.stream_write %arg2, %5 : <f32, 400>, f32
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<400x400xf32>, %arg1: memref<400x400xf32>, %arg2: memref<400xf32>, %arg3: memref<400xf32>, %arg4: memref<400xf32>, %arg5: memref<400xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 400 : i32} : <f32, 400>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<400x400xf32>
    %1 = dataflow.stream {depth = 400 : i32} : <f32, 400>
    call @node4(%arg0, %arg2, %1, %cst) : (memref<400x400xf32>, memref<400xf32>, !dataflow.stream<f32, 400>, f32) -> ()
    call @node3(%arg1, %alloc) : (memref<400x400xf32>, memref<400x400xf32>) -> ()
    call @node2(%alloc, %arg3, %0, %cst) : (memref<400x400xf32>, memref<400xf32>, !dataflow.stream<f32, 400>, f32) -> ()
    call @node1(%1, %arg4) : (!dataflow.stream<f32, 400>, memref<400xf32>) -> ()
    call @node0(%0, %arg5) : (!dataflow.stream<f32, 400>, memref<400xf32>) -> ()
    return
  }
}

