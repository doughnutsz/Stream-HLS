//===----------------------------------------------------------------------===//
//
// Copyright 2020-2021 The ScaleHLS Authors.
//
//===----------------------------------------------------------------------===//

/*
 * Modified by Suhail Basalama in 2024.
 *
 * This software is also released under the MIT License:
 * https://opensource.org/licenses/MIT
 */


#ifndef STREAMHLS_DIALECT_DATAFLOW_TYPES_TD
#define STREAMHLS_DIALECT_DATAFLOW_TYPES_TD

def StreamType : DataflowType<"Stream"> {
  let summary = "A stream type";
  let description = [{
    Represents a stream of any type that can be transfered between HLS modules.
  }];
  let mnemonic = "stream";

  let parameters = (ins "mlir::Type":$elementType, "unsigned":$depth);
  let assemblyFormat = "`<` qualified($elementType) `,` $depth `>`";
}

//===----------------------------------------------------------------------===//
// XRT Types
//===----------------------------------------------------------------------===//
// def XRTBufferType : DataflowType<"XRTBuffer"> {
//   let summary = "A buffer type";
//   let description = [{
//     Represents a buffer type that can be transfered between HLS modules.
//   }];
//   let mnemonic = "xrtBuffer";
//   let parameters = (ins "mlir::Type":$elementType, "unsigned":$sizeBytes);
//   let assemblyFormat = "`<` qualified($elementType) `,` $sizeBytes `>`";
// }

// def XRTDeviceType : DataflowType<"Device"> {
//   let summary = "A device type";
//   let description = [{
//     Represents a device type that can be transfered between HLS modules.
//   }];
//   let mnemonic = "device";
// }

// def XRTKernelType : DataflowType<"Kernel"> {
//   let summary = "A kernel type";
//   let description = [{
//     Represents a kernel type that can be transfered between HLS modules.
//   }];
//   let mnemonic = "kernel";
//   let parameters = (ins Variadic<AnyType>:$inputs);
//   let assemblyFormat = "`<` $inputs `>`";
// }

// def XRTMapType : DataflowType<"Map"> {
//   let summary = "A map type";
//   let description = [{
//     Represents a map type that can be transfered between HLS modules.
//   }];
//   let mnemonic = "map";
//   let parameters = (ins "mlir::Type":$elementType, "unsigned":$sizeBytes);
//   let assemblyFormat = "`<` qualified($elementType) `,` $sizeBytes `>`";
// }

#endif // STREAMHLS_DIALECT_DATAFLOW_TYPES_TD
