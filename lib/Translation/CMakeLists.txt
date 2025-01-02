file(GLOB globbed *.cpp)

add_mlir_library(MLIR_StreamHLS_EmitHLSCpp
  ${globbed}
  
  LINK_LIBS PUBLIC
  StreamHLS_Dataflow
  MLIR_StreamHLS_Support
  MLIRMemRefDialect
  MLIRAnalysis
)