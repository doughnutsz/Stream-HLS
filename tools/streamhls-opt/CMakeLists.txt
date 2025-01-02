# get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
# get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)

# set(LIBS
#   ${dialect_libs}
#   ${conversion_libs}
#   MLIRSTREAMHLSDataflow
#   MLIROptLib
#   MLIRSTREAMHLSTransforms
#   )

# # add_llvm_tool(streamhls-opt
# #   streamhls-opt.cpp

# #   DEPENDS

# #   )

# add_mlir_tool(streamhls-opt
#   streamhls-opt.cpp

#   DEPENDS
#   ${LIBS}
#   )

# target_link_libraries(streamhls-opt PRIVATE ${LIBS})

# llvm_update_compile_flags(streamhls-opt)
get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)

add_llvm_tool(streamhls-opt
  streamhls-opt.cpp
  )

llvm_update_compile_flags(streamhls-opt)

target_link_libraries(streamhls-opt
  PRIVATE
  ${dialect_libs}
  ${conversion_libs}
  StreamHLS_Dataflow
  MLIROptLib
  MLIR_StreamHLS_Transforms
  MLIR_StreamHLS_Analysis
  MLIR_StreamHLS_Passes
  MLIR_StreamHLS_Support

  # Threads::Threads
  )

