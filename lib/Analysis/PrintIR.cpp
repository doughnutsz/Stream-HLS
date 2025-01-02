/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "streamhls/Transforms/Passes.h"
#include "streamhls/Support/Utils.h"

#include <string>
#include <fstream>

using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-print-ir"

namespace {
struct PrintIR
    : public PrintIRBase<PrintIR> {
  PrintIR() = default;
  PrintIR(std::string argFilePath) {
    filePath = argFilePath;
  }
  void runOnOperation() override {
    LLVM_DEBUG(
      llvm::dbgs() << "PrintIR\n";
      llvm::dbgs() << "filePath: " << filePath << "\n";
    );
    auto module = getOperation();
    // dump IR to file
    std::error_code stdError;
    llvm::raw_fd_ostream file(filePath, stdError);
    if (!file.has_error()) {
      module.print(file);
      file.close();
    } else {
      llvm::errs() << "cannot open file " << filePath << "\n";
    }
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createPrintIRPass(std::string filePath) {
  LLVM_DEBUG(
    llvm::dbgs() << "createPrintIRPass\n";
    llvm::dbgs() << "filePath: " << filePath << "\n";
  );
  return std::make_unique<PrintIR>(filePath);
}