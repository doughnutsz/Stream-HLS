/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "streamhls/Transforms/Passes.h"
#include "streamhls/Support/Utils.h"
#include "streamhls/Support/DataflowGraph.h"

using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-pipeline-inner-loops"

namespace {
struct PipelineInnerLoops
    : public PipelineInnerLoopsBase<PipelineInnerLoops> {
  PipelineInnerLoops() = default;
  void runOnOperation() override {
    LLVM_DEBUG(llvm::dbgs() << "PipelineInnerLoops\n");
    auto func = getOperation();
    AffineLoopBands targetBands;
    getLoopBands(func.front(), targetBands, /*allowHavingChilds=*/true);
    for(auto band : targetBands){
      auto innerMostLoop = band.back();
      setLoopDirective(innerMostLoop, true, 1, false, false);
    }
    
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createPipelineInnerLoopsPass() {
  return std::make_unique<PipelineInnerLoops>();
}