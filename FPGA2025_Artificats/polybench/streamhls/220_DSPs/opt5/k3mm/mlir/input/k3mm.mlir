module attributes {torch.debug_module_name = "k3mm"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<180x200xf32>, %arg1: tensor<200x190xf32>, %arg2: tensor<190x220xf32>, %arg3: tensor<220x210xf32>) -> tensor<180x210xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<180x190xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<180x190xf32>) -> tensor<180x190xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<180x200xf32>, tensor<200x190xf32>) outs(%1 : tensor<180x190xf32>) -> tensor<180x190xf32>
    %3 = tensor.empty() : tensor<190x210xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%3 : tensor<190x210xf32>) -> tensor<190x210xf32>
    %5 = linalg.matmul ins(%arg2, %arg3 : tensor<190x220xf32>, tensor<220x210xf32>) outs(%4 : tensor<190x210xf32>) -> tensor<190x210xf32>
    %6 = tensor.empty() : tensor<180x210xf32>
    %7 = linalg.fill ins(%cst : f32) outs(%6 : tensor<180x210xf32>) -> tensor<180x210xf32>
    %8 = linalg.matmul ins(%2, %5 : tensor<180x190xf32>, tensor<190x210xf32>) outs(%7 : tensor<180x210xf32>) -> tensor<180x210xf32>
    return %8 : tensor<180x210xf32>
  }
}

