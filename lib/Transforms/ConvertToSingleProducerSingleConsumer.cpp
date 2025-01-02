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

#define DEBUG_TYPE "streamhls-convert-to-single-producer-single-consumer"


namespace {
  struct EliminateSingleElementMemRefs : public OpRewritePattern<memref::AllocOp> {
    using OpRewritePattern<memref::AllocOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      memref::AllocOp allocOp,
      PatternRewriter &rewriter
    ) const override {
      auto memRef = allocOp.getResult();
      auto memRefShape = memRef.getType().cast<MemRefType>().getShape();

      if(memRefShape.size() != 0){
        return failure();
      }
      // allocOp.dump();
      // memRef.dump();
      // llvm::dbgs() << "EliminateSingleElementMemRefs: " << memRefShape.size() << "\n";
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
      // llvm::dbgs() << "EliminateSingleElementMemRefs: " << storeOps.size() << " " << loadOps.size() << "\n";
      if(storeOps.size() != 1)
        return failure();

      auto storeOp = storeOps[0];
      // get value to store
      auto valToStore = storeOp.getOperand(0).getDefiningOp();
      if(!isa<arith::ConstantOp>(valToStore)){
        return failure();
      }
      // replace all uses with the value to store
      // rewriter.replaceAllUsesWith()
      for(auto loadOp : loadOps){
        rewriter.replaceOp(loadOp, storeOp.getOperand(0));
      }
      rewriter.eraseOp(storeOp);
      rewriter.eraseOp(allocOp);
      return success();
    }
  };
}

namespace {
  struct SingleStoreMultipleLoads : public OpRewritePattern<memref::AllocOp> {
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
          // loadOp.dump();
        }
        if(auto storeOp = dyn_cast<AffineStoreOp>(user)){
          storeOps.push_back(storeOp);
          // storeOp.dump();
        }
      }
      LLVM_DEBUG(
        // allocOp.dump();
        llvm::dbgs() << "SingleStoreMultipleLoads: " << storeOps.size() << " " << loadOps.size() << "\n";
        // llvm::dbgs() << "loadOps.size(): " << loadOps.size() << "\n";
      );
      if(storeOps.size() == 1 && loadOps.size() > storeOps.size()){
        // LLVM_DEBUG(
        //   llvm::dbgs() << "storeOps.size() == 1 && loadOps.size() > storeOps.size()\n"
        // );
        auto storeOp = storeOps[0];
        auto srcOp = storeOp.getOperand(0).getDefiningOp();
        auto forOp = storeOp->getParentOfType<AffineForOp>();
        AffineLoopBand band;
        auto outerForOp = getLoopBandFromInnermost(forOp, band);
        SmallVector<int64_t, 4> lbs;
        SmallVector<int64_t, 4> ubs;
        SmallVector<int64_t, 4> steps;
        for(auto loop : band){
          lbs.push_back(loop.getConstantLowerBound());
          ubs.push_back(loop.getConstantUpperBound());
          steps.push_back(loop.getStep().getRawData()[0]);
        }
        // storeOp.getOperand(0).dump();
        auto loc = rewriter.getUnknownLoc();
        for(auto loadOp : loadOps){
          rewriter.setInsertionPoint(allocOp);
          auto newAllocOp = rewriter.create<memref::AllocOp>(
            loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
          );
          if(auto constOp = dyn_cast<arith::ConstantOp>(srcOp)){
            rewriter.setInsertionPoint(outerForOp);
            affine::buildAffineLoopNest(rewriter, loc, lbs, ubs, steps,
              [&](OpBuilder &b, Location loc, ValueRange ivs) {
                rewriter.create<AffineStoreOp>(
                  loc,
                  constOp.getResult(),
                  newAllocOp.getMemref(),
                  ivs
                );
              });
            rewriter.setInsertionPoint(loadOp);
            auto newLoadOp = rewriter.create<AffineLoadOp>(
              loc, 
              newAllocOp.getMemref(), 
              loadOp.getAffineMap(), 
              loadOp.getMapOperands()
            );
            rewriter.replaceOp(loadOp, newLoadOp.getResult());
          } else {
            rewriter.setInsertionPoint(storeOp);
            rewriter.create<AffineStoreOp>(
              loc,
              storeOp.getOperand(0), 
              newAllocOp.getMemref(), 
              storeOp.getAffineMap(), 
              storeOp.getMapOperands()
            );
            rewriter.setInsertionPoint(loadOp);
            auto newLoadOp = rewriter.create<AffineLoadOp>(
              loc, 
              newAllocOp.getMemref(), 
              loadOp.getAffineMap(), 
              loadOp.getMapOperands()
            );
            rewriter.replaceOp(loadOp, newLoadOp.getResult());
          }
        }
        rewriter.eraseOp(storeOp);
        rewriter.eraseOp(allocOp);
        return success();
        // for(auto loadOp : loadOps){
        //   rewriter.eraseOp(loadOp);
        // }
      }else{
        return failure();
      }
    }
  };
}

