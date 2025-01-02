#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0, d1, d2, d3)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<8xf32>
    %cst_1 = arith.constant dense<[[[[0.346185744]], [[-0.113060012]], [[-0.0301920213]], [[0.241195709]], [[-2.315260e-01]], [[-0.0270058885]], [[0.229487568]], [[-0.317245096]]], [[[0.169837758]], [[0.350980699]], [[-0.301485211]], [[-0.302449614]], [[-0.296972424]], [[0.223004878]], [[-0.0274504535]], [[-0.0322358496]]], [[[0.211221501]], [[0.251898319]], [[0.0817340761]], [[0.331842363]], [[-0.158554584]], [[-0.280874759]], [[0.348199517]], [[0.0623310171]]], [[[-0.338981777]], [[0.227815852]], [[0.00999858137]], [[0.131857678]], [[0.202520624]], [[0.0180382617]], [[0.195410609]], [[0.09437678]]], [[[-0.184633955]], [[-0.312284738]], [[-0.197419465]], [[-0.212733269]], [[-0.122193366]], [[0.180542514]], [[0.147113532]], [[-0.0115300706]]], [[[-0.153763801]], [[0.293510973]], [[-0.293421924]], [[-0.237327084]], [[0.0302011669]], [[-0.243256301]], [[-0.0795396566]], [[-0.212654278]]], [[[0.283516198]], [[0.133480325]], [[-0.171978787]], [[0.00363971759]], [[0.264724523]], [[0.282967955]], [[-0.166075647]], [[0.148767591]]], [[[0.0369826779]], [[-0.0574606955]], [[0.225994945]], [[0.25660494]], [[0.296168387]], [[-0.0375270061]], [[0.280697286]], [[0.114728861]]]]> : tensor<8x8x1x1xf32>
    %cst_2 = arith.constant dense<[[[[-0.315078974, -0.00523777818, 0.0358608961], [0.267990351, -0.0154094305, 0.196178362], [-0.113280937, 0.321303964, -0.170802236]]], [[[0.14755246, -0.28661567, -0.10623765], [0.319218367, 0.230365843, 0.0979020223], [-0.103495322, -0.155797526, 0.0103258295]]], [[[-0.0631543845, -0.253604412, -0.220981598], [0.295533866, 0.0332323313, -0.0867453814], [0.20897305, 0.150132105, 0.0331560373]]], [[[0.330548525, 0.119127274, 0.208130762], [-0.0496242456, 0.0819802284, -0.245499343], [0.239744067, -0.245198131, 0.200686544]]], [[[0.026943922, -0.0605775118, -0.0218555145], [0.0508680753, 0.0407618694, 0.316394627], [0.00649027061, 0.0363516435, -0.295483559]]], [[[-0.306544632, 2.765960e-01, 0.114452921], [6.205980e-02, -0.300361931, 0.0734171122], [-0.298193455, -0.157377765, 0.190872759]]], [[[0.0435587168, -0.153434321, -0.272962302], [9.25819098E-4, 0.265581846, 0.0126257744], [-0.0482723713, -0.00346275186, 0.0143404007]]], [[[-0.130672783, 0.264553249, -0.32002008], [0.139147729, -0.0580702648, -0.199808121], [0.288222641, 0.0541667566, 0.297048777]]]]> : tensor<8x1x3x3xf32>
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

