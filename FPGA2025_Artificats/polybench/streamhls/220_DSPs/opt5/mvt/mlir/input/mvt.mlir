#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "mvt"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<400x400xf32>, %arg1: tensor<400x400xf32>, %arg2: tensor<400xf32>, %arg3: tensor<400xf32>) -> (tensor<400xf32>, tensor<400xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<400xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<400xf32>) -> tensor<400xf32>
    %2 = linalg.matvec ins(%arg0, %arg2 : tensor<400x400xf32>, tensor<400xf32>) outs(%1 : tensor<400xf32>) -> tensor<400xf32>
    %3 = tensor.empty() : tensor<400x400xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<400x400xf32>) outs(%3 : tensor<400x400xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<400x400xf32>
    %5 = linalg.matvec ins(%4, %arg3 : tensor<400x400xf32>, tensor<400xf32>) outs(%1 : tensor<400xf32>) -> tensor<400xf32>
    return %2, %5 : tensor<400xf32>, tensor<400xf32>
  }
}

