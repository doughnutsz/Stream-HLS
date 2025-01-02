module attributes {torch.debug_module_name = "bicg"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<410x390xf32>, %arg1: tensor<410x390xf32>, %arg2: tensor<410xf32>, %arg3: tensor<390xf32>) -> (tensor<390xf32>, tensor<410xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<390xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<390xf32>) -> tensor<390xf32>
    %2 = linalg.vecmat ins(%arg2, %arg0 : tensor<410xf32>, tensor<410x390xf32>) outs(%1 : tensor<390xf32>) -> tensor<390xf32>
    %3 = tensor.empty() : tensor<410xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<410xf32>) -> tensor<410xf32>
    %5 = linalg.matvec ins(%arg1, %arg3 : tensor<410x390xf32>, tensor<390xf32>) outs(%4 : tensor<410xf32>) -> tensor<410xf32>
    return %2, %5 : tensor<390xf32>, tensor<410xf32>
  }
}

