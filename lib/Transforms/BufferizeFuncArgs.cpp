/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

#include "mlir/IR/IntegerSet.h"


#include "streamhls/Transforms/Passes.h"
#include "streamhls/Support/Utils.h"
#include "streamhls/Support/AffineMemAccess.h"
#include "streamhls/Support/DFG.h"


using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-bufferize-func-args"

namespace {
  enum ArgType {
    INPUT, OUTPUT
  };
  static LogicalResult bufferizeArg(TypedValue<mlir::MemRefType> memref, Block* block, OpBuilder &builder){
    auto loc = builder.getUnknownLoc();
    // start of the block
    builder.setInsertionPoint(&block->front());
    auto newBuffer = builder.create<memref::AllocOp>(loc, memref.getType());
    SmallVector<int64_t> lbs;
    SmallVector<int64_t> ubs;
    SmallVector<int64_t> steps;
    for(int i = 0; i < memref.getType().getRank(); i++){
      lbs.push_back(0);
      ubs.push_back(memref.getType().getShape()[i]);
      steps.push_back(1);
    }
    affine::buildAffineLoopNest(builder, loc, lbs, ubs, steps,
      [&](OpBuilder &b, Location loc, ValueRange ivs) {
        // auto dtype = memref.getType().getElementType();
        // new load op
        auto loadOp = b.create<AffineLoadOp>(loc, memref, ivs);
        // new store op
        b.create<AffineStoreOp>(loc, loadOp, newBuffer, ivs);
        memref.replaceAllUsesExcept(newBuffer, loadOp);
    });
    // replace all uses of the original memref with the new buffer
    return success();
  }
}
namespace {
struct BufferizeFuncArgs : public BufferizeFuncArgsBase<BufferizeFuncArgs> {
  void runOnOperation() override {
    func::FuncOp func = getOperation();
    auto context = func.getContext();
    OpBuilder builder(context);
    auto block = &func.front();
    SmallVector<std::pair<TypedValue<mlir::MemRefType>, ArgType>> memRefs;
    for(auto arg : func.getArguments()){
      // dynamic cast to TypedValue<MemRefType>
      if(auto memref = dyn_cast<TypedValue<mlir::MemRefType>>(arg)){
        bool isInput = false;
        bool isOutput = false;
        for(auto user : memref.getUsers()){
          if(isa<AffineLoadOp>(user)){
            isInput = true;
          }
          if(isa<AffineStoreOp>(user)){
            isOutput = true;
          }
        }
        if(isInput && isOutput){
          assert(false && "Top Func Argument is both INPUT and OUTPUT");
        } else if(isInput){
          memRefs.push_back({memref, ArgType::INPUT});
        } else if(isOutput){
          memRefs.push_back({memref, ArgType::OUTPUT});
        }
      } else {
        assert(false && "Top Func Argument is not a MemRefType");
      }
    }

    for(auto pair : memRefs){
      auto memref = pair.first;
      auto argType = pair.second;
      if(argType == INPUT){
        if(succeeded(bufferizeArg(memref, block, builder))){
          LLVM_DEBUG(llvm::dbgs() << "Bufferized INPUT argument\n");
        }else{
          assert(false && "Failed to bufferize INPUT argument");
        }
      }
    }
    
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createBufferizeFuncArgsPass() {
  return std::make_unique<BufferizeFuncArgs>();
}