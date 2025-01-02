#map = affine_map<(d0, d1, d2) -> (0, d1 mod 2, d2 mod 8, d0, d1 floordiv 2, d2 floordiv 8)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0 mod 8, d0 floordiv 8)>
#map3 = affine_map<(d0, d1) -> (d0 mod 16, d1 mod 8, d0 floordiv 16, d1 floordiv 8)>
#map4 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 8, d0 floordiv 2, d1 floordiv 8)>
#map5 = affine_map<(d0, d1) -> (d0 mod 2, d1 mod 16, d0 floordiv 2, d1 floordiv 16)>
#map6 = affine_map<(d0, d1) -> (d0 mod 8, d1 mod 16, d0 floordiv 8, d1 floordiv 16)>
#map7 = affine_map<(d0) -> (d0 mod 16, d0 floordiv 16)>
#set = affine_set<(d0, d1) : (d0 + d1 * 8 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 2 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 16 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 16 - 255 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 8 - 127 == 0)>
module attributes {torch.debug_module_name = "FeedForward"} {
  func.func @node0(%arg0: tensor<2x8x!dataflow.stream<f32, 4096>>, %arg1: memref<1x512x128xf32, #map>) {
    affine.for %arg2 = 0 to 256 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 2 {
          affine.for %arg5 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<2x8x!dataflow.stream<f32, 4096>>) -> f32
            affine.store %0, %arg1[0, %arg4 + %arg2 * 2, %arg5 + %arg3 * 8] : memref<1x512x128xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<2x8x!dataflow.stream<f32, 4096>>, %arg1: memref<128xf32, #map2>, %arg2: tensor<2x8x!dataflow.stream<f32, 4096>>) {
    affine.for %arg3 = 0 to 256 {
      affine.for %arg4 = 0 to 16 {
        affine.for %arg5 = 0 to 2 {
          affine.for %arg6 = 0 to 8 {
            %0 = dataflow.aofs_read %arg0[%arg5, %arg6] {map = #map1} : (tensor<2x8x!dataflow.stream<f32, 4096>>) -> f32
            %1 = affine.load %arg1[%arg6 + %arg4 * 8] : memref<128xf32, #map2>
            %2 = arith.addf %0, %1 : f32
            dataflow.aofs_write %arg2[%arg5, %arg6], %2 {map = #map1} : tensor<2x8x!dataflow.stream<f32, 4096>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: memref<256x128xf32, #map3>, %arg1: tensor<2x16x!dataflow.stream<f32, 4096>>, %arg2: tensor<2x8x!dataflow.stream<f32, 4096>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<512x128xf32, #map4>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32, #map3>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<512x256xf32, #map5>
    affine.for %arg4 = 0 to 256 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 8 {
              affine.for %arg9 = 0 to 16 {
                affine.if #set(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<2x16x!dataflow.stream<f32, 4096>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 16] : memref<512x256xf32, #map5>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 16] : memref<512x256xf32, #map5>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %arg0[%arg9 + %arg6 * 16, %arg8 + %arg5 * 8] : memref<256x128xf32, #map3>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 16, %arg8 + %arg5 * 8] : memref<256x128xf32, #map3>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 16, %arg8 + %arg5 * 8] : memref<256x128xf32, #map3>
                affine.if #set2(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<512x128xf32, #map4>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<512x128xf32, #map4>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<512x128xf32, #map4>
                affine.if #set3(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 8] : memref<512x128xf32, #map4>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<2x8x!dataflow.stream<f32, 4096>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<128x256xf32, #map6>, %arg1: memref<256x128xf32, #map3>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 16 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 8, %arg4 + %arg2 * 16] : memref<128x256xf32, #map6>
            affine.store %0, %arg1[%arg4 + %arg2 * 16, %arg5 + %arg3 * 8] : memref<256x128xf32, #map3>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: tensor<2x16x!dataflow.stream<f32, 4096>>, %arg1: memref<256xf32, #map7>, %arg2: tensor<2x16x!dataflow.stream<f32, 4096>>, %arg3: f32) {
    affine.for %arg4 = 0 to 256 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 2 {
          affine.for %arg7 = 0 to 16 {
            %0 = dataflow.aofs_read %arg0[%arg6, %arg7] {map = #map1} : (tensor<2x16x!dataflow.stream<f32, 4096>>) -> f32
            %1 = affine.load %arg1[%arg7 + %arg5 * 16] : memref<256xf32, #map7>
            %2 = arith.addf %0, %1 : f32
            %3 = arith.cmpf ugt, %2, %arg3 : f32
            %4 = arith.select %3, %2, %arg3 : f32
            dataflow.aofs_write %arg2[%arg6, %arg7], %4 {map = #map1} : tensor<2x16x!dataflow.stream<f32, 4096>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: memref<128x256xf32, #map6>, %arg1: tensor<2x8x!dataflow.stream<f32, 4096>>, %arg2: tensor<2x16x!dataflow.stream<f32, 4096>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<512x256xf32, #map5>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32, #map6>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<512x128xf32, #map4>
    affine.for %arg4 = 0 to 256 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 16 {
          affine.for %arg7 = 0 to 2 {
            affine.for %arg8 = 0 to 16 {
              affine.for %arg9 = 0 to 8 {
                affine.if #set2(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<2x8x!dataflow.stream<f32, 4096>>) -> f32
                  affine.store %5, %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 8] : memref<512x128xf32, #map4>
                }
                %0 = affine.load %alloc_1[%arg7 + %arg4 * 2, %arg9 + %arg6 * 8] : memref<512x128xf32, #map4>
                affine.if #set1(%arg7, %arg4) {
                  %5 = affine.load %arg0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 16] : memref<128x256xf32, #map6>
                  affine.store %5, %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 16] : memref<128x256xf32, #map6>
                }
                %1 = affine.load %alloc_0[%arg9 + %arg6 * 8, %arg8 + %arg5 * 16] : memref<128x256xf32, #map6>
                affine.if #set(%arg9, %arg6) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 16] : memref<512x256xf32, #map5>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 16] : memref<512x256xf32, #map5>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 16] : memref<512x256xf32, #map5>
                affine.if #set4(%arg9, %arg6) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 2, %arg8 + %arg5 * 16] : memref<512x256xf32, #map5>
                  dataflow.aofs_write %arg2[%arg7, %arg8], %5 {map = #map1} : tensor<2x16x!dataflow.stream<f32, 4096>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: memref<256x128xf32, #map3>, %arg1: memref<128x256xf32, #map6>) {
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 8 {
          affine.for %arg5 = 0 to 16 {
            %0 = affine.load %arg0[%arg5 + %arg3 * 16, %arg4 + %arg2 * 8] : memref<256x128xf32, #map3>
            affine.store %0, %arg1[%arg4 + %arg2 * 8, %arg5 + %arg3 * 16] : memref<128x256xf32, #map6>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node7(%arg0: memref<1x512x128xf32, #map>, %arg1: tensor<2x8x!dataflow.stream<f32, 4096>>) {
    affine.for %arg2 = 0 to 256 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 2 {
          affine.for %arg5 = 0 to 8 {
            %0 = affine.load %arg0[0, %arg4 + %arg2 * 2, %arg5 + %arg3 * 8] : memref<1x512x128xf32, #map>
            dataflow.aofs_write %arg1[%arg4, %arg5], %0 {map = #map1} : tensor<2x8x!dataflow.stream<f32, 4096>>, f32
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<1x512x128xf32, #map>, %arg1: memref<256xf32, #map7>, %arg2: memref<256x128xf32, #map3>, %arg3: memref<128xf32, #map2>, %arg4: memref<128x256xf32, #map6>, %arg5: memref<1x512x128xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 4096>>
    %1 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 4096>>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<256x128xf32, #map3>
    %2 = dataflow.aofs : tensor<2x16x!dataflow.stream<f32, 4096>>
    %3 = dataflow.aofs : tensor<2x16x!dataflow.stream<f32, 4096>>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32, #map6>
    %4 = dataflow.aofs : tensor<2x8x!dataflow.stream<f32, 4096>>
    call @node7(%arg0, %4) : (memref<1x512x128xf32, #map>, tensor<2x8x!dataflow.stream<f32, 4096>>) -> ()
    call @node6(%arg2, %alloc_0) : (memref<256x128xf32, #map3>, memref<128x256xf32, #map6>) -> ()
    call @node5(%alloc_0, %4, %3, %cst) : (memref<128x256xf32, #map6>, tensor<2x8x!dataflow.stream<f32, 4096>>, tensor<2x16x!dataflow.stream<f32, 4096>>, f32) -> ()
    call @node4(%3, %arg1, %2, %cst) : (tensor<2x16x!dataflow.stream<f32, 4096>>, memref<256xf32, #map7>, tensor<2x16x!dataflow.stream<f32, 4096>>, f32) -> ()
    call @node3(%arg4, %alloc) : (memref<128x256xf32, #map6>, memref<256x128xf32, #map3>) -> ()
    call @node2(%alloc, %2, %1, %cst) : (memref<256x128xf32, #map3>, tensor<2x16x!dataflow.stream<f32, 4096>>, tensor<2x8x!dataflow.stream<f32, 4096>>, f32) -> ()
    call @node1(%1, %arg3, %0) : (tensor<2x8x!dataflow.stream<f32, 4096>>, memref<128xf32, #map2>, tensor<2x8x!dataflow.stream<f32, 4096>>) -> ()
    call @node0(%0, %arg5) : (tensor<2x8x!dataflow.stream<f32, 4096>>, memref<1x512x128xf32, #map>) -> ()
    return
  }
}