// namespace {
//   struct StoreLoadStoreLoad : public OpRewritePattern<memref::AllocOp> {
//     using OpRewritePattern<memref::AllocOp>::OpRewritePattern;
//     LogicalResult matchAndRewrite(
//       memref::AllocOp allocOp,
//       PatternRewriter &rewriter
//     ) const override {
//       auto memRef = allocOp.getResult();
//       auto context = rewriter.getContext();
//       SmallVector<AffineLoadOp, 4> loadOps;
//       SmallVector<AffineStoreOp, 4> storeOps;
//       for(auto user : memRef.getUsers()){
//         if(auto loadOp = dyn_cast<AffineLoadOp>(user)){
//           loadOps.push_back(loadOp);
//           // loadOp.dump();
//         }
//         if(auto storeOp = dyn_cast<AffineStoreOp>(user)){
//           storeOps.push_back(storeOp);
//           // storeOp.dump();
//         }
//       }
//       // LLVM_DEBUG(
//       //   // allocOp.dump();
//       //   llvm::dbgs() << "StoreLoadStoreLoad: " << storeOps.size() << " " << loadOps.size() << "\n";
//       //   // llvm::dbgs() << "loadOps.size(): " << loadOps.size() << "\n";
//       // );
//       // return success();
//       if(storeOps.size() == 2 && loadOps.size() == 2){
//         StoreLoadStoreLoadOps ops;
//         if(failed(reorderOps(loadOps, storeOps, ops))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: reorderOps failed\n"
//           );
//           return failure();
//         }
//         AccessInfo storeInfo(ops.storeOp);
//         AccessInfo loopLoadInfo(ops.loopLoadOp);
//         AccessInfo loopStoreInfo(ops.loopStoreOp);
//         AccessInfo loadInfo(ops.loadOp);
//         if(failed(storeInfo.getAllInfo(context))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: storeInfo.getAllInfo failed\n"
//           );
//           return failure();
//         }
//         if(failed(loopLoadInfo.getAllInfo(context))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: loopLoadInfo.getAllInfo failed\n"
//           );
//           return failure();
//         }
//         if(failed(loopStoreInfo.getAllInfo(context))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: loopStoreInfo.getAllInfo failed\n"
//           );
//           return failure();
//         }
//         if(failed(loadInfo.getAllInfo(context))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: loadInfo.getAllInfo failed\n"
//           );
//           return failure();
//         }
//         auto storeSpace = storeInfo.getRelevantSpace();
//         auto loopLoadSpace = loopLoadInfo.getRelevantSpace();
//         auto loopStoreSpace = loopStoreInfo.getRelevantSpace();
//         auto loadSpace = loadInfo.getRelevantSpace();
//         auto loc = rewriter.getUnknownLoc();
//         rewriter.setInsertionPoint(allocOp);
//         auto newAllocOp1 = rewriter.create<memref::AllocOp>(
//           loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
//         );
//         auto newAllocOp2 = rewriter.create<memref::AllocOp>(
//           loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
//         );
//         if(storeSpace.isCompatible(loopLoadSpace)){
//           if(storeInfo.relevantRelation.isEqual(loopLoadInfo.relevantRelation)){
//             // create if condition
//             rewriter.setInsertionPoint(ops.loopLoadOp);
//             if (!loopLoadInfo.ifExprs.empty()) {
//               auto ifCondition = IntegerSet::get(loopLoadInfo.ifExprs.size(), 0, loopLoadInfo.ifExprs, loopLoadInfo.ifEqFlags);
//               auto ifOp = rewriter.create<AffineIfOp>(
//                     loc, ifCondition, loopLoadInfo.ifOperands, false);
//               rewriter.setInsertionPointToStart(ifOp.getThenBlock());
//             }
//             // create new load
//             auto newLoopLoadOp = rewriter.create<AffineLoadOp>(
//               loc, allocOp.getMemref(), ops.loopLoadOp.getAffineMap(), ops.loopLoadOp.getMapOperands()
//             );
//             // create new store
//             auto newLoopStoreOp = rewriter.create<AffineStoreOp>(
//               loc, newLoopLoadOp.getResult(), newAllocOp1.getMemref(), ops.loopStoreOp.getMapOperands()
//             );
//             // replace old load
//             ops.loopLoadOp.setMemRef(newAllocOp1.getMemref());
//           }
//         }
//         if (loopStoreSpace.isCompatible(loadSpace)) {
//           if (loopStoreInfo.relevantRelation.isEqual(loadInfo.relevantRelation)) {
//             ops.loopStoreOp.setMemRef(newAllocOp1.getMemref());
//             rewriter.setInsertionPointAfter(ops.loopStoreOp);
//             if(!loopStoreInfo.ifExprs.empty()){
//               auto ifCondition = IntegerSet::get(loopStoreInfo.ifExprs.size(), 0, loopStoreInfo.ifExprs, loopStoreInfo.ifEqFlags);
//               auto ifOp = rewriter.create<AffineIfOp>(
//                     loc, ifCondition, loopStoreInfo.ifOperands, false);
//               rewriter.setInsertionPointToStart(ifOp.getThenBlock());
//             }
//             // new load
//             auto newLoadOp = rewriter.create<AffineLoadOp>(
//               loc, newAllocOp1.getMemref(), ops.loopLoadOp.getAffineMap(), ops.loopLoadOp.getMapOperands()
//             );
//             // new store
//             auto newStoreOp = rewriter.create<AffineStoreOp>(
//               loc, newLoadOp.getResult(), newAllocOp2.getMemref(), ops.loopStoreOp.getMapOperands()
//             );
//             ops.loadOp.setMemRef(newAllocOp2.getMemref());
//           }
//         }
//       }
//     }
//   };
// }

