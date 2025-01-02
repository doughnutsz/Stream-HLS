#map = affine_map<(d0) -> (d0 mod 2, d0 floordiv 2)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0 mod 30, d1 mod 2, d0 floordiv 30, d1 floordiv 2)>
#map3 = affine_map<(d0) -> (d0 mod 30, d0 floordiv 30)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#set = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set1 = affine_set<(d0, d1) : (d0 - 12 == 0, d1 - 29 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 30 == 0)>
#set3 = affine_set<(d0, d1) : (d0 - 204 == 0, d1 - 1 == 0)>
module {
  func.func @node0(%arg0: tensor<2x!dataflow.stream<f32, 205>>, %arg1: memref<410xf32, #map>) {
    affine.for %arg2 = 0 to 205 {
      affine.for %arg3 = 0 to 2 {
        %0 = dataflow.aofs_read %arg0[%arg3] {map = #map1} : (tensor<2x!dataflow.stream<f32, 205>>) -> f32
        affine.store %0, %arg1[%arg3 + %arg2 * 2] : memref<410xf32, #map>
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: tensor<30x!dataflow.stream<f32, 13>>, %arg1: memref<390x410xf32, #map2>, %arg2: tensor<2x!dataflow.stream<f32, 205>>, %arg3: tensor<30x2x!dataflow.stream<f32, 2665>>) {
    %alloc = memref.alloc() : memref<410xf32, #map>
    %alloc_0 = memref.alloc() : memref<390xf32, #map3>
    %alloc_1 = memref.alloc() : memref<390x410xf32>
    affine.for %arg4 = 0 to 205 {
      affine.for %arg5 = 0 to 13 {
        affine.for %arg6 = 0 to 2 {
          affine.for %arg7 = 0 to 30 {
            %0 = affine.load %arg1[%arg7 + %arg5 * 30, %arg6 + %arg4 * 2] : memref<390x410xf32, #map2>
            dataflow.aofs_write %arg3[%arg7, %arg6], %0 {map = #map4} : tensor<30x2x!dataflow.stream<f32, 2665>>, f32
            affine.store %0, %alloc_1[%arg7 + %arg5 * 30, %arg6 + %arg4 * 2] : memref<390x410xf32>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    affine.for %arg4 = 0 to 13 {
      affine.for %arg5 = 0 to 205 {
        affine.for %arg6 = 0 to 30 {
          affine.for %arg7 = 0 to 2 {
            %0 = affine.load %alloc_1[%arg6 + %arg4 * 30, %arg7 + %arg5 * 2] : memref<390x410xf32>
            affine.if #set(%arg7, %arg5) {
              %5 = dataflow.aofs_read %arg0[%arg6] {map = #map1} : (tensor<30x!dataflow.stream<f32, 13>>) -> f32
              affine.store %5, %alloc_0[%arg6 + %arg4 * 30] : memref<390xf32, #map3>
            }
            %1 = affine.load %alloc_0[%arg6 + %arg4 * 30] : memref<390xf32, #map3>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %alloc[%arg7 + %arg5 * 2] : memref<410xf32, #map>
            %4 = arith.addf %3, %2 : f32
            affine.if #set1(%arg4, %arg6) {
              dataflow.aofs_write %arg2[%arg7], %4 {map = #map1} : tensor<2x!dataflow.stream<f32, 205>>, f32
            }
            affine.store %4, %alloc[%arg7 + %arg5 * 2] : memref<410xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: tensor<30x2x!dataflow.stream<f32, 2665>>, %arg1: tensor<2x!dataflow.stream<f32, 205>>, %arg2: tensor<30x!dataflow.stream<f32, 13>>) {
    %alloc = memref.alloc() : memref<390xf32, #map3>
    %alloc_0 = memref.alloc() : memref<410xf32, #map>
    affine.for %arg3 = 0 to 205 {
      affine.for %arg4 = 0 to 13 {
        affine.for %arg5 = 0 to 2 {
          affine.for %arg6 = 0 to 30 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg5] {map = #map4} : (tensor<30x2x!dataflow.stream<f32, 2665>>) -> f32
            affine.if #set2(%arg6, %arg4) {
              %5 = dataflow.aofs_read %arg1[%arg5] {map = #map1} : (tensor<2x!dataflow.stream<f32, 205>>) -> f32
              affine.store %5, %alloc_0[%arg5 + %arg3 * 2] : memref<410xf32, #map>
            }
            %1 = affine.load %alloc_0[%arg5 + %arg3 * 2] : memref<410xf32, #map>
            %2 = arith.mulf %0, %1 : f32
            %3 = affine.load %alloc[%arg6 + %arg4 * 30] : memref<390xf32, #map3>
            %4 = arith.addf %3, %2 : f32
            affine.if #set3(%arg3, %arg5) {
              dataflow.aofs_write %arg2[%arg6], %4 {map = #map1} : tensor<30x!dataflow.stream<f32, 13>>, f32
            }
            affine.store %4, %alloc[%arg6 + %arg4 * 30] : memref<390xf32, #map3>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<410xf32, #map>, %arg1: tensor<2x!dataflow.stream<f32, 205>>) {
    affine.for %arg2 = 0 to 205 {
      affine.for %arg3 = 0 to 2 {
        %0 = affine.load %arg0[%arg3 + %arg2 * 2] : memref<410xf32, #map>
        dataflow.aofs_write %arg1[%arg3], %0 {map = #map1} : tensor<2x!dataflow.stream<f32, 205>>, f32
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @forward(%arg0: memref<390x410xf32, #map2>, %arg1: memref<410xf32, #map>, %arg2: memref<410xf32, #map>) {
    %0 = dataflow.aofs : tensor<2x!dataflow.stream<f32, 205>>
    %1 = dataflow.aofs : tensor<30x!dataflow.stream<f32, 13>>
    %2 = dataflow.aofs : tensor<30x2x!dataflow.stream<f32, 2665>>
    %3 = dataflow.aofs : tensor<2x!dataflow.stream<f32, 205>>
    call @node3(%arg1, %3) : (memref<410xf32, #map>, tensor<2x!dataflow.stream<f32, 205>>) -> ()
    call @node2(%2, %3, %1) : (tensor<30x2x!dataflow.stream<f32, 2665>>, tensor<2x!dataflow.stream<f32, 205>>, tensor<30x!dataflow.stream<f32, 13>>) -> ()
    call @node1(%1, %arg0, %0, %2) : (tensor<30x!dataflow.stream<f32, 13>>, memref<390x410xf32, #map2>, tensor<2x!dataflow.stream<f32, 205>>, tensor<30x2x!dataflow.stream<f32, 2665>>) -> ()
    call @node0(%0, %arg2) : (tensor<2x!dataflow.stream<f32, 205>>, memref<410xf32, #map>) -> ()
    return
  }
}

