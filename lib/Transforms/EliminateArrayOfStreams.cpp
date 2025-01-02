/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "streamhls/Transforms/Passes.h"
// #include "streamhls/Transforms/Utils.h"

// #include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
// #include "mlir/Analysis/Presburger/PresburgerSpace.h"

#include "streamhls/Support/Utils.h"
#include "streamhls/Support/AffineMemAccess.h"

#include "mlir/IR/IntegerSet.h"


using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-eliminate-array-of-streams"

// static calculateIdx()

namespace {
  struct EliminateArrayOfStreamsPattern : public OpRewritePattern<ArrayOfStreamsOp> {
    using OpRewritePattern<ArrayOfStreamsOp>::OpRewritePattern;
    LogicalResult matchAndRewrite(
      ArrayOfStreamsOp aosOp,
      PatternRewriter &rewriter
    ) const override {
      auto elementType = aosOp.getElementType();
      auto channelType = aosOp.getChannels().getType().cast<RankedTensorType>().getElementType().cast<StreamType>();
      SmallVector<ArrayOfStreamsReadOp, 4> reads;
      SmallVector<ArrayOfStreamsWriteOp, 4> writes;
      for(auto user : aosOp.getResult().getUsers()){
        if(auto read = dyn_cast<ArrayOfStreamsReadOp>(user)){
          reads.push_back(read);
        }
        if(auto write = dyn_cast<ArrayOfStreamsWriteOp>(user)){
          writes.push_back(write);
        }
      }
      // llvm::dbgs() << "Num Reads: " << reads.size() << " Num Writes: " << writes.size() << "\n";
      // if num of reads and writes is not equal
      // if(reads.size() != writes.size()){
      //   return failure();
      // }
      // DenseMap<ArrayOfStreamsReadOp, int64_t> readIdxMap;
      // DenseMap<ArrayOfStreamsWriteOp, int64_t> writeIdxMap;
      // auto readIdx = 0;
      // auto writeIdx = 0;
      // // for(auto read : reads){
      // //   readIdxMap[read] = readIdx++;
      // // }
      // // for(auto write : writes){
      // //   writeIdxMap[write] = writeIdx++;
      // // }
      auto idx = 0;
      DenseMap<int64_t, SmallVector<Operation*, 4>> opsMap;
      for(auto read : reads){
        for(auto write : writes){
          auto readMap = read.getAffineMap();
          auto writeMap = write.getAffineMap();
          if(readMap != writeMap){
            continue;
          }
          auto readOperands = read.getMapOperands();
          auto writeOperands = write.getMapOperands();
          bool matched = true;
          for(auto pair : llvm::zip(readOperands, writeOperands)){
            auto readOperand = std::get<0>(pair);
            auto writeOperand = std::get<1>(pair);
            auto readDef = readOperand.getDefiningOp();
            auto writeDef = writeOperand.getDefiningOp();
            if(auto readConst = dyn_cast<arith::ConstantOp>(readDef)){
              if(auto writeConst = dyn_cast<arith::ConstantOp>(writeDef)){
                if(readConst.getValue() != writeConst.getValue()){
                  matched = false;
                  break;
                }
              }else{
                assert(false && "Read operand is constant but write operand is not");
              }
            }else{
              assert(false && "Read operand is not constant");
            }
          }
          if(matched){
            auto currIdx = idx;
            bool foundRead = false;
            bool foundWrite = false;
            for(auto pair : opsMap){
              for(auto op : pair.second){
                if(op == read){
                  currIdx = pair.first;
                  foundRead = true;
                  break;
                }
                if(op == write){
                  currIdx = pair.first;
                  foundWrite = true;
                  break;
                }
              }
            }
            if(!foundRead){
              opsMap[currIdx].push_back(read);
            }
            if(!foundWrite){
              opsMap[currIdx].push_back(write);
            }
            idx++;
            // read.dump();
            // write.dump();
            // llvm::dbgs() << "Matched\n";
          }
        }
      }
      auto loc = rewriter.getUnknownLoc();
      for(auto pair : opsMap){
        // llvm::dbgs() << "Idx: " << pair.first << " Num Ops: " << pair.second.size() << "\n";
        // for(auto op : pair.second){
        //   op->dump();
        // }
        // llvm::dbgs() << "\n";
        rewriter.setInsertionPoint(aosOp);
        auto streamOp = rewriter.create<StreamOp>(loc, channelType, channelType.getDepth());
        for(auto op : pair.second){
          if(auto aosReadOp = dyn_cast<ArrayOfStreamsReadOp>(op)){
            rewriter.setInsertionPoint(aosReadOp);
            auto streamReadOp = rewriter.create<StreamReadOp>(loc, elementType, streamOp.getChannel());
            rewriter.replaceOp(aosReadOp, streamReadOp.getResult());
          }else if(auto aosWriteOp = dyn_cast<ArrayOfStreamsWriteOp>(op)){
            rewriter.setInsertionPoint(aosWriteOp);
            rewriter.create<StreamWriteOp>(loc, streamOp.getChannel(), aosWriteOp.getStoredValue());
            rewriter.eraseOp(aosWriteOp);
          }else{
            assert(false && "AOS Unknown op type");
          }
        }
      }
      if(aosOp.use_empty()){
        rewriter.eraseOp(aosOp);
      }else{
        assert(false && "AOS not fully replaced");
      }
      return success();
    }
  };
}