/*
// sample input code
for i in I
  buff[i] = 0           //store

for i in I
  for j in J
    val = buff[i]       //load
    buff[i] = val + 1   //store

for i in I
  val = buff[i]         //load

// expected output
newBuff1 = alloc()
newBuff2 = alloc()
for i in I
  buff[i] = 0             //buff store

for i in I
  for j in J
    if(j == 0)
      val = buff[i]       //buff load
      newBuff1[i] = val   //new1 store
    val = newBuff1[i]     //new1 load
    newBuff1[i] = val + 1 //new1 store
    if(j == J-1)
      val = newBuff1[i]   //new1 load
      newBuff2[i] = val   //new2 store

for i in I
  val = newBuff2[i]       //new2 load

*/
namespace {
  struct StoreLoadStoreLoad : public OpRewritePattern<memref::AllocOp> {
    using OpRewritePattern<memref::AllocOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      memref::AllocOp allocOp,
      PatternRewriter &rewriter
    ) const override {
      auto memRef = allocOp.getResult();
      auto context = rewriter.getContext();
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
      LLVM_DEBUG(
        llvm::dbgs() << "StoreLoadStoreLoad: " << storeOps.size() << " " << loadOps.size() << "\n";
      );
      if(storeOps.size() != 2 || loadOps.size() != 2)
        return failure();

      StoreLoadStoreLoadOps ops;
      if(failed(reorderOps(loadOps, storeOps, ops))){
        LLVM_DEBUG(
          llvm::dbgs() << "StoreLoadStoreLoadPattern: reorderOps failed\n"
        );
        return failure();
      }
      if(
        // isa<AffineIfOp>(ops.loopLoadOp->getParentOp()) || 
        // isa<AffineIfOp>(ops.loopStoreOp->getParentOp()) ||
        // isa<AffineIfOp>(ops.loadOp->getParentOp()) ||
        isa<AffineIfOp>(ops.storeOp->getParentOp())
      ){
        LLVM_DEBUG(
          llvm::dbgs() << "StoreLoadStoreLoadPattern: loopLoadOp or loopStoreOp is in an if block\n"
        );
        return failure();
      }
      AccessInfo loopLoadInfo(ops.loopLoadOp);
      AccessInfo loopStoreInfo(ops.loopStoreOp);
      if(failed(loopLoadInfo.getAllInfo(context))){
        LLVM_DEBUG(
          llvm::dbgs() << "StoreLoadStoreLoadPattern: loopLoadInfo.getAllInfo failed\n"
        );
        return failure();
      }
      if(failed(loopStoreInfo.getAllInfo(context))){
        LLVM_DEBUG(
          llvm::dbgs() << "StoreLoadStoreLoadPattern: loopStoreInfo.getAllInfo failed\n"
        );
        return failure();
      }

      // handle local accumulation buffer
      auto loc = rewriter.getUnknownLoc();
      rewriter.setInsertionPoint(allocOp);
      auto newAllocOp1 = rewriter.create<memref::AllocOp>(
        loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
      );
      // create new allocOp2
      auto newAllocOp2 = rewriter.create<memref::AllocOp>(
        loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
      );
      auto newAllocOp3 = rewriter.create<memref::AllocOp>(
        loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
      );
      // create if condition for loopLoadOp
      rewriter.setInsertionPoint(ops.loopLoadOp);
      if (!loopLoadInfo.ifExprs.empty()) {
        auto ifCondition = IntegerSet::get(loopLoadInfo.ifExprs.size(), 0, loopLoadInfo.ifExprs, loopLoadInfo.ifEqFlags);
        auto ifOp = rewriter.create<AffineIfOp>(
              loc, ifCondition, loopLoadInfo.ifOperands, false);
        // create new load
        rewriter.setInsertionPoint(ops.loopLoadOp);
        auto newLoadOp = rewriter.create<AffineLoadOp>(
          loc, 
          newAllocOp1.getMemref(), 
          ops.loopLoadOp.getAffineMap(), 
          ops.loopLoadOp.getMapOperands()
        );
        // replace old load with new load
        rewriter.replaceAllUsesWith(ops.loopLoadOp.getResult(), newLoadOp.getResult());
        // add ops to the if block
        rewriter.setInsertionPointToStart(ifOp.getThenBlock());
        auto terminator = ifOp.getThenBlock()->getTerminator();
        // move loopLoadOp to the if block
        ops.loopLoadOp->moveBefore(terminator);
        // create new store
        rewriter.create<AffineStoreOp>(
          loc, 
          ops.loopLoadOp.getResult(), 
          newAllocOp1.getMemref(), 
          ops.loopLoadOp.getAffineMap(), 
          ops.loopLoadOp.getMapOperands()
        );
      }
      // // create if condition for loopStoreOp
      // rewriter.setInsertionPoint(ops.loopStoreOp);
      ops.loopStoreOp.setMemRef(newAllocOp1.getMemref());
      rewriter.setInsertionPointAfter(ops.loopStoreOp);
      if(!loopStoreInfo.ifExprs.empty()){
        auto ifCondition = IntegerSet::get(loopStoreInfo.ifExprs.size(), 0, loopStoreInfo.ifExprs, loopStoreInfo.ifEqFlags);
        auto ifOp = rewriter.create<AffineIfOp>(
              loc, ifCondition, loopStoreInfo.ifOperands, false);
        // create new store
        rewriter.setInsertionPoint(ops.loopStoreOp);

        // add load from newAllocOp1 to if block
        rewriter.setInsertionPointToStart(ifOp.getThenBlock());
        auto newLoadOp = rewriter.create<AffineLoadOp>(
          loc, 
          newAllocOp1.getMemref(), 
          ops.loopLoadOp.getAffineMap(), 
          ops.loopLoadOp.getMapOperands()
        );
        // create new store to newAllocOp2
        rewriter.create<AffineStoreOp>(
          loc, 
          newLoadOp.getResult(), 
          newAllocOp2.getMemref(), 
          ops.loopLoadOp.getAffineMap(),
          ops.loopLoadOp.getMapOperands()
        );
        AccessInfo loadInfo(ops.loadOp);
        if(failed(loadInfo.getAllInfo(context))){
          LLVM_DEBUG(
            llvm::dbgs() << "StoreLoadStoreLoadPattern: loadInfo.getAllInfo failed\n"
          );
          return failure();
        }
        rewriter.setInsertionPoint(ops.loadOp);
        // guard loadOp if it is reused
        if(!loadInfo.ifExprs.empty() && !isa<AffineIfOp>(ops.loadOp->getParentOp())){
          auto ifCondition = IntegerSet::get(loadInfo.ifExprs.size(), 0, loadInfo.ifExprs, loadInfo.ifEqFlags);
          auto ifOp = rewriter.create<AffineIfOp>(
                loc, ifCondition, loadInfo.ifOperands, false);
          rewriter.setInsertionPointToStart(ifOp.getThenBlock());
          auto newLoadOp = rewriter.create<AffineLoadOp>(
            loc,
            newAllocOp2.getMemref(),
            ops.loadOp.getAffineMap(), 
            ops.loadOp.getMapOperands()
          );
          // new store to newAllocOp3
          rewriter.create<AffineStoreOp>(
            loc, 
            newLoadOp.getResult(), 
            newAllocOp3.getMemref(), 
            ops.loadOp.getAffineMap(),
            ops.loadOp.getMapOperands()
          );
          rewriter.setInsertionPoint(ifOp);
          ops.loadOp.setMemRef(newAllocOp3.getMemref());
          // new load
        } else{
          ops.loadOp.setMemRef(newAllocOp2.getMemref());
        }
      }
      return success();
    }
  };
}

