/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "streamhls/Transforms/Passes.h"
#include "streamhls/Support/Utils.h"
#include "streamhls/Support/DFG.h"

// include fstream for file IO
#include <fstream>
// include string
#include <string>

using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-print-dataflow-graph"

namespace {
struct PrintDataflowGraph
    : public PrintDataflowGraphBase<PrintDataflowGraph> {
  PrintDataflowGraph() = default;
  PrintDataflowGraph(std::string argDotFileName, bool argMergeNodes) {
    dotFileName = argDotFileName;
    mergeNodes = argMergeNodes;
  }
  void runOnOperation() override {
    LLVM_DEBUG(llvm::dbgs() << "PrintDataflowGraph\n");
    auto func = getOperation();
    auto context = func.getContext();
    Block* block = &func.front();
    DFG graph(*block);
    if (!graph.init(mergeNodes)) {
      LLVM_DEBUG(llvm::dbgs() << "MDG init failed\n");
      return;
    }
    // for(auto node : graph.nodes){
    //   if(auto forOp = dyn_cast<AffineForOp>(node.second.op)){
    //     AffineLoopBand band;
    //     getLoopBandFromOutermost(forOp, band);
    //     std::vector<unsigned> vec(band.size());
    //     std::iota(vec.rbegin(), vec.rend(), 0); // Fill the vector with {N-1, N-2, ..., 0}
    //     llvm::ArrayRef<unsigned> permMap(vec); 
    //     auto isValid = isValidLoopInterchangePermutation(band, permMap);
    //     LLVM_DEBUG(
    //       llvm::dbgs() << "Permuting node: " << node.first << " is valid: " << isValid << "\n";
    //     );
    //     // if(isValid){
    //       auto newRoot = band[permuteLoops(band, permMap)];
    //       band.clear();
    //       getLoopBandFromInnermost(newRoot, band);
    //       band.resize(band.size());
    //     // }
    //   }
    // }
    std::error_code stdError;
    llvm::raw_fd_ostream file(dotFileName, stdError);
    if(!file.has_error()) {
      graph.printAsDot(file);
      file.close();
    } else {
      llvm::errs() << "cannot open file " << dotFileName << "\n";
    }
    // graph.printAsDot(llvm::dbgs());
    // outfile.close();
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createPrintDataflowGraphPass(std::string dotFileName, bool mergeNodes) {
  return std::make_unique<PrintDataflowGraph>(dotFileName, mergeNodes);
}