namespace {
  LogicalResult loopUnroll(AffineForOp forOp){
    // if not an outermost loop
    if(!isa<func::FuncOp>(forOp->getParentOp())){
      return failure();
    }
    // if does not have constant bounds
    if(!forOp.hasConstantBounds()){
      return failure();
    }
    // if has non-unit stride
    if(forOp.getStep() != 1){
      return failure();
    }
    AffineLoopBand band;
    getLoopBandFromOutermost(forOp, band);
    
    if(!isPerfectlyNested(band)){
      return failure();
    }

    // if(band.size() % 2 != 0){
    //   return failure();
    // }
    // assert(band.size() % 2 == 0 && "Loop band size must be even");
    const int64_t allLoops = band.size();
    auto unrollLimit = -1;
    for(auto loopPair : llvm::enumerate(band)){
      auto loop = loopPair.value();
      auto idx = loopPair.index();
      auto hasPipelineAttr = loop->hasAttr("loop_directive");
      if(hasPipelineAttr)
        unrollLimit = idx;
    }
    // llvm::dbgs() << "Loop Band Size: " << band.size() << "\n";
    // llvm::dbgs() << "Unroll Limit: " << unrollLimit << "\n";
    if(unrollLimit == -1){
      assert(false && "No loop directive found");
    }
    for(int idx = allLoops - 1; idx >= unrollLimit + 1; idx--){
      auto loop = band[idx];
      loopUnrollFull(loop);
    }
    return success();

  }
}

namespace {
struct EliminateArrayOfStreams
    : public EliminateArrayOfStreamsBase<EliminateArrayOfStreams> {
  void runOnOperation() override {
    auto func = getOperation();
    auto context = func.getContext();

    OpBuilder builder(context);
    AffineLoopBands allLoops;
    getLoopBands(func.front(), allLoops, /*allowHavingChilds=*/true);
    for(auto band : allLoops){
      if(failed(loopUnroll(band[0]))){
        signalPassFailure();
      }
    }

    mlir::RewritePatternSet patterns(context);

    // simplify affineApplyOps before eliminating array of streams
    AffineApplyOp::getCanonicalizationPatterns(patterns, context);
    if(failed(applyPatternsAndFoldGreedily(func, std::move(patterns)))){
      signalPassFailure();
    }

    patterns.clear();
    patterns.add<EliminateArrayOfStreamsPattern>(context);
    applyPatternsAndFoldGreedily(func, std::move(patterns));

    // auto loc = builder.getUnknownLoc();
    // uint64_t numArgs = func.getNumArguments();
    // for(unsigned i = 0; i < numArgs; i++) {
    //   auto arg = func.getArgument(i);
    //   // auto argKind = func.getArgAttr(i, "builtin.argKind").cast<StringAttr>();
    //   auto user = arg.getUsers().begin();
    //   auto forOp = user->getParentOfType<affine::AffineForOp>();
    //   AffineLoopBand band;
    //   getLoopBandFromInnermost(forOp, band);
    //   // band[0].dump();
    // }
  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createEliminateArrayOfStreamsPass() {
  return std::make_unique<EliminateArrayOfStreams>();
}