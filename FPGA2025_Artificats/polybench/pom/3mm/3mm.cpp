
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
/// Latency=5786318, interval=5786318
/// DSP=20, BRAM=0
void test_3mm(
  float v0,
  float v1[180][200],
  float v2[200][190],
  float v3[190][220],
  float v4[220][210],
  float v5[180][190],
  float v6[190][210],
  float v7[180][210]
) {	// L3, [0,5786318)
  #pragma HLS interface s_axilite port=return bundle=ctrl
  #pragma HLS interface s_axilite port=v0 bundle=ctrl
  #pragma HLS interface bram port=v1
  #pragma HLS interface bram port=v2
  #pragma HLS interface bram port=v3
  #pragma HLS interface bram port=v4
  #pragma HLS interface bram port=v5
  #pragma HLS interface bram port=v6
  #pragma HLS interface bram port=v7

  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v1 cyclic factor=2 dim=2
  #pragma HLS resource variable=v1 core=ram_s2p_bram

  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=1
  #pragma HLS array_partition variable=v2 cyclic factor=2 dim=2
  #pragma HLS resource variable=v2 core=ram_s2p_bram

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
    for (int v9 = 0; v9 < 95; v9 += 1) {	// L5, [5777764,5777861), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v5[(v8 * 2)][(v9 * 2)] = v0;	// L6, [0,1)
      v5[(v8 * 2)][((v9 * 2) + 1)] = v0;	// L7, [0,1)
      v5[((v8 * 2) + 1)][(v9 * 2)] = v0;	// L8, [0,1)
      v5[((v8 * 2) + 1)][((v9 * 2) + 1)] = v0;	// L9, [0,1)
    }
  }
  for (int v10 = 0; v10 < 100; v10 += 1) {	// L12, [8552,1718572), iterCycle=20, II=2
    for (int v11 = 0; v11 < 90; v11 += 1) {	// L13, [4067744,4084864), iterCycle=20, II=2
      for (int v12 = 0; v12 < 95; v12 += 1) {	// L14, [4067744,4067954), iterCycle=20, II=2
        #pragma HLS pipeline II=1
        float v13 = v1[(v11 * 2)][(v10 * 2)];	// L15, [0,2)
        float v14 = v2[(v10 * 2)][(v12 * 2)];	// L16, [0,2)
        float v15 = v13 * v14;	// L17, [2,6)
        float v16 = v5[(v11 * 2)][(v12 * 2)];	// L18, [4,6)
        float v17 = v15 + v16;	// L19, [6,11)
        v5[(v11 * 2)][(v12 * 2)] = v17;	// L20, [11,12)
        float v18 = v2[(v10 * 2)][((v12 * 2) + 1)];	// L21, [0,2)
        float v19 = v13 * v18;	// L22, [2,6)
        float v20 = v5[(v11 * 2)][((v12 * 2) + 1)];	// L23, [4,6)
        float v21 = v19 + v20;	// L24, [6,11)
        v5[(v11 * 2)][((v12 * 2) + 1)] = v21;	// L25, [11,12)
        float v22 = v1[((v11 * 2) + 1)][(v10 * 2)];	// L26, [0,2)
        float v23 = v22 * v14;	// L27, [2,6)
        float v24 = v5[((v11 * 2) + 1)][(v12 * 2)];	// L28, [4,6)
        float v25 = v23 + v24;	// L29, [6,11)
        v5[((v11 * 2) + 1)][(v12 * 2)] = v25;	// L30, [11,12)
        float v26 = v22 * v18;	// L31, [2,6)
        float v27 = v5[((v11 * 2) + 1)][((v12 * 2) + 1)];	// L32, [4,6)
        float v28 = v26 + v27;	// L33, [6,11)
        v5[((v11 * 2) + 1)][((v12 * 2) + 1)] = v28;	// L34, [11,12)
        float v29 = v1[(v11 * 2)][((v10 * 2) + 1)];	// L35, [8,10)
        float v30 = v2[((v10 * 2) + 1)][(v12 * 2)];	// L36, [8,10)
        float v31 = v29 * v30;	// L37, [10,14)
        float v32 = v5[(v11 * 2)][(v12 * 2)];	// L38, [12,14)
        float v33 = v31 + v32;	// L39, [14,19)
        v5[(v11 * 2)][(v12 * 2)] = v33;	// L40, [19,20)
        float v34 = v2[((v10 * 2) + 1)][((v12 * 2) + 1)];	// L41, [8,10)
        float v35 = v29 * v34;	// L42, [10,14)
        float v36 = v5[(v11 * 2)][((v12 * 2) + 1)];	// L43, [12,14)
        float v37 = v35 + v36;	// L44, [14,19)
        v5[(v11 * 2)][((v12 * 2) + 1)] = v37;	// L45, [19,20)
        float v38 = v1[((v11 * 2) + 1)][((v10 * 2) + 1)];	// L46, [8,10)
        float v39 = v38 * v30;	// L47, [10,14)
        float v40 = v5[((v11 * 2) + 1)][(v12 * 2)];	// L48, [12,14)
        float v41 = v39 + v40;	// L49, [14,19)
        v5[((v11 * 2) + 1)][(v12 * 2)] = v41;	// L50, [19,20)
        float v42 = v38 * v34;	// L51, [10,14)
        float v43 = v5[((v11 * 2) + 1)][((v12 * 2) + 1)];	// L52, [12,14)
        float v44 = v42 + v43;	// L53, [14,19)
        v5[((v11 * 2) + 1)][((v12 * 2) + 1)] = v44;	// L54, [19,20)
      }
    }
  }
  for (int v45 = 0; v45 < 190; v45 += 1) {	// L58, [1718572,1758474), iterCycle=1, II=1
    for (int v46 = 0; v46 < 210; v46 += 1) {	// L59, [4027842,4028054), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v6[v45][v46] = v0;	// L60, [0,1)
    }
  }
  for (int v47 = 0; v47 < 110; v47 += 1) {	// L63, [1758474,3952994), iterCycle=20, II=2
    for (int v48 = 0; v48 < 95; v48 += 1) {	// L64, [1833322,1853292), iterCycle=20, II=2
      for (int v49 = 0; v49 < 105; v49 += 1) {	// L65, [1833322,1833552), iterCycle=20, II=2
        #pragma HLS pipeline II=1
        float v50 = v3[(v48 * 2)][(v47 * 2)];	// L66, [0,2)
        float v51 = v4[(v47 * 2)][(v49 * 2)];	// L67, [0,2)
        float v52 = v50 * v51;	// L68, [2,6)
        float v53 = v6[(v48 * 2)][(v49 * 2)];	// L69, [4,6)
        float v54 = v52 + v53;	// L70, [6,11)
        v6[(v48 * 2)][(v49 * 2)] = v54;	// L71, [11,12)
        float v55 = v4[(v47 * 2)][((v49 * 2) + 1)];	// L72, [0,2)
        float v56 = v50 * v55;	// L73, [2,6)
        float v57 = v6[(v48 * 2)][((v49 * 2) + 1)];	// L74, [4,6)
        float v58 = v56 + v57;	// L75, [6,11)
        v6[(v48 * 2)][((v49 * 2) + 1)] = v58;	// L76, [11,12)
        float v59 = v3[((v48 * 2) + 1)][(v47 * 2)];	// L77, [0,2)
        float v60 = v59 * v51;	// L78, [2,6)
        float v61 = v6[((v48 * 2) + 1)][(v49 * 2)];	// L79, [4,6)
        float v62 = v60 + v61;	// L80, [6,11)
        v6[((v48 * 2) + 1)][(v49 * 2)] = v62;	// L81, [11,12)
        float v63 = v59 * v55;	// L82, [2,6)
        float v64 = v6[((v48 * 2) + 1)][((v49 * 2) + 1)];	// L83, [4,6)
        float v65 = v63 + v64;	// L84, [6,11)
        v6[((v48 * 2) + 1)][((v49 * 2) + 1)] = v65;	// L85, [11,12)
        float v66 = v3[(v48 * 2)][((v47 * 2) + 1)];	// L86, [8,10)
        float v67 = v4[((v47 * 2) + 1)][(v49 * 2)];	// L87, [8,10)
        float v68 = v66 * v67;	// L88, [10,14)
        float v69 = v6[(v48 * 2)][(v49 * 2)];	// L89, [12,14)
        float v70 = v68 + v69;	// L90, [14,19)
        v6[(v48 * 2)][(v49 * 2)] = v70;	// L91, [19,20)
        float v71 = v4[((v47 * 2) + 1)][((v49 * 2) + 1)];	// L92, [8,10)
        float v72 = v66 * v71;	// L93, [10,14)
        float v73 = v6[(v48 * 2)][((v49 * 2) + 1)];	// L94, [12,14)
        float v74 = v72 + v73;	// L95, [14,19)
        v6[(v48 * 2)][((v49 * 2) + 1)] = v74;	// L96, [19,20)
        float v75 = v3[((v48 * 2) + 1)][((v47 * 2) + 1)];	// L97, [8,10)
        float v76 = v75 * v67;	// L98, [10,14)
        float v77 = v6[((v48 * 2) + 1)][(v49 * 2)];	// L99, [12,14)
        float v78 = v76 + v77;	// L100, [14,19)
        v6[((v48 * 2) + 1)][(v49 * 2)] = v78;	// L101, [19,20)
        float v79 = v75 * v71;	// L102, [10,14)
        float v80 = v6[((v48 * 2) + 1)][((v49 * 2) + 1)];	// L103, [12,14)
        float v81 = v79 + v80;	// L104, [14,19)
        v6[((v48 * 2) + 1)][((v49 * 2) + 1)] = v81;	// L105, [19,20)
      }
    }
  }
  for (int v82 = 0; v82 < 180; v82 += 1) {	// L109, [3952994,3990796), iterCycle=1, II=1
    for (int v83 = 0; v83 < 210; v83 += 1) {	// L110, [1795520,1795732), iterCycle=1, II=1
      #pragma HLS pipeline II=1
      v7[v82][v83] = v0;	// L111, [0,1)
    }
  }
  for (int v84 = 0; v84 < 95; v84 += 1) {	// L114, [3990796,5786316), iterCycle=20, II=2
    for (int v85 = 0; v85 < 90; v85 += 1) {	// L115, [0,18920), iterCycle=20, II=2
      for (int v86 = 0; v86 < 105; v86 += 1) {	// L116, [0,230), iterCycle=20, II=2
        #pragma HLS pipeline II=1
        float v87 = v5[(v85 * 2)][(v84 * 2)];	// L117, [0,2)
        float v88 = v6[(v84 * 2)][(v86 * 2)];	// L118, [0,2)
        float v89 = v87 * v88;	// L119, [2,6)
        float v90 = v7[(v85 * 2)][(v86 * 2)];	// L120, [4,6)
        float v91 = v89 + v90;	// L121, [6,11)
        v7[(v85 * 2)][(v86 * 2)] = v91;	// L122, [11,12)
        float v92 = v6[(v84 * 2)][((v86 * 2) + 1)];	// L123, [0,2)
        float v93 = v87 * v92;	// L124, [2,6)
        float v94 = v7[(v85 * 2)][((v86 * 2) + 1)];	// L125, [4,6)
        float v95 = v93 + v94;	// L126, [6,11)
        v7[(v85 * 2)][((v86 * 2) + 1)] = v95;	// L127, [11,12)
        float v96 = v5[((v85 * 2) + 1)][(v84 * 2)];	// L128, [0,2)
        float v97 = v96 * v88;	// L129, [2,6)
        float v98 = v7[((v85 * 2) + 1)][(v86 * 2)];	// L130, [4,6)
        float v99 = v97 + v98;	// L131, [6,11)
        v7[((v85 * 2) + 1)][(v86 * 2)] = v99;	// L132, [11,12)
        float v100 = v96 * v92;	// L133, [2,6)
        float v101 = v7[((v85 * 2) + 1)][((v86 * 2) + 1)];	// L134, [4,6)
        float v102 = v100 + v101;	// L135, [6,11)
        v7[((v85 * 2) + 1)][((v86 * 2) + 1)] = v102;	// L136, [11,12)
        float v103 = v5[(v85 * 2)][((v84 * 2) + 1)];	// L137, [8,10)
        float v104 = v6[((v84 * 2) + 1)][(v86 * 2)];	// L138, [8,10)
        float v105 = v103 * v104;	// L139, [10,14)
        float v106 = v7[(v85 * 2)][(v86 * 2)];	// L140, [12,14)
        float v107 = v105 + v106;	// L141, [14,19)
        v7[(v85 * 2)][(v86 * 2)] = v107;	// L142, [19,20)
        float v108 = v6[((v84 * 2) + 1)][((v86 * 2) + 1)];	// L143, [8,10)
        float v109 = v103 * v108;	// L144, [10,14)
        float v110 = v7[(v85 * 2)][((v86 * 2) + 1)];	// L145, [12,14)
        float v111 = v109 + v110;	// L146, [14,19)
        v7[(v85 * 2)][((v86 * 2) + 1)] = v111;	// L147, [19,20)
        float v112 = v5[((v85 * 2) + 1)][((v84 * 2) + 1)];	// L148, [8,10)
        float v113 = v112 * v104;	// L149, [10,14)
        float v114 = v7[((v85 * 2) + 1)][(v86 * 2)];	// L150, [12,14)
        float v115 = v113 + v114;	// L151, [14,19)
        v7[((v85 * 2) + 1)][(v86 * 2)] = v115;	// L152, [19,20)
        float v116 = v112 * v108;	// L153, [10,14)
        float v117 = v7[((v85 * 2) + 1)][((v86 * 2) + 1)];	// L154, [12,14)
        float v118 = v116 + v117;	// L155, [14,19)
        v7[((v85 * 2) + 1)][((v86 * 2) + 1)] = v118;	// L156, [19,20)
      }
    }
  }
}

