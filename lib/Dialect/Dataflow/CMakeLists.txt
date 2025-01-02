add_mlir_dialect_library(StreamHLS_Dataflow
  Dataflow.cpp

  DEPENDS
  MLIRDataflowIncGen
  MLIRDataflowAttributesIncGen
  MLIRDataflowInterfacesIncGen
  )
