#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 389 == 0)>
#set2 = affine_set<(d0) : (d0 - 409 == 0)>
module attributes {torch.debug_module_name = "atax"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 410>, %arg1: memref<410xf32>) {
    affine.for %arg2 = 0 to 410 {
      %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 410>) -> f32
      affine.store %0, %arg1[%arg2] : memref<410xf32>
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 159900>, %arg1: !dataflow.stream<f32, 390>, %arg2: !dataflow.stream<f32, 410>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<410xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<390xf32>
    affine.for %arg4 = 0 to 390 {
      affine.for %arg5 = 0 to 410 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 159900>) -> f32
        affine.if #set(%arg5) {
          %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 390>) -> f32
          affine.store %5, %alloc_0[%arg4] : memref<390xf32>
        }
        %1 = affine.load %alloc_0[%arg4] : memref<390xf32>
        affine.if #set(%arg4) {
          affine.store %arg3, %alloc[%arg5] : memref<410xf32>
        }
        %2 = affine.load %alloc[%arg5] : memref<410xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %alloc[%arg5] : memref<410xf32>
        affine.if #set1(%arg4) {
          %5 = affine.load %alloc[%arg5] : memref<410xf32>
          dataflow.stream_write %arg2, %5 : <f32, 410>, f32
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: memref<390x410xf32>, %arg1: !dataflow.stream<f32, 159900>) {
    affine.for %arg2 = 0 to 390 {
      affine.for %arg3 = 0 to 410 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<390x410xf32>
        dataflow.stream_write %arg1, %0 : <f32, 159900>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<390x410xf32>, %arg1: memref<410xf32>, %arg2: !dataflow.stream<f32, 390>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<390xf32>
    affine.for %arg4 = 0 to 410 {
      affine.for %arg5 = 0 to 390 {
        %0 = affine.load %arg0[%arg5, %arg4] : memref<390x410xf32>
        %1 = affine.load %arg1[%arg4] : memref<410xf32>
        affine.if #set(%arg4) {
          affine.store %arg3, %alloc[%arg5] : memref<390xf32>
        }
        %2 = affine.load %alloc[%arg5] : memref<390xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %alloc[%arg5] : memref<390xf32>
        affine.if #set2(%arg4) {
          %5 = affine.load %alloc[%arg5] : memref<390xf32>
          dataflow.stream_write %arg2, %5 : <f32, 390>, f32
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<390x410xf32>, %arg1: memref<410xf32>, %arg2: memref<410xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 410 : i32} : <f32, 410>
    %1 = dataflow.stream {depth = 159900 : i32} : <f32, 159900>
    %2 = dataflow.stream {depth = 390 : i32} : <f32, 390>
    call @node3(%arg0, %arg1, %2, %cst) : (memref<390x410xf32>, memref<410xf32>, !dataflow.stream<f32, 390>, f32) -> ()
    call @node2(%arg0, %1) : (memref<390x410xf32>, !dataflow.stream<f32, 159900>) -> ()
    call @node1(%1, %2, %0, %cst) : (!dataflow.stream<f32, 159900>, !dataflow.stream<f32, 390>, !dataflow.stream<f32, 410>, f32) -> ()
    call @node0(%0, %arg2) : (!dataflow.stream<f32, 410>, memref<410xf32>) -> ()
    return
  }
}

