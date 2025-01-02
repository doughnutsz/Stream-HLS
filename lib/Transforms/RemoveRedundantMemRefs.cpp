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

#define DEBUG_TYPE "streamhls-remove-redundant-memrefs"

namespace {
  struct RemoveRedundantMemRefsRewriter : public OpRewritePattern<memref::AllocOp> {
    using OpRewritePattern<memref::AllocOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      memref::AllocOp allocOp,
      PatternRewriter &rewriter
    ) const override {
      auto memRef = allocOp.getResult();
      SmallVector<AffineLoadOp, 4> loadOps;
      SmallVector<AffineStoreOp, 4> storeOps;
      for(auto user : memRef.getUsers()){
        if(auto loadOp = dyn_cast<AffineLoadOp>(user)){
          loadOps.push_back(loadOp);
        }
        if(auto storeOp = dyn_cast<AffineStoreOp>(user)){
          storeOps.push_back(storeOp);
        }
      }

      // // if there is only one load and one store
      // if(loadOps.size() == 1 && storeOps.size() == 1){
      //   LLVM_DEBUG(
      //     llvm::dbgs() << "loadOps.size() == 1 && storeOps.size() == 1\n"
      //   );
      //   auto loadOp = loadOps[0];
      //   auto storeOp = storeOps[0];
      for(auto loadOp : loadOps){
        for(auto storeOp : storeOps){
          streamhls::MemRefAccess loadAccess(loadOp);
          streamhls::MemRefAccess storeAccess(storeOp);
          FlatAffineRelation loadRelation;
          FlatAffineRelation storeRelation;
          if(failed(loadAccess.getAccessRelation(loadRelation))){
            LLVM_DEBUG(
              llvm::dbgs() << "loadAccess.getAccessRelation failed\n"
            );
            // return failure();
            continue;
          }
          if(failed(storeAccess.getAccessRelation(storeRelation))){
            LLVM_DEBUG(
              llvm::dbgs() << "storeAccess.getAccessRelation failed\n"
            );
            // return failure();
            continue;
          }

          // if load and store are in the same block
          if(loadOp->getBlock() != storeOp->getBlock()){
            LLVM_DEBUG(
              llvm::dbgs() << "\tloadOp->getBlock() != storeOp->getBlock()\n"
            );
            // return failure();
            continue;
          }
          // if the load is after the store
          if(loadOp->isBeforeInBlock(storeOp)){
            LLVM_DEBUG(
              llvm::dbgs() << "\tloadOp->isBeforeInBlock(storeOp)\n"
            );
            // return failure();
            continue;
          }
          auto loadSpace = loadRelation.getSpace();
          auto storeSpace = storeRelation.getSpace();
          if(!loadSpace.isCompatible(storeSpace)){
            LLVM_DEBUG(
              llvm::dbgs() << "\t!loadSpace.isCompatible(storeSpace)\n"
            );
            // return failure();
            continue;
          }
          if(!loadRelation.isEqual(storeRelation)){
            LLVM_DEBUG(
              llvm::dbgs() << "\t!loadRelation.isEqual(storeRelation)\n"
            );
            // return failure();
            continue;
          }
          LLVM_DEBUG(
            llvm::dbgs() << "Removing redundant memrefs\n"
          );
          rewriter.replaceOp(loadOp, storeOp.getOperand(0));
          rewriter.eraseOp(storeOp);
          if(allocOp.use_empty()){
            rewriter.eraseOp(allocOp);
          }
          return success();
          // if(loadOp->isBeforeInBlock(storeOp)){
          //   // LLVM_DEBUG(
          //   //   llvm::dbgs() << "\t\tloadOp->isBeforeInBlock(storeOp)\n";
          //   //   loadOp.dump();
          //   //   storeOp.dump();
          //   //   loadOp->getBlock()->dump();
          //   // );
          // }else{
          //   // LLVM_DEBUG(
          //   //   storeOp->getBlock()->dump();
          //   // );
            
          // }
        }
      }
      return success();
    }
  };
}

namespace {
struct RemoveRedundantMemRefs
    : public RemoveRedundantMemRefsBase<RemoveRedundantMemRefs> {
  void runOnOperation() override {
    auto func = getOperation();
    auto context = func.getContext();
    RewritePatternSet patterns(context);
    patterns.add<RemoveRedundantMemRefsRewriter>(context);
    (void)applyPatternsAndFoldGreedily(func, std::move(patterns));
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createRemoveRedundantMemRefsPass() {
  return std::make_unique<RemoveRedundantMemRefs>();
}