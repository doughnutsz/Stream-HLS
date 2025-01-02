
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
/// Latency=12789, interval=12789
/// DSP=50, BRAM=0
void test_gesummv(
  float v0,
  float v1,
  float v2[250][250],
  float v3[250][250],
  float v4[250],
  float v5[250],
  float v6[250]
) {	// L5, [0,12789)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6

  #pragma HLS array_partition variable=v2 cyclic factor=5 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=2
  #pragma HLS resource variable=v2 core=ram_s2p_bram

  #pragma HLS array_partition variable=v3 cyclic factor=5 dim=1
  #pragma HLS array_partition variable=v3 cyclic factor=2 dim=2
  #pragma HLS resource variable=v3 core=ram_s2p_bram

  #pragma HLS array_partition variable=v4 cyclic factor=5 dim=1
  #pragma HLS resource variable=v4 core=ram_s2p_bram

  #pragma HLS array_partition variable=v5 cyclic factor=2 dim=1
  #pragma HLS resource variable=v5 core=ram_s2p_bram

  #pragma HLS array_partition variable=v6 cyclic factor=5 dim=1
  #pragma HLS resource variable=v6 core=ram_s2p_bram

  for (int v7 = 0; v7 < 125; v7 += 1) {	// L6, [0,12520), iterCycle=20, II=2
    for (int v8 = 0; v8 < 50; v8 += 1) {	// L7, [267,387), iterCycle=20, II=2
      #pragma HLS pipeline II=1
      float v9 = v2[(v8 * 5)][(v7 * 2)];	// L8, [0,2)
      float v10 = v5[(v7 * 2)];	// L9, [0,2)
      float v11 = v9 * v10;	// L10, [2,6)
      float v12 = v4[(v8 * 5)];	// L11, [4,6)
      float v13 = v11 + v12;	// L12, [6,11)
      v4[(v8 * 5)] = v13;	// L13, [11,12)
      float v14 = v3[(v8 * 5)][(v7 * 2)];	// L14, [0,2)
      float v15 = v14 * v10;	// L15, [2,6)
      float v16 = v6[(v8 * 5)];	// L16, [4,6)
      float v17 = v15 + v16;	// L17, [6,11)
      v6[(v8 * 5)] = v17;	// L18, [11,12)
      float v18 = v2[((v8 * 5) + 1)][(v7 * 2)];	// L19, [0,2)
      float v19 = v18 * v10;	// L20, [2,6)
      float v20 = v4[((v8 * 5) + 1)];	// L21, [4,6)
      float v21 = v19 + v20;	// L22, [6,11)
      v4[((v8 * 5) + 1)] = v21;	// L23, [11,12)
      float v22 = v3[((v8 * 5) + 1)][(v7 * 2)];	// L24, [0,2)
      float v23 = v22 * v10;	// L25, [2,6)
      float v24 = v6[((v8 * 5) + 1)];	// L26, [4,6)
      float v25 = v23 + v24;	// L27, [6,11)
      v6[((v8 * 5) + 1)] = v25;	// L28, [11,12)
      float v26 = v2[((v8 * 5) + 2)][(v7 * 2)];	// L29, [0,2)
      float v27 = v26 * v10;	// L30, [2,6)
      float v28 = v4[((v8 * 5) + 2)];	// L31, [4,6)
      float v29 = v27 + v28;	// L32, [6,11)
      v4[((v8 * 5) + 2)] = v29;	// L33, [11,12)
      float v30 = v3[((v8 * 5) + 2)][(v7 * 2)];	// L34, [0,2)
      float v31 = v30 * v10;	// L35, [2,6)
      float v32 = v6[((v8 * 5) + 2)];	// L36, [4,6)
      float v33 = v31 + v32;	// L37, [6,11)
      v6[((v8 * 5) + 2)] = v33;	// L38, [11,12)
      float v34 = v2[((v8 * 5) + 3)][(v7 * 2)];	// L39, [0,2)
      float v35 = v34 * v10;	// L40, [2,6)
      float v36 = v4[((v8 * 5) + 3)];	// L41, [4,6)
      float v37 = v35 + v36;	// L42, [6,11)
      v4[((v8 * 5) + 3)] = v37;	// L43, [11,12)
      float v38 = v3[((v8 * 5) + 3)][(v7 * 2)];	// L44, [0,2)
      float v39 = v38 * v10;	// L45, [2,6)
      float v40 = v6[((v8 * 5) + 3)];	// L46, [4,6)
      float v41 = v39 + v40;	// L47, [6,11)
      v6[((v8 * 5) + 3)] = v41;	// L48, [11,12)
      float v42 = v2[((v8 * 5) + 4)][(v7 * 2)];	// L49, [0,2)
      float v43 = v42 * v10;	// L50, [2,6)
      float v44 = v4[((v8 * 5) + 4)];	// L51, [4,6)
      float v45 = v43 + v44;	// L52, [6,11)
      v4[((v8 * 5) + 4)] = v45;	// L53, [11,12)
      float v46 = v3[((v8 * 5) + 4)][(v7 * 2)];	// L54, [0,2)
      float v47 = v46 * v10;	// L55, [2,6)
      float v48 = v6[((v8 * 5) + 4)];	// L56, [4,6)
      float v49 = v47 + v48;	// L57, [6,11)
      v6[((v8 * 5) + 4)] = v49;	// L58, [11,12)
      float v50 = v2[(v8 * 5)][((v7 * 2) + 1)];	// L59, [8,10)
      float v51 = v5[((v7 * 2) + 1)];	// L60, [8,10)
      float v52 = v50 * v51;	// L61, [10,14)
      float v53 = v4[(v8 * 5)];	// L62, [12,14)
      float v54 = v52 + v53;	// L63, [14,19)
      v4[(v8 * 5)] = v54;	// L64, [19,20)
      float v55 = v3[(v8 * 5)][((v7 * 2) + 1)];	// L65, [8,10)
      float v56 = v55 * v51;	// L66, [10,14)
      float v57 = v6[(v8 * 5)];	// L67, [12,14)
      float v58 = v56 + v57;	// L68, [14,19)
      v6[(v8 * 5)] = v58;	// L69, [19,20)
      float v59 = v2[((v8 * 5) + 1)][((v7 * 2) + 1)];	// L70, [8,10)
      float v60 = v59 * v51;	// L71, [10,14)
      float v61 = v4[((v8 * 5) + 1)];	// L72, [12,14)
      float v62 = v60 + v61;	// L73, [14,19)
      v4[((v8 * 5) + 1)] = v62;	// L74, [19,20)
      float v63 = v3[((v8 * 5) + 1)][((v7 * 2) + 1)];	// L75, [8,10)
      float v64 = v63 * v51;	// L76, [10,14)
      float v65 = v6[((v8 * 5) + 1)];	// L77, [12,14)
      float v66 = v64 + v65;	// L78, [14,19)
      v6[((v8 * 5) + 1)] = v66;	// L79, [19,20)
      float v67 = v2[((v8 * 5) + 2)][((v7 * 2) + 1)];	// L80, [8,10)
      float v68 = v67 * v51;	// L81, [10,14)
      float v69 = v4[((v8 * 5) + 2)];	// L82, [12,14)
      float v70 = v68 + v69;	// L83, [14,19)
      v4[((v8 * 5) + 2)] = v70;	// L84, [19,20)
      float v71 = v3[((v8 * 5) + 2)][((v7 * 2) + 1)];	// L85, [8,10)
      float v72 = v71 * v51;	// L86, [10,14)
      float v73 = v6[((v8 * 5) + 2)];	// L87, [12,14)
      float v74 = v72 + v73;	// L88, [14,19)
      v6[((v8 * 5) + 2)] = v74;	// L89, [19,20)
      float v75 = v2[((v8 * 5) + 3)][((v7 * 2) + 1)];	// L90, [8,10)
      float v76 = v75 * v51;	// L91, [10,14)
      float v77 = v4[((v8 * 5) + 3)];	// L92, [12,14)
      float v78 = v76 + v77;	// L93, [14,19)
      v4[((v8 * 5) + 3)] = v78;	// L94, [19,20)
      float v79 = v3[((v8 * 5) + 3)][((v7 * 2) + 1)];	// L95, [8,10)
      float v80 = v79 * v51;	// L96, [10,14)
      float v81 = v6[((v8 * 5) + 3)];	// L97, [12,14)
      float v82 = v80 + v81;	// L98, [14,19)
      v6[((v8 * 5) + 3)] = v82;	// L99, [19,20)
      float v83 = v2[((v8 * 5) + 4)][((v7 * 2) + 1)];	// L100, [8,10)
      float v84 = v83 * v51;	// L101, [10,14)
      float v85 = v4[((v8 * 5) + 4)];	// L102, [12,14)
      float v86 = v84 + v85;	// L103, [14,19)
      v4[((v8 * 5) + 4)] = v86;	// L104, [19,20)
      float v87 = v3[((v8 * 5) + 4)][((v7 * 2) + 1)];	// L105, [8,10)
      float v88 = v87 * v51;	// L106, [10,14)
      float v89 = v6[((v8 * 5) + 4)];	// L107, [12,14)
      float v90 = v88 + v89;	// L108, [14,19)
      v6[((v8 * 5) + 4)] = v90;	// L109, [19,20)
    }
  }
  for (int v91 = 0; v91 < 250; v91 += 1) {	// L112, [12520,12787), iterCycle=16, II=1
    #pragma HLS pipeline II=1
    float v92 = v4[v91];	// L113, [0,2)
    float v93 = v0 * v92;	// L114, [2,6)
    float v94 = v1 + v93;	// L115, [6,11)
    float v95 = v6[v91];	// L116, [9,11)
    float v96 = v94 * v95;	// L117, [11,15)
    v6[v91] = v96;	// L118, [15,16)
  }
}

