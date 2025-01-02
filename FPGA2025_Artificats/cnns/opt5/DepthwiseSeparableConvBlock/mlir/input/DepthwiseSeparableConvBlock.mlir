#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0, d1, d2, d3)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<8xf32>
    %cst_1 = arith.constant dense<[[[[-0.30515936]], [[-0.144949839]], [[-0.219902277]], [[0.206145674]], [[-0.00276175654]], [[0.281564176]], [[-0.241820738]], [[0.111142039]]], [[[-0.25665307]], [[0.191092581]], [[0.20759207]], [[-0.2470368]], [[0.279981285]], [[-0.130188957]], [[-0.181335419]], [[-0.345528543]]], [[[-0.100917846]], [[-0.0764409825]], [[-0.306151807]], [[-0.0572920218]], [[-0.0558185689]], [[-0.241868749]], [[0.191003948]], [[-0.221234366]]], [[[-0.0889015272]], [[0.149111077]], [[-0.122121632]], [[-0.0838962495]], [[-0.0315554291]], [[0.0337604694]], [[0.253325313]], [[0.347589612]]], [[[0.222323447]], [[0.00257386593]], [[-0.308656722]], [[0.0389082842]], [[0.106023304]], [[9.65626445E-4]], [[0.0174983181]], [[0.0126873814]]], [[[0.0486317724]], [[0.14130713]], [[-0.0965290069]], [[-0.336640865]], [[0.00633075135]], [[0.0964610278]], [[2.581040e-01]], [[-0.127996057]]], [[[0.0443074629]], [[-0.0398708321]], [[-0.20330134]], [[0.260671347]], [[-0.0301371887]], [[0.341966331]], [[0.0563497879]], [[0.179338589]]], [[[-0.16427353]], [[0.132465184]], [[-0.320362538]], [[-0.0765766501]], [[0.193117365]], [[-0.191309944]], [[-0.0995575562]], [[-0.0884076878]]]]> : tensor<8x8x1x1xf32>
    %cst_2 = arith.constant dense<[[[[0.253041029, 0.00573257636, -0.232933164], [0.0168619957, 0.114989877, 0.272744179], [-0.199064896, 0.299351811, -0.0529678687]]], [[[-0.265486211, 0.281321228, -0.134185404], [-0.315565765, -0.196251795, -0.177717298], [-0.19023785, -0.250390828, -0.202031106]]], [[[0.274623036, 0.0329083204, 0.199533552], [-0.135659933, -0.320422858, -0.113608919], [-0.0113243666, -0.235169977, -0.221958801]]], [[[0.144051313, 0.105011106, 0.120572135], [-2.784620e-01, 0.00989615917, -0.0868384838], [0.307850897, 0.204132959, 0.191310376]]], [[[-0.0752910823, -0.316064209, 0.102761231], [0.128361076, -0.0830043181, -0.271423817], [0.306005806, -0.181720734, 0.193007678]]], [[[-0.0258194208, 0.0502122641, 0.209941149], [0.182140917, -0.293824524, 2.602690e-01], [0.140506431, 0.206883311, -0.285454512]]], [[[-0.0657429695, 0.0394188166, -0.00594393443], [-0.140608788, -0.0260209646, -0.318750381], [0.277385771, -0.120425664, -0.318705559]]], [[[-0.292205185, -0.0370820761, -0.125483394], [-0.3262344, -0.259417653, 0.00308569288], [-0.078667365, 0.235598892, 0.0969605892]]]]> : tensor<8x1x3x3xf32>
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

