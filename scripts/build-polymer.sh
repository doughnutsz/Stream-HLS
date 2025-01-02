#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Script options.
while getopts 'j:p:' opt
do
  case $opt in
    j) JOBS="${OPTARG}";;
    p) PYBIND="${OPTARG}";;
  esac
done

# If ninja is available, use it.
CMAKE_GENERATOR="Unix Makefiles"
if which ninja &>/dev/null; then
  CMAKE_GENERATOR="Ninja"
fi

# The absolute path to the directory of this script.
PRJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/extern/polymer"

echo ""
echo ">>> Unified MLIR, Clang, and Polymer build..."
echo ""

# Got to the build directory.
cd "${PRJ_DIR}"
mkdir -p build
cd build
# /home/suhail/Projects/HLS-MLIR/extern/polygeist/llvm-project
cmake -G "${CMAKE_GENERATOR}" .. \
  -DMLIR_DIR=$PWD/../../llvm-project/build/lib/cmake/mlir \
  -DLLVM_DIR=$PWD/../../llvm-project/build/lib/cmake/llvm \
  -DCLANG_DIR=/usr/bin \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=DEBUG \
  -DLLVM_PARALLEL_LINK_JOBS=$JOBS \
  -DLLVM_ENABLE_LLD=ON \
  -DLLVM_EXTERNAL_LIT=$PWD/../../llvm-project/build/bin/llvm-lit \
  -DCMAKE_C_COMPILER=/usr/bin/clang \
  -DCMAKE_CXX_COMPILER=/usr/bin/clang++ 

# Run building.
if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
  ninja -j $JOBS
else
  make -j $JOBS # VERBOSE=1
fi