// RUN: streamhls-opt -streamhls-convert-to-single-producer-single-consumer %s | FileCheck %s

module attributes {torch.debug_module_name = "test"} {
  func.func @forward(%arg0: memref<8xf32>, %arg1: memref<8xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>

    affine.for %arg2 = 0 to 8 {
      affine.store %cst, %alloc[%arg2] : memref<8xf32>
    }
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 32 {
          %0 = affine.load %arg0[%arg2] : memref<8xf32>
          %1 = affine.load %alloc[%arg2] : memref<8xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %alloc[%arg2] : memref<8xf32>
        }
      }
    }
    affine.for %arg2 = 0 to 8 {
      %0 = affine.load %alloc[%arg2] : memref<8xf32>
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
// CHECK:     %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:     %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:     affine.for %arg2 = 0 to 8 {
// CHECK:       affine.store %cst, %alloc_1[%arg2] : memref<8xf32>
// CHECK:     }
// CHECK:     affine.for %arg2 = 0 to 8 {
// CHECK:       affine.for %arg3 = 0 to 16 {
// CHECK:         affine.for %arg4 = 0 to 32 {
// CHECK:           %0 = affine.load %arg0[%arg2] : memref<8xf32>
// CHECK:           affine.if #set(%arg3, %arg4) {
// CHECK:             %3 = affine.load %alloc_1[%arg2] : memref<8xf32>
// CHECK:             affine.store %3, %alloc[%arg2] : memref<8xf32>
// CHECK:           }
// CHECK:           %1 = affine.load %alloc[%arg2] : memref<8xf32>
// CHECK:           %2 = arith.addf %0, %1 : f32
// CHECK:           affine.store %2, %alloc[%arg2] : memref<8xf32>
// CHECK:           affine.if #set1(%arg3, %arg4) {
// CHECK:             %3 = affine.load %alloc[%arg2] : memref<8xf32>
// CHECK:             affine.store %3, %alloc_0[%arg2] : memref<8xf32>
// CHECK:           }
// CHECK:         }
// CHECK:       }
// CHECK:     }
// CHECK:     affine.for %arg2 = 0 to 8 {
// CHECK:       %0 = affine.load %alloc_0[%arg2] : memref<8xf32>
// CHECK:       affine.store %0, %arg1[%arg2] : memref<8xf32>
// CHECK:     }
// CHECK:     return
// CHECK:   }
// CHECK: }
module attributes {torch.debug_module_name = "test"} {
  func.func @forward(%arg0: memref<8xf32>, %arg1: memref<8xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
    affine.for %arg2 = 0 to 8 {
      affine.store %cst, %alloc[%arg2] : memref<8xf32>
    }
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 32 {
          %0 = affine.load %arg0[%arg2] : memref<8xf32>
          %1 = affine.load %alloc[%arg2] : memref<8xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %alloc[%arg2] : memref<8xf32>
        }
      }
    }
    affine.for %arg2 = 0 to 8 {
      affine.store %cst, %alloc_0[%arg2] : memref<8xf32>
    }
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        %0 = affine.load %alloc[%arg2] : memref<8xf32>
        %1 = affine.load %alloc_0[%arg2] : memref<8xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %alloc_0[%arg2] : memref<8xf32>
      }
    }
    affine.for %arg2 = 0 to 8 {
      %0 = affine.load %alloc_0[%arg2] : memref<8xf32>
      affine.store %0, %arg1[%arg2] : memref<8xf32>
    }
    return
  }
}
// CHECK: set = affine_set<(d0, d1) : (d0 == 0, d1 == 0)>
// CHECK: set1 = affine_set<(d0, d1) : (d0 - 15 == 0, d1 - 31 == 0)>
// CHECK: set2 = affine_set<(d0) : (d0 == 0)>
// CHECK: set3 = affine_set<(d0) : (d0 - 15 == 0)>
// CHECK: module attributes {torch.debug_module_name = "test"} {
// CHECK:  func.func @forward(%arg0: memref<8xf32>, %arg1: memref<8xf32>) {
// CHECK:    %cst = arith.constant 0.000000e+00 : f32
// CHECK:    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8xf32>
// CHECK:    affine.for %arg2 = 0 to 8 {
// CHECK:      affine.store %cst, %alloc_1[%arg2] : memref<8xf32>
// CHECK:    }
// CHECK:    affine.for %arg2 = 0 to 8 {
// CHECK:      affine.for %arg3 = 0 to 16 {
// CHECK:        affine.for %arg4 = 0 to 32 {
// CHECK:          %0 = affine.load %arg0[%arg2] : memref<8xf32>
// CHECK:          affine.if #set(%arg3, %arg4) {
// CHECK:            %3 = affine.load %alloc_1[%arg2] : memref<8xf32>
// CHECK:            affine.store %3, %alloc[%arg2] : memref<8xf32>
// CHECK:          }
// CHECK:          %1 = affine.load %alloc[%arg2] : memref<8xf32>
// CHECK:          %2 = arith.addf %0, %1 : f32
// CHECK:          affine.store %2, %alloc[%arg2] : memref<8xf32>
// CHECK:          affine.if #set1(%arg3, %arg4) {
// CHECK:            %3 = affine.load %alloc[%arg2] : memref<8xf32>
// CHECK:            affine.store %3, %alloc_0[%arg2] : memref<8xf32>
// CHECK:          }
// CHECK:        }
// CHECK:      }
// CHECK:    }
// CHECK:    affine.for %arg2 = 0 to 8 {
// CHECK:      affine.store %cst, %alloc_4[%arg2] : memref<8xf32>
// CHECK:    }
// CHECK:    affine.for %arg2 = 0 to 8 {
// CHECK:      affine.for %arg3 = 0 to 16 {
// CHECK:        %0 = affine.load %alloc_0[%arg2] : memref<8xf32>
// CHECK:        affine.if #set2(%arg3) {
// CHECK:          %3 = affine.load %alloc_4[%arg2] : memref<8xf32>
// CHECK:          affine.store %3, %alloc_2[%arg2] : memref<8xf32>
// CHECK:        }
// CHECK:        %1 = affine.load %alloc_2[%arg2] : memref<8xf32>
// CHECK:        %2 = arith.addf %0, %1 : f32
// CHECK:        affine.store %2, %alloc_2[%arg2] : memref<8xf32>
// CHECK:        affine.if #set3(%arg3) {
// CHECK:          %3 = affine.load %alloc_2[%arg2] : memref<8xf32>
// CHECK:          affine.store %3, %alloc_3[%arg2] : memref<8xf32>
// CHECK:        }
// CHECK:      }
// CHECK:    }
// CHECK:    affine.for %arg2 = 0 to 8 {
// CHECK:      %0 = affine.load %alloc_3[%arg2] : memref<8xf32>
// CHECK:      affine.store %0, %arg1[%arg2] : memref<8xf32>
// CHECK:    }
// CHECK:    return
// CHECK:  }
// CHECK: }