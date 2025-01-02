file(GLOB globbed *.cpp)

add_mlir_library(MLIR_StreamHLS_Analysis
  ${globbed}
  
  DEPENDS
  MLIR_StreamHLS_TransformsIncGen

  LINK_LIBS PUBLIC
  MLIR_StreamHLS_Support
  MLIRPass
  )
