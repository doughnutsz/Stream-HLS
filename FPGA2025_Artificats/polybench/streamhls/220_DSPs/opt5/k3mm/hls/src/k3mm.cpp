
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
  hls::stream<float> v0[6][2],
  float v1[180][210]
) {
  #pragma HLS array_partition variable=v1 cyclic dim=1 factor=6
  #pragma HLS array_partition variable=v1 cyclic dim=2 factor=2

  loop0: for (int v2 = 0; v2 < 30; v2++) {
    loop1: for (int v3 = 0; v3 < 105; v3++) {
      #pragma HLS pipeline II=1
      #pragma HLS loop_flatten
      loop2: for (int v4 = 0; v4 < 6; v4++) {
        loop3: for (int v5 = 0; v5 < 2; v5++) {
          float v6 = v0[v4][v5].read();
          v1[(v4 + (v2 * 6))][(v5 + (v3 * 2))] = v6;
        }
      }
    }
  }
  return ;
}

void node1(
  hls::stream<float> v7[1][2],
  hls::stream<float> v8[6][1],
  hls::stream<float> v9[6][2],
  float v10
) {
  float v11[180][210];
  #pragma HLS array_partition variable=v11 cyclic dim=1 factor=6
  #pragma HLS array_partition variable=v11 cyclic dim=2 factor=2

  float v12[190][210];
  #pragma HLS array_partition variable=v12 cyclic dim=2 factor=2

  float v13[180][190];
  #pragma HLS array_partition variable=v13 cyclic dim=1 factor=6

  loop4: for (int v14 = 0; v14 < 190; v14++) {
    loop5: for (int v15 = 0; v15 < 30; v15++) {
      loop6: for (int v16 = 0; v16 < 105; v16++) {
        #pragma HLS pipeline II=1
        #pragma HLS loop_flatten
        loop7: for (int v17 = 0; v17 < 1; v17++) {
          loop8: for (int v18 = 0; v18 < 6; v18++) {
            loop9: for (int v19 = 0; v19 < 2; v19++) {
              if ((v19 + (v16 * 2)) == 0) {
                float v20 = v8[v18][v17].read();
                v13[(v18 + (v15 * 6))][(v14 + v17)] = v20;
              }
              float v21 = v13[(v18 + (v15 * 6))][(v14 + v17)];
              if ((v18 + (v15 * 6)) == 0) {
                float v22 = v7[v17][v19].read();
                v12[(v14 + v17)][(v19 + (v16 * 2))] = v22;
              }
              float v23 = v12[(v14 + v17)][(v19 + (v16 * 2))];
              if ((v14 + v17) == 0) {
                v11[(v18 + (v15 * 6))][(v19 + (v16 * 2))] = v10;
              }
              float v24 = v11[(v18 + (v15 * 6))][(v19 + (v16 * 2))];
              float v25 = v21 * v23;
              float v26 = v24 + v25;
              v11[(v18 + (v15 * 6))][(v19 + (v16 * 2))] = v26;
              if (((v14 + v17) - 189) == 0) {
                float v27 = v11[(v18 + (v15 * 6))][(v19 + (v16 * 2))];
                v9[v18][v19].write(v27);
              }
            }
          }
        }
      }
    }
  }
  return ;
}

