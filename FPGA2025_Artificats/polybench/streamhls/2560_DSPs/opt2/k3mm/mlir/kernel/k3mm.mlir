#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 189 == 0)>
#set2 = affine_set<(d0) : (d0 - 219 == 0)>
#set3 = affine_set<(d0) : (d0 - 199 == 0)>
module attributes {torch.debug_module_name = "k3mm"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 37800>, %arg1: memref<180x210xf32>) {
    affine.for %arg2 = 0 to 210 {
      affine.for %arg3 = 0 to 180 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 37800>) -> f32
        affine.store %0, %arg1[%arg3, %arg2] : memref<180x210xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 34200>, %arg1: !dataflow.stream<f32, 39900>, %arg2: !dataflow.stream<f32, 37800>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x210xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32>
    affine.for %arg4 = 0 to 190 {
      affine.for %arg5 = 0 to 210 {
        affine.for %arg6 = 0 to 180 {
          affine.if #set(%arg5) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 34200>) -> f32
            affine.store %5, %alloc_1[%arg6, %arg4] : memref<180x190xf32>
          }
          %0 = affine.load %alloc_1[%arg6, %arg4] : memref<180x190xf32>
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 39900>) -> f32
            affine.store %5, %alloc_0[%arg4, %arg5] : memref<190x210xf32>
          }
          %1 = affine.load %alloc_0[%arg4, %arg5] : memref<190x210xf32>
          affine.if #set(%arg4) {
            affine.store %arg3, %alloc[%arg6, %arg5] : memref<180x210xf32>
          }
          %2 = affine.load %alloc[%arg6, %arg5] : memref<180x210xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg6, %arg5] : memref<180x210xf32>
          affine.if #set1(%arg4) {
            %5 = affine.load %alloc[%arg6, %arg5] : memref<180x210xf32>
            dataflow.stream_write %arg2, %5 : <f32, 37800>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: memref<190x220xf32>, %arg1: memref<220x210xf32>, %arg2: !dataflow.stream<f32, 39900>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32>
    affine.for %arg4 = 0 to 190 {
      affine.for %arg5 = 0 to 220 {
        affine.for %arg6 = 0 to 210 {
          %0 = affine.load %arg0[%arg4, %arg5] : memref<190x220xf32>
          %1 = affine.load %arg1[%arg5, %arg6] : memref<220x210xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<190x210xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<190x210xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<190x210xf32>
          affine.if #set2(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<190x210xf32>
            dataflow.stream_write %arg2, %5 : <f32, 39900>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<180x200xf32>, %arg1: memref<200x190xf32>, %arg2: !dataflow.stream<f32, 34200>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32>
    affine.for %arg4 = 0 to 190 {
      affine.for %arg5 = 0 to 200 {
        affine.for %arg6 = 0 to 180 {
          %0 = affine.load %arg0[%arg6, %arg5] : memref<180x200xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<200x190xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg6, %arg4] : memref<180x190xf32>
          }
          %2 = affine.load %alloc[%arg6, %arg4] : memref<180x190xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg6, %arg4] : memref<180x190xf32>
          affine.if #set3(%arg5) {
            %5 = affine.load %alloc[%arg6, %arg4] : memref<180x190xf32>
            dataflow.stream_write %arg2, %5 : <f32, 34200>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<180x200xf32>, %arg1: memref<200x190xf32>, %arg2: memref<190x220xf32>, %arg3: memref<220x210xf32>, %arg4: memref<180x210xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.stream {depth = 37800 : i32} : <f32, 37800>
    %1 = dataflow.stream {depth = 39900 : i32} : <f32, 39900>
    %2 = dataflow.stream {depth = 34200 : i32} : <f32, 34200>
    call @node3(%arg0, %arg1, %2, %cst) : (memref<180x200xf32>, memref<200x190xf32>, !dataflow.stream<f32, 34200>, f32) -> ()
    call @node2(%arg2, %arg3, %1, %cst) : (memref<190x220xf32>, memref<220x210xf32>, !dataflow.stream<f32, 39900>, f32) -> ()
    call @node1(%2, %1, %0, %cst) : (!dataflow.stream<f32, 34200>, !dataflow.stream<f32, 39900>, !dataflow.stream<f32, 37800>, f32) -> ()
    call @node0(%0, %arg4) : (!dataflow.stream<f32, 37800>, memref<180x210xf32>) -> ()
    return
  }
}

