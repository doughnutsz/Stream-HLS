kernels=(2mm 3mm atax bicg gemm gesummv mvt)
mkdir -p results_syn
mkdir -p results_rtl
for kernel in ${kernels[@]}; do
  if [ -f $kernel/$kernel.prj/solution1/syn/report/kernel_csynth.rpt ]; then
    cp $kernel/$kernel.prj/solution1/syn/report/kernel_csynth.rpt results_syn/${kernel}.rpt
    cp $kernel/$kernel.prj/solution1/syn/report/kernel_csynth.xml results_syn/${kernel}.xml
  else
    echo "File not found: $kernel/$kernel.prj/solution1/syn/report/kernel_csynth.rpt"
  fi
  if [ -f $kernel/$kernel.prj/solution1/sim/report/kernel_cosim.rpt ]; then
    cp $kernel/$kernel.prj/solution1/sim/report/kernel_cosim.rpt results_rtl/${kernel}.rpt
  else
    echo "File not found: $kernel/$kernel.prj/solution1/sim/report/kernel_cosim.rpt"
  fi
  # srun -c4 --mem=8GB vitis_hls run
done
