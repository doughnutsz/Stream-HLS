prj_path=/home/suhail/Projects/Stream-HLS/examples/experiments/transformers/experiments_1024_0_1_0_1_1/MultiHeadSelfAttention
export PRJ_PATH=${prj_path}/hls
g++ ${prj_path}/hls/src/MultiHeadSelfAttention_tb.cpp ${prj_path}/hls/src/MultiHeadSelfAttention$1.cpp -lm -I${HOME}/hls_headers -o ${prj_path}/hls/MultiHeadSelfAttention.bin
${prj_path}/hls/MultiHeadSelfAttention.bin