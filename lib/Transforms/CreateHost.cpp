/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "streamhls/Transforms/Passes.h"
// #include "streamhls/Transforms/Utils.h"

// #include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
// #include "mlir/Analysis/Presburger/PresburgerSpace.h"

// #include "streamhls/Support/Utils.h"
// #include "streamhls/Support/AffineMemAccess.h"

#include "mlir/IR/IntegerSet.h"
#include "mlir/IR/AsmState.h"

#include <fstream>


using namespace mlir;
using namespace streamhls;
using namespace dataflow;

#define DEBUG_TYPE "streamhls-create-host"

// Enum for argument type
enum ArgKind {
  INPUT,
  WEIGHT,
  OUTPUT,
  INOUT
};
// This pass takes the final transformed code and creates a host function
// it initializes the host arrays with 1s and calls the transformed function
namespace {
struct CreateHost
    : public CreateHostBase<CreateHost> {
  void runOnOperation() override {
    auto func = getOperation();
    auto context = func.getContext();

    OpBuilder builder(context);

    auto loc = builder.getUnknownLoc();

    builder.setInsertionPoint(func);
    // create function signature
    auto funcSignature = func.cloneWithoutRegions();
    funcSignature.setVisibility(SymbolTable::Visibility::Private);
    builder.insert(funcSignature);

    auto returnType = builder.getI32Type();
    auto mainFunc = builder.create<func::FuncOp>(
        loc, "main", builder.getFunctionType({}, {returnType}));

    auto mainBlock = mainFunc.addEntryBlock();

    builder.setInsertionPointToStart(mainBlock);

    // // // // create a dummy op
    // auto streamType = StreamType::get(context, builder.getF32Type(), 2);
    // auto rankedTensorType = RankedTensorType::get({10,10}, streamType);
    // auto arrayOfStreamsOp = builder.create<ArrayOfStreamsOp>(loc, rankedTensorType);
    // auto idx0 = builder.create<arith::ConstantOp>(loc, builder.getIndexAttr(5)).getResult();
    // auto idx1 = builder.create<arith::ConstantOp>(loc, builder.getIndexAttr(5)).getResult();
    // auto indices = ValueRange({idx0, idx1});
    // auto float0 = builder.create<arith::ConstantOp>(loc, builder.getF32FloatAttr(0.0)).getResult();
    // // // identity map
    // auto affineMap = AffineMap::getMultiDimIdentityMap(2, context);
    // // stream write op
    // auto streamWriteOp = builder.create<ArrayOfStreamsWriteOp>(
    //   loc, arrayOfStreamsOp.getResult(), float0, indices, affineMap
    // );
    // auto arrayOfStreamsReadOp = builder.create<ArrayOfStreamsReadOp>(
    //   loc, arrayOfStreamsOp.getElementType(), arrayOfStreamsOp.getResult(), indices, affineMap
    // );
    // ArrayRef<int64_t> shape = {10, 10};
    // auto tensorOfStreamsOp = builder.create<tensor::EmptyOp>(
    //   loc,
    //   shape,
    //   streamType
    // );
    // auto i_idx = builder.create<arith::ConstantOp>(loc, builder.getIndexAttr(0)).getResult();
    // auto j_idx = builder.create<arith::ConstantOp>(loc, builder.getIndexAttr(0)).getResult();
    // auto fifo = builder.create<tensor::ExtractOp>(
    //   loc,
    //   streamType,
    //   tensorOfStreamsOp.getResult(),
    //   {i_idx, j_idx}
    // );
    // auto tensorOfStreams = tensorOfStreamsOp.getResult();
    
    // XRT ops
    // auto device = builder.create<XRTDeviceOp>(loc, builder.getType<DeviceType>(), builder.getIntegerAttr(builder.getI32Type(), 0)).getResult();
    // auto uuid = builder.create<XRTLoadBitStreamOp>(loc, builder.getI32Type(), device, builder.getStringAttr("./forward.xclbin")).getResult();
    // auto kernel = builder.create<XRTKernelOp>(loc, builder.getType<KernelType>(), device, uuid, builder.getStringAttr("forward"), builder.getStringAttr("xrt::kernel::cu_access_mode::exclusive")).getResult();
    SmallVector<Value, 4> args;
    SmallVector<Value, 4> inputs;
    SmallVector<Value, 4> outputs;
    SmallVector<std::pair<Value, ArgKind>, 4> argsWithKinds;
    MemRefType memrefType;
    // create host arrays
    uint64_t numArgs = func.getNumArguments();
    for(unsigned i = 0; i < numArgs; i++) {
      auto arg = func.getArgument(i);
      if(memrefType = arg.getType().dyn_cast<MemRefType>()){
        if(func.getArgAttr(i, "builtin.dense_resource")){
          argsWithKinds.push_back({arg, WEIGHT});
        }else{
          ArgKind argKind;
          SmallVector<Operation*, 4> storeOps;
          SmallVector<Operation*, 4> loadOps;
          // TODO: this is a hack, we should be able to get the input/outputs info from the lowering passes as an attribute
          for(auto user : arg.getUsers()) {
            if(isa<bufferization::ToTensorOp>(user))
              loadOps.push_back(user);
            else if(isa<memref::CopyOp>(user))
              storeOps.push_back(user);
          }
          if(loadOps.size() > 0 && storeOps.size() > 0){
            argKind = INOUT;
            assert(false && "inout not supported yet");
          } else if (loadOps.size() > 0){
            argKind = INPUT;
          } else if (storeOps.size() > 0){
            argKind = OUTPUT;
          } else {
            assert(false && "arg is not used");
          }
          argsWithKinds.push_back({arg, argKind});
        }
      }else{
        assert(false && "arg is not a memref");
      }
    }
    auto inputIdx = 0;
    for(auto argWithKindPair : llvm::enumerate(argsWithKinds)){
      auto idx = argWithKindPair.index();
      auto argWithKind = argWithKindPair.value();
      auto arg = argWithKind.first;
      auto argKind = argWithKind.second;
      if(argKind == WEIGHT){
        auto value = func.getArgAttr(idx, "builtin.dense_resource").cast<DenseResourceElementsAttr>();
        auto constTensor = builder.create<arith::ConstantOp>(
          loc,
          value
        );
        auto constOpResult = constTensor.getResult();
        args.push_back(constOpResult);
      }else if(argKind == INPUT){
        // // create new dense resource
        // std::string path = "/home/suhail/Projects/HLS-MLIR/e2e/models/MM/hls/data/input_0.bin";
        // // load the input from binary file
        // std::ifstream rawData(path, std::ios::binary);
        // if(!rawData.is_open()){
        //   llvm::errs() << "Error opening file: " << path << "\n";
        //   return;
        // }
        // // convert data to ArrayRef
        // auto vectorData = std::vector<char>((std::istreambuf_iterator<char>(rawData)), std::istreambuf_iterator<char>());
        // auto data = ArrayRef<char>(vectorData);
        // // // auto value = func.getArgAttr(i, "builtin.dense_resource").cast<DenseResourceElementsAttr>();
        // auto memrefType = arg.getType().cast<MemRefType>();
        // auto shapedType = MemRefType::get(memrefType.getShape(), memrefType.getElementType());
        // auto nameForBlob = "input_" + std::to_string(inputIdx);
        // auto attr = DenseResourceElementsAttr::get(shapedType, nameForBlob, UnmanagedAsmResourceBlob::allocateInferAlign(data));
        // auto constTensor = builder.create<arith::ConstantOp>(
        //   loc,
        //   attr
        // );
        auto memrefType = arg.getType().cast<MemRefType>();
        StringRef nameForBlob = "input_" + std::to_string(inputIdx);
        auto attr = DenseResourceElementsAttr::get(memrefType, nameForBlob, AsmResourceBlob());
        // cast tensor to memref
        // golden arrays
        auto constTensor = builder.create<arith::ConstantOp>(
          loc,
          // MemRefType::get(type.getShape(), type.getElementType()),
          attr
        );
        
        auto constOpResult = constTensor.getResult();
        args.push_back(constOpResult);
        inputIdx++;
      }else if(argKind == OUTPUT){
        // allocate buffer and initialize with 0s
        auto memrefType = arg.getType().cast<MemRefType>();
        auto allocOp = builder.create<memref::AllocOp>(loc, memrefType);
        auto allocResult = allocOp.getResult();
        args.push_back(allocResult);
        outputs.push_back(allocResult);
      }
    }
    // for(uint64_t i = 0; i < numArgs; i++) {
    //   auto arg = func.getArgument(i);
    //   if(auto memrefType = arg.getType().dyn_cast<MemRefType>()){
    //     if(func.getArgAttr(i, "builtin.dense_resource")){
    //       auto value = func.getArgAttr(i, "builtin.dense_resource").cast<DenseResourceElementsAttr>();
    //       auto constTensor = builder.create<arith::ConstantOp>(
    //         loc,
    //         value
    //       );
    //       auto constOpResult = constTensor.getResult();
    //       args.push_back(constOpResult);
    //     }else{
    //       // allocate buffer
    //       auto allocOp = builder.create<memref::AllocOp>(loc, memrefType);
    //       auto allocResult = allocOp.getResult();
    //       args.push_back(allocResult);
    //       ArgKind ArgKind;
    //       SmallVector<Operation*, 4> storeOps;
    //       SmallVector<Operation*, 4> loadOps;
    //       // TODO: this is a hack, we should be able to get the input/outputs info from the lowering passes as an attribute
    //       for(auto user : arg.getUsers()) {
    //         if(isa<bufferization::ToTensorOp>(user))
    //           loadOps.push_back(user);
    //         else if(isa<memref::CopyOp>(user))
    //           storeOps.push_back(user);
    //       }
    //       // LLVM_DEBUG(
    //       //   llvm::dbgs() << "arg: " << arg << "\n";
    //       //   llvm::dbgs() << "loadOps: " << loadOps.size() << "\n";
    //       //   llvm::dbgs() << "storeOps: " << storeOps.size() << "\n";
    //       // );
    //       if(loadOps.size() > 0 && storeOps.size() > 0){
    //         ArgKind = INOUT;
    //         outputs.push_back(allocResult);
    //       } else if (loadOps.size() > 0){
    //         ArgKind = INPUT;
    //       } else if (storeOps.size() > 0){
    //         ArgKind = OUTPUT;
    //         outputs.push_back(allocResult);
    //       } else
    //         assert(false && "arg is not used");
    //       // initialize the host arrays
    //       SmallVector<int64_t, 4> lbs;
    //       SmallVector<int64_t, 4> ubs;
    //       SmallVector<int64_t, 4> steps;
    //       for(auto dim : memrefType.getShape()) {
    //         lbs.push_back(0);
    //         ubs.push_back(dim);
    //         steps.push_back(1);
    //       }
    //       // int initValue = ArgKind == INPUT ? 1 : 0;
    //       // affine::buildAffineLoopNest(builder, loc, lbs, ubs, steps,
    //       //   [&](OpBuilder &b, Location loc, ValueRange ivs) {
    //       //     auto dtype = memrefType.getElementType();
    //       //     Value val;
    //       //     if(dtype.isa<IntegerType>())
    //       //       val = b.create<arith::ConstantOp>(loc, b.getIntegerAttr(dtype, initValue));
    //       //     else if(dtype.isa<FloatType>())
    //       //       val = b.create<arith::ConstantOp>(loc, b.getFloatAttr(dtype, initValue));
    //       //     else
    //       //       assert(false && "unsupported type in host creation");
    //       //     b.create<affine::AffineStoreOp>(loc, val, allocResult, ivs);
    //       //   });
    //       if(ArgKind == INPUT){
    //         inputs.push_back(allocResult);
    //       } else if(ArgKind == OUTPUT){
    //         affine::buildAffineLoopNest(builder, loc, lbs, ubs, steps,
    //         [&](OpBuilder &b, Location loc, ValueRange ivs) {
    //           auto dtype = memrefType.getElementType();
    //           Value val;
    //           if(dtype.isa<IntegerType>())
    //             val = b.create<arith::ConstantOp>(loc, b.getIntegerAttr(dtype, 0));
    //           else if(dtype.isa<FloatType>())
    //             val = b.create<arith::ConstantOp>(loc, b.getFloatAttr(dtype, 0));
    //           else
    //             assert(false && "unsupported type in host creation");
    //           b.create<affine::AffineStoreOp>(loc, val, allocResult, ivs);
    //         });
    //       } else {
    //         assert (ArgKind == INOUT && "unsupported arg type");
    //       }
    //     }
    //   }
    //   else
    //     assert(false && "arg is not a memref");
    // }
    // for(auto inputPair : llvm::enumerate(inputs)){
    //   auto idx = inputPair.index();
    //   auto input = inputPair.value();
    //   // create new dense resource
    //   std::string path = "/home/suhail/Projects/HLS-MLIR/e2e/models/MM/hls/data/input_0.bin";
    //   // load the input from binary file
    //   std::ifstream rawData(path, std::ios::binary);
    //   if(!rawData.is_open()){
    //     llvm::errs() << "Error opening file: " << path << "\n";
    //     return;
    //   }
    //   // convert data to ArrayRef
    //   auto vectorData = std::vector<char>((std::istreambuf_iterator<char>(rawData)), std::istreambuf_iterator<char>());
    //   auto data = ArrayRef<char>(vectorData);
    //   // // auto value = func.getArgAttr(i, "builtin.dense_resource").cast<DenseResourceElementsAttr>();
    //   auto memrefType = input.getType().cast<MemRefType>();
    //   auto shapedType = MemRefType::get(memrefType.getShape(), memrefType.getElementType());
    //   auto nameForBlob = "input_" + std::to_string(idx);
    //   auto attr = DenseResourceElementsAttr::get(shapedType, nameForBlob, UnmanagedAsmResourceBlob::allocateInferAlign(data));
    //   auto constTensor = builder.create<arith::ConstantOp>(
    //     loc,
    //     attr
    //   );
    // }
    // for(size_t i = 0; i < args.size(); i++) {
    //   auto arg = args[i];
    //   if(auto memrefType = arg.getType().dyn_cast<MemRefType>()){
    //     auto bufferShape = memrefType.getShape();
    //     auto elementType = memrefType.getElementType();
    //     auto bufferSize = 1;
    //     for(auto dim : bufferShape)
    //       bufferSize *= dim;
    //     bufferSize *= elementType.getIntOrFloatBitWidth() / 8;
    //     auto xrtBufferOp = builder.create<XRTBufferAllocOp>(
    //       loc, 
    //       builder.getType<XRTBufferType>(elementType, bufferSize),
    //       device,
    //       kernel,
    //       builder.getIntegerAttr(builder.getI32Type(), i)
    //     );
    //     auto xrtMapOp = builder.create<XRTMapOp>(
    //       loc,
    //       builder.getType<XRTBufferType>(elementType, bufferSize),
    //       xrtBufferOp.getResult()
    //     );
    //     // xrtMapOp.getType().getElementType().dump();
    //     // auto memCpyOp = builder.create<memref::CopyOp>(
    //     //   loc,
    //     //   arg,
    //     //   xrtMapOp.getResult()
    //     // );
    //   }
    // }
    // create function call
    // for(auto arg : args){
    //   arg.dump();
    // }
    auto callOp = builder.create<func::CallOp>(loc, funcSignature, args);
    
    builder.setInsertionPointAfter(callOp);


    // error flag
    DenseElementsAttr attr = DenseElementsAttr::get(
      MemRefType::get({1}, builder.getI1Type()),
      {true}
    );
    auto errFlag = builder.create<arith::ConstantOp>(
      loc, 
      attr
    );

    // assert(outputs.size() == 1 && "only one output is supported");
    // compare the output with the expected output
    for(auto outputPair : llvm::enumerate(outputs)){
      auto idx = outputPair.index();
      auto output = outputPair.value();
      // LLVM_DEBUG(llvm::dbgs() << "output: " << output << "\n");
      auto memrefType = output.getType().cast<MemRefType>();
      StringRef nameForBlob = "output_" + std::to_string(idx);
      auto attr = DenseResourceElementsAttr::get(memrefType, nameForBlob, AsmResourceBlob());
      // cast tensor to memref
      // golden arrays
      auto golednAllocOp = builder.create<arith::ConstantOp>(
        loc,
        // MemRefType::get(type.getShape(), type.getElementType()),
        attr
      );
      auto goldenAllocResult = golednAllocOp.getResult();
      SmallVector<int64_t, 4> lbs;
      SmallVector<int64_t, 4> ubs;
      SmallVector<int64_t, 4> steps;
      for(auto dim : memrefType.getShape()) {
        lbs.push_back(0);
        ubs.push_back(dim);
        steps.push_back(1);
        LLVM_DEBUG(llvm::dbgs() << "dim: " << dim << "\n");
      }
      affine::buildAffineLoopNest(builder, loc, lbs, ubs, steps,
        [&](OpBuilder &b, Location loc, ValueRange ivs) {
          auto hwVal = b.create<affine::AffineLoadOp>(loc, output, ivs).getResult();
          auto goldenVal = b.create<affine::AffineLoadOp>(loc, goldenAllocResult, ivs).getResult();
          auto dtype = memrefType.getElementType();
          if(isa<IntegerType>(dtype)){
            // auto cmpOp = b.create<arith::CmpFOp>(loc, arith::CmpFPredicate::ONE, hwVal, goldenVal);
            auto cmpOp = b.create<arith::CmpIOp>(loc, arith::CmpIPredicate::ne, hwVal, goldenVal);
            auto ifOp = b.create<scf::IfOp>(loc, cmpOp, false);
            b.setInsertionPointToStart(&ifOp.getThenRegion().front());
            auto zeroIdxOp = b.create<arith::ConstantOp>(loc, b.getIndexAttr(0));
            auto trueOp = b.create<arith::ConstantOp>(loc, b.getBoolAttr(false));
            b.create<affine::AffineStoreOp>(loc, trueOp.getResult(), errFlag, zeroIdxOp.getResult());
          }else if(isa<FloatType>(dtype)){
            auto subtractOpVal1 = b.create<arith::SubFOp>(loc, hwVal, goldenVal).getResult();
            auto subtractOpVal2 = b.create<arith::SubFOp>(loc, goldenVal, hwVal).getResult();
            auto thresholdVal = b.create<arith::ConstantOp>(loc, b.getFloatAttr(dtype, 0.1));
            auto cmpOp1 = b.create<arith::CmpFOp>(loc, arith::CmpFPredicate::UGT, subtractOpVal1, thresholdVal);
            auto cmpOp2 = b.create<arith::CmpFOp>(loc, arith::CmpFPredicate::UGT, subtractOpVal2, thresholdVal);
            auto orOp = b.create<arith::OrIOp>(loc, cmpOp1, cmpOp2);
            auto ifOp = b.create<scf::IfOp>(loc, orOp, false);
            b.setInsertionPointToStart(&ifOp.getThenRegion().front());
            auto zeroIdxOp = b.create<arith::ConstantOp>(loc, b.getIndexAttr(0));
            auto trueOp = b.create<arith::ConstantOp>(loc, b.getBoolAttr(false));
            b.create<affine::AffineStoreOp>(loc, trueOp.getResult(), errFlag, zeroIdxOp.getResult());
          } else 
            assert(false && "unsupported type in host creation");
          
        });
    }
    // read error flag
    auto zeroIdxOp = builder.create<arith::ConstantOp>(loc, builder.getIndexAttr(0));
    auto errFlagVal = builder.create<affine::AffineLoadOp>(loc, errFlag, zeroIdxOp.getResult()).getResult();
    builder.create<mlir::cf::AssertOp>(loc, errFlagVal, builder.getStringAttr("Error!"));
    auto zeroVal = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(0)).getResult();
    builder.create<func::ReturnOp>(loc, zeroVal);
    // erase the original function
    func.setVisibility(SymbolTable::Visibility::Private);
    func.erase();

  }
};
} // namespace

std::unique_ptr<Pass> streamhls::createCreateHostPass() {
  return std::make_unique<CreateHost>();
}