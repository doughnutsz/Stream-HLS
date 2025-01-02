kernels=(2mm 3mm atax bicg gemm gesummv mvt)
prefix="paper_result"
for kernel in ${kernels[@]}; do
  echo "Running ${kernel}..."
  cd $kernel
  srun -c2 --mem=4GB ./run_dse.sh &> dse.log &
  cd ..
done