add_mlir_library(MLIR_StreamHLS_Passes
  Passes.cpp
  
  DEPENDS
  MLIR_StreamHLS_TransformsIncGen
  
  LINK_LIBS PUBLIC
  MLIR_StreamHLS_Analysis
  MLIR_StreamHLS_Transforms
  MLIRTensorToLinalg
  MLIRPass
)

add_subdirectory(Dialect)
add_subdirectory(Transforms)
add_subdirectory(Translation)
add_subdirectory(Support)
add_subdirectory(Analysis)