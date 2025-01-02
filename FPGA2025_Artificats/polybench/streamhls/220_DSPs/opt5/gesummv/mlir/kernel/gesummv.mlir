#map = affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 10, d0 floordiv 2, d1 floordiv 10)>
#map3 = affine_map<(d0) -> (d0 mod 10, d0 floordiv 10)>
#set = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 10 - 249 == 0)>
module attributes {torch.debug_module_name = "gesummv"} {
  func.func @node0(%arg0: tensor<2x!dataflow.stream<f32, 125>>, %arg1: memref<250xf32, #map>) {
    affine.for %arg2 = 0 to 125 {
      affine.for %arg3 = 0 to 2 {
        %0 = dataflow.aofs_read %arg0[%arg3] {map = #map1} : (tensor<2x!dataflow.stream<f32, 125>>) -> f32
        affine.store %0, %arg1[%arg3 + %arg2 * 2] : memref<250xf32, #map>
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: tensor<2x!dataflow.stream<f32, 125>>, %arg1: tensor<2x!dataflow.stream<f32, 125>>, %arg2: tensor<2x!dataflow.stream<f32, 125>>, %arg3: f64, %arg4: f32) {
    affine.for %arg5 = 0 to 125 {
      affine.for %arg6 = 0 to 2 {
        %0 = dataflow.aofs_read %arg0[%arg6] {map = #map1} : (tensor<2x!dataflow.stream<f32, 125>>) -> f32
        %1 = dataflow.aofs_read %arg1[%arg6] {map = #map1} : (tensor<2x!dataflow.stream<f32, 125>>) -> f32
        %2 = arith.truncf %arg3 : f64 to f32
        %3 = arith.mulf %1, %2 : f32
        %4 = arith.mulf %0, %arg4 : f32
        %5 = arith.addf %4, %3 : f32
        dataflow.aofs_write %arg2[%arg6], %5 {map = #map1} : tensor<2x!dataflow.stream<f32, 125>>, f32
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node2(%arg0: memref<250x250xf32, #map2>, %arg1: memref<250xf32, #map3>, %arg2: tensor<2x!dataflow.stream<f32, 125>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<250xf32, #map>
    affine.for %arg4 = 0 to 25 {
      affine.for %arg5 = 0 to 125 {
        affine.for %arg6 = 0 to 10 {
          affine.for %arg7 = 0 to 2 {
            %0 = affine.load %arg0[%arg7 + %arg5 * 2, %arg6 + %arg4 * 10] : memref<250x250xf32, #map2>
            %1 = affine.load %arg1[%arg6 + %arg4 * 10] : memref<250xf32, #map3>
            affine.if #set(%arg6, %arg4) {
              affine.store %arg3, %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
            }
            %2 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
            affine.if #set1(%arg6, %arg4) {
              %5 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
              dataflow.aofs_write %arg2[%arg7], %5 {map = #map1} : tensor<2x!dataflow.stream<f32, 125>>, f32
            }
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<250x250xf32, #map2>, %arg1: memref<250xf32, #map3>, %arg2: tensor<2x!dataflow.stream<f32, 125>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<250xf32, #map>
    affine.for %arg4 = 0 to 25 {
      affine.for %arg5 = 0 to 125 {
        affine.for %arg6 = 0 to 10 {
          affine.for %arg7 = 0 to 2 {
            %0 = affine.load %arg0[%arg7 + %arg5 * 2, %arg6 + %arg4 * 10] : memref<250x250xf32, #map2>
            %1 = affine.load %arg1[%arg6 + %arg4 * 10] : memref<250xf32, #map3>
            affine.if #set(%arg6, %arg4) {
              affine.store %arg3, %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
            }
            %2 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
            affine.if #set1(%arg6, %arg4) {
              %5 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<250xf32, #map>
              dataflow.aofs_write %arg2[%arg7], %5 {map = #map1} : tensor<2x!dataflow.stream<f32, 125>>, f32
            }
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<250x250xf32, #map2>, %arg1: memref<250x250xf32, #map2>, %arg2: memref<250xf32, #map3>, %arg3: memref<250xf32, #map>) {
    %cst = arith.constant 1.500000e+00 : f32
    %cst_0 = arith.constant 1.200000e+00 : f64
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<2x!dataflow.stream<f32, 125>>
    %1 = dataflow.aofs : tensor<2x!dataflow.stream<f32, 125>>
    %2 = dataflow.aofs : tensor<2x!dataflow.stream<f32, 125>>
    call @node3(%arg0, %arg2, %2, %cst_1) : (memref<250x250xf32, #map2>, memref<250xf32, #map3>, tensor<2x!dataflow.stream<f32, 125>>, f32) -> ()
    call @node2(%arg1, %arg2, %1, %cst_1) : (memref<250x250xf32, #map2>, memref<250xf32, #map3>, tensor<2x!dataflow.stream<f32, 125>>, f32) -> ()
    call @node1(%2, %1, %0, %cst_0, %cst) : (tensor<2x!dataflow.stream<f32, 125>>, tensor<2x!dataflow.stream<f32, 125>>, tensor<2x!dataflow.stream<f32, 125>>, f64, f32) -> ()
    call @node0(%0, %arg3) : (tensor<2x!dataflow.stream<f32, 125>>, memref<250xf32, #map>) -> ()
    return
  }
}