void node2(
  float v28[190][220],
  float v29[220][210],
  hls::stream<float> v30[1][2],
  float v31
) {
  #pragma HLS array_partition variable=v28 cyclic dim=2 factor=10

  #pragma HLS array_partition variable=v29 cyclic dim=1 factor=10
  #pragma HLS array_partition variable=v29 cyclic dim=2 factor=2

  float v32[190][210];
  #pragma HLS array_partition variable=v32 cyclic dim=2 factor=2

  loop10: for (int v33 = 0; v33 < 190; v33++) {
    loop11: for (int v34 = 0; v34 < 22; v34++) {
      loop12: for (int v35 = 0; v35 < 105; v35++) {
        #pragma HLS pipeline II=1
        #pragma HLS loop_flatten
        loop13: for (int v36 = 0; v36 < 1; v36++) {
          loop14: for (int v37 = 0; v37 < 10; v37++) {
            loop15: for (int v38 = 0; v38 < 2; v38++) {
              float v39 = v28[(v33 + v36)][(v37 + (v34 * 10))];
              float v40 = v29[(v37 + (v34 * 10))][(v38 + (v35 * 2))];
              if ((v37 + (v34 * 10)) == 0) {
                v32[(v33 + v36)][(v38 + (v35 * 2))] = v31;
              }
              float v41 = v32[(v33 + v36)][(v38 + (v35 * 2))];
              float v42 = v39 * v40;
              float v43 = v41 + v42;
              v32[(v33 + v36)][(v38 + (v35 * 2))] = v43;
              if (((v37 + (v34 * 10)) - 219) == 0) {
                float v44 = v32[(v33 + v36)][(v38 + (v35 * 2))];
                v30[v36][v38].write(v44);
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
  float v45[180][200],
  float v46[200][190],
  hls::stream<float> v47[6][1],
  float v48
) {
  #pragma HLS array_partition variable=v45 cyclic dim=1 factor=6
  #pragma HLS array_partition variable=v45 cyclic dim=2 factor=2

  #pragma HLS array_partition variable=v46 cyclic dim=1 factor=2

  float v49[180][190];
  #pragma HLS array_partition variable=v49 cyclic dim=1 factor=6

  loop16: for (int v50 = 0; v50 < 190; v50++) {
    loop17: for (int v51 = 0; v51 < 100; v51++) {
      loop18: for (int v52 = 0; v52 < 30; v52++) {
        #pragma HLS pipeline II=1
        #pragma HLS loop_flatten
        loop19: for (int v53 = 0; v53 < 1; v53++) {
          loop20: for (int v54 = 0; v54 < 2; v54++) {
            loop21: for (int v55 = 0; v55 < 6; v55++) {
              float v56 = v45[(v55 + (v52 * 6))][(v54 + (v51 * 2))];
              float v57 = v46[(v54 + (v51 * 2))][(v50 + v53)];
              if ((v54 + (v51 * 2)) == 0) {
                v49[(v55 + (v52 * 6))][(v50 + v53)] = v48;
              }
              float v58 = v49[(v55 + (v52 * 6))][(v50 + v53)];
              float v59 = v56 * v57;
              float v60 = v58 + v59;
              v49[(v55 + (v52 * 6))][(v50 + v53)] = v60;
              if (((v54 + (v51 * 2)) - 199) == 0) {
                float v61 = v49[(v55 + (v52 * 6))][(v50 + v53)];
                v47[v55][v53].write(v61);
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
  float v62[180][200],
  float v63[200][190],
  float v64[190][220],
  float v65[220][210],
  float v66[180][210]
) {
	#pragma HLS DATAFLOW
  #pragma HLS array_partition variable=v62 cyclic dim=1 factor=6
  #pragma HLS array_partition variable=v62 cyclic dim=2 factor=2

  #pragma HLS array_partition variable=v63 cyclic dim=1 factor=2

  #pragma HLS array_partition variable=v64 cyclic dim=2 factor=10

  #pragma HLS array_partition variable=v65 cyclic dim=1 factor=10
  #pragma HLS array_partition variable=v65 cyclic dim=2 factor=2

  #pragma HLS array_partition variable=v66 cyclic dim=1 factor=6
  #pragma HLS array_partition variable=v66 cyclic dim=2 factor=2

  hls::stream<float> v67[6][2];
	#pragma HLS STREAM variable=v67 depth=3150
  hls::stream<float> v68[1][2];
	#pragma HLS STREAM variable=v68 depth=19950
  hls::stream<float> v69[6][1];
	#pragma HLS STREAM variable=v69 depth=5700
  node3(v62, v63, v69, 0.000000);
  node2(v64, v65, v68, 0.000000);
  node1(v68, v69, v67, 0.000000);
  node0(v67, v66);
  return ;
}

