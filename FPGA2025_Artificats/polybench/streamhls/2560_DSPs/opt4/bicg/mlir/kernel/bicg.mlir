#map = affine_map<(d0) -> (d0 mod 10, d0 floordiv 10)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 mod 15, d0 floordiv 15)>
#map3 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 15, d0 floordiv 10, d1 floordiv 15)>
#set = affine_set<(d0, d1) : (d0 + d1 * 15 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 15 - 389 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 10 - 409 == 0)>
module attributes {torch.debug_module_name = "bicg"} {
  func.func @node0(%arg0: tensor<10x!dataflow.stream<f32, 41>>, %arg1: memref<410xf32, #map>) {
    affine.for %arg2 = 0 to 41 {
      affine.for %arg3 = 0 to 10 {
        %0 = dataflow.aofs_read %arg0[%arg3] {map = #map1} : (tensor<10x!dataflow.stream<f32, 41>>) -> f32
        affine.store %0, %arg1[%arg3 + %arg2 * 10] : memref<410xf32, #map>
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node1(%arg0: tensor<15x!dataflow.stream<f32, 26>>, %arg1: memref<390xf32, #map2>) {
    affine.for %arg2 = 0 to 26 {
      affine.for %arg3 = 0 to 15 {
        %0 = dataflow.aofs_read %arg0[%arg3] {map = #map1} : (tensor<15x!dataflow.stream<f32, 26>>) -> f32
        affine.store %0, %arg1[%arg3 + %arg2 * 15] : memref<390xf32, #map2>
      }
    } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    return
  }
  func.func @node2(%arg0: memref<410x390xf32, #map3>, %arg1: memref<390xf32, #map2>, %arg2: tensor<10x!dataflow.stream<f32, 41>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<410xf32, #map>
    affine.for %arg4 = 0 to 26 {
      affine.for %arg5 = 0 to 41 {
        affine.for %arg6 = 0 to 15 {
          affine.for %arg7 = 0 to 10 {
            %0 = affine.load %arg0[%arg7 + %arg5 * 10, %arg6 + %arg4 * 15] : memref<410x390xf32, #map3>
            %1 = affine.load %arg1[%arg6 + %arg4 * 15] : memref<390xf32, #map2>
            affine.if #set(%arg6, %arg4) {
              affine.store %arg3, %alloc[%arg7 + %arg5 * 10] : memref<410xf32, #map>
            }
            %2 = affine.load %alloc[%arg7 + %arg5 * 10] : memref<410xf32, #map>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7 + %arg5 * 10] : memref<410xf32, #map>
            affine.if #set1(%arg6, %arg4) {
              %5 = affine.load %alloc[%arg7 + %arg5 * 10] : memref<410xf32, #map>
              dataflow.aofs_write %arg2[%arg7], %5 {map = #map1} : tensor<10x!dataflow.stream<f32, 41>>, f32
            }
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node3(%arg0: memref<410xf32, #map>, %arg1: memref<410x390xf32, #map3>, %arg2: tensor<15x!dataflow.stream<f32, 26>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<390xf32, #map2>
    affine.for %arg4 = 0 to 41 {
      affine.for %arg5 = 0 to 26 {
        affine.for %arg6 = 0 to 10 {
          affine.for %arg7 = 0 to 15 {
            %0 = affine.load %arg0[%arg6 + %arg4 * 10] : memref<410xf32, #map>
            %1 = affine.load %arg1[%arg6 + %arg4 * 10, %arg7 + %arg5 * 15] : memref<410x390xf32, #map3>
            affine.if #set2(%arg6, %arg4) {
              affine.store %arg3, %alloc[%arg7 + %arg5 * 15] : memref<390xf32, #map2>
            }
            %2 = affine.load %alloc[%arg7 + %arg5 * 15] : memref<390xf32, #map2>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg7 + %arg5 * 15] : memref<390xf32, #map2>
            affine.if #set3(%arg6, %arg4) {
              %5 = affine.load %alloc[%arg7 + %arg5 * 15] : memref<390xf32, #map2>
              dataflow.aofs_write %arg2[%arg7], %5 {map = #map1} : tensor<15x!dataflow.stream<f32, 26>>, f32
            }
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<410x390xf32, #map3>, %arg1: memref<410x390xf32, #map3>, %arg2: memref<410xf32, #map>, %arg3: memref<390xf32, #map2>, %arg4: memref<390xf32, #map2>, %arg5: memref<410xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<10x!dataflow.stream<f32, 41>>
    %1 = dataflow.aofs : tensor<15x!dataflow.stream<f32, 26>>
    call @node3(%arg2, %arg0, %1, %cst) : (memref<410xf32, #map>, memref<410x390xf32, #map3>, tensor<15x!dataflow.stream<f32, 26>>, f32) -> ()
    call @node2(%arg1, %arg3, %0, %cst) : (memref<410x390xf32, #map3>, memref<390xf32, #map2>, tensor<10x!dataflow.stream<f32, 41>>, f32) -> ()
    call @node1(%1, %arg4) : (tensor<15x!dataflow.stream<f32, 26>>, memref<390xf32, #map2>) -> ()
    call @node0(%0, %arg5) : (tensor<10x!dataflow.stream<f32, 41>>, memref<410xf32, #map>) -> ()
    return
  }
}

