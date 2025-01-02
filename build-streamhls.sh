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
PRJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo ""
echo ">>> Stream-HLS build..."
echo ""

# Got to the build directory.
cd "${PRJ_DIR}"
mkdir -p build
cd build
# use clang/clang++ and enable lld linker
cmake -G "${CMAKE_GENERATOR}" .. \
  -DMLIR_DIR=/home/suhail/Projects/Stream-HLS/extern/llvm-project/build/lib/cmake/mlir \
  -DLLVM_DIR=/home/suhail/Projects/Stream-HLS/extern/llvm-project/build/lib/cmake/llvm \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=DEBUG \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DLLVM_ENABLE_LLD=ON

# Run building.
if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
  ninja
else
  make
fi