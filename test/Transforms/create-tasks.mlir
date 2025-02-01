// RUN: streamhls-opt -streamhls-create-tasks %s | FileCheck %s

//CHECK: #set = affine_set<(d0) : (d0 == 0)>
//CHECK: #set1 = affine_set<(d0) : (d0 - 31 == 0)>
//CHECK: module attributes {torch.debug_module_name = "gemm"} {
//CHECK:   func.func @forward(%arg0: memref<64x32xf32> {builtin.argKind = "input_0"}, %arg1: memref<32x16xf32> {builtin.argKind = "input_1"}, %arg2: memref<64x16xf32> {builtin.argKind = "output_0"}) {
//CHECK:     dataflow.dataflow.dispatch {
//CHECK:       %0 = dataflow.stream {depth = 1024 : i32} : <f32, 1024>
//CHECK:       %cst = arith.constant 0.000000e+00 : f32
//CHECK:       dataflow.dataflow.task {
//CHECK:         %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x16xf32>
//CHECK:         affine.for %arg3 = 0 to 64 {
//CHECK:           affine.for %arg4 = 0 to 16 {
//CHECK:             affine.for %arg5 = 0 to 32 {
//CHECK:               %1 = affine.load %arg0[%arg3, %arg5] : memref<64x32xf32>
//CHECK:               %2 = affine.load %arg1[%arg5, %arg4] : memref<32x16xf32>
//CHECK:               affine.if #set(%arg5) {
//CHECK:                 affine.store %cst, %alloc[%arg3, %arg4] : memref<64x16xf32>
//CHECK:               }
//CHECK:               %3 = affine.load %alloc[%arg3, %arg4] : memref<64x16xf32>
//CHECK:               %4 = arith.mulf %1, %2 : f32
//CHECK:               %5 = arith.addf %3, %4 : f32
//CHECK:               affine.store %5, %alloc[%arg3, %arg4] : memref<64x16xf32>
//CHECK:               affine.if #set1(%arg5) {
//CHECK:                 %6 = affine.load %alloc[%arg3, %arg4] : memref<64x16xf32>
//CHECK:                 dataflow.stream_write %0, %6 : <f32, 1024>, f32
//CHECK:               }
//CHECK:             } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
//CHECK:           }
//CHECK:         }
//CHECK:       }
//CHECK:       dataflow.dataflow.task {
//CHECK:         affine.for %arg3 = 0 to 64 {
//CHECK:           affine.for %arg4 = 0 to 16 {
//CHECK:             %1 = dataflow.stream_read %0 : (!dataflow.stream<f32, 1024>) -> f32
//CHECK:             affine.store %1, %arg2[%arg3, %arg4] : memref<64x16xf32>
//CHECK:           } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
//CHECK:         }
//CHECK:       }
//CHECK:     }
//CHECK:     return
//CHECK:   }
//CHECK: }


#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 31 == 0)>
module attributes {torch.debug_module_name = "gemm"} {
  func.func @forward(%arg0: memref<64x32xf32> {builtin.argKind = "input_0"}, %arg1: memref<32x16xf32> {builtin.argKind = "input_1"}, %arg2: memref<64x16xf32> {builtin.argKind = "output_0"}) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x16xf32>
    %0 = dataflow.stream {depth = 1024 : i32} : <f32, 1024>
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 32 {
          %1 = affine.load %arg0[%arg3, %arg5] : memref<64x32xf32>
          %2 = affine.load %arg1[%arg5, %arg4] : memref<32x16xf32>
          affine.if #set(%arg5) {
            affine.store %cst, %alloc[%arg3, %arg4] : memref<64x16xf32>
          }
          %3 = affine.load %alloc[%arg3, %arg4] : memref<64x16xf32>
          %4 = arith.mulf %1, %2 : f32
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %alloc[%arg3, %arg4] : memref<64x16xf32>
          affine.if #set1(%arg5) {
            %6 = affine.load %alloc[%arg3, %arg4] : memref<64x16xf32>
            dataflow.stream_write %0, %6 : <f32, 1024>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 16 {
        %1 = dataflow.stream_read %0 : (!dataflow.stream<f32, 1024>) -> f32
        affine.store %1, %arg2[%arg3, %arg4] : memref<64x16xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
}
