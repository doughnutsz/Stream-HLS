cmake_minimum_required(VERSION 3.20.0)
message(STATUS "============== ${CMAKE_CURRENT_BINARY_DIR} ==============")
message(STATUS "============== ${CMAKE_BINARY_DIR} ==============")


# if(POLICY CMP0068)
#   cmake_policy(SET CMP0068 NEW)
#   set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)
# endif()

# if(POLICY CMP0075)
#   cmake_policy(SET CMP0075 NEW)
# endif()

# if(POLICY CMP0077)
#   cmake_policy(SET CMP0077 NEW)
# endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
project(streamhls LANGUAGES CXX C)
message(STATUS "Searching for MLIRConfig.cmake in: ${MLIR_DIR}")
find_package(MLIR REQUIRED CONFIG)
option(LLVM_INCLUDE_TOOLS "Generate build targets for the LLVM tools." ON)
option(LLVM_BUILD_TOOLS "Build the LLVM tools. If OFF, just generate build targets." ON)

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)



if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  project(streamhls LANGUAGES CXX C)

  message(STATUS "Searching for MLIRConfig.cmake in: ${MLIR_DIR}")
  find_package(MLIR REQUIRED CONFIG)

  # set(Clang_DIR ${CLANG_DIR})
  # message(STATUS "Searching for ClangConfig.cmake in: ${Clang_DIR}")
  # find_package(Clang REQUIRED CONFIG)

  set(LLVM_DIR ${LLVM_DIR})
  message(STATUS "Searching for LLVMConfig.cmake in: ${LLVM_DIR}")
  find_package(LLVM REQUIRED CONFIG)
  # # This is exported if we are building against a build area.  If
  # # building against an install area, then assume we're using the
  # # submodule.
  # if(NOT LLVM_BUILD_MAIN_SRC_DIR)
  #   set(LLVM_BUILD_MAIN_SRC_DIR ${CMAKE_SOURCE_DIR}/extern/llvm-project/llvm)
  # endif()
  # set(LLVM_SOURCE_DIR ${LLVM_BUILD_MAIN_SRC_DIR} CACHE STRING "Location of LLVM source")

  message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
  message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
  # message(STATUS "Using ClangConfig.cmake in: ${CLANG_DIR}")
else ()
  set(LLVM_SOURCE_DIR ${LLVM_MAIN_SRC_DIR})
  set(MLIR_MAIN_SRC_DIR ${LLVM_MAIN_SRC_DIR}/../mlir)
  set(MLIR_INCLUDE_DIRS ${MLIR_MAIN_SRC_DIR}/include)
  set(MLIR_CMAKE_DIR ${MLIR_MAIN_SRC_DIR}/cmake/modules)
  set(MLIR_TABLEGEN_EXE $<TARGET_FILE:mlir-tblgen>)
  set(MLIR_TABLEGEN_OUTPUT_DIR ${LLVM_BINARY_DIR}/tools/mlir/include)
  set(PROJECT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  include_directories(${MLIR_TABLEGEN_OUTPUT_DIR})
endif()


set(LIT_ARGS_DEFAULT "-sv")
if (MSVC_IDE OR XCODE)
  set(LIT_ARGS_DEFAULT "${LIT_ARGS_DEFAULT} --no-progress-bar")
endif()
set(LLVM_LIT_ARGS "${LIT_ARGS_DEFAULT}" CACHE STRING "Default options for lit")

list(APPEND CMAKE_MODULE_PATH "${MLIR_MAIN_SRC_DIR}/cmake/modules")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
# # list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
# list(APPEND CMAKE_MODULE_PATH "${CLANG_CMAKE_DIR}")
# # list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(TableGen)
include(AddLLVM)
include(AddMLIR)
# include(AddClang)
include(HandleLLVMOptions)

set(StreamHLS_MAIN_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR} )
set(StreamHLS_MAIN_INCLUDE_DIR ${StreamHLS_MAIN_SRC_DIR}/include)

set(StreamHLS_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(StreamHLS_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/include)
set(StreamHLS_TOOLS_DIR ${CMAKE_BINARY_DIR}/bin)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${StreamHLS_MAIN_INCLUDE_DIR})
include_directories(${StreamHLS_INCLUDE_DIR})
link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

add_subdirectory(include/streamhls)
add_subdirectory(lib)
add_subdirectory(tools)
add_subdirectory(test)
