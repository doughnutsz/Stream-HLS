
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//
#include <hls_stream.h>
#include <hls_half.h>
#include <cassert>
#include <hls_math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

using namespace std;

void node0(
  hls::stream<float> v0[1][2],
  float v1[180][220]
) {
  #pragma HLS array_partition variable=v1 cyclic dim=2 factor=2

  loop0: for (int v2 = 0; v2 < 180; v2++) {
    loop1: for (int v3 = 0; v3 < 110; v3++) {
      #pragma HLS pipeline II=1
      #pragma HLS loop_flatten
      loop2: for (int v4 = 0; v4 < 1; v4++) {
        loop3: for (int v5 = 0; v5 < 2; v5++) {
          float v6 = v0[v4][v5].read();
          v1[(v2 + v4)][(v5 + (v3 * 2))] = v6;
        }
      }
    }
  }
  return ;
}

void node1(
  hls::stream<float> v7[1][2],
  float v8[180][220],
  hls::stream<float> v9[1][2],
  double v10,
  float v11
) {
  #pragma HLS array_partition variable=v8 cyclic dim=2 factor=2

  loop4: for (int v12 = 0; v12 < 180; v12++) {
    loop5: for (int v13 = 0; v13 < 110; v13++) {
      #pragma HLS pipeline II=1
      #pragma HLS loop_flatten
      loop6: for (int v14 = 0; v14 < 1; v14++) {
        loop7: for (int v15 = 0; v15 < 2; v15++) {
          float v16 = v7[v14][v15].read();
          float v17 = v8[(v12 + v14)][(v15 + (v13 * 2))];
          float v18 = v10;
          float v19 = v17 * v18;
          float v20 = v16 * v11;
          float v21 = v20 + v19;
          v9[v14][v15].write(v21);
        }
      }
    }
  }
  return ;
}

void node2(
  float v22[190][220],
  hls::stream<float> v23[1][10],
  hls::stream<float> v24[1][2],
  float v25
) {
  #pragma HLS array_partition variable=v22 cyclic dim=1 factor=10
  #pragma HLS array_partition variable=v22 cyclic dim=2 factor=2

  float v26[180][220];
  #pragma HLS array_partition variable=v26 cyclic dim=2 factor=2

  float v27[180][190];
  #pragma HLS array_partition variable=v27 cyclic dim=2 factor=10

  loop8: for (int v28 = 0; v28 < 180; v28++) {
    loop9: for (int v29 = 0; v29 < 19; v29++) {
      loop10: for (int v30 = 0; v30 < 110; v30++) {
        #pragma HLS pipeline II=1
        #pragma HLS loop_flatten
        loop11: for (int v31 = 0; v31 < 1; v31++) {
          loop12: for (int v32 = 0; v32 < 10; v32++) {
            loop13: for (int v33 = 0; v33 < 2; v33++) {
              if ((v33 + (v30 * 2)) == 0) {
                float v34 = v23[v31][v32].read();
                v27[(v28 + v31)][(v32 + (v29 * 10))] = v34;
              }
              float v35 = v27[(v28 + v31)][(v32 + (v29 * 10))];
              float v36 = v22[(v32 + (v29 * 10))][(v33 + (v30 * 2))];
              if ((v32 + (v29 * 10)) == 0) {
                v26[(v28 + v31)][(v33 + (v30 * 2))] = v25;
              }
              float v37 = v26[(v28 + v31)][(v33 + (v30 * 2))];
              float v38 = v35 * v36;
              float v39 = v37 + v38;
              v26[(v28 + v31)][(v33 + (v30 * 2))] = v39;
              if (((v32 + (v29 * 10)) - 189) == 0) {
                float v40 = v26[(v28 + v31)][(v33 + (v30 * 2))];
                v24[v31][v33].write(v40);
              }
            }
          }
        }
      }
    }
  }
  return ;
}

void node3(
  float v41[210][190],
  float v42[180][210],
  hls::stream<float> v43[1][10],
  float v44
) {
  #pragma HLS array_partition variable=v41 cyclic dim=1 factor=2
  #pragma HLS array_partition variable=v41 cyclic dim=2 factor=10

  #pragma HLS array_partition variable=v42 cyclic dim=2 factor=2

  float v45[180][190];
  #pragma HLS array_partition variable=v45 cyclic dim=2 factor=10

  loop14: for (int v46 = 0; v46 < 180; v46++) {
    loop15: for (int v47 = 0; v47 < 105; v47++) {
      loop16: for (int v48 = 0; v48 < 19; v48++) {
        #pragma HLS pipeline II=1
        #pragma HLS loop_flatten
        loop17: for (int v49 = 0; v49 < 1; v49++) {
          loop18: for (int v50 = 0; v50 < 2; v50++) {
            loop19: for (int v51 = 0; v51 < 10; v51++) {
              float v52 = v42[(v46 + v49)][(v50 + (v47 * 2))];
              float v53 = v41[(v50 + (v47 * 2))][(v51 + (v48 * 10))];
              if ((v50 + (v47 * 2)) == 0) {
                v45[(v46 + v49)][(v51 + (v48 * 10))] = v44;
              }
              float v54 = v45[(v46 + v49)][(v51 + (v48 * 10))];
              float v55 = v52 * v53;
              float v56 = v54 + v55;
              v45[(v46 + v49)][(v51 + (v48 * 10))] = v56;
              if (((v50 + (v47 * 2)) - 209) == 0) {
                float v57 = v45[(v46 + v49)][(v51 + (v48 * 10))];
                v43[v49][v51].write(v57);
              }
            }
          }
        }
      }
    }
  }
  return ;
}

void forward(
  float v58[180][210],
  float v59[210][190],
  float v60[190][220],
  float v61[180][220],
  float v62[180][220]
) {
	#pragma HLS DATAFLOW
  #pragma HLS array_partition variable=v58 cyclic dim=2 factor=2

  #pragma HLS array_partition variable=v59 cyclic dim=1 factor=2
  #pragma HLS array_partition variable=v59 cyclic dim=2 factor=10

  #pragma HLS array_partition variable=v60 cyclic dim=1 factor=10
  #pragma HLS array_partition variable=v60 cyclic dim=2 factor=2

  #pragma HLS array_partition variable=v61 cyclic dim=2 factor=2

  #pragma HLS array_partition variable=v62 cyclic dim=2 factor=2

  hls::stream<float> v63[1][2];
	#pragma HLS STREAM variable=v63 depth=19800
  hls::stream<float> v64[1][2];
	#pragma HLS STREAM variable=v64 depth=19800
  hls::stream<float> v65[1][10];
	#pragma HLS STREAM variable=v65 depth=3420
  node3(v59, v58, v65, 0.000000);
  node2(v60, v65, v64, 0.000000);
  node1(v64, v61, v63, 0.100000, 0.500000);
  node0(v63, v62);
  return ;
}

