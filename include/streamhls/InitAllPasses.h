/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#ifndef STREAMHLS_INITALLPASSES_H
#define STREAMHLS_INITALLPASSES_H

#include "streamhls/Transforms/Passes.h"
#include "mlir/InitAllPasses.h"

namespace mlir {
namespace streamhls {

// Add all the STREAMHLS passes.
inline void registerAllPasses() {
  streamhls::registerTransformsPasses();
  mlir::registerAllPasses();
}

} // namespace streamhls
} // namespace mlir

#endif // STREAMHLS_INITALLPASSES_H
