//===----------------------------------------------------------------------===//
//
// Copyright 2020-2021 The ScaleHLS Authors.
//
//===----------------------------------------------------------------------===//
#ifndef STREAMHLS_DIALECT_DATAFLOW_TD
#define STREAMHLS_DIALECT_DATAFLOW_TD

include "mlir/IR/AttrTypeBase.td"
include "mlir/IR/EnumAttr.td"
include "mlir/IR/OpBase.td"

def DataflowDialect : Dialect {
  let name = "dataflow";
  let summary = "An HLS out-of-tree MLIR dialect";
  let description = [{
    This dialect contains dedicated operations, types, and attributes designed
    for representing HLS C++ specific structures and components in MLIR, while
    enabling comprehensive optimization for both performance and area.
  }];
  let useDefaultTypePrinterParser = 1;
  let useDefaultAttributePrinterParser = 1;
  let cppNamespace = "::mlir::streamhls::dataflow";
}

class DataflowType<string name> : TypeDef<DataflowDialect, name>;

class DataflowAttr<string name> : AttrDef<DataflowDialect, name>;

class DataflowOp<string mnemonic, list<Trait> traits = []> :
    Op<DataflowDialect, mnemonic, traits>;

include "streamhls/Dialect/Dataflow/Attributes.td"
include "streamhls/Dialect/Dataflow/Types.td"
include "streamhls/Dialect/Dataflow/Ops.td"

#endif // STREAMHLS_DIALECT_DATAFLOW_TD
