//===----------------------------------------------------------------------===//
//
// Copyright 2020-2021 The ScaleHLS Authors.
//
//===----------------------------------------------------------------------===//

#ifndef STREAMHLS_DIALECT_HLS_INTERFACES_TD
#define STREAMHLS_DIALECT_HLS_INTERFACES_TD

include "mlir/IR/OpBase.td"

def BufferLikeInterface : OpInterface<"BufferLikeInterface"> {
  let description = [{
    This interface is used to represent dataflow buffers.
  }];

  let methods = [
    InterfaceMethod<"Return the memref result of the buffer",
      "mlir::Value", "getMemref", (ins), [{ return $_op.getMemref(); }]
    >,
    InterfaceMethod<"Return the memref type of the buffer",
      "mlir::MemRefType", "getMemrefType", (ins), [{
        return $_op.getMemref().getType().template cast<mlir::MemRefType>();
      }]
    >,
    InterfaceMethod<"Return the depth of the buffer", "int32_t",
                    "getBufferDepth">,
    // InterfaceMethod<"Return the initial value of the buffer",
    //                 "llvm::Optional<mlir::TypedAttr>", "getBufferInitValue">,
  ];
}

def StageLikeInterface : OpInterface<"StageLikeInterface"> {
  let description = [{
    This interface is used to represent dataflow stage.
  }];

  let methods = [    
    InterfaceMethod<"Return body region of the stage",
      "mlir::Region &", "getBody", (ins), "return $_op.getBody();">,
    InterfaceMethod<"Check whether the stage has hierarchy",
      "bool", "hasHierarchy", (ins), [{
        return $_op.walk([&](StageLikeInterface stage) {
          if (stage != $_op)
            return WalkResult::interrupt();
          return WalkResult::advance();
        }).wasInterrupted();
      }]>,
    InterfaceMethod<"Return whether the value is a stage livein",
                    "bool", "isLivein", (ins "mlir::Value":$value)>,
    InterfaceMethod<"Return the liveins of the stage",
                    "llvm::SmallVector<mlir::Value>", "getLiveins">,
    InterfaceMethod<"Return the internal users of a stage livein",
                    "llvm::SmallVector<mlir::Operation *>", "getLiveinUsers",
                    (ins "mlir::Value":$livein)>,
  ];
}

#endif // STREAMHLS_DIALECT_HLS_INTERFACES_TD
