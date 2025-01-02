
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//

#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

using namespace std;

/// This is top function.
/// Latency=2651034, interval=2651034
/// DSP=26, BRAM=0
void test_gemm(
  float v0,
  float v1,
  float v2[200][240],
  float v3[240][220],
  float v4[200][220]
) {	// L3, [0,2651034)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=2
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=2
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v4 cyclic factor=2 dim=2
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 100; v5 += 1) {	// L4, [0,11008), iterCycle=7, II=1
    for (int v6 = 0; v6 < 110; v6 += 1) {	// L5, [2640024,2640142), iterCycle=7, II=1
      #pragma HLS pipeline II=1
      float v7 = v4[(v5 * 2)][(v6 * 2)];	// L6, [0,2)
      float v8 = v7 * v1;	// L7, [2,6)
      v4[(v5 * 2)][(v6 * 2)] = v8;	// L8, [6,7)
      float v9 = v4[(v5 * 2)][((v6 * 2) + 1)];	// L9, [0,2)
      float v10 = v9 * v1;	// L10, [2,6)
      v4[(v5 * 2)][((v6 * 2) + 1)] = v10;	// L11, [6,7)
      float v11 = v4[((v5 * 2) + 1)][(v6 * 2)];	// L12, [0,2)
      float v12 = v11 * v1;	// L13, [2,6)
      v4[((v5 * 2) + 1)][(v6 * 2)] = v12;	// L14, [6,7)
      float v13 = v4[((v5 * 2) + 1)][((v6 * 2) + 1)];	// L15, [0,2)
      float v14 = v13 * v1;	// L16, [2,6)
      v4[((v5 * 2) + 1)][((v6 * 2) + 1)] = v14;	// L17, [6,7)
    }
  }
  for (int v15 = 0; v15 < 120; v15 += 1) {	// L20, [11008,2651032), iterCycle=24, II=2
    for (int v16 = 0; v16 < 100; v16 += 1) {	// L21, [0,22024), iterCycle=24, II=2
      for (int v17 = 0; v17 < 110; v17 += 1) {	// L22, [0,244), iterCycle=24, II=2
        #pragma HLS pipeline II=1
        float v18 = v2[(v16 * 2)][(v15 * 2)];	// L23, [0,2)
        float v19 = v0 * v18;	// L24, [2,6)
        float v20 = v3[(v15 * 2)][(v17 * 2)];	// L25, [4,6)
        float v21 = v20 * v19;	// L26, [6,10)
        float v22 = v4[(v16 * 2)][(v17 * 2)];	// L27, [8,10)
        float v23 = v21 + v22;	// L28, [10,15)
        v4[(v16 * 2)][(v17 * 2)] = v23;	// L29, [15,16)
        float v24 = v3[(v15 * 2)][((v17 * 2) + 1)];	// L30, [4,6)
        float v25 = v24 * v19;	// L31, [6,10)
        float v26 = v4[(v16 * 2)][((v17 * 2) + 1)];	// L32, [8,10)
        float v27 = v25 + v26;	// L33, [10,15)
        v4[(v16 * 2)][((v17 * 2) + 1)] = v27;	// L34, [15,16)
        float v28 = v2[((v16 * 2) + 1)][(v15 * 2)];	// L35, [0,2)
        float v29 = v0 * v28;	// L36, [2,6)
        float v30 = v20 * v29;	// L37, [6,10)
        float v31 = v4[((v16 * 2) + 1)][(v17 * 2)];	// L38, [8,10)
        float v32 = v30 + v31;	// L39, [10,15)
        v4[((v16 * 2) + 1)][(v17 * 2)] = v32;	// L40, [15,16)
        float v33 = v24 * v29;	// L41, [6,10)
        float v34 = v4[((v16 * 2) + 1)][((v17 * 2) + 1)];	// L42, [8,10)
        float v35 = v33 + v34;	// L43, [10,15)
        v4[((v16 * 2) + 1)][((v17 * 2) + 1)] = v35;	// L44, [15,16)
        float v36 = v2[(v16 * 2)][((v15 * 2) + 1)];	// L45, [8,10)
        float v37 = v0 * v36;	// L46, [10,14)
        float v38 = v3[((v15 * 2) + 1)][(v17 * 2)];	// L47, [12,14)
        float v39 = v38 * v37;	// L48, [14,18)
        float v40 = v4[(v16 * 2)][(v17 * 2)];	// L49, [16,18)
        float v41 = v39 + v40;	// L50, [18,23)
        v4[(v16 * 2)][(v17 * 2)] = v41;	// L51, [23,24)
        float v42 = v3[((v15 * 2) + 1)][((v17 * 2) + 1)];	// L52, [12,14)
        float v43 = v42 * v37;	// L53, [14,18)
        float v44 = v4[(v16 * 2)][((v17 * 2) + 1)];	// L54, [16,18)
        float v45 = v43 + v44;	// L55, [18,23)
        v4[(v16 * 2)][((v17 * 2) + 1)] = v45;	// L56, [23,24)
        float v46 = v2[((v16 * 2) + 1)][((v15 * 2) + 1)];	// L57, [8,10)
        float v47 = v0 * v46;	// L58, [10,14)
        float v48 = v38 * v47;	// L59, [14,18)
        float v49 = v4[((v16 * 2) + 1)][(v17 * 2)];	// L60, [16,18)
        float v50 = v48 + v49;	// L61, [18,23)
        v4[((v16 * 2) + 1)][(v17 * 2)] = v50;	// L62, [23,24)
        float v51 = v42 * v47;	// L63, [14,18)
        float v52 = v4[((v16 * 2) + 1)][((v17 * 2) + 1)];	// L64, [16,18)
        float v53 = v51 + v52;	// L65, [18,23)
        v4[((v16 * 2) + 1)][((v17 * 2) + 1)] = v53;	// L66, [23,24)
      }
    }
  }
}

