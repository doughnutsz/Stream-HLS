#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 249 == 0)>
module attributes {torch.debug_module_name = "gesummv"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 250>, %arg1: memref<250xf32>) {
    affine.for %arg2 = 0 to 250 {
      %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 250>) -> f32
      affine.store %0, %arg1[%arg2] : memref<250xf32>
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 250>, %arg1: !dataflow.stream<f32, 250>, %arg2: !dataflow.stream<f32, 250>, %arg3: f64, %arg4: f32) {
    affine.for %arg5 = 0 to 250 {
      %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 250>) -> f32
      %1 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 250>) -> f32
      %2 = arith.truncf %arg3 : f64 to f32
      %3 = arith.mulf %1, %2 : f32
      %4 = arith.mulf %0, %arg4 : f32
      %5 = arith.addf %4, %3 : f32
      dataflow.stream_write %arg2, %5 : <f32, 250>, f32
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node2(%arg0: memref<250x250xf32>, %arg1: memref<250xf32>, %arg2: !dataflow.stream<f32, 250>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<250xf32>
    affine.for %arg4 = 0 to 250 {
      affine.for %arg5 = 0 to 250 {
        %0 = affine.load %arg0[%arg5, %arg4] : memref<250x250xf32>
        %1 = affine.load %arg1[%arg4] : memref<250xf32>
        affine.if #set(%arg4) {
          affine.store %arg3, %alloc[%arg5] : memref<250xf32>
        }
        %2 = affine.load %alloc[%arg5] : memref<250xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %alloc[%arg5] : memref<250xf32>
        affine.if #set1(%arg4) {
          %5 = affine.load %alloc[%arg5] : memref<250xf32>
          dataflow.stream_write %arg2, %5 : <f32, 250>, f32
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<250x250xf32>, %arg1: memref<250xf32>, %arg2: !dataflow.stream<f32, 250>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<250xf32>
    affine.for %arg4 = 0 to 250 {
      affine.for %arg5 = 0 to 250 {
        %0 = affine.load %arg0[%arg5, %arg4] : memref<250x250xf32>
        %1 = affine.load %arg1[%arg4] : memref<250xf32>
        affine.if #set(%arg4) {
          affine.store %arg3, %alloc[%arg5] : memref<250xf32>
        }
        %2 = affine.load %alloc[%arg5] : memref<250xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %alloc[%arg5] : memref<250xf32>
        affine.if #set1(%arg4) {
          %5 = affine.load %alloc[%arg5] : memref<250xf32>
          dataflow.stream_write %arg2, %5 : <f32, 250>, f32
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<250x250xf32>, %arg1: memref<250x250xf32>, %arg2: memref<250xf32>, %arg3: memref<250xf32>) {
    %cst = arith.constant 1.500000e+00 : f32
    %cst_0 = arith.constant 1.200000e+00 : f64
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 250 : i32} : <f32, 250>
    %1 = dataflow.stream {depth = 250 : i32} : <f32, 250>
    %2 = dataflow.stream {depth = 250 : i32} : <f32, 250>
    call @node3(%arg0, %arg2, %2, %cst_1) : (memref<250x250xf32>, memref<250xf32>, !dataflow.stream<f32, 250>, f32) -> ()
    call @node2(%arg1, %arg2, %1, %cst_1) : (memref<250x250xf32>, memref<250xf32>, !dataflow.stream<f32, 250>, f32) -> ()
    call @node1(%2, %1, %0, %cst_0, %cst) : (!dataflow.stream<f32, 250>, !dataflow.stream<f32, 250>, !dataflow.stream<f32, 250>, f64, f32) -> ()
    call @node0(%0, %arg3) : (!dataflow.stream<f32, 250>, memref<250xf32>) -> ()
    return
  }
}

