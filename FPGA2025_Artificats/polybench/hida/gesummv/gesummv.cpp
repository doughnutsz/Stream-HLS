
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
#include <hls_vector.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

using namespace std;

/// This is top function.
/// Latency=6274, interval=6274
/// DSP=180, BRAM=0
void test_gesummv(
  float v0,
  float v1,
  float v2[250][250],
  float v3[250][250],
  float v4[250],
  float v5[250],
  float v6[250]
) {	// L3, [0,6274)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface s_axilite port=v1 bundle=ctrl
  #pragma HLS interface bram port=v2
  #pragma HLS array_partition variable=v2 cyclic factor=10 dim=1

  #pragma HLS interface bram port=v3
  #pragma HLS array_partition variable=v3 cyclic factor=10 dim=1

  #pragma HLS interface bram port=v4
  #pragma HLS array_partition variable=v4 cyclic factor=10 dim=1

  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS array_partition variable=v6 cyclic factor=10 dim=1

  for (int v7 = 0; v7 < 250; v7 += 1) {	// L4, [0,6272), iterCycle=21, II=1
    for (int v8 = 0; v8 < 25; v8 += 1) {	// L5, [0,47), iterCycle=21, II=1
      #pragma HLS pipeline II=1
      float v9 = v2[(v8 * 10)][v7];	// L6, [0,2)
      float v10 = v5[v7];	// L7, [0,2)
      float v11 = v9 * v10;	// L8, [2,6)
      float v12 = v4[(v8 * 10)];	// L9, [4,6)
      float v13 = v12 + v11;	// L10, [6,11)
      v4[(v8 * 10)] = v13;	// L11, [20,21)
      float v14 = v3[(v8 * 10)][v7];	// L12, [0,2)
      float v15 = v14 * v10;	// L13, [2,6)
      float v16 = v6[(v8 * 10)];	// L14, [4,6)
      float v17 = v16 + v15;	// L15, [6,11)
      float v18 = v0 * v13;	// L16, [11,15)
      float v19 = v1 * v17;	// L17, [11,15)
      float v20 = v18 + v19;	// L18, [15,20)
      float v21 = (((-v7) + 249) == 0) ? v20 : v17;	// L19, [20,20)
      v6[(v8 * 10)] = v21;	// L20, [20,21)
      float v22 = v2[((v8 * 10) + 1)][v7];	// L21, [0,2)
      float v23 = v22 * v10;	// L22, [2,6)
      float v24 = v4[((v8 * 10) + 1)];	// L23, [4,6)
      float v25 = v24 + v23;	// L24, [6,11)
      v4[((v8 * 10) + 1)] = v25;	// L25, [20,21)
      float v26 = v3[((v8 * 10) + 1)][v7];	// L26, [0,2)
      float v27 = v26 * v10;	// L27, [2,6)
      float v28 = v6[((v8 * 10) + 1)];	// L28, [4,6)
      float v29 = v28 + v27;	// L29, [6,11)
      float v30 = v0 * v25;	// L30, [11,15)
      float v31 = v1 * v29;	// L31, [11,15)
      float v32 = v30 + v31;	// L32, [15,20)
      float v33 = (((-v7) + 249) == 0) ? v32 : v29;	// L33, [20,20)
      v6[((v8 * 10) + 1)] = v33;	// L34, [20,21)
      float v34 = v2[((v8 * 10) + 2)][v7];	// L35, [0,2)
      float v35 = v34 * v10;	// L36, [2,6)
      float v36 = v4[((v8 * 10) + 2)];	// L37, [4,6)
      float v37 = v36 + v35;	// L38, [6,11)
      v4[((v8 * 10) + 2)] = v37;	// L39, [20,21)
      float v38 = v3[((v8 * 10) + 2)][v7];	// L40, [0,2)
      float v39 = v38 * v10;	// L41, [2,6)
      float v40 = v6[((v8 * 10) + 2)];	// L42, [4,6)
      float v41 = v40 + v39;	// L43, [6,11)
      float v42 = v0 * v37;	// L44, [11,15)
      float v43 = v1 * v41;	// L45, [11,15)
      float v44 = v42 + v43;	// L46, [15,20)
      float v45 = (((-v7) + 249) == 0) ? v44 : v41;	// L47, [20,20)
      v6[((v8 * 10) + 2)] = v45;	// L48, [20,21)
      float v46 = v2[((v8 * 10) + 3)][v7];	// L49, [0,2)
      float v47 = v46 * v10;	// L50, [2,6)
      float v48 = v4[((v8 * 10) + 3)];	// L51, [4,6)
      float v49 = v48 + v47;	// L52, [6,11)
      v4[((v8 * 10) + 3)] = v49;	// L53, [20,21)
      float v50 = v3[((v8 * 10) + 3)][v7];	// L54, [0,2)
      float v51 = v50 * v10;	// L55, [2,6)
      float v52 = v6[((v8 * 10) + 3)];	// L56, [4,6)
      float v53 = v52 + v51;	// L57, [6,11)
      float v54 = v0 * v49;	// L58, [11,15)
      float v55 = v1 * v53;	// L59, [11,15)
      float v56 = v54 + v55;	// L60, [15,20)
      float v57 = (((-v7) + 249) == 0) ? v56 : v53;	// L61, [20,20)
      v6[((v8 * 10) + 3)] = v57;	// L62, [20,21)
      float v58 = v2[((v8 * 10) + 4)][v7];	// L63, [0,2)
      float v59 = v58 * v10;	// L64, [2,6)
      float v60 = v4[((v8 * 10) + 4)];	// L65, [4,6)
      float v61 = v60 + v59;	// L66, [6,11)
      v4[((v8 * 10) + 4)] = v61;	// L67, [20,21)
      float v62 = v3[((v8 * 10) + 4)][v7];	// L68, [0,2)
      float v63 = v62 * v10;	// L69, [2,6)
      float v64 = v6[((v8 * 10) + 4)];	// L70, [4,6)
      float v65 = v64 + v63;	// L71, [6,11)
      float v66 = v0 * v61;	// L72, [11,15)
      float v67 = v1 * v65;	// L73, [11,15)
      float v68 = v66 + v67;	// L74, [15,20)
      float v69 = (((-v7) + 249) == 0) ? v68 : v65;	// L75, [20,20)
      v6[((v8 * 10) + 4)] = v69;	// L76, [20,21)
      float v70 = v2[((v8 * 10) + 5)][v7];	// L77, [0,2)
      float v71 = v70 * v10;	// L78, [2,6)
      float v72 = v4[((v8 * 10) + 5)];	// L79, [4,6)
      float v73 = v72 + v71;	// L80, [6,11)
      v4[((v8 * 10) + 5)] = v73;	// L81, [20,21)
      float v74 = v3[((v8 * 10) + 5)][v7];	// L82, [0,2)
      float v75 = v74 * v10;	// L83, [2,6)
      float v76 = v6[((v8 * 10) + 5)];	// L84, [4,6)
      float v77 = v76 + v75;	// L85, [6,11)
      float v78 = v0 * v73;	// L86, [11,15)
      float v79 = v1 * v77;	// L87, [11,15)
      float v80 = v78 + v79;	// L88, [15,20)
      float v81 = (((-v7) + 249) == 0) ? v80 : v77;	// L89, [20,20)
      v6[((v8 * 10) + 5)] = v81;	// L90, [20,21)
      float v82 = v2[((v8 * 10) + 6)][v7];	// L91, [0,2)
      float v83 = v82 * v10;	// L92, [2,6)
      float v84 = v4[((v8 * 10) + 6)];	// L93, [4,6)
      float v85 = v84 + v83;	// L94, [6,11)
      v4[((v8 * 10) + 6)] = v85;	// L95, [20,21)
      float v86 = v3[((v8 * 10) + 6)][v7];	// L96, [0,2)
      float v87 = v86 * v10;	// L97, [2,6)
      float v88 = v6[((v8 * 10) + 6)];	// L98, [4,6)
      float v89 = v88 + v87;	// L99, [6,11)
      float v90 = v0 * v85;	// L100, [11,15)
      float v91 = v1 * v89;	// L101, [11,15)
      float v92 = v90 + v91;	// L102, [15,20)
      float v93 = (((-v7) + 249) == 0) ? v92 : v89;	// L103, [20,20)
      v6[((v8 * 10) + 6)] = v93;	// L104, [20,21)
      float v94 = v2[((v8 * 10) + 7)][v7];	// L105, [0,2)
      float v95 = v94 * v10;	// L106, [2,6)
      float v96 = v4[((v8 * 10) + 7)];	// L107, [4,6)
      float v97 = v96 + v95;	// L108, [6,11)
      v4[((v8 * 10) + 7)] = v97;	// L109, [20,21)
      float v98 = v3[((v8 * 10) + 7)][v7];	// L110, [0,2)
      float v99 = v98 * v10;	// L111, [2,6)
      float v100 = v6[((v8 * 10) + 7)];	// L112, [4,6)
      float v101 = v100 + v99;	// L113, [6,11)
      float v102 = v0 * v97;	// L114, [11,15)
      float v103 = v1 * v101;	// L115, [11,15)
      float v104 = v102 + v103;	// L116, [15,20)
      float v105 = (((-v7) + 249) == 0) ? v104 : v101;	// L117, [20,20)
      v6[((v8 * 10) + 7)] = v105;	// L118, [20,21)
      float v106 = v2[((v8 * 10) + 8)][v7];	// L119, [0,2)
      float v107 = v106 * v10;	// L120, [2,6)
      float v108 = v4[((v8 * 10) + 8)];	// L121, [4,6)
      float v109 = v108 + v107;	// L122, [6,11)
      v4[((v8 * 10) + 8)] = v109;	// L123, [20,21)
      float v110 = v3[((v8 * 10) + 8)][v7];	// L124, [0,2)
      float v111 = v110 * v10;	// L125, [2,6)
      float v112 = v6[((v8 * 10) + 8)];	// L126, [4,6)
      float v113 = v112 + v111;	// L127, [6,11)
      float v114 = v0 * v109;	// L128, [11,15)
      float v115 = v1 * v113;	// L129, [11,15)
      float v116 = v114 + v115;	// L130, [15,20)
      float v117 = (((-v7) + 249) == 0) ? v116 : v113;	// L131, [20,20)
      v6[((v8 * 10) + 8)] = v117;	// L132, [20,21)
      float v118 = v2[((v8 * 10) + 9)][v7];	// L133, [0,2)
      float v119 = v118 * v10;	// L134, [2,6)
      float v120 = v4[((v8 * 10) + 9)];	// L135, [4,6)
      float v121 = v120 + v119;	// L136, [6,11)
      v4[((v8 * 10) + 9)] = v121;	// L137, [20,21)
      float v122 = v3[((v8 * 10) + 9)][v7];	// L138, [0,2)
      float v123 = v122 * v10;	// L139, [2,6)
      float v124 = v6[((v8 * 10) + 9)];	// L140, [4,6)
      float v125 = v124 + v123;	// L141, [6,11)
      float v126 = v0 * v121;	// L142, [11,15)
      float v127 = v1 * v125;	// L143, [11,15)
      float v128 = v126 + v127;	// L144, [15,20)
      float v129 = (((-v7) + 249) == 0) ? v128 : v125;	// L145, [20,20)
      v6[((v8 * 10) + 9)] = v129;	// L146, [20,21)
    }
  }
}

