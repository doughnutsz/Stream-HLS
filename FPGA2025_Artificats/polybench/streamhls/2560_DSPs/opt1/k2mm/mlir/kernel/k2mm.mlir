#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 189 == 0)>
#set2 = affine_set<(d0) : (d0 - 209 == 0)>
module attributes {torch.debug_module_name = "k2mm"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 39600>, %arg1: memref<180x220xf32>) {
    affine.for %arg2 = 0 to 180 {
      affine.for %arg3 = 0 to 220 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 39600>) -> f32
        affine.store %0, %arg1[%arg2, %arg3] : memref<180x220xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 39600>, %arg1: memref<180x220xf32>, %arg2: !dataflow.stream<f32, 39600>, %arg3: f64, %arg4: f32) {
    affine.for %arg5 = 0 to 180 {
      affine.for %arg6 = 0 to 220 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 39600>) -> f32
        %1 = affine.load %arg1[%arg5, %arg6] : memref<180x220xf32>
        %2 = arith.truncf %arg3 : f64 to f32
        %3 = arith.mulf %1, %2 : f32
        %4 = arith.mulf %0, %arg4 : f32
        %5 = arith.addf %4, %3 : f32
        dataflow.stream_write %arg2, %5 : <f32, 39600>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 34200>, %arg1: memref<190x220xf32>, %arg2: !dataflow.stream<f32, 39600>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x220xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32>
    affine.for %arg4 = 0 to 180 {
      affine.for %arg5 = 0 to 220 {
        affine.for %arg6 = 0 to 190 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 34200>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg6] : memref<180x190xf32>
          }
          %0 = affine.load %alloc_0[%arg4, %arg6] : memref<180x190xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<190x220xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<180x220xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<180x220xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<180x220xf32>
          affine.if #set1(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<180x220xf32>
            dataflow.stream_write %arg2, %5 : <f32, 39600>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<180x210xf32>, %arg1: memref<210x190xf32>, %arg2: !dataflow.stream<f32, 34200>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32>
    affine.for %arg4 = 0 to 180 {
      affine.for %arg5 = 0 to 190 {
        affine.for %arg6 = 0 to 210 {
          %0 = affine.load %arg0[%arg4, %arg6] : memref<180x210xf32>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<210x190xf32>
          affine.if #set(%arg6) {
            affine.store %arg3, %alloc[%arg4, %arg5] : memref<180x190xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg5] : memref<180x190xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg5] : memref<180x190xf32>
          affine.if #set2(%arg6) {
            %5 = affine.load %alloc[%arg4, %arg5] : memref<180x190xf32>
            dataflow.stream_write %arg2, %5 : <f32, 34200>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<180x210xf32>, %arg1: memref<210x190xf32>, %arg2: memref<190x220xf32>, %arg3: memref<180x220xf32>, %arg4: memref<180x220xf32>) {
    %cst = arith.constant 5.000000e-01 : f32
    %cst_0 = arith.constant 1.000000e-01 : f64
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 39600 : i32} : <f32, 39600>
    %1 = dataflow.stream {depth = 39600 : i32} : <f32, 39600>
    %2 = dataflow.stream {depth = 34200 : i32} : <f32, 34200>
    call @node3(%arg0, %arg1, %2, %cst_1) : (memref<180x210xf32>, memref<210x190xf32>, !dataflow.stream<f32, 34200>, f32) -> ()
    call @node2(%2, %arg2, %1, %cst_1) : (!dataflow.stream<f32, 34200>, memref<190x220xf32>, !dataflow.stream<f32, 39600>, f32) -> ()
    call @node1(%1, %arg3, %0, %cst_0, %cst) : (!dataflow.stream<f32, 39600>, memref<180x220xf32>, !dataflow.stream<f32, 39600>, f64, f32) -> ()
    call @node0(%0, %arg4) : (!dataflow.stream<f32, 39600>, memref<180x220xf32>) -> ()
    return
  }
}

