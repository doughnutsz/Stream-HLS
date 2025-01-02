/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "streamhls/InitAllDialects.h"
#include "streamhls/InitAllPasses.h"

using namespace mlir;

int main(int argc, char **argv) {
  DialectRegistry registry;
  mlir::streamhls::registerAllDialects(registry);
  mlir::streamhls::registerAllPasses();
  return failed(MlirOptMain(
      argc, argv, "STREAMHLS Optimization Tool", registry));
}
