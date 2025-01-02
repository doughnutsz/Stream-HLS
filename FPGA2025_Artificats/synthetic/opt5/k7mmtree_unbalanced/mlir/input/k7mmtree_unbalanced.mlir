module attributes {torch.debug_module_name = "k7mmtree"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<64x32xf32>, %arg1: tensor<32x64xf32>, %arg2: tensor<64x64xf32>, %arg3: tensor<64x128xf32>, %arg4: tensor<128x128xf32>, %arg5: tensor<128x64xf32>, %arg6: tensor<64x32xf32>, %arg7: tensor<32x16xf32>) -> tensor<64x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<64x64xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<64x32xf32>, tensor<32x64xf32>) outs(%1 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %3 = tensor.empty() : tensor<64x128xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %5 = linalg.matmul ins(%arg2, %arg3 : tensor<64x64xf32>, tensor<64x128xf32>) outs(%4 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %6 = tensor.empty() : tensor<128x64xf32>
    %7 = linalg.fill ins(%cst : f32) outs(%6 : tensor<128x64xf32>) -> tensor<128x64xf32>
    %8 = linalg.matmul ins(%arg4, %arg5 : tensor<128x128xf32>, tensor<128x64xf32>) outs(%7 : tensor<128x64xf32>) -> tensor<128x64xf32>
    %9 = tensor.empty() : tensor<64x16xf32>
    %10 = linalg.fill ins(%cst : f32) outs(%9 : tensor<64x16xf32>) -> tensor<64x16xf32>
    %11 = linalg.matmul ins(%arg6, %arg7 : tensor<64x32xf32>, tensor<32x16xf32>) outs(%10 : tensor<64x16xf32>) -> tensor<64x16xf32>
    %12 = linalg.matmul ins(%2, %5 : tensor<64x64xf32>, tensor<64x128xf32>) outs(%4 : tensor<64x128xf32>) -> tensor<64x128xf32>
    %13 = tensor.empty() : tensor<128x16xf32>
    %14 = linalg.fill ins(%cst : f32) outs(%13 : tensor<128x16xf32>) -> tensor<128x16xf32>
    %15 = linalg.matmul ins(%8, %11 : tensor<128x64xf32>, tensor<64x16xf32>) outs(%14 : tensor<128x16xf32>) -> tensor<128x16xf32>
    %16 = linalg.matmul ins(%12, %15 : tensor<64x128xf32>, tensor<128x16xf32>) outs(%10 : tensor<64x16xf32>) -> tensor<64x16xf32>
    return %16 : tensor<64x16xf32>
  }
}

