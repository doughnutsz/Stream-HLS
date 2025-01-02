#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
module attributes {torch.debug_module_name = "k2mm"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<180x210xf32>, %arg1: tensor<210x190xf32>, %arg2: tensor<190x220xf32>, %arg3: tensor<180x220xf32>) -> tensor<180x220xf32> {
    %cst = arith.constant dense<1.000000e-01> : tensor<f64>
    %cst_0 = arith.constant dense<5.000000e-01> : tensor<f64>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<180x190xf32>
    %1 = linalg.fill ins(%cst_1 : f32) outs(%0 : tensor<180x190xf32>) -> tensor<180x190xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<180x210xf32>, tensor<210x190xf32>) outs(%1 : tensor<180x190xf32>) -> tensor<180x190xf32>
    %3 = tensor.empty() : tensor<180x220xf32>
    %4 = linalg.fill ins(%cst_1 : f32) outs(%3 : tensor<180x220xf32>) -> tensor<180x220xf32>
    %5 = linalg.matmul ins(%2, %arg2 : tensor<180x190xf32>, tensor<190x220xf32>) outs(%4 : tensor<180x220xf32>) -> tensor<180x220xf32>
    %6 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%5, %cst_0 : tensor<180x220xf32>, tensor<f64>) outs(%3 : tensor<180x220xf32>) {
    ^bb0(%in: f32, %in_2: f64, %out: f32):
      %9 = arith.truncf %in_2 : f64 to f32
      %10 = arith.mulf %in, %9 : f32
      linalg.yield %10 : f32
    } -> tensor<180x220xf32>
    %7 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg3, %cst : tensor<180x220xf32>, tensor<f64>) outs(%3 : tensor<180x220xf32>) {
    ^bb0(%in: f32, %in_2: f64, %out: f32):
      %9 = arith.truncf %in_2 : f64 to f32
      %10 = arith.mulf %in, %9 : f32
      linalg.yield %10 : f32
    } -> tensor<180x220xf32>
    %8 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%6, %7 : tensor<180x220xf32>, tensor<180x220xf32>) outs(%3 : tensor<180x220xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %9 = arith.addf %in, %in_2 : f32
      linalg.yield %9 : f32
    } -> tensor<180x220xf32>
    return %8 : tensor<180x220xf32>
  }
}

