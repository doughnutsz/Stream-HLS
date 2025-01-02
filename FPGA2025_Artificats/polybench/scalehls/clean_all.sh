kernels=(2mm 3mm atax bicg gemm gesummv mvt)
prefix="paper_result"
for kernel in ${kernels[@]}; do
  echo "Running ${kernel}..."
  cd $kernel
  # rm -rf $prefix/$kernel.prj $prefix/*.log $prefix/*.app $prefix/solution* $prefix/*.bin
  # rm -rf $kernel.prj *.log *.app solution* *.bin
  rm -rf run.tcl
  cd ..
done