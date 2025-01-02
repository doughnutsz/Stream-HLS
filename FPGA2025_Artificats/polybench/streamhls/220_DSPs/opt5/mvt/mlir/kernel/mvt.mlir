#map = affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 mod 10, d0 floordiv 10)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 2, d0 floordiv 10, d1 floordiv 2)>
#set = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 10 - 399 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 2 - 399 == 0)>
module attributes {torch.debug_module_name = "mvt"} {
  func.func @node0(%arg0: tensor<2x!dataflow.stream<f32, 200>>, %arg1: memref<400xf32, #map>) {
    affine.for %arg2 = 0 to 200 {
      affine.for %arg3 = 0 to 2 {
        %0 = dataflow.aofs_read %arg0[%arg3] {map = #map1} : (tensor<2x!dataflow.stream<f32, 200>>) -> f32
        affine.store %0, %arg1[%arg3 + %arg2 * 2] : memref<400xf32, #map>
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: tensor<10x!dataflow.stream<f32, 40>>, %arg1: memref<400xf32, #map2>) {
    affine.for %arg2 = 0 to 40 {
      affine.for %arg3 = 0 to 10 {
        %0 = dataflow.aofs_read %arg0[%arg3] {map = #map1} : (tensor<10x!dataflow.stream<f32, 40>>) -> f32
        affine.store %0, %arg1[%arg3 + %arg2 * 10] : memref<400xf32, #map2>
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node2(%arg0: tensor<2x10x!dataflow.stream<f32, 8000>>, %arg1: memref<400xf32, #map2>, %arg2: tensor<2x!dataflow.stream<f32, 200>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<400xf32, #map>
    affine.for %arg4 = 0 to 40 {
      affine.for %arg5 = 0 to 200 {
        affine.for %arg6 = 0 to 10 {
          affine.for %arg7 = 0 to 2 {
            %0 = dataflow.aofs_read %arg0[%arg7, %arg6] {map = #map3} : (tensor<2x10x!dataflow.stream<f32, 8000>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 10] : memref<400xf32, #map2>
            affine.if #set(%arg6, %arg4) {
              affine.store %arg3, %alloc[%arg7 + %arg5 * 2] : memref<400xf32, #map>
            }
            %2 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<400xf32, #map>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7 + %arg5 * 2] : memref<400xf32, #map>
            affine.if #set1(%arg6, %arg4) {
              %5 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<400xf32, #map>
              dataflow.aofs_write %arg2[%arg7], %5 {map = #map1} : tensor<2x!dataflow.stream<f32, 200>>, f32
            }
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<400x400xf32, #map4>, %arg1: tensor<2x10x!dataflow.stream<f32, 8000>>) {
    affine.for %arg2 = 0 to 40 {
      affine.for %arg3 = 0 to 200 {
        affine.for %arg4 = 0 to 10 {
          affine.for %arg5 = 0 to 2 {
            %0 = affine.load %arg0[%arg4 + %arg2 * 10, %arg5 + %arg3 * 2] : memref<400x400xf32, #map4>
            dataflow.aofs_write %arg1[%arg5, %arg4], %0 {map = #map3} : tensor<2x10x!dataflow.stream<f32, 8000>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: memref<400x400xf32, #map4>, %arg1: memref<400xf32, #map>, %arg2: tensor<10x!dataflow.stream<f32, 40>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<400xf32, #map2>
    affine.for %arg4 = 0 to 200 {
      affine.for %arg5 = 0 to 40 {
        affine.for %arg6 = 0 to 2 {
          affine.for %arg7 = 0 to 10 {
            %0 = affine.load %arg0[%arg7 + %arg5 * 10, %arg6 + %arg4 * 2] : memref<400x400xf32, #map4>
            %1 = affine.load %arg1[%arg6 + %arg4 * 2] : memref<400xf32, #map>
            affine.if #set2(%arg6, %arg4) {
              affine.store %arg3, %alloc[%arg7 + %arg5 * 10] : memref<400xf32, #map2>
            }
            %2 = affine.load %alloc[%arg7 + %arg5 * 10] : memref<400xf32, #map2>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7 + %arg5 * 10] : memref<400xf32, #map2>
            affine.if #set3(%arg6, %arg4) {
              %5 = affine.load %alloc[%arg7 + %arg5 * 10] : memref<400xf32, #map2>
              dataflow.aofs_write %arg2[%arg7], %5 {map = #map1} : tensor<10x!dataflow.stream<f32, 40>>, f32
            }
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<400x400xf32, #map4>, %arg1: memref<400x400xf32, #map4>, %arg2: memref<400xf32, #map>, %arg3: memref<400xf32, #map2>, %arg4: memref<400xf32, #map2>, %arg5: memref<400xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<2x!dataflow.stream<f32, 200>>
    %1 = dataflow.aofs : tensor<2x10x!dataflow.stream<f32, 8000>>
    %2 = dataflow.aofs : tensor<10x!dataflow.stream<f32, 40>>
    call @node4(%arg0, %arg2, %2, %cst) : (memref<400x400xf32, #map4>, memref<400xf32, #map>, tensor<10x!dataflow.stream<f32, 40>>, f32) -> ()
    call @node3(%arg1, %1) : (memref<400x400xf32, #map4>, tensor<2x10x!dataflow.stream<f32, 8000>>) -> ()
    call @node2(%1, %arg3, %0, %cst) : (tensor<2x10x!dataflow.stream<f32, 8000>>, memref<400xf32, #map2>, tensor<2x!dataflow.stream<f32, 200>>, f32) -> ()
    call @node1(%2, %arg4) : (tensor<10x!dataflow.stream<f32, 40>>, memref<400xf32, #map2>) -> ()
    call @node0(%0, %arg5) : (tensor<2x!dataflow.stream<f32, 200>>, memref<400xf32, #map>) -> ()
    return
  }
}

