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
PRJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/circt"

echo ""
echo ">>> Building LLVM, MLIR..."
echo ""

# Got to the build directory.
# cd "${PRJ_DIR}"
# mkdir -p llvm/build
# cd llvm/build

# # Configure CMake for LLVM.
# cmake -G "${CMAKE_GENERATOR}" ../llvm \
#   -DLLVM_ENABLE_PROJECTS="mlir;clang" \
#   -DLLVM_TARGETS_TO_BUILD="host" \
#   -DLLVM_ENABLE_ASSERTIONS=ON \
#   -DCMAKE_BUILD_TYPE=DEBUG \
#   -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
#   -DCMAKE_C_COMPILER=clang \
#   -DCMAKE_CXX_COMPILER=clang++

# Run building.
# if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
#   ninja -j $JOBS
#   ninja -j $JOBS check-mlir
# else 
#   make -j $JOBS
#   make -j $JOBS check-mlir
# fi

echo ""
echo ">>> Building CIRCT..."
echo ""

# Got to the build directory.
cd "${PRJ_DIR}"
mkdir -p build
cd build

# # Configure CMake for CIRCT.
# cmake -G "${CMAKE_GENERATOR}" .. \
#   -DMLIR_DIR=$PWD/../llvm/build/lib/cmake/mlir \
#   -DLLVM_DIR=$PWD/../llvm/build/lib/cmake/llvm \
#   -DLLVM_ENABLE_ASSERTIONS=ON \
#   -DCMAKE_BUILD_TYPE=DEBUG \
#   -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
#   -DCMAKE_C_COMPILER=clang \
#   -DIVERILOG_DISABLE=ON \
#   -DCMAKE_CXX_COMPILER=clang++

# Run building.
if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
  ninja -j $JOBS
  ninja -j $JOBS check-circt
  ninja -j $JOBS check-circt-integration
else 
  make -j $JOBS
  make -j $JOBS check-circt
  make -j $JOBS check-circt-integration
fi