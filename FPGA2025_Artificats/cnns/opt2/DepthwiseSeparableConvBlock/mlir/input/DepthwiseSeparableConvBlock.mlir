#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0, d1, d2, d3)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<8xf32>
    %cst_1 = arith.constant dense<[[[[0.196528018]], [[0.226367563]], [[0.289669931]], [[-0.16157259]], [[0.116169907]], [[-0.288891703]], [[0.336023033]], [[-0.0334616043]]], [[[-0.0389493369]], [[-0.0946899354]], [[-3.031920e-01]], [[0.139246911]], [[0.025817683]], [[-0.328274369]], [[0.203134149]], [[0.217599377]]], [[[-0.0607551448]], [[0.0558846965]], [[-4.551830e-02]], [[-0.176580757]], [[0.256701797]], [[0.21286653]], [[0.0498879589]], [[-0.231376961]]], [[[-0.186389163]], [[0.306170344]], [[-0.0635983273]], [[0.231572986]], [[0.114029266]], [[0.243700072]], [[-0.349983603]], [[0.303311348]]], [[[-0.0147684664]], [[0.291509688]], [[-0.203139037]], [[0.294171929]], [[-0.0955896825]], [[0.128968596]], [[-0.139021039]], [[0.0193993505]]], [[[0.31218645]], [[-0.121084988]], [[-0.280023962]], [[0.0465014167]], [[-0.0452018194]], [[-0.0703004822]], [[-0.0589802563]], [[-0.203390196]]], [[[-0.0958391949]], [[-0.0470505506]], [[-0.188251853]], [[0.268409133]], [[-0.264290571]], [[-0.134312093]], [[0.146147698]], [[0.0742874891]]], [[[0.163196564]], [[0.109609328]], [[0.164516136]], [[0.0408355743]], [[-0.300797164]], [[-0.0984635949]], [[0.274232894]], [[-0.219685689]]]]> : tensor<8x8x1x1xf32>
    %cst_2 = arith.constant dense<[[[[-0.122583829, 0.13036041, 0.243315309], [-0.241903067, 0.0976821184, 0.265573382], [-0.23158662, 0.163204283, -0.0663185939]]], [[[0.235136434, 0.245192572, 0.234646723], [-0.303841323, 0.225912973, -0.175780416], [0.16521129, 0.0780708789, -0.236974165]]], [[[-0.29635942, -0.183070153, 0.0995617732], [0.00685977935, 0.113850757, 0.245936081], [0.0370722227, 0.106984496, -0.111389957]]], [[[0.115437627, 0.0213712864, -0.280801624], [-0.0631810427, -0.113323852, 0.23277545], [-0.293185234, -0.192929432, -0.245938823]]], [[[-0.321413368, 0.273961425, -0.252744287], [-0.269542336, 0.306961536, 0.274822235], [0.0369398594, 0.259435505, 0.32515502]]], [[[-0.225317478, 0.237511486, 0.0438220128], [-0.146307468, -0.214232534, -0.209022164], [-0.0550880842, -0.0451842174, 0.295532405]]], [[[-0.0992062911, -0.190077752, -0.226526424], [0.087224409, -0.288901091, 0.21591489], [0.074286744, -0.296986043, -0.00197382784]]], [[[-0.233918592, -0.148992151, -0.0779628381], [0.175057694, 0.145975918, -0.156029582], [0.177936479, -0.190630525, -0.243232846]]]]> : tensor<8x1x3x3xf32>
    %false = arith.constant false
    %cst_3 = arith.constant 0.000000e+00 : f32
    %cst_4 = arith.constant 1.000000e-05 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %padded = tensor.pad %arg0 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst_3 : f32
    } : tensor<1x8x112x112xf32> to tensor<1x8x114x114xf32>
    %0 = tensor.empty() : tensor<1x8x112x112xf32>
    %1 = linalg.fill ins(%cst_3 : f32) outs(%0 : tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32>
    %collapsed = tensor.collapse_shape %cst_2 [[0, 1], [2], [3]] : tensor<8x1x3x3xf32> into tensor<8x3x3xf32>
    %2 = linalg.depthwise_conv_2d_nchw_chw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded, %collapsed : tensor<1x8x114x114xf32>, tensor<8x3x3xf32>) outs(%1 : tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32>
    %3 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%2, %cst_1 : tensor<1x8x112x112xf32>, tensor<8x8x1x1xf32>) outs(%1 : tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32>
    %4 = arith.cmpi eq, %false, %false : i1
    cf.assert %4, "training is not supported for now"
    %5 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map1, #map1, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%3, %cst_0, %cst, %cst, %cst_0 : tensor<1x8x112x112xf32>, tensor<8xf32>, tensor<8xf32>, tensor<8xf32>, tensor<8xf32>) outs(%3 : tensor<1x8x112x112xf32>) {
    ^bb0(%in: f32, %in_5: f32, %in_6: f32, %in_7: f32, %in_8: f32, %out: f32):
      %7 = arith.truncf %cst_4 : f64 to f32
      %8 = arith.addf %in_8, %7 : f32
      %9 = math.rsqrt %8 : f32
      %10 = arith.subf %in, %in_7 : f32
      %11 = arith.mulf %10, %9 : f32
      %12 = arith.mulf %11, %in_5 : f32
      %13 = arith.addf %12, %in_6 : f32
      linalg.yield %13 : f32
    } -> tensor<1x8x112x112xf32>
    %6 = linalg.generic {indexing_maps = [#map2, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%5 : tensor<1x8x112x112xf32>) outs(%0 : tensor<1x8x112x112xf32>) {
    ^bb0(%in: f32, %out: f32):
      %7 = arith.cmpf ugt, %in, %cst_3 : f32
      %8 = arith.select %7, %in, %cst_3 : f32
      linalg.yield %8 : f32
    } -> tensor<1x8x112x112xf32>
    return %6 : tensor<1x8x112x112xf32>
  }
}

