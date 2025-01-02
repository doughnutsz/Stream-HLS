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
PRJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/extern/polygeist"

echo ""
echo ">>> Unified MLIR, Clang, and Polygeist build..."
echo ""

# Got to the build directory.
cd "${PRJ_DIR}"
mkdir -p build
cd build

# Configure CMake.
cmake -G "${CMAKE_GENERATOR}" \
  ../llvm-project/llvm \
  -DLLVM_ENABLE_PROJECTS="mlir;clang" \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DLLVM_EXTERNAL_PROJECTS="polygeist" \
  -DLLVM_EXTERNAL_POLYGEIST_SOURCE_DIR=.. \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=DEBUG \
  -DLLVM_USE_LINKER=lld \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++

# Run building.
if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
  ninja -j $JOBS 
  ninja -j $JOBS check-polygeist-opt && ninja -j $JOBS check-cgeist
else
  make -j $JOBS
  make -j $JOBS check-polygeist-opt && make -j $JOBS check-cgeist
fi
