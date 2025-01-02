module attributes {torch.debug_module_name = "k7mmtree"} {
  func.func private @forward(memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>)
  func.func @main() -> i32 {
    %cst = arith.constant dense_resource<input_0> : memref<64x64xf32>
    %cst_0 = arith.constant dense_resource<input_1> : memref<64x64xf32>
    %cst_1 = arith.constant dense_resource<input_2> : memref<64x64xf32>
    %cst_2 = arith.constant dense_resource<input_3> : memref<64x64xf32>
    %cst_3 = arith.constant dense_resource<input_4> : memref<64x64xf32>
    %cst_4 = arith.constant dense_resource<input_5> : memref<64x64xf32>
    %cst_5 = arith.constant dense_resource<input_6> : memref<64x64xf32>
    %cst_6 = arith.constant dense_resource<input_7> : memref<64x64xf32>
    %alloc = memref.alloc() : memref<64x64xf32>
    call @forward(%cst, %cst_0, %cst_1, %cst_2, %cst_3, %cst_4, %cst_5, %cst_6, %alloc) : (memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>, memref<64x64xf32>) -> ()
    %cst_7 = arith.constant dense<true> : memref<1xi1>
    %cst_8 = arith.constant dense_resource<output_0> : memref<64x64xf32>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 64 {
        %1 = affine.load %alloc[%arg0, %arg1] : memref<64x64xf32>
        %2 = affine.load %cst_8[%arg0, %arg1] : memref<64x64xf32>
        %3 = arith.subf %1, %2 : f32
        %4 = arith.subf %2, %1 : f32
        %cst_9 = arith.constant 1.000000e-01 : f32
        %5 = arith.cmpf ugt, %3, %cst_9 : f32
        %6 = arith.cmpf ugt, %4, %cst_9 : f32
        %7 = arith.ori %5, %6 : i1
        scf.if %7 {
          %c0_10 = arith.constant 0 : index
          %false = arith.constant false
          affine.store %false, %cst_7[%c0_10] : memref<1xi1>
        }
      }
    }
    %c0 = arith.constant 0 : index
    %0 = affine.load %cst_7[%c0] : memref<1xi1>
    cf.assert %0, "Error!"
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

{-#
  dialect_resources: {
    builtin: {
      input_0: "0x00000000",
      input_1: "0x00000000",
      input_2: "0x00000000",
      input_3: "0x00000000",
      input_4: "0x00000000",
      input_5: "0x00000000",
      input_6: "0x00000000",
      input_7: "0x00000000",
      output_0: "0x00000000"
    }
  }
#-}

