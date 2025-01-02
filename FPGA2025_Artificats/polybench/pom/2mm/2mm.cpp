
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
/// Latency=3922706, interval=3922706
/// DSP=26, BRAM=0
void test_2mm(
  float v0,
  float v1,
  float v2,
  float v3[180][210],
  float v4[210][190],
  float v5[190][220],
  float v6[180][220],
  float v7[180][190]
) {	// L3, [0,3922706)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface s_axilite port=v2 bundle=ctrl
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS interface bram port=v7

  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=2
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v4 cyclic factor=2 dim=2
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v5 cyclic factor=2 dim=2
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v6 cyclic factor=2 dim=2
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  #pragma HLS array_partition variable=v7 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v7 cyclic factor=2 dim=2
  #pragma HLS resource variable=v7 core=ram_s2p_bram

  for (int v8 = 0; v8 < 90; v8 += 1) {	// L4, [0,8552), iterCycle=1, II=1
    for (int v9 = 0; v9 < 95; v9 += 1) {	// L5, [3914152,3914249), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v7[(v8 * 2)][(v9 * 2)] = v2;	// L6, [0,1)
      v7[(v8 * 2)][((v9 * 2) + 1)] = v2;	// L7, [0,1)
      v7[((v8 * 2) + 1)][(v9 * 2)] = v2;	// L8, [0,1)
      v7[((v8 * 2) + 1)][((v9 * 2) + 1)] = v2;	// L9, [0,1)
    }
  }
  for (int v10 = 0; v10 < 105; v10 += 1) {	// L12, [8552,1804076), iterCycle=24, II=2
    for (int v11 = 0; v11 < 90; v11 += 1) {	// L13, [2118628,2135752), iterCycle=24, II=2
      for (int v12 = 0; v12 < 95; v12 += 1) {	// L14, [2118628,2118842), iterCycle=24, II=2
        #pragma HLS pipeline II=1
        float v13 = v3[(v11 * 2)][(v10 * 2)];	// L15, [0,2)
        float v14 = v0 * v13;	// L16, [2,6)
        float v15 = v4[(v10 * 2)][(v12 * 2)];	// L17, [4,6)
        float v16 = v15 * v14;	// L18, [6,10)
        float v17 = v7[(v11 * 2)][(v12 * 2)];	// L19, [8,10)
        float v18 = v16 + v17;	// L20, [10,15)
        v7[(v11 * 2)][(v12 * 2)] = v18;	// L21, [15,16)
        float v19 = v4[(v10 * 2)][((v12 * 2) + 1)];	// L22, [4,6)
        float v20 = v19 * v14;	// L23, [6,10)
        float v21 = v7[(v11 * 2)][((v12 * 2) + 1)];	// L24, [8,10)
        float v22 = v20 + v21;	// L25, [10,15)
        v7[(v11 * 2)][((v12 * 2) + 1)] = v22;	// L26, [15,16)
        float v23 = v3[((v11 * 2) + 1)][(v10 * 2)];	// L27, [0,2)
        float v24 = v0 * v23;	// L28, [2,6)
        float v25 = v15 * v24;	// L29, [6,10)
        float v26 = v7[((v11 * 2) + 1)][(v12 * 2)];	// L30, [8,10)
        float v27 = v25 + v26;	// L31, [10,15)
        v7[((v11 * 2) + 1)][(v12 * 2)] = v27;	// L32, [15,16)
        float v28 = v19 * v24;	// L33, [6,10)
        float v29 = v7[((v11 * 2) + 1)][((v12 * 2) + 1)];	// L34, [8,10)
        float v30 = v28 + v29;	// L35, [10,15)
        v7[((v11 * 2) + 1)][((v12 * 2) + 1)] = v30;	// L36, [15,16)
        float v31 = v3[(v11 * 2)][((v10 * 2) + 1)];	// L37, [8,10)
        float v32 = v0 * v31;	// L38, [10,14)
        float v33 = v4[((v10 * 2) + 1)][(v12 * 2)];	// L39, [12,14)
        float v34 = v33 * v32;	// L40, [14,18)
        float v35 = v7[(v11 * 2)][(v12 * 2)];	// L41, [16,18)
        float v36 = v34 + v35;	// L42, [18,23)
        v7[(v11 * 2)][(v12 * 2)] = v36;	// L43, [23,24)
        float v37 = v4[((v10 * 2) + 1)][((v12 * 2) + 1)];	// L44, [12,14)
        float v38 = v37 * v32;	// L45, [14,18)
        float v39 = v7[(v11 * 2)][((v12 * 2) + 1)];	// L46, [16,18)
        float v40 = v38 + v39;	// L47, [18,23)
        v7[(v11 * 2)][((v12 * 2) + 1)] = v40;	// L48, [23,24)
        float v41 = v3[((v11 * 2) + 1)][((v10 * 2) + 1)];	// L49, [8,10)
        float v42 = v0 * v41;	// L50, [10,14)
        float v43 = v33 * v42;	// L51, [14,18)
        float v44 = v7[((v11 * 2) + 1)][(v12 * 2)];	// L52, [16,18)
        float v45 = v43 + v44;	// L53, [18,23)
        v7[((v11 * 2) + 1)][(v12 * 2)] = v45;	// L54, [23,24)
        float v46 = v37 * v42;	// L55, [14,18)
        float v47 = v7[((v11 * 2) + 1)][((v12 * 2) + 1)];	// L56, [16,18)
        float v48 = v46 + v47;	// L57, [18,23)
        v7[((v11 * 2) + 1)][((v12 * 2) + 1)] = v48;	// L58, [23,24)
      }
    }
  }
  for (int v49 = 0; v49 < 180; v49 += 1) {	// L62, [1804076,1843684), iterCycle=7, II=1
    for (int v50 = 0; v50 < 220; v50 += 1) {	// L63, [2079020,2079248), iterCycle=7, II=1
      #pragma HLS pipeline II=1
      float v51 = v6[v49][v50];	// L64, [0,2)
      float v52 = v51 * v1;	// L65, [2,6)
      v6[v49][v50] = v52;	// L66, [6,7)
    }
  }
  for (int v53 = 0; v53 < 105; v53 += 1) {	// L69, [1843684,3922704), iterCycle=20, II=2
    for (int v54 = 0; v54 < 90; v54 += 1) {	// L70, [0,19820), iterCycle=20, II=2
      for (int v55 = 0; v55 < 110; v55 += 1) {	// L71, [0,240), iterCycle=20, II=2
        #pragma HLS pipeline II=1
        float v56 = v7[(v54 * 2)][(v53 * 2)];	// L72, [0,2)
        float v57 = v5[(v53 * 2)][(v55 * 2)];	// L73, [0,2)
        float v58 = v56 * v57;	// L74, [2,6)
        float v59 = v6[(v54 * 2)][(v55 * 2)];	// L75, [4,6)
        float v60 = v58 + v59;	// L76, [6,11)
        v6[(v54 * 2)][(v55 * 2)] = v60;	// L77, [11,12)
        float v61 = v5[(v53 * 2)][((v55 * 2) + 1)];	// L78, [0,2)
        float v62 = v56 * v61;	// L79, [2,6)
        float v63 = v6[(v54 * 2)][((v55 * 2) + 1)];	// L80, [4,6)
        float v64 = v62 + v63;	// L81, [6,11)
        v6[(v54 * 2)][((v55 * 2) + 1)] = v64;	// L82, [11,12)
        float v65 = v7[((v54 * 2) + 1)][(v53 * 2)];	// L83, [0,2)
        float v66 = v65 * v57;	// L84, [2,6)
        float v67 = v6[((v54 * 2) + 1)][(v55 * 2)];	// L85, [4,6)
        float v68 = v66 + v67;	// L86, [6,11)
        v6[((v54 * 2) + 1)][(v55 * 2)] = v68;	// L87, [11,12)
        float v69 = v65 * v61;	// L88, [2,6)
        float v70 = v6[((v54 * 2) + 1)][((v55 * 2) + 1)];	// L89, [4,6)
        float v71 = v69 + v70;	// L90, [6,11)
        v6[((v54 * 2) + 1)][((v55 * 2) + 1)] = v71;	// L91, [11,12)
        float v72 = v7[(v54 * 2)][((v53 * 2) + 1)];	// L92, [8,10)
        float v73 = v5[((v53 * 2) + 1)][(v55 * 2)];	// L93, [8,10)
        float v74 = v72 * v73;	// L94, [10,14)
        float v75 = v6[(v54 * 2)][(v55 * 2)];	// L95, [12,14)
        float v76 = v74 + v75;	// L96, [14,19)
        v6[(v54 * 2)][(v55 * 2)] = v76;	// L97, [19,20)
        float v77 = v5[((v53 * 2) + 1)][((v55 * 2) + 1)];	// L98, [8,10)
        float v78 = v72 * v77;	// L99, [10,14)
        float v79 = v6[(v54 * 2)][((v55 * 2) + 1)];	// L100, [12,14)
        float v80 = v78 + v79;	// L101, [14,19)
        v6[(v54 * 2)][((v55 * 2) + 1)] = v80;	// L102, [19,20)
        float v81 = v7[((v54 * 2) + 1)][((v53 * 2) + 1)];	// L103, [8,10)
        float v82 = v81 * v73;	// L104, [10,14)
        float v83 = v6[((v54 * 2) + 1)][(v55 * 2)];	// L105, [12,14)
        float v84 = v82 + v83;	// L106, [14,19)
        v6[((v54 * 2) + 1)][(v55 * 2)] = v84;	// L107, [19,20)
        float v85 = v81 * v77;	// L108, [10,14)
        float v86 = v6[((v54 * 2) + 1)][((v55 * 2) + 1)];	// L109, [12,14)
        float v87 = v85 + v86;	// L110, [14,19)
        v6[((v54 * 2) + 1)][((v55 * 2) + 1)] = v87;	// L111, [19,20)
      }
    }
  }
}

