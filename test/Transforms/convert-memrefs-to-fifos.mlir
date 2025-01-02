// RUN: streamhls-opt -streamhls-convert-memrefs-to-fifos %s | FileCheck %s

#set = affine_set<(d0, d1) : (d0 == 0, d1 == 0)>
#set1 = affine_set<(d0, d1) : (d0 - 15 == 0, d1 - 31 == 0)>
module attributes {torch.debug_module_name = "test"} {
  func.func @forward(%arg0: memref<8xf32>, %arg1: memref<8xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    affine.for %arg2 = 0 to 8 {
      affine.store %cst, %alloc_1[%arg2] : memref<8xf32>
    }
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 32 {
          %0 = affine.load %arg0[%arg2] : memref<8xf32>
          affine.if #set(%arg3, %arg4) {
            %3 = affine.load %alloc_1[%arg2] : memref<8xf32>
            affine.store %3, %alloc[%arg2] : memref<8xf32>
          }
          %1 = affine.load %alloc[%arg2] : memref<8xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %alloc[%arg2] : memref<8xf32>
          affine.if #set1(%arg3, %arg4) {
            %3 = affine.load %alloc[%arg2] : memref<8xf32>
            affine.store %3, %alloc_0[%arg2] : memref<8xf32>
          }
        }
      }
    }
    affine.for %arg2 = 0 to 8 {
      %0 = affine.load %alloc_0[%arg2] : memref<8xf32>
      affine.store %0, %arg1[%arg2] : memref<8xf32>
    }
    return
  }
}
// CHECK: #set = affine_set<(d0, d1) : (d0 == 0, d1 == 0)>
// CHECK: #set1 = affine_set<(d0, d1) : (d0 - 15 == 0, d1 - 31 == 0)>
// CHECK: module attributes {torch.debug_module_name = "test"} {
// CHECK:   func.func @forward(%arg0: memref<8xf32>, %arg1: memref<8xf32>) {
// CHECK:     %cst = arith.constant 0.000000e+00 : f32
// CHECK:     %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:     %0 = dataflow.stream {depth = 2 : i32} : <f32, 2>
// CHECK:     %1 = dataflow.stream {depth = 2 : i32} : <f32, 2>
// CHECK:     affine.for %arg2 = 0 to 8 {
// CHECK:       dataflow.stream_write %1, %cst : <f32, 2>, f32
// CHECK:     }
// CHECK:     affine.for %arg2 = 0 to 8 {
// CHECK:       affine.for %arg3 = 0 to 16 {
// CHECK:         affine.for %arg4 = 0 to 32 {
// CHECK:           %2 = affine.load %arg0[%arg2] : memref<8xf32>
// CHECK:           affine.if #set(%arg3, %arg4) {
// CHECK:             %5 = dataflow.stream_read %1 : (!dataflow.stream<f32, 2>) -> f32
// CHECK:             affine.store %5, %alloc[%arg2] : memref<8xf32>
// CHECK:           }
// CHECK:           %3 = affine.load %alloc[%arg2] : memref<8xf32>
// CHECK:           %4 = arith.addf %2, %3 : f32
// CHECK:           affine.store %4, %alloc[%arg2] : memref<8xf32>
// CHECK:           affine.if #set1(%arg3, %arg4) {
// CHECK:             %5 = affine.load %alloc[%arg2] : memref<8xf32>
// CHECK:             dataflow.stream_write %0, %5 : <f32, 2>, f32
// CHECK:           }
// CHECK:         }
// CHECK:       }
// CHECK:     }
// CHECK:     affine.for %arg2 = 0 to 8 {
// CHECK:       %2 = dataflow.stream_read %0 : (!dataflow.stream<f32, 2>) -> f32
// CHECK:       affine.store %2, %arg1[%arg2] : memref<8xf32>
// CHECK:     }
// CHECK:     return
// CHECK:   }
// CHECK: }