// namespace {
//   struct StoreLoadStoreLoad : public OpRewritePattern<memref::AllocOp> {
//     using OpRewritePattern<memref::AllocOp>::OpRewritePattern;
//     LogicalResult matchAndRewrite(
//       memref::AllocOp allocOp,
//       PatternRewriter &rewriter
//     ) const override {
//       auto memRef = allocOp.getResult();
//       auto context = rewriter.getContext();
//       SmallVector<AffineLoadOp, 4> loadOps;
//       SmallVector<AffineStoreOp, 4> storeOps;
//       for(auto user : memRef.getUsers()){
//         if(auto loadOp = dyn_cast<AffineLoadOp>(user)){
//           loadOps.push_back(loadOp);
//         }
//         if(auto storeOp = dyn_cast<AffineStoreOp>(user)){
//           storeOps.push_back(storeOp);
//         }
//       }
//       LLVM_DEBUG(
//         llvm::dbgs() << "StoreLoadStoreLoad: " << storeOps.size() << " " << loadOps.size() << "\n";
//       );
//       if(storeOps.size() == 2 && loadOps.size() == 2){
//         StoreLoadStoreLoadOps ops;
//         if(failed(reorderOps(loadOps, storeOps, ops))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: reorderOps failed\n"
//           );
//           return failure();
//         }
//         if(
//           // isa<AffineIfOp>(ops.loopLoadOp->getParentOp()) || 
//           // isa<AffineIfOp>(ops.loopStoreOp->getParentOp()) ||
//           // isa<AffineIfOp>(ops.loadOp->getParentOp()) ||
//           isa<AffineIfOp>(ops.storeOp->getParentOp())
//         ){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: loopLoadOp or loopStoreOp is in an if block\n"
//           );
//           return failure();
//         }
//         AccessInfo loopLoadInfo(ops.loopLoadOp);
//         AccessInfo loopStoreInfo(ops.loopStoreOp);
//         if(failed(loopLoadInfo.getAllInfo(context))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: loopLoadInfo.getAllInfo failed\n"
//           );
//           return failure();
//         }
//         if(failed(loopStoreInfo.getAllInfo(context))){
//           LLVM_DEBUG(
//             llvm::dbgs() << "StoreLoadStoreLoadPattern: loopStoreInfo.getAllInfo failed\n"
//           );
//           return failure();
//         }
//         // create new allocOp1
//         auto loc = rewriter.getUnknownLoc();
//         rewriter.setInsertionPoint(allocOp);
//         auto newAllocOp1 = rewriter.create<memref::AllocOp>(
//           loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
//         );
//         // create new allocOp2
//         auto newAllocOp2 = rewriter.create<memref::AllocOp>(
//           loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
//         );
//         auto newAllocOp3 = rewriter.create<memref::AllocOp>(
//           loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
//         );
//         // create if condition for loopLoadOp
//         rewriter.setInsertionPoint(ops.loopLoadOp);
//         if (!loopLoadInfo.ifExprs.empty()) {
//           auto ifCondition = IntegerSet::get(loopLoadInfo.ifExprs.size(), 0, loopLoadInfo.ifExprs, loopLoadInfo.ifEqFlags);
//           auto ifOp = rewriter.create<AffineIfOp>(
//                 loc, ifCondition, loopLoadInfo.ifOperands, false);
//           // create new load
//           rewriter.setInsertionPoint(ops.loopLoadOp);
//           auto newLoadOp = rewriter.create<AffineLoadOp>(
//             loc, 
//             newAllocOp1.getMemref(), 
//             ops.loopLoadOp.getAffineMap(), 
//             ops.loopLoadOp.getMapOperands()
//           );
//           // replace old load with new load
//           rewriter.replaceAllUsesWith(ops.loopLoadOp.getResult(), newLoadOp.getResult());
//           // add ops to the if block
//           rewriter.setInsertionPointToStart(ifOp.getThenBlock());
//           auto terminator = ifOp.getThenBlock()->getTerminator();
//           // move loopLoadOp to the if block
//           ops.loopLoadOp->moveBefore(terminator);
//           // create new store
//           rewriter.create<AffineStoreOp>(
//             loc, 
//             ops.loopLoadOp.getResult(), 
//             newAllocOp1.getMemref(), 
//             ops.loopLoadOp.getAffineMap(), 
//             ops.loopLoadOp.getMapOperands()
//           );
//         }
//         // // create if condition for loopStoreOp
//         // rewriter.setInsertionPoint(ops.loopStoreOp);
//         ops.loopStoreOp.setMemRef(newAllocOp1.getMemref());
//         rewriter.setInsertionPointAfter(ops.loopStoreOp);
//         if(!loopStoreInfo.ifExprs.empty()){
//           auto ifCondition = IntegerSet::get(loopStoreInfo.ifExprs.size(), 0, loopStoreInfo.ifExprs, loopStoreInfo.ifEqFlags);
//           auto ifOp = rewriter.create<AffineIfOp>(
//                 loc, ifCondition, loopStoreInfo.ifOperands, false);
//           // create new store
//           rewriter.setInsertionPoint(ops.loopStoreOp);
//           // rewriter.create<AffineStoreOp>(
//           //   loc, ops.loopStoreOp.getValueToStore(), newAllocOp2.getMemref(), ops.loopStoreOp.getMapOperands()
//           // );
//           // // erase old store
//           // rewriter.eraseOp(ops.loopStoreOp);
//         //   // add load from newAllocOp1 to if block
//           rewriter.setInsertionPointToStart(ifOp.getThenBlock());
//           auto newLoadOp = rewriter.create<AffineLoadOp>(
//             loc, 
//             newAllocOp1.getMemref(), 
//             ops.loopLoadOp.getAffineMap(), 
//             ops.loopLoadOp.getMapOperands()
//           );
//           // create new store to newAllocOp2
//           rewriter.create<AffineStoreOp>(
//             loc, 
//             newLoadOp.getResult(), 
//             newAllocOp2.getMemref(), 
//             ops.loopLoadOp.getAffineMap(),
//             ops.loopLoadOp.getMapOperands()
//           );
//         //   // replace storeOp memref with newAllocOp2
//           // ops.loadOp.setMemRef(newAllocOp2.getMemref());
//           AccessInfo loadInfo(ops.loadOp);
//           if(failed(loadInfo.getAllInfo(context))){
//             LLVM_DEBUG(
//               llvm::dbgs() << "StoreLoadStoreLoadPattern: loadInfo.getAllInfo failed\n"
//             );
//             return failure();
//           }
//           rewriter.setInsertionPoint(ops.loadOp);
//           // guard loadOp if it is reused
//           if(!loadInfo.ifExprs.empty()){
//             auto ifCondition = IntegerSet::get(loadInfo.ifExprs.size(), 0, loadInfo.ifExprs, loadInfo.ifEqFlags);
//             auto ifOp = rewriter.create<AffineIfOp>(
//                   loc, ifCondition, loadInfo.ifOperands, false);
//             rewriter.setInsertionPointToStart(ifOp.getThenBlock());
//             auto newLoadOp = rewriter.create<AffineLoadOp>(
//               loc,
//               newAllocOp2.getMemref(),
//               ops.loadOp.getAffineMap(), 
//               ops.loadOp.getMapOperands()
//             );
//             // new store to newAllocOp3
//             rewriter.create<AffineStoreOp>(
//               loc, 
//               newLoadOp.getResult(), 
//               newAllocOp3.getMemref(), 
//               ops.loadOp.getAffineMap(),
//               ops.loadOp.getMapOperands()
//             );
//             rewriter.setInsertionPoint(ifOp);
//             ops.loadOp.setMemRef(newAllocOp3.getMemref());
//             // new load
//           } else{
//             ops.loadOp.setMemRef(newAllocOp2.getMemref());
//           }
//           return success();
//         }
//       }
//       return failure();
//     }
//   };
// }

