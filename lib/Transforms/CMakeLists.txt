file(GLOB globbed *.cpp)

add_mlir_library(MLIR_StreamHLS_Transforms
  ${globbed}

  DEPENDS
  MLIR_StreamHLS_TransformsIncGen
  
  LINK_LIBS PUBLIC
  MLIRPass
  )
