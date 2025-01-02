#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
module attributes {torch.debug_module_name = "gemm"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<200x240xf32>, %arg1: tensor<240x220xf32>, %arg2: tensor<200x220xf32>) -> tensor<200x220xf32> {
    %cst = arith.constant dense<1.000000e-01> : tensor<f64>
    %cst_0 = arith.constant dense<5.000000e-01> : tensor<f64>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<200x220xf32>
    %1 = linalg.fill ins(%cst_1 : f32) outs(%0 : tensor<200x220xf32>) -> tensor<200x220xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<200x240xf32>, tensor<240x220xf32>) outs(%1 : tensor<200x220xf32>) -> tensor<200x220xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %cst_0 : tensor<200x220xf32>, tensor<f64>) outs(%0 : tensor<200x220xf32>) {
    ^bb0(%in: f32, %in_2: f64, %out: f32):
      %6 = arith.truncf %in_2 : f64 to f32
      %7 = arith.mulf %in, %6 : f32
      linalg.yield %7 : f32
    } -> tensor<200x220xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg2, %cst : tensor<200x220xf32>, tensor<f64>) outs(%0 : tensor<200x220xf32>) {
    ^bb0(%in: f32, %in_2: f64, %out: f32):
      %6 = arith.truncf %in_2 : f64 to f32
      %7 = arith.mulf %in, %6 : f32
      linalg.yield %7 : f32
    } -> tensor<200x220xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%3, %4 : tensor<200x220xf32>, tensor<200x220xf32>) outs(%0 : tensor<200x220xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %6 = arith.addf %in, %in_2 : f32
      linalg.yield %6 : f32
    } -> tensor<200x220xf32>
    return %5 : tensor<200x220xf32>
  }
}

