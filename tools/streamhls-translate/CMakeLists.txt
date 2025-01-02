# Copyright HeteroCL authors. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

set(LLVM_LINK_COMPONENTS
  Support
  )

get_property(translation_libs GLOBAL PROPERTY MLIR_TRANSLATION_LIBS)

add_llvm_executable(streamhls-translate
  streamhls-translate.cpp
  )
llvm_update_compile_flags(streamhls-translate)


target_link_libraries(streamhls-translate
  PRIVATE
  ${translation_libs}
  MLIRIR
  MLIRParser
  MLIRPass
  StreamHLS_Dataflow
  MLIRSPIRVDialect
  MLIRTranslateLib
  MLIRSupport
  MLIR_StreamHLS_EmitHLSCpp
  )


mlir_check_link_libraries(streamhls-translate)
