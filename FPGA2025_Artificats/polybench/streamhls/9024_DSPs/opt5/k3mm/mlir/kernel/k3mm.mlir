#map = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 6, d0 floordiv 10, d1 floordiv 6)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 10, d0 floordiv 10, d1 floordiv 10)>
#map3 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 11, d0 floordiv 10, d1 floordiv 11)>
#map4 = affine_map<(d0, d1) -> (d0 mod 11, d1 mod 6, d0 floordiv 11, d1 floordiv 6)>
#map5 = affine_map<(d0, d1) -> (d0 mod 10, d1 mod 5, d0 floordiv 10, d1 floordiv 5)>
#map6 = affine_map<(d0, d1) -> (d0 mod 5, d1 mod 10, d0 floordiv 5, d1 floordiv 10)>
#set = affine_set<(d0, d1) : (d0 + d1 * 6 == 0)>
#set1 = affine_set<(d0, d1) : (d0 + d1 * 10 == 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 * 10 - 189 == 0)>
#set3 = affine_set<(d0, d1) : (d0 + d1 * 11 == 0)>
#set4 = affine_set<(d0, d1) : (d0 + d1 * 11 - 219 == 0)>
#set5 = affine_set<(d0, d1) : (d0 + d1 * 5 == 0)>
#set6 = affine_set<(d0, d1) : (d0 + d1 * 5 - 199 == 0)>
module attributes {torch.debug_module_name = "k3mm"} {
  func.func @node0(%arg0: tensor<10x6x!dataflow.stream<f32, 630>>, %arg1: memref<180x210xf32, #map>) {
    affine.for %arg2 = 0 to 18 {
      affine.for %arg3 = 0 to 35 {
        affine.for %arg4 = 0 to 10 {
          affine.for %arg5 = 0 to 6 {
            %0 = dataflow.aofs_read %arg0[%arg4, %arg5] {map = #map1} : (tensor<10x6x!dataflow.stream<f32, 630>>) -> f32
            affine.store %0, %arg1[%arg4 + %arg2 * 10, %arg5 + %arg3 * 6] : memref<180x210xf32, #map>
          }
        }
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: tensor<10x10x!dataflow.stream<f32, 342>>, %arg1: tensor<10x6x!dataflow.stream<f32, 665>>, %arg2: tensor<10x6x!dataflow.stream<f32, 630>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x210xf32, #map>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32, #map>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map2>
    affine.for %arg4 = 0 to 19 {
      affine.for %arg5 = 0 to 18 {
        affine.for %arg6 = 0 to 35 {
          affine.for %arg7 = 0 to 10 {
            affine.for %arg8 = 0 to 10 {
              affine.for %arg9 = 0 to 6 {
                affine.if #set(%arg9, %arg6) {
                  %5 = dataflow.aofs_read %arg0[%arg8, %arg7] {map = #map1} : (tensor<10x10x!dataflow.stream<f32, 342>>) -> f32
                  affine.store %5, %alloc_1[%arg8 + %arg5 * 10, %arg7 + %arg4 * 10] : memref<180x190xf32, #map2>
                }
                %0 = affine.load %alloc_1[%arg8 + %arg5 * 10, %arg7 + %arg4 * 10] : memref<180x190xf32, #map2>
                affine.if #set1(%arg8, %arg5) {
                  %5 = dataflow.aofs_read %arg1[%arg7, %arg9] {map = #map1} : (tensor<10x6x!dataflow.stream<f32, 665>>) -> f32
                  affine.store %5, %alloc_0[%arg7 + %arg4 * 10, %arg9 + %arg6 * 6] : memref<190x210xf32, #map>
                }
                %1 = affine.load %alloc_0[%arg7 + %arg4 * 10, %arg9 + %arg6 * 6] : memref<190x210xf32, #map>
                affine.if #set1(%arg7, %arg4) {
                  affine.store %arg3, %alloc[%arg8 + %arg5 * 10, %arg9 + %arg6 * 6] : memref<180x210xf32, #map>
                }
                %2 = affine.load %alloc[%arg8 + %arg5 * 10, %arg9 + %arg6 * 6] : memref<180x210xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg8 + %arg5 * 10, %arg9 + %arg6 * 6] : memref<180x210xf32, #map>
                affine.if #set2(%arg7, %arg4) {
                  %5 = affine.load %alloc[%arg8 + %arg5 * 10, %arg9 + %arg6 * 6] : memref<180x210xf32, #map>
                  dataflow.aofs_write %arg2[%arg8, %arg9], %5 {map = #map1} : tensor<10x6x!dataflow.stream<f32, 630>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node2(%arg0: memref<190x220xf32, #map3>, %arg1: memref<220x210xf32, #map4>, %arg2: tensor<10x6x!dataflow.stream<f32, 665>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<190x210xf32, #map>
    affine.for %arg4 = 0 to 19 {
      affine.for %arg5 = 0 to 20 {
        affine.for %arg6 = 0 to 35 {
          affine.for %arg7 = 0 to 10 {
            affine.for %arg8 = 0 to 11 {
              affine.for %arg9 = 0 to 6 {
                %0 = affine.load %arg0[%arg7 + %arg4 * 10, %arg8 + %arg5 * 11] : memref<190x220xf32, #map3>
                %1 = affine.load %arg1[%arg8 + %arg5 * 11, %arg9 + %arg6 * 6] : memref<220x210xf32, #map4>
                affine.if #set3(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg7 + %arg4 * 10, %arg9 + %arg6 * 6] : memref<190x210xf32, #map>
                }
                %2 = affine.load %alloc[%arg7 + %arg4 * 10, %arg9 + %arg6 * 6] : memref<190x210xf32, #map>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg7 + %arg4 * 10, %arg9 + %arg6 * 6] : memref<190x210xf32, #map>
                affine.if #set4(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg7 + %arg4 * 10, %arg9 + %arg6 * 6] : memref<190x210xf32, #map>
                  dataflow.aofs_write %arg2[%arg7, %arg9], %5 {map = #map1} : tensor<10x6x!dataflow.stream<f32, 665>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<180x200xf32, #map5>, %arg1: memref<200x190xf32, #map6>, %arg2: tensor<10x10x!dataflow.stream<f32, 342>>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<180x190xf32, #map2>
    affine.for %arg4 = 0 to 19 {
      affine.for %arg5 = 0 to 40 {
        affine.for %arg6 = 0 to 18 {
          affine.for %arg7 = 0 to 10 {
            affine.for %arg8 = 0 to 5 {
              affine.for %arg9 = 0 to 10 {
                %0 = affine.load %arg0[%arg9 + %arg6 * 10, %arg8 + %arg5 * 5] : memref<180x200xf32, #map5>
                %1 = affine.load %arg1[%arg8 + %arg5 * 5, %arg7 + %arg4 * 10] : memref<200x190xf32, #map6>
                affine.if #set5(%arg8, %arg5) {
                  affine.store %arg3, %alloc[%arg9 + %arg6 * 10, %arg7 + %arg4 * 10] : memref<180x190xf32, #map2>
                }
                %2 = affine.load %alloc[%arg9 + %arg6 * 10, %arg7 + %arg4 * 10] : memref<180x190xf32, #map2>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %alloc[%arg9 + %arg6 * 10, %arg7 + %arg4 * 10] : memref<180x190xf32, #map2>
                affine.if #set6(%arg8, %arg5) {
                  %5 = affine.load %alloc[%arg9 + %arg6 * 10, %arg7 + %arg4 * 10] : memref<180x190xf32, #map2>
                  dataflow.aofs_write %arg2[%arg9, %arg7], %5 {map = #map1} : tensor<10x10x!dataflow.stream<f32, 342>>, f32
                }
              }
            }
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @forward(%arg0: memref<180x200xf32, #map5>, %arg1: memref<200x190xf32, #map6>, %arg2: memref<190x220xf32, #map3>, %arg3: memref<220x210xf32, #map4>, %arg4: memref<180x210xf32, #map>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = dataflow.aofs : tensor<10x6x!dataflow.stream<f32, 630>>
    %1 = dataflow.aofs : tensor<10x6x!dataflow.stream<f32, 665>>
    %2 = dataflow.aofs : tensor<10x10x!dataflow.stream<f32, 342>>
    call @node3(%arg0, %arg1, %2, %cst) : (memref<180x200xf32, #map5>, memref<200x190xf32, #map6>, tensor<10x10x!dataflow.stream<f32, 342>>, f32) -> ()
    call @node2(%arg2, %arg3, %1, %cst) : (memref<190x220xf32, #map3>, memref<220x210xf32, #map4>, tensor<10x6x!dataflow.stream<f32, 665>>, f32) -> ()
    call @node1(%2, %1, %0, %cst) : (tensor<10x10x!dataflow.stream<f32, 342>>, tensor<10x6x!dataflow.stream<f32, 665>>, tensor<10x6x!dataflow.stream<f32, 630>>, f32) -> ()
    call @node0(%0, %arg4) : (tensor<10x6x!dataflow.stream<f32, 630>>, memref<180x210xf32, #map>) -> ()
    return
  }
}

