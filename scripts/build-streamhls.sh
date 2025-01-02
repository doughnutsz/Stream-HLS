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
echo ">>> STREAMHLS build..."
echo ""

# Got to the build directory.
cd "${PRJ_DIR}"
mkdir -p build
cd build

cmake -G "${CMAKE_GENERATOR}" .. \
  -DMLIR_DIR=$PWD/../extern/llvm-project/build/lib/cmake/mlir \
  -DLLVM_DIR=$PWD/../extern/llvm-project/build/lib/cmake/llvm \
  -DCLANG_DIR=$PWD/../extern/llvm-project/build/lib/cmake/clang \
  -DLLVM_TARGETS_TO_BUILD="host" \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DCMAKE_BUILD_TYPE=DEBUG \
  -DLLVM_PARALLEL_LINK_JOBS=$JOBS \
  -DLLVM_ENABLE_LLD=ON \
  -DCMAKE_C_COMPILER=/usr/bin/gcc-10 \
  -DCMAKE_CXX_COMPILER=/usr/bin/g++-10 

# # Run building.
# if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
#   ninja -j $JOBS
# else
#   make -j $JOBS # VERBOSE=1
# fi