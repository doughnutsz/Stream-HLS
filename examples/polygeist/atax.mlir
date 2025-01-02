module {
  func.func @forward(%arg0: memref<390x410xf32>, %arg1: memref<410xf32>, %arg2: memref<410xf32>) {
    %alloc = memref.alloc() : memref<390xf32>
    %alloc_0 = memref.alloc() : memref<410xf32>
    affine.for %arg4 = 0 to 390 {
      affine.for %arg5 = 0 to 410 {
        %0 = affine.load %arg0[%arg4, %arg5] : memref<390x410xf32>
        %1 = affine.load %arg1[%arg5] : memref<410xf32>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %alloc[%arg4] : memref<390xf32>
        %4 = arith.addf %3, %2 : f32
        affine.store %4, %alloc[%arg4] : memref<390xf32>
      }
    }
    affine.for %arg4 = 0 to 410 {
      affine.for %arg5 = 0 to 390 {
        %0 = affine.load %arg0[%arg5, %arg4] : memref<390x410xf32>
        %1 = affine.load %alloc[%arg5] : memref<390xf32>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %alloc_0[%arg4] : memref<410xf32>
        %4 = arith.addf %3, %2 : f32
        affine.store %4, %alloc_0[%arg4] : memref<410xf32>
      }
    }
    affine.for %arg4 = 0 to 410 {
      %0 = affine.load %alloc_0[%arg4] : memref<410xf32>
      affine.store %0, %arg2[%arg4] : memref<410xf32>
    }
    return
  }
}
