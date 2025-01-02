/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "streamhls/Transforms/Passes.h"

#include "streamhls/Support/Utils.h"
#include "streamhls/Support/AffineMemAccess.h"

#include "mlir/IR/IntegerSet.h"


using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-constant-fifo-propogation"

namespace {
  struct ConstantFIFOPropogationPattern : public OpRewritePattern<StreamWriteOp> {
    using OpRewritePattern<StreamWriteOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      StreamWriteOp streamWriteOp,
      PatternRewriter &rewriter
    ) const override {
      auto val = streamWriteOp.getOperand(1);
      auto constantOp = val.getDefiningOp<arith::ConstantOp>();
      if(!constantOp)
        return failure();
      auto channel = streamWriteOp.getChannel();
      StreamReadOp streamReadOp;
      for(auto user : channel.getUsers()){
        if(auto readOp = dyn_cast<StreamReadOp>(user)){
          streamReadOp = readOp;
          break;
        }
      }
      // move the constant to before the read
      rewriter.replaceAllUsesWith(streamReadOp.getResult(), constantOp.getResult());
      rewriter.eraseOp(streamWriteOp);
      rewriter.eraseOp(streamReadOp);
      rewriter.eraseOp(channel.getDefiningOp());
      return success();
    }
  };
}

namespace {
  struct ConstantMemRefPropogationPattern : public OpRewritePattern<AffineStoreOp> {
    using OpRewritePattern<AffineStoreOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      AffineStoreOp affineStoreOp,
      PatternRewriter &rewriter
    ) const override {
      auto val = affineStoreOp.getValueToStore();
      auto constantOp = val.getDefiningOp<arith::ConstantOp>();
      if(!constantOp){
        LLVM_DEBUG(llvm::dbgs() << "No constant found\n");
        return failure();
      }

      auto memref = affineStoreOp.getMemRef();
      if(isa<BlockArgument>(memref))
        return failure();
      unsigned numUses = 0;
      for(auto user : memref.getUsers()){
        numUses++;
      }
      if(numUses != 2)
        return failure();
      // LLVM_DEBUG(llvm::dbgs() << "Num uses: " << numUses << "\n");
      // if(memref.hasOneUse())
      //   return failure();
      AffineLoadOp affineLoadOp;
      for(auto user : memref.getUsers()){
        if(auto loadOp = dyn_cast<AffineLoadOp>(user)){
          affineLoadOp = loadOp;
          break;
        }
      }
      if(!affineLoadOp)
        return failure();
      LLVM_DEBUG(llvm::dbgs() << "Removing redundant ops...\n");

      // move the constant to before the read
      rewriter.replaceAllUsesWith(affineLoadOp.getResult(), constantOp.getResult());
      rewriter.eraseOp(affineStoreOp);
      rewriter.eraseOp(affineLoadOp);
      if(memref.use_empty())
        rewriter.eraseOp(memref.getDefiningOp());
      return success();
    }
  };
}

namespace {
struct ConstantFIFOPropogation
    : public ConstantFIFOPropogationBase<ConstantFIFOPropogation> {
  void runOnOperation() override {
    auto func = getOperation();
    auto context = func.getContext();
    mlir::RewritePatternSet patterns(context);
    // patterns.add<ConstantFIFOPropogationPattern>(context);
    patterns.add<ConstantMemRefPropogationPattern>(context);
    (void)applyPatternsAndFoldGreedily(func, std::move(patterns));
  }
};
} // end anonymous namespace

std::unique_ptr<Pass> streamhls::createConstantFIFOPropogationPass() {
  return std::make_unique<ConstantFIFOPropogation>();
}