namespace {
  // static int64_t evaluateMap(AffineMap map, ArrayRef<int64_t> operands){
  //   // replace dims with operands
  //   DenseMap<AffineExpr, AffineExpr> exprMap;
  //   for(unsigned i = 0; i < operands.size(); i++){
  //     // exprMap[getAffineDimExpr(i, map.getContext())] = getAffineConstantExpr(operands[i], map.getContext());
  //     exprMap[get]
  //   }
  //   map.replace(exprMap);
  //   map.dump();
  //   return map.getSingleConstantResult();
  // }
  struct StoreLoad : public OpRewritePattern<memref::AllocOp> {
    using OpRewritePattern<memref::AllocOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      memref::AllocOp allocOp,
      PatternRewriter &rewriter
    ) const override {
      auto memRef = allocOp.getResult();
      auto context = rewriter.getContext();
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
      LLVM_DEBUG(
        llvm::dbgs() << "StoreLoad: " << storeOps.size() << " " << loadOps.size() << "\n";
      );
      if(storeOps.size() == 1 && loadOps.size() == 1){
        auto storeOp = storeOps[0];
        auto loadOp = loadOps[0];
        
        auto loadOpParentFor = loadOp->getParentOfType<AffineForOp>();
        auto storeOpParentFor = storeOp->getParentOfType<AffineForOp>();
        if(loadOpParentFor && storeOpParentFor){
          if(loadOpParentFor == storeOpParentFor){
            LLVM_DEBUG(
              llvm::dbgs() << "StoreLoadPattern: loadOpParentFor == storeOpParentFor\n"
            );
            return failure();
          }
        }

        AccessInfo storeInfo(storeOp);
        AccessInfo loadInfo(loadOp);
        if(failed(storeInfo.getAllInfo(context))){
          LLVM_DEBUG(
            llvm::dbgs() << "StoreLoadPattern: storeInfo.getAllInfo failed\n"
          );
          return failure();
        }
        if(failed(loadInfo.getAllInfo(context))){
          LLVM_DEBUG(
            llvm::dbgs() << "StoreLoadPattern: loadInfo.getAllInfo failed\n"
          );
          return failure();
        }
        // loadOp.dump();
        // llvm::dbgs() << "loadInfo.ifExprs.size(): " << loadInfo.ifExprs.size() << "\n";
        if(!loadInfo.ifExprs.empty()){
          auto loc = rewriter.getUnknownLoc();
          rewriter.setInsertionPoint(allocOp);
          auto newAllocOp = rewriter.create<memref::AllocOp>(
            loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
          );
          rewriter.setInsertionPoint(loadOp);
          auto ifCondition = IntegerSet::get(loadInfo.ifExprs.size(), 0, loadInfo.ifExprs, loadInfo.ifEqFlags);
          if(auto ifOp = dyn_cast<AffineIfOp>(loadOp->getParentOp())){
            auto cond = ifOp.getIntegerSet();
            // loadOp.dump();
            // ifCondition.dump();
            // cond.dump();

            if(ifCondition == cond){
              LLVM_DEBUG(
                llvm::dbgs() << "StoreLoadPattern: ifCondition.isEqual(cond)\n"
              );
              return failure();
            }
          }
          auto ifOp = rewriter.create<AffineIfOp>(
                loc, ifCondition, loadInfo.ifOperands, false);
          rewriter.setInsertionPointToStart(ifOp.getThenBlock());
          auto newLoadOp = rewriter.create<AffineLoadOp>(
            loc,
            memRef,
            loadOp.getAffineMap(), 
            loadOp.getMapOperands()
          );
          // new store to newAllocOp
          rewriter.create<AffineStoreOp>(
            loc, 
            newLoadOp.getResult(), 
            newAllocOp.getMemref(), 
            loadOp.getAffineMap(),
            loadOp.getMapOperands()
          );
          loadOp.setMemRef(newAllocOp.getMemref());
          return success();
        }else{
          return failure();
        }
      }else{
        return failure();
      }
    }
  };
}
// namespace {
//   struct GuardAffineLoadOps : public OpRewritePattern<AffineLoadOp> {
//     using OpRewritePattern<AffineLoadOp>::OpRewritePattern;
//     LogicalResult matchAndRewrite(
//       AffineLoadOp loadOp,
//       PatternRewriter &rewriter
//     ) const override {
//       auto context = rewriter.getContext();
//       auto allocOp = loadOp.getMemRef().getDefiningOp<memref::AllocOp>();
//       // if loadOp is already in an if guard, return failure
//       if(isa<AffineIfOp>(loadOp->getParentOp())){
//         LLVM_DEBUG(
//           llvm::dbgs() << "GuardAffineLoadOps: loadOp->getParentOp<AffineIfOp>()\n"
//         );
//         return failure();
//       }
//       if(!allocOp){
//         LLVM_DEBUG(
//           llvm::dbgs() << "GuardAffineLoadOps: !allocOp\n"
//         );
//         return failure();
//       }
//       AccessInfo loadInfo(loadOp);
//       if(failed(loadInfo.getAllInfo(context))){
//         LLVM_DEBUG(
//           llvm::dbgs() << "GuardAffineLoadOps: loadInfo.getAllInfo failed\n"
//         );
//         return failure();
//       }
//       // // if loadOp is not in a reduction loop, return failure
//       // auto loadSpace = loadInfo.getSpace();
//       // auto loadRelevantSpace = loadInfo.getRelevantSpace();
//       // if(!loadRelevantSpace.isCompatible(loadSpace)){
//       //   LLVM_DEBUG(
//       //     llvm::dbgs() << "GuardAffineLoadOps: !loadRelevantSpace.isCompatible(loadSpace)\n"
//       //   );
//       //   return failure();
//       // }
//       auto loc = rewriter.getUnknownLoc();
//       // create new allocOp
//       rewriter.setInsertionPoint(allocOp);
//       auto newAllocOp = rewriter.create<memref::AllocOp>(
//         loc, allocOp.getType().cast<MemRefType>(), allocOp.getAlignmentAttr()
//       );

