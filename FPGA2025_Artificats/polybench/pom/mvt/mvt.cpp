
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
/// Latency=320020, interval=320020
/// DSP=5, BRAM=0
void test_mvt(
  float v0[400][400],
  float v1[400],
  float v2[400],
  float v3[400],
  float v4[400]
) {	// L4, [0,320020)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface bram port=v0
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4

  #pragma HLS array_partition variable=v0 cyclic factor=16 dim=1
  #pragma HLS array_partition variable=v0 cyclic factor=32 dim=2
  #pragma HLS resource variable=v0 core=ram_s2p_bram

  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=1
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=1
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=2 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  for (int v5 = 0; v5 < 200; v5 += 1) {	// L5, [0,320018), iterCycle=24, II=8
    for (int v6 = 0; v6 < 200; v6 += 1) {	// L6, [0,1618), iterCycle=24, II=8
      #pragma HLS pipeline II=1
      float v7 = v0[(v6 * 2)][(v5 * 2)];	// L7, [0,2)
      float v8 = v3[(v5 * 2)];	// L8, [4,6)
      float v9 = v7 * v8;	// L9, [6,10)
      float v10 = v1[(v6 * 2)];	// L10, [8,10)
      float v11 = v9 + v10;	// L11, [10,15)
      v1[(v6 * 2)] = v11;	// L12, [15,16)
      float v12 = v0[(v5 * 2)][(v6 * 2)];	// L13, [2,4)
      float v13 = v4[(v5 * 2)];	// L14, [4,6)
      float v14 = v12 * v13;	// L15, [6,10)
      float v15 = v2[(v6 * 2)];	// L16, [8,10)
      float v16 = v14 + v15;	// L17, [10,15)
      v2[(v6 * 2)] = v16;	// L18, [15,16)
      float v17 = v0[((v6 * 2) + 1)][(v5 * 2)];	// L19, [3,5)
      float v18 = v17 * v8;	// L20, [6,10)
      float v19 = v1[((v6 * 2) + 1)];	// L21, [8,10)
      float v20 = v18 + v19;	// L22, [10,15)
      v1[((v6 * 2) + 1)] = v20;	// L23, [15,16)
      float v21 = v0[(v5 * 2)][((v6 * 2) + 1)];	// L24, [4,6)
      float v22 = v21 * v13;	// L25, [6,10)
      float v23 = v2[((v6 * 2) + 1)];	// L26, [8,10)
      float v24 = v22 + v23;	// L27, [10,15)
      v2[((v6 * 2) + 1)] = v24;	// L28, [15,16)
      float v25 = v0[(v6 * 2)][((v5 * 2) + 1)];	// L29, [9,11)
      float v26 = v3[((v5 * 2) + 1)];	// L30, [12,14)
      float v27 = v25 * v26;	// L31, [14,18)
      float v28 = v1[(v6 * 2)];	// L32, [16,18)
      float v29 = v27 + v28;	// L33, [18,23)
      v1[(v6 * 2)] = v29;	// L34, [23,24)
      float v30 = v0[((v5 * 2) + 1)][(v6 * 2)];	// L35, [11,13)
      float v31 = v4[((v5 * 2) + 1)];	// L36, [12,14)
      float v32 = v30 * v31;	// L37, [14,18)
      float v33 = v2[(v6 * 2)];	// L38, [16,18)
      float v34 = v32 + v33;	// L39, [18,23)
      v2[(v6 * 2)] = v34;	// L40, [23,24)
      float v35 = v0[((v6 * 2) + 1)][((v5 * 2) + 1)];	// L41, [10,12)
      float v36 = v35 * v26;	// L42, [14,18)
      float v37 = v1[((v6 * 2) + 1)];	// L43, [16,18)
      float v38 = v36 + v37;	// L44, [18,23)
      v1[((v6 * 2) + 1)] = v38;	// L45, [23,24)
      float v39 = v0[((v5 * 2) + 1)][((v6 * 2) + 1)];	// L46, [12,14)
      float v40 = v39 * v31;	// L47, [14,18)
      float v41 = v2[((v6 * 2) + 1)];	// L48, [16,18)
      float v42 = v40 + v41;	// L49, [18,23)
      v2[((v6 * 2) + 1)] = v42;	// L50, [23,24)
    }
  }
}

