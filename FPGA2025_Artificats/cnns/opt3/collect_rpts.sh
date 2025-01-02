kernels=(DepthwiseSeparableConvBlock ResidualBlock)
rpt_names=(DepthwiseSeparableConvBlock ResidualBlock)

mkdir -p results_syn
mkdir -p results_rtl
mkdir -p results_streamhls
for i in {0..1} ; do
  kernel=${kernels[$i]}
  rpt_name=${rpt_names[$i]}
  # cp $kernel/paper_result/hls_${kernel}/solution1/syn/report/forward_csynth.rpt results_syn/${kernel}.rpt
  # cp $kernel/paper_result/hls_${kernel}/solution1/sim/report/forward_cosim.rpt results_rtl/${kernel}.rpt
  if [ -f $kernel/hls/hls_${kernel}/solution1/syn/report/forward_csynth.rpt ]; then
    cp $kernel/hls/hls_${kernel}/solution1/syn/report/forward_csynth.rpt results_syn/${rpt_name}.rpt
    cp $kernel/hls/hls_${kernel}/solution1/syn/report/forward_csynth.xml results_syn/${rpt_name}.xml
  else
    echo "File not found: $kernel/hls/hls_${kernel}/solution1/syn/report/forward_csynth.rpt"
  fi
  if [ -f $kernel/hls/hls_${kernel}/solution1/sim/report/forward_cosim.rpt ]; then
    cp $kernel/hls/hls_${kernel}/solution1/sim/report/forward_cosim.rpt results_rtl/${rpt_name}.rpt
  else
    echo "File not found: $kernel/hls/hls_${kernel}/solution1/sim/report/forward_cosim.rpt"
  fi
  if [ -f $kernel/streamhls*.json ]; then
    cp $kernel/streamhls*.json results_streamhls/${rpt_name}.json
  else
    echo "File not found: $kernel/streamhls*.json"
  fi
done
