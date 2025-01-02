/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "streamhls/Transforms/Passes.h"
#include "streamhls/Support/Utils.h"

using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-count-operations"

namespace {
struct CountOperations
    : public CountOperationsBase<CountOperations> {
  void runOnOperation() override {
    auto func = getOperation();
    auto context = func.getContext();

    dispatchBlock(&func.front());
    AffineLoopBands targetBands;
    getLoopBands(func.front(), targetBands, /*allowHavingChilds=*/true);
    for(auto& band : targetBands){
      // auto body = getInnermostLoopBody(band.back());
      // body->dump();
      LLVM_DEBUG(llvm::dbgs() << "Loop iters: " << getLoopNestIterations(band) << "\n");
      // SmallVector<Operation *, 4> mathOrArithOps;
      // densemap for operation names (string) and their count (int)
      llvm::SmallDenseMap<OperationName, int64_t> mathOrArithOps;
      getBandMathOrArithOps(band.back().getBody(), mathOrArithOps);
      for(auto& op : mathOrArithOps){
        LLVM_DEBUG(llvm::dbgs() << "Operation: " << op.first << " Count: " << op.second << "\n");
      }
      // band.back().getBody()->dump();
    }

    // for (auto &band : llvm::reverse(targetBands))
    //   dispatchBlock(band.back().getBody());

    // mlir::RewritePatternSet patterns(context);
    // patterns.add<TaskPartition>(context);
    // (void)applyPatternsAndFoldGreedily(func, std::move(patterns));
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createCountOperationsPass() {
  return std::make_unique<CountOperations>();
}
