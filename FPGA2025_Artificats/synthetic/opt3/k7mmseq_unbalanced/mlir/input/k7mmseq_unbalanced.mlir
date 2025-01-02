module attributes {torch.debug_module_name = "k7mmseq"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<64x32xf32>, %arg1: tensor<32x64xf32>, %arg2: tensor<64x64xf32>, %arg3: tensor<64x128xf32>, %arg4: tensor<128x128xf32>, %arg5: tensor<128x64xf32>, %arg6: tensor<64x32xf32>, %arg7: tensor<32x16xf32>) -> tensor<64x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<64x64xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<64x32xf32>, tensor<32x64xf32>) outs(%1 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %3 = linalg.matmul ins(%2, %arg2 : tensor<64x64xf32>, tensor<64x64xf32>) outs(%1 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %4 = tensor.empty() : tensor<64x128xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %6 = linalg.matmul ins(%3, %arg3 : tensor<64x64xf32>, tensor<64x128xf32>) outs(%5 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %7 = linalg.matmul ins(%6, %arg4 : tensor<64x128xf32>, tensor<128x128xf32>) outs(%5 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %8 = linalg.matmul ins(%7, %arg5 : tensor<64x128xf32>, tensor<128x64xf32>) outs(%1 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %9 = tensor.empty() : tensor<64x32xf32>
    %10 = linalg.fill ins(%cst : f32) outs(%9 : tensor<64x32xf32>) -> tensor<64x32xf32>
    %11 = linalg.matmul ins(%8, %arg6 : tensor<64x64xf32>, tensor<64x32xf32>) outs(%10 : tensor<64x32xf32>) -> tensor<64x32xf32>
    %12 = tensor.empty() : tensor<64x16xf32>
    %13 = linalg.fill ins(%cst : f32) outs(%12 : tensor<64x16xf32>) -> tensor<64x16xf32>
    %14 = linalg.matmul ins(%11, %arg7 : tensor<64x32xf32>, tensor<32x16xf32>) outs(%13 : tensor<64x16xf32>) -> tensor<64x16xf32>
    return %14 : tensor<64x16xf32>
  }
}