//       // create the if guard
//       rewriter.setInsertionPoint(loadOp);
//       if(!loadInfo.ifExprs.empty()){
//         auto ifCondition = IntegerSet::get(loadInfo.ifExprs.size(), 0, loadInfo.ifExprs, loadInfo.ifEqFlags);
//         auto ifOp = rewriter.create<AffineIfOp>(
//               loc, ifCondition, loadInfo.ifOperands, false);
//         rewriter.setInsertionPointToStart(ifOp.getThenBlock());
//         // create new load
//         auto newLoopLoadOp = rewriter.create<AffineLoadOp>(
//           loc, allocOp.getMemref(), loadOp.getAffineMap(), loadOp.getMapOperands()
//         );

//         // create new store
//         rewriter.create<AffineStoreOp>(
//           loc, newLoopLoadOp.getResult(), newAllocOp.getMemref(), loadOp.getMapOperands()
//         );

//         // replace old load
//         // rewriter.replaceOp(loadOp, newLoopLoadOp.getResult());   
//         // rewriter.replaceOp(loadOp, newAllocOp.getMemref());
//         LLVM_DEBUG(
//           llvm::dbgs() << "GuardAffineLoadOps: success\n"
//         );
//         // get parent of type AffineForOp
//         ifOp.dump();
//         return success();
//       } else {
//         LLVM_DEBUG(
//           llvm::dbgs() << "GuardAffineLoadOps: !loadInfo.ifExprs.empty()\n"
//         );
//         return failure();
//       }
//     }
//   };
// }

namespace {
struct ConvertToSingleProducerSingleConsumer
    : public ConvertToSingleProducerSingleConsumerBase<ConvertToSingleProducerSingleConsumer> {
  void runOnOperation() override {
    auto func = getOperation();
    auto context = func.getContext();
    mlir::RewritePatternSet patterns(context);
    patterns.add<EliminateSingleElementMemRefs>(context);
    (void)applyPatternsAndFoldGreedily(func, std::move(patterns));

    patterns.clear();
    patterns.add<SingleStoreMultipleLoads>(context);
    (void)applyPatternsAndFoldGreedily(func, std::move(patterns));

    patterns.clear();
    patterns.add<StoreLoad>(context);
    (void)applyPatternsAndFoldGreedily(func, std::move(patterns));

    patterns.clear();
    patterns.add<StoreLoadStoreLoad>(context);
    (void)applyPatternsAndFoldGreedily(func, std::move(patterns));

  }
};
} // end anonymous namespace

std::unique_ptr<Pass> streamhls::createConvertToSingleProducerSingleConsumerPass() {
  return std::make_unique<ConvertToSingleProducerSingleConsumer>();
}