#set = affine_set<(d0) : (d0 == 0)>
#set1 = affine_set<(d0) : (d0 - 127 == 0)>
#set2 = affine_set<(d0) : (d0 - 63 == 0)>
#set3 = affine_set<(d0) : (d0 - 15 == 0)>
module attributes {torch.debug_module_name = "MultiHeadSelfAttention"} {
  func.func @node0(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<1x64x128xf32>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 64 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        affine.store %0, %arg1[0, %arg3, %arg2] : memref<1x64x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node1(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<128xf32>, %arg2: !dataflow.stream<f32, 8192>) {
    affine.for %arg3 = 0 to 128 {
      affine.for %arg4 = 0 to 64 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        %1 = affine.load %arg1[%arg3] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        dataflow.stream_write %arg2, %2 : <f32, 8192>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node2(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<128x128xf32>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    affine.for %arg4 = 0 to 128 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 64 {
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
            affine.store %5, %alloc_1[%arg6, %arg5] : memref<64x128xf32>
          }
          %0 = affine.load %alloc_1[%arg6, %arg5] : memref<64x128xf32>
          affine.if #set(%arg6) {
            %5 = affine.load %arg1[%arg5, %arg4] : memref<128x128xf32>
            affine.store %5, %alloc_0[%arg5, %arg4] : memref<128x128xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg4] : memref<128x128xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg6, %arg4] : memref<64x128xf32>
          }
          %2 = affine.load %alloc[%arg6, %arg4] : memref<64x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg6, %arg4] : memref<64x128xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg6, %arg4] : memref<64x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 8192>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node3(%arg0: memref<128x128xf32>, %arg1: memref<128x128xf32>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x128xf32>
        affine.store %0, %arg1[%arg2, %arg3] : memref<128x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node4(%arg0: memref<64x8x16xf32>, %arg1: !dataflow.stream<f32, 8192>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 64 {
        %0 = affine.load %arg0[%arg3, %arg2 floordiv 16, %arg2 mod 16] : memref<64x8x16xf32>
        dataflow.stream_write %arg1, %0 : <f32, 8192>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node5(%arg0: memref<8x64x16xf32>, %arg1: memref<64x8x16xf32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 64 {
        affine.for %arg4 = 0 to 16 {
          %0 = affine.load %arg0[%arg2, %arg3, %arg4] : memref<8x64x16xf32>
          affine.store %0, %arg1[%arg3, %arg2, %arg4] : memref<64x8x16xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node6(%arg0: !dataflow.stream<f32, 32768>, %arg1: memref<8x64x16xf32>, %arg2: memref<8x64x16xf32>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x64x64xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          affine.for %arg7 = 0 to 16 {
            affine.if #set(%arg7) {
              %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
              affine.store %5, %alloc_1[%arg4, %arg5, %arg6] : memref<8x64x64xf32>
            }
            %0 = affine.load %alloc_1[%arg4, %arg5, %arg6] : memref<8x64x64xf32>
            affine.if #set(%arg5) {
              %5 = affine.load %arg1[%arg4, %arg6, %arg7] : memref<8x64x16xf32>
              affine.store %5, %alloc_0[%arg4, %arg6, %arg7] : memref<8x64x16xf32>
            }
            %1 = affine.load %alloc_0[%arg4, %arg6, %arg7] : memref<8x64x16xf32>
            affine.if #set(%arg6) {
              affine.store %arg3, %alloc[%arg4, %arg5, %arg7] : memref<8x64x16xf32>
            }
            %2 = affine.load %alloc[%arg4, %arg5, %arg7] : memref<8x64x16xf32>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg4, %arg5, %arg7] : memref<8x64x16xf32>
            affine.if #set2(%arg6) {
              %5 = affine.load %alloc[%arg4, %arg5, %arg7] : memref<8x64x16xf32>
              affine.store %5, %arg2[%arg4, %arg5, %arg7] : memref<8x64x16xf32>
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    return
  }
  func.func @node7(%arg0: memref<64x128xf32>, %arg1: memref<8x64x16xf32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 64 {
          %0 = affine.load %arg0[%arg4, %arg2 * 16 + %arg3] : memref<64x128xf32>
          affine.store %0, %arg1[%arg2, %arg4, %arg3] : memref<8x64x16xf32>
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node8(%arg0: !dataflow.stream<f32, 32768>, %arg1: !dataflow.stream<f32, 512>, %arg2: !dataflow.stream<f32, 32768>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32>
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 64 {
        affine.for %arg5 = 0 to 64 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
          affine.if #set(%arg5) {
            %3 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 512>) -> f32
            affine.store %3, %alloc[%arg3, %arg4] : memref<8x64xf32>
          }
          %1 = affine.load %alloc[%arg3, %arg4] : memref<8x64xf32>
          %2 = arith.divf %0, %1 : f32
          dataflow.stream_write %arg2, %2 : <f32, 32768>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node9(%arg0: !dataflow.stream<f32, 32768>, %arg1: !dataflow.stream<f32, 512>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32>
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 64 {
        affine.for %arg5 = 0 to 64 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
          affine.if #set(%arg5) {
            affine.store %arg2, %alloc[%arg3, %arg4] : memref<8x64xf32>
          }
          %1 = affine.load %alloc[%arg3, %arg4] : memref<8x64xf32>
          %2 = arith.addf %0, %1 : f32
          affine.store %2, %alloc[%arg3, %arg4] : memref<8x64xf32>
          affine.if #set2(%arg5) {
            %3 = affine.load %alloc[%arg3, %arg4] : memref<8x64xf32>
            dataflow.stream_write %arg1, %3 : <f32, 512>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node10(%arg0: !dataflow.stream<f32, 32768>, %arg1: !dataflow.stream<f32, 512>, %arg2: !dataflow.stream<f32, 32768>, %arg3: !dataflow.stream<f32, 32768>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
          affine.if #set(%arg6) {
            %4 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 512>) -> f32
            affine.store %4, %alloc[%arg4, %arg5] : memref<8x64xf32>
          }
          %1 = affine.load %alloc[%arg4, %arg5] : memref<8x64xf32>
          %2 = arith.subf %0, %1 : f32
          %3 = math.exp %2 : f32
          dataflow.stream_write %arg2, %3 : <f32, 32768>, f32
          dataflow.stream_write %arg3, %3 : <f32, 32768>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node11(%arg0: !dataflow.stream<f32, 32768>, %arg1: !dataflow.stream<f32, 512>, %arg2: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64xf32>
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 64 {
        affine.for %arg5 = 0 to 64 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
          affine.if #set(%arg5) {
            affine.store %arg2, %alloc[%arg3, %arg4] : memref<8x64xf32>
          }
          %1 = affine.load %alloc[%arg3, %arg4] : memref<8x64xf32>
          %2 = arith.maximumf %0, %1 : f32
          affine.store %2, %alloc[%arg3, %arg4] : memref<8x64xf32>
          affine.if #set2(%arg5) {
            %3 = affine.load %alloc[%arg3, %arg4] : memref<8x64xf32>
            dataflow.stream_write %arg1, %3 : <f32, 512>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node12(%arg0: !dataflow.stream<f32, 32768>, %arg1: !dataflow.stream<f32, 32768>, %arg2: !dataflow.stream<f32, 32768>, %arg3: f32) {
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 64 {
        affine.for %arg6 = 0 to 64 {
          %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 32768>) -> f32
          %1 = arith.divf %0, %arg3 : f32
          dataflow.stream_write %arg1, %1 : <f32, 32768>, f32
          dataflow.stream_write %arg2, %1 : <f32, 32768>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node13(%arg0: !dataflow.stream<f32, 8192>, %arg1: !dataflow.stream<f32, 8192>, %arg2: !dataflow.stream<f32, 32768>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x64x64xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8x16x64xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32>
    affine.for %arg4 = 0 to 8 {
      affine.for %arg5 = 0 to 16 {
        affine.for %arg6 = 0 to 64 {
          affine.for %arg7 = 0 to 64 {
            affine.if #set(%arg7) {
              %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 8192>) -> f32
              affine.store %5, %alloc_1[%arg4, %arg6, %arg5] : memref<8x64x16xf32>
            }
            %0 = affine.load %alloc_1[%arg4, %arg6, %arg5] : memref<8x64x16xf32>
            affine.if #set(%arg6) {
              %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
              affine.store %5, %alloc_0[%arg4, %arg5, %arg7] : memref<8x16x64xf32>
            }
            %1 = affine.load %alloc_0[%arg4, %arg5, %arg7] : memref<8x16x64xf32>
            affine.if #set(%arg5) {
              affine.store %arg3, %alloc[%arg4, %arg6, %arg7] : memref<8x64x64xf32>
            }
            %2 = affine.load %alloc[%arg4, %arg6, %arg7] : memref<8x64x64xf32>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            affine.store %4, %alloc[%arg4, %arg6, %arg7] : memref<8x64x64xf32>
            affine.if #set3(%arg5) {
              %5 = affine.load %alloc[%arg4, %arg6, %arg7] : memref<8x64x64xf32>
              dataflow.stream_write %arg2, %5 : <f32, 32768>, f32
            }
          } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
        }
      }
    }
    return
  }
  func.func @node14(%arg0: memref<64x128xf32>, %arg1: !dataflow.stream<f32, 8192>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 64 {
          %0 = affine.load %arg0[%arg4, %arg2 * 16 + %arg3] : memref<64x128xf32>
          dataflow.stream_write %arg1, %0 : <f32, 8192>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node15(%arg0: memref<64x128xf32>, %arg1: !dataflow.stream<f32, 8192>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 64 {
          %0 = affine.load %arg0[%arg4, %arg2 * 16 + %arg3] : memref<64x128xf32>
          dataflow.stream_write %arg1, %0 : <f32, 8192>, f32
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node16(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<128xf32>, %arg2: memref<64x128xf32>) {
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg3, %arg4] : memref<64x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node17(%arg0: !dataflow.stream<f32, 16384>, %arg1: !dataflow.stream<f32, 8192>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 8192>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<64x128xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<64x128xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 16384>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<128x128xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<128x128xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<64x128xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<64x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<64x128xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<64x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 8192>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node18(%arg0: memref<128x128xf32>, %arg1: !dataflow.stream<f32, 16384>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x128xf32>
        dataflow.stream_write %arg1, %0 : <f32, 16384>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node19(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<128xf32>, %arg2: memref<64x128xf32>) {
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg3, %arg4] : memref<64x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node20(%arg0: !dataflow.stream<f32, 8192>, %arg1: !dataflow.stream<f32, 16384>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<64x128xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<64x128xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 16384>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<128x128xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<128x128xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<64x128xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<64x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<64x128xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<64x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 8192>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node21(%arg0: memref<128x128xf32>, %arg1: !dataflow.stream<f32, 16384>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x128xf32>
        dataflow.stream_write %arg1, %0 : <f32, 16384>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node22(%arg0: !dataflow.stream<f32, 8192>, %arg1: memref<128xf32>, %arg2: memref<64x128xf32>) {
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 128 {
        %0 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 8192>) -> f32
        %1 = affine.load %arg1[%arg4] : memref<128xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg3, %arg4] : memref<64x128xf32>
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node23(%arg0: !dataflow.stream<f32, 16384>, %arg1: !dataflow.stream<f32, 8192>, %arg2: !dataflow.stream<f32, 8192>, %arg3: f32) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 128 {
        affine.for %arg6 = 0 to 128 {
          affine.if #set(%arg6) {
            %5 = dataflow.stream_read %arg1 : (!dataflow.stream<f32, 8192>) -> f32
            affine.store %5, %alloc_1[%arg4, %arg5] : memref<64x128xf32>
          }
          %0 = affine.load %alloc_1[%arg4, %arg5] : memref<64x128xf32>
          affine.if #set(%arg4) {
            %5 = dataflow.stream_read %arg0 : (!dataflow.stream<f32, 16384>) -> f32
            affine.store %5, %alloc_0[%arg5, %arg6] : memref<128x128xf32>
          }
          %1 = affine.load %alloc_0[%arg5, %arg6] : memref<128x128xf32>
          affine.if #set(%arg5) {
            affine.store %arg3, %alloc[%arg4, %arg6] : memref<64x128xf32>
          }
          %2 = affine.load %alloc[%arg4, %arg6] : memref<64x128xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %alloc[%arg4, %arg6] : memref<64x128xf32>
          affine.if #set1(%arg5) {
            %5 = affine.load %alloc[%arg4, %arg6] : memref<64x128xf32>
            dataflow.stream_write %arg2, %5 : <f32, 8192>, f32
          }
        } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
      }
    }
    return
  }
  func.func @node24(%arg0: memref<128x128xf32>, %arg1: !dataflow.stream<f32, 16384>) {
    affine.for %arg2 = 0 to 128 {
      affine.for %arg3 = 0 to 128 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<128x128xf32>
        dataflow.stream_write %arg1, %0 : <f32, 16384>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @node25(%arg0: memref<1x64x128xf32>, %arg1: !dataflow.stream<f32, 8192>, %arg2: !dataflow.stream<f32, 8192>, %arg3: !dataflow.stream<f32, 8192>) {
    affine.for %arg4 = 0 to 64 {
      affine.for %arg5 = 0 to 128 {
        %0 = affine.load %arg0[0, %arg4, %arg5] : memref<1x64x128xf32>
        dataflow.stream_write %arg1, %0 : <f32, 8192>, f32
        dataflow.stream_write %arg2, %0 : <f32, 8192>, f32
        dataflow.stream_write %arg3, %0 : <f32, 8192>, f32
      } {loop_directive = #dataflow.pipeline_ii<pipeline=true, targetII=1, dataflow=false, flatten=false>}
    }
    return
  }
  func.func @forward(%arg0: memref<1x64x128xf32>, %arg1: memref<128xf32>, %arg2: memref<128x128xf32>, %arg3: memref<128xf32>, %arg4: memref<128x128xf32>, %arg5: memref<128xf32>, %arg6: memref<128x128xf32>, %arg7: memref<128xf32>, %arg8: memref<128x128xf32>, %arg9: memref<1x64x128xf32>) {
    %cst = arith.constant 4.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %cst_1 = arith.constant 0xFF800000 : f32
    %0 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %1 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x128xf32>
    %2 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<64x8x16xf32>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32>
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x64x16xf32>
    %3 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %4 = dataflow.stream {depth = 512 : i32} : <f32, 512>
    %5 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %6 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %7 = dataflow.stream {depth = 512 : i32} : <f32, 512>
    %8 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %9 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %10 = dataflow.stream {depth = 32768 : i32} : <f32, 32768>
    %11 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %12 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %13 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %14 = dataflow.stream {depth = 16384 : i32} : <f32, 16384>
    %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %15 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %16 = dataflow.stream {depth = 16384 : i32} : <f32, 16384>
    %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<64x128xf32>
    %17 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %18 = dataflow.stream {depth = 16384 : i32} : <f32, 16384>
    %19 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %20 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    %21 = dataflow.stream {depth = 8192 : i32} : <f32, 8192>
    call @node25(%arg0, %21, %20, %19) : (memref<1x64x128xf32>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 8192>) -> ()
    call @node24(%arg2, %18) : (memref<128x128xf32>, !dataflow.stream<f32, 16384>) -> ()
    call @node23(%18, %19, %17, %cst_0) : (!dataflow.stream<f32, 16384>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node22(%17, %arg1, %alloc_7) : (!dataflow.stream<f32, 8192>, memref<128xf32>, memref<64x128xf32>) -> ()
    call @node21(%arg4, %16) : (memref<128x128xf32>, !dataflow.stream<f32, 16384>) -> ()
    call @node20(%20, %16, %15, %cst_0) : (!dataflow.stream<f32, 8192>, !dataflow.stream<f32, 16384>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node19(%15, %arg3, %alloc_6) : (!dataflow.stream<f32, 8192>, memref<128xf32>, memref<64x128xf32>) -> ()
    call @node18(%arg6, %14) : (memref<128x128xf32>, !dataflow.stream<f32, 16384>) -> ()
    call @node17(%14, %21, %13, %cst_0) : (!dataflow.stream<f32, 16384>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node16(%13, %arg5, %alloc_5) : (!dataflow.stream<f32, 8192>, memref<128xf32>, memref<64x128xf32>) -> ()
    call @node15(%alloc_7, %12) : (memref<64x128xf32>, !dataflow.stream<f32, 8192>) -> ()
    call @node14(%alloc_6, %11) : (memref<64x128xf32>, !dataflow.stream<f32, 8192>) -> ()
    call @node13(%11, %12, %10, %cst_0) : (!dataflow.stream<f32, 8192>, !dataflow.stream<f32, 8192>, !dataflow.stream<f32, 32768>, f32) -> ()
    call @node12(%10, %9, %8, %cst) : (!dataflow.stream<f32, 32768>, !dataflow.stream<f32, 32768>, !dataflow.stream<f32, 32768>, f32) -> ()
    call @node11(%9, %7, %cst_1) : (!dataflow.stream<f32, 32768>, !dataflow.stream<f32, 512>, f32) -> ()
    call @node10(%8, %7, %6, %5) : (!dataflow.stream<f32, 32768>, !dataflow.stream<f32, 512>, !dataflow.stream<f32, 32768>, !dataflow.stream<f32, 32768>) -> ()
    call @node9(%6, %4, %cst_0) : (!dataflow.stream<f32, 32768>, !dataflow.stream<f32, 512>, f32) -> ()
    call @node8(%5, %4, %3) : (!dataflow.stream<f32, 32768>, !dataflow.stream<f32, 512>, !dataflow.stream<f32, 32768>) -> ()
    call @node7(%alloc_5, %alloc_4) : (memref<64x128xf32>, memref<8x64x16xf32>) -> ()
    call @node6(%3, %alloc_4, %alloc_3, %cst_0) : (!dataflow.stream<f32, 32768>, memref<8x64x16xf32>, memref<8x64x16xf32>, f32) -> ()
    call @node5(%alloc_3, %alloc_2) : (memref<8x64x16xf32>, memref<64x8x16xf32>) -> ()
    call @node4(%alloc_2, %2) : (memref<64x8x16xf32>, !dataflow.stream<f32, 8192>) -> ()
    call @node3(%arg8, %alloc) : (memref<128x128xf32>, memref<128x128xf32>) -> ()
    call @node2(%2, %alloc, %1, %cst_0) : (!dataflow.stream<f32, 8192>, memref<128x128xf32>, !dataflow.stream<f32, 8192>, f32) -> ()
    call @node1(%1, %arg7, %0) : (!dataflow.stream<f32, 8192>, memref<128xf32>, !dataflow.stream<f32, 8192>) -> ()
    call @node0(%0, %arg9) : (!dataflow.stream<f32, 8192>, memref<1x64x128xf32>) -> ()
    return
  }
}

