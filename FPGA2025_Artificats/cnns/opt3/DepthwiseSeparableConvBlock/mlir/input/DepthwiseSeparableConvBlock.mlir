#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0, d1, d2, d3)>
module attributes {torch.debug_module_name = "DepthwiseSeparableConvBlock"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<1x8x112x112xf32>) -> tensor<1x8x112x112xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<8xf32>
    %cst_1 = arith.constant dense<[[[[-0.34646976]], [[0.089019075]], [[0.352178127]], [[-0.0834950134]], [[-0.0255962014]], [[0.313151449]], [[0.318026066]], [[-0.229360074]]], [[[-0.34530589]], [[0.341271907]], [[0.130735978]], [[0.00696645258]], [[0.0560766347]], [[-0.0558728129]], [[0.34930253]], [[0.31776008]]], [[[-0.337055176]], [[0.139688641]], [[-0.190821916]], [[-0.253982216]], [[-0.300118595]], [[0.127044633]], [[0.108872391]], [[0.321472675]]], [[[0.304146737]], [[0.130110905]], [[0.275538504]], [[0.141826257]], [[0.0719902292]], [[0.0713539421]], [[0.0317203067]], [[0.082418628]]], [[[-0.308602512]], [[-0.13045688]], [[-0.174955904]], [[0.181974024]], [[-0.301336586]], [[-0.313241869]], [[-0.100757264]], [[-0.156520247]]], [[[0.0697360486]], [[0.160000309]], [[9.262090e-02]], [[0.30515486]], [[-0.12115398]], [[-0.146400779]], [[-0.210398793]], [[-0.332659334]]], [[[0.0256237239]], [[-0.158816069]], [[0.10118261]], [[-0.0120771788]], [[0.166376576]], [[0.255319029]], [[-0.104027189]], [[0.301106513]]], [[[0.071745865]], [[-0.204116762]], [[-0.307513267]], [[-9.0122607E-4]], [[-7.400270e-02]], [[-0.15970777]], [[0.103476159]], [[-0.166900635]]]]> : tensor<8x8x1x1xf32>
    %cst_2 = arith.constant dense<[[[[-0.142621085, -0.237067699, 0.158205032], [-0.238010213, 0.0110286083, 0.151465893], [0.0974142551, -0.324197114, 0.21517241]]], [[[0.264917076, 0.0317604169, -0.0713649616], [-0.324660271, -0.0553447418, -0.188256428], [0.108444296, -0.00885760784, -0.05081328]]], [[[-0.235089064, 0.0750961304, 7.901470e-03], [-0.285057247, 0.146487921, -0.257890671], [-0.075423561, 0.244400829, 0.301397383]]], [[[-0.02908675, 0.178728312, -0.12685661], [0.0940568894, -0.207478449, -0.0511117801], [-0.268494308, -0.0719555244, 0.32093966]]], [[[-0.0441870317, -0.110765934, -0.0549975634], [0.09411522, 0.0448778495, 0.138416573], [0.161431238, -0.238210648, -0.325174302]]], [[[-0.160607025, 0.125012636, -0.0579388142], [0.274264544, -0.0998266562, -0.0191164427], [0.283507943, 0.0779523104, -0.196037412]]], [[[0.232993051, -0.0727090836, 0.136124536], [0.227864593, -0.223662183, -0.135127634], [-0.0106554432, 0.00211822987, 3.026620e-01]]], [[[-0.170914143, -0.210119173, 0.153036594], [-0.097667776, -0.166837811, -0.238011479], [0.210756466, -0.235854432, -0.254551232]]]]> : tensor<8x1x3x3xf32>
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

