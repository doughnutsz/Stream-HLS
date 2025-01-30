#!/usr/bin/env bash

# If ninja is available, use it.
CMAKE_GENERATOR="Unix Makefiles"
if which ninja &>/dev/null; then
  CMAKE_GENERATOR="Ninja"
fi

mkdir -p build
cd build

LLVM_PRJ_PATH=$1

# Check if the LLVM and MLIR paths are set.
if [ -z "${LLVM_PRJ_PATH}" ]; then
  echo "Error: LLVM project path is not set."
  echo "Usage: ./build-streamhls.sh <LLVM_PROJECT_PATH>"
  echo "Example: ./build-streamhls.sh /path/to/llvm-project"
  exit 1
fi
# check if path exists
if [ ! -d "${LLVM_PRJ_PATH}" ]; then
  echo "Error: LLVM project path does not exist."
  echo "Make sure the path is correct."
  exit 1
fi

echo ""
echo "Building Stream-HLS..."
echo ""

cmake -G "${CMAKE_GENERATOR}" .. \
  -DMLIR_DIR=${LLVM_PRJ_PATH}/build/lib/cmake/mlir \
  -DLLVM_DIR=${LLVM_PRJ_PATH}/build/lib/cmake/llvm \

# Run building.
if [ "${CMAKE_GENERATOR}" == "Ninja" ]; then
  ninja
else
  make
fi