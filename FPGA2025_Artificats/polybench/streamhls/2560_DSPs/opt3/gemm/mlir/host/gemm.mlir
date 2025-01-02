module attributes {torch.debug_module_name = "gemm"} {
  func.func private @forward(memref<200x240xf32>, memref<240x220xf32>, memref<200x220xf32>, memref<200x220xf32>)
  func.func @main() -> i32 {
    %cst = arith.constant dense_resource<input_0> : memref<200x240xf32>
    %cst_0 = arith.constant dense_resource<input_1> : memref<240x220xf32>
    %cst_1 = arith.constant dense_resource<input_2> : memref<200x220xf32>
    %alloc = memref.alloc() : memref<200x220xf32>
    call @forward(%cst, %cst_0, %cst_1, %alloc) : (memref<200x240xf32>, memref<240x220xf32>, memref<200x220xf32>, memref<200x220xf32>) -> ()
    %cst_2 = arith.constant dense<true> : memref<1xi1>
    %cst_3 = arith.constant dense_resource<output_0> : memref<200x220xf32>
    affine.for %arg0 = 0 to 200 {
      affine.for %arg1 = 0 to 220 {
        %1 = affine.load %alloc[%arg0, %arg1] : memref<200x220xf32>
        %2 = affine.load %cst_3[%arg0, %arg1] : memref<200x220xf32>
        %3 = arith.subf %1, %2 : f32
        %4 = arith.subf %2, %1 : f32
        %cst_4 = arith.constant 1.000000e-01 : f32
        %5 = arith.cmpf ugt, %3, %cst_4 : f32
        %6 = arith.cmpf ugt, %4, %cst_4 : f32
        %7 = arith.ori %5, %6 : i1
        scf.if %7 {
          %c0_5 = arith.constant 0 : index
          %false = arith.constant false
          affine.store %false, %cst_2[%c0_5] : memref<1xi1>
        }
      }
    }
    %c0 = arith.constant 0 : index
    %0 = affine.load %cst_2[%c0] : memref<1xi1>
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
      output_0: "0x00000000"
    }
  }
#-}

