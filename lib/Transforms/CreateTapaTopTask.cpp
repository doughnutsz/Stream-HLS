/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "streamhls/Transforms/Passes.h"
#include "streamhls/Support/Utils.h"
#include "streamhls/Support/DFG.h"
#include <fstream>
#include <string>
using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-create-tapa-top-task"


namespace {
struct CreateTapaTopTask : public CreateTapaTopTaskBase<CreateTapaTopTask> {
  CreateTapaTopTask() = default;
  void runOnOperation() override {
    LLVM_DEBUG(llvm::dbgs() << "CreateTapaTopTask\n");
    auto func = getOperation();
    auto context = func.getContext();
    // get func symbol
    auto funcSymbol = func.getSymName();
    // FIXME: check if the func is always forward
    if(funcSymbol != "forward") return; 
    auto builder = OpBuilder(context);
    auto loc = builder.getUnknownLoc();
    auto block = &func.front();
    // auto builder = OpBuilder(context);
    // auto loc = builder.getUnknownLoc();
    // auto dispatch = builder.create<DispatchOp>(loc, ValueRange({}));
    // auto &dispatchBlock = dispatch.getBody().emplaceBlock();
    // builder.setInsertionPointToEnd(&dispatchBlock);
    // auto yeildOp = builder.create<YieldOp>(loc, ValueRange({}));
    // auto &dispatchOps = dispatchBlock.getOperations();
    // SmallVector<Operation *, 8> callOps;
    for(auto &op : block->getOperations()) {
      if(auto callOp = dyn_cast<func::CallOp>(op)) {
        builder.setInsertionPoint(callOp);
        builder.create<TAPATaskBeginOp>(loc);
        break;
      }
    }
    auto funcTerm = block->getTerminator();
    builder.setInsertionPoint(funcTerm);
    builder.create<TAPATaskEndOp>(loc);
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createCreateTapaTopTaskPass() {
  return std::make_unique<CreateTapaTopTask>();
}