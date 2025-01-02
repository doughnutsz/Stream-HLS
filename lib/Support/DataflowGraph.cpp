/*
 * Copyright (c) 2024 Suhail Basalama
 *
 * This software is released under the MIT License.
 * https://opensource.org/licenses/MIT
 */
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Analysis/Presburger/PresburgerRelation.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/IR/AffineValueMap.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/IR/IntegerSet.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/SetVector.h"

#include <optional>

#include "streamhls/Support/DataflowGraph.h"


using namespace mlir;
using namespace streamhls;
using namespace dataflow;
using namespace affine;

using Node = DataflowGraph::Node;

#define DEBUG_TYPE "streamhls-dataflow-graph"

// LoopNestStateCollector walks loop nests and collects load and store
// operations, and whether or not a region holding op other than ForOp and IfOp
// was encountered in the loop nest.
void LoopNestInfoCollector::collect(Operation *opToWalk) {
  opToWalk->walk([&](Operation *op) {
    if (isa<AffineForOp>(op))
      forOps.push_back(cast<AffineForOp>(op));
    else if (op->getNumRegions() != 0 && !isa<AffineIfOp>(op))
      hasNonAffineRegionOp = true;
    else if (isa<AffineReadOpInterface>(op))
      loadOpInsts.push_back(op);
    else if (isa<AffineWriteOpInterface>(op))
      storeOpInsts.push_back(op);
    else if (isa<StreamReadOp>(op))
      fifoReadOps.push_back(op);
    else if (isa<StreamWriteOp>(op))
      fifoWriteOps.push_back(op);
  });
}

// Returns the load op count for 'memref'.
unsigned Node::getLoadOpCount(Value memref) const {
  unsigned loadOpCount = 0;
  for (Operation *loadOp : loads) {
    if (memref == cast<AffineReadOpInterface>(loadOp).getMemRef())
      ++loadOpCount;
  }
  return loadOpCount;
}

// Returns the store op count for 'memref'.
unsigned Node::getStoreOpCount(Value memref) const {
  unsigned storeOpCount = 0;
  for (Operation *storeOp : stores) {
    if (memref == cast<AffineWriteOpInterface>(storeOp).getMemRef())
      ++storeOpCount;
  }
  return storeOpCount;
}

// Returns the FIFO read op count for 'fifo'.
unsigned Node::getFifoReadOpCount(Value fifo) const {
  unsigned fifoReadOpCount = 0;
  for (Operation *fifoReadOp : fifoReads) {
    if (fifo == cast<StreamReadOp>(fifoReadOp).getChannel())
      ++fifoReadOpCount;
  }
  return fifoReadOpCount;
}

// Returns the FIFO write op count for 'fifo'.
unsigned Node::getFifoWriteOpCount(Value fifo) const {
  unsigned fifoWriteOpCount = 0;
  for (Operation *fifoWriteOp : fifoWrites) {
    if (fifo == cast<StreamWriteOp>(fifoWriteOp).getChannel())
      ++fifoWriteOpCount;
  }
  return fifoWriteOpCount;
}

// Returns all store ops in 'storeOps' which access 'memref'.
void Node::getStoreOpsForMemref(Value memref,
                                SmallVectorImpl<Operation *> *storeOps) const {
  for (Operation *storeOp : stores) {
    if (memref == cast<AffineWriteOpInterface>(storeOp).getMemRef())
      storeOps->push_back(storeOp);
  }
}

// Returns all load ops in 'loadOps' which access 'memref'.
void Node::getLoadOpsForMemref(Value memref,
                               SmallVectorImpl<Operation *> *loadOps) const {
  for (Operation *loadOp : loads) {
    if (memref == cast<AffineReadOpInterface>(loadOp).getMemRef())
      loadOps->push_back(loadOp);
  }
}



// Returns all memrefs in 'loadAndStoreMemrefSet' for which this node
// has at least one load and store operation.
void Node::getLoadAndStoreMemrefSet(
    DenseSet<Value> *loadAndStoreMemrefSet) const {
  llvm::SmallDenseSet<Value, 2> loadMemrefs;
  for (Operation *loadOp : loads) {
    loadMemrefs.insert(cast<AffineReadOpInterface>(loadOp).getMemRef());
  }
  for (Operation *storeOp : stores) {
    auto memref = cast<AffineWriteOpInterface>(storeOp).getMemRef();
    if (loadMemrefs.count(memref) > 0)
      loadAndStoreMemrefSet->insert(memref);
  }
}

// Initializes the data dependence graph by walking operations in `block`.
// Assigns each node in the graph a node id based on program order in 'f'.
bool DataflowGraph::init() {
  LLVM_DEBUG(llvm::dbgs() << "--- Initializing MDG ---\n");
  // Map from a memref to the set of ids of the nodes that have ops accessing
  // the memref.
  DenseMap<Value, SetVector<unsigned>> memrefAccesses;
  DenseMap<Value, SetVector<unsigned>> fifoAccesses;
  DenseMap<Operation *, unsigned> forToNodeMap;
  for (Operation &op : block) {
    if (dyn_cast<AffineForOp>(op)) {
      // Create graph node 'id' to represent top-level 'forOp' and record
      // all loads and store accesses it contains.
      LoopNestInfoCollector collector;
      collector.collect(&op);
      // Return false if a region holding op other than 'affine.for' and
      // 'affine.if' was found (not currently supported).
      if (collector.hasNonAffineRegionOp)
        return false;
      Node node(nextNodeId++, &op);
      for (auto *opInst : collector.loadOpInsts) {
        // opInst->dump();
        node.loads.push_back(opInst);
        auto memref = cast<AffineReadOpInterface>(opInst).getMemRef();
        memrefAccesses[memref].insert(node.id);
      }
      for (auto *opInst : collector.storeOpInsts) {
        // opInst->dump();
        node.stores.push_back(opInst);
        auto memref = cast<AffineWriteOpInterface>(opInst).getMemRef();
        memrefAccesses[memref].insert(node.id);
      }
      for (auto *opInst : collector.fifoReadOps) {
        // opInst->dump();
        node.fifoReads.push_back(opInst);
        auto fifo = cast<StreamReadOp>(opInst).getChannel();
        fifoAccesses[fifo].insert(node.id);
      }
      for (auto *opInst : collector.fifoWriteOps) {
        // opInst->dump();
        node.fifoWrites.push_back(opInst);
        auto fifo = cast<StreamWriteOp>(opInst).getChannel();
        fifoAccesses[fifo].insert(node.id);
      }
      forToNodeMap[&op] = node.id;
      nodes.insert({node.id, node});
    } 
    // else if (dyn_cast<AffineReadOpInterface>(op)) {
    //   // Create graph node for top-level load op.
    //   Node node(nextNodeId++, &op);
    //   node.loads.push_back(&op);
    //   auto memref = cast<AffineReadOpInterface>(op).getMemRef();
    //   memrefAccesses[memref].insert(node.id);
    //   nodes.insert({node.id, node});
    // } else if (dyn_cast<AffineWriteOpInterface>(op)) {
    //   // Create graph node for top-level store op.
    //   Node node(nextNodeId++, &op);
    //   node.stores.push_back(&op);
    //   auto memref = cast<AffineWriteOpInterface>(op).getMemRef();
    //   memrefAccesses[memref].insert(node.id);
    //   nodes.insert({node.id, node});
    // } 
    else if (op.getNumRegions() != 0) {
      // Return false if another region is found (not currently supported).
      return false;
    } 
    // else if (op.getNumResults() > 0 && !op.use_empty()) {
    //   // Create graph node for top-level producer of SSA values, which
    //   // could be used by loop nest nodes.
    //   Node node(nextNodeId++, &op);
    //   nodes.insert({node.id, node});
    // } 
    // else if (isa<CallOpInterface>(op)) {
    //   // Create graph node for top-level Call Op that takes any argument of
    //   // memref type. Call Op that returns one or more memref type results
    //   // is already taken care of, by the previous conditions.
    //   if (llvm::any_of(op.getOperandTypes(),
    //                    [&](Type t) { return isa<MemRefType>(t); })) {
    //     Node node(nextNodeId++, &op);
    //     nodes.insert({node.id, node});
    //   }
    // } 
    // else if (hasEffect<MemoryEffects::Write, MemoryEffects::Free>(&op)) {
    //   // Create graph node for top-level op, which could have a memory write
    //   // side effect.
    //   Node node(nextNodeId++, &op);
    //   nodes.insert({node.id, node});
    // }
  }

  // for (auto &idAndNode : nodes) {
  //   LLVM_DEBUG(llvm::dbgs() << "Create node " << idAndNode.first << " for:\n"
  //                           << *(idAndNode.second.op) << "\n");
  //   (void)idAndNode;
  // }

  // Add dependence edges between nodes which produce SSA values and their
  // users. Load ops can be considered as the ones producing SSA values.
  for (auto &idAndNode : nodes) {
    const Node &node = idAndNode.second;
    // Stores don't define SSA values, skip them.
    if (!node.stores.empty())
      continue;
    Operation *opInst = node.op;
    for (Value value : opInst->getResults()) {
      for (Operation *user : value.getUsers()) {
        // Ignore users outside of the block.
        if (block.getParent()->findAncestorOpInRegion(*user)->getBlock() !=
            &block)
          continue;
        SmallVector<AffineForOp, 4> loops;
        getAffineForIVs(*user, &loops);
        if (loops.empty())
          continue;
        assert(forToNodeMap.count(loops[0]) > 0 && "missing mapping");
        unsigned userLoopNestId = forToNodeMap[loops[0]];
        addEdge(node.id, userLoopNestId, value);
      }
    }
  }

  // Walk memref access lists and add graph edges between dependent nodes.
  for (auto &memrefAndList : memrefAccesses) {
    unsigned n = memrefAndList.second.size();
    for (unsigned i = 0; i < n; ++i) {
      unsigned srcId = memrefAndList.second[i];
      bool srcHasStore =
          getNode(srcId)->getStoreOpCount(memrefAndList.first) > 0;
      for (unsigned j = i + 1; j < n; ++j) {
        unsigned dstId = memrefAndList.second[j];
        bool dstHasStore =
            getNode(dstId)->getStoreOpCount(memrefAndList.first) > 0;
        if (srcHasStore || dstHasStore)
          addEdge(srcId, dstId, memrefAndList.first);
      }
    }
  }
  // Walk fifo access lists and add graph edges between dependent nodes.
  for (auto &fifoAndList : fifoAccesses) {
    unsigned n = fifoAndList.second.size();
    for (unsigned i = 0; i < n; ++i) {
      unsigned srcId = fifoAndList.second[i];
      bool srcHasStore =
          getNode(srcId)->getFifoWriteOpCount(fifoAndList.first) > 0;
      for (unsigned j = i + 1; j < n; ++j) {
        unsigned dstId = fifoAndList.second[j];
        bool dstHasStore =
            getNode(dstId)->getFifoWriteOpCount(fifoAndList.first) > 0;
        if (srcHasStore || dstHasStore)
          addEdge(srcId, dstId, fifoAndList.first);
      }
    }
  }
  return true;
}

// Returns the graph node for 'id'.
Node *DataflowGraph::getNode(unsigned id) {
  auto it = nodes.find(id);
  assert(it != nodes.end());
  return &it->second;
}

// Returns the graph node for 'forOp'.
Node *DataflowGraph::getForOpNode(AffineForOp forOp) {
  for (auto &idAndNode : nodes)
    if (idAndNode.second.op == forOp)
      return &idAndNode.second;
  return nullptr;
}

// Adds a node with 'op' to the graph and returns its unique identifier.
unsigned DataflowGraph::addNode(Operation *op) {
  Node node(nextNodeId++, op);
  nodes.insert({node.id, node});
  return node.id;
}

// Remove node 'id' (and its associated edges) from graph.
void DataflowGraph::removeNode(unsigned id) {
  // Remove each edge in 'inEdges[id]'.
  if (inEdges.count(id) > 0) {
    SmallVector<Edge, 2> oldInEdges = inEdges[id];
    for (auto &inEdge : oldInEdges) {
      removeEdge(inEdge.id, id, inEdge.value);
    }
  }
  // Remove each edge in 'outEdges[id]'.
  if (outEdges.count(id) > 0) {
    SmallVector<Edge, 2> oldOutEdges = outEdges[id];
    for (auto &outEdge : oldOutEdges) {
      removeEdge(id, outEdge.id, outEdge.value);
    }
  }
  // Erase remaining node state.
  inEdges.erase(id);
  outEdges.erase(id);
  nodes.erase(id);
}

// Returns true if node 'id' writes to any memref which escapes (or is an
// argument to) the block. Returns false otherwise.
bool DataflowGraph::writesToLiveInOrEscapingMemrefs(unsigned id) {
  Node *node = getNode(id);
  for (auto *storeOpInst : node->stores) {
    auto memref = cast<AffineWriteOpInterface>(storeOpInst).getMemRef();
    auto *op = memref.getDefiningOp();
    // Return true if 'memref' is a block argument.
    if (!op)
      return true;
    // Return true if any use of 'memref' does not deference it in an affine
    // way.
    for (auto *user : memref.getUsers())
      if (!isa<AffineMapAccessInterface>(*user))
        return true;
  }
  return false;
}

// Returns true iff there is an edge from node 'srcId' to node 'dstId' which
// is for 'value' if non-null, or for any value otherwise. Returns false
// otherwise.
bool DataflowGraph::hasEdge(unsigned srcId, unsigned dstId,
                                    Value value) {
  if (outEdges.count(srcId) == 0 || inEdges.count(dstId) == 0) {
    return false;
  }
  bool hasOutEdge = llvm::any_of(outEdges[srcId], [=](Edge &edge) {
    return edge.id == dstId && (!value || edge.value == value);
  });
  bool hasInEdge = llvm::any_of(inEdges[dstId], [=](Edge &edge) {
    return edge.id == srcId && (!value || edge.value == value);
  });
  return hasOutEdge && hasInEdge;
}

// Adds an edge from node 'srcId' to node 'dstId' for 'value'.
void DataflowGraph::addEdge(unsigned srcId, unsigned dstId,
                                    Value value) {
  if (!hasEdge(srcId, dstId, value)) {
    outEdges[srcId].push_back({dstId, value});
    inEdges[dstId].push_back({srcId, value});
    if (isa<MemRefType>(value.getType()))
      memrefEdgeCount[value]++;
  }
}

// Removes an edge from node 'srcId' to node 'dstId' for 'value'.
void DataflowGraph::removeEdge(unsigned srcId, unsigned dstId,
                                       Value value) {
  assert(inEdges.count(dstId) > 0);
  assert(outEdges.count(srcId) > 0);
  if (isa<MemRefType>(value.getType())) {
    assert(memrefEdgeCount.count(value) > 0);
    memrefEdgeCount[value]--;
  }
  // Remove 'srcId' from 'inEdges[dstId]'.
  for (auto *it = inEdges[dstId].begin(); it != inEdges[dstId].end(); ++it) {
    if ((*it).id == srcId && (*it).value == value) {
      inEdges[dstId].erase(it);
      break;
    }
  }
  // Remove 'dstId' from 'outEdges[srcId]'.
  for (auto *it = outEdges[srcId].begin(); it != outEdges[srcId].end(); ++it) {
    if ((*it).id == dstId && (*it).value == value) {
      outEdges[srcId].erase(it);
      break;
    }
  }
}

// Returns true if there is a path in the dependence graph from node 'srcId'
// to node 'dstId'. Returns false otherwise. `srcId`, `dstId`, and the
// operations that the edges connected are expected to be from the same block.
bool DataflowGraph::hasDependencePath(unsigned srcId, unsigned dstId) {
  // Worklist state is: <node-id, next-output-edge-index-to-visit>
  SmallVector<std::pair<unsigned, unsigned>, 4> worklist;
  worklist.push_back({srcId, 0});
  Operation *dstOp = getNode(dstId)->op;
  // Run DFS traversal to see if 'dstId' is reachable from 'srcId'.
  while (!worklist.empty()) {
    auto &idAndIndex = worklist.back();
    // Return true if we have reached 'dstId'.
    if (idAndIndex.first == dstId)
      return true;
    // Pop and continue if node has no out edges, or if all out edges have
    // already been visited.
    if (outEdges.count(idAndIndex.first) == 0 ||
        idAndIndex.second == outEdges[idAndIndex.first].size()) {
      worklist.pop_back();
      continue;
    }
    // Get graph edge to traverse.
    Edge edge = outEdges[idAndIndex.first][idAndIndex.second];
    // Increment next output edge index for 'idAndIndex'.
    ++idAndIndex.second;
    // Add node at 'edge.id' to the worklist. We don't need to consider
    // nodes that are "after" dstId in the containing block; one can't have a
    // path to `dstId` from any of those nodes.
    bool afterDst = dstOp->isBeforeInBlock(getNode(edge.id)->op);
    if (!afterDst && edge.id != idAndIndex.first)
      worklist.push_back({edge.id, 0});
  }
  return false;
}

// Returns the input edge count for node 'id' and 'memref' from src nodes
// which access 'memref' with a store operation.
unsigned DataflowGraph::getIncomingMemRefAccesses(unsigned id,
                                                          Value memref) {
  unsigned inEdgeCount = 0;
  if (inEdges.count(id) > 0)
    for (auto &inEdge : inEdges[id])
      if (inEdge.value == memref) {
        Node *srcNode = getNode(inEdge.id);
        // Only count in edges from 'srcNode' if 'srcNode' accesses 'memref'
        if (srcNode->getStoreOpCount(memref) > 0)
          ++inEdgeCount;
      }
  return inEdgeCount;
}

// Returns the output edge count for node 'id' and 'memref' (if non-null),
// otherwise returns the total output edge count from node 'id'.
unsigned DataflowGraph::getOutEdgeCount(unsigned id, Value memref) {
  unsigned outEdgeCount = 0;
  if (outEdges.count(id) > 0)
    for (auto &outEdge : outEdges[id])
      if (!memref || outEdge.value == memref)
        ++outEdgeCount;
  return outEdgeCount;
}

/// Return all nodes which define SSA values used in node 'id'.
void DataflowGraph::gatherDefiningNodes(
    unsigned id, DenseSet<unsigned> &definingNodes) {
  for (DataflowGraph::Edge edge : inEdges[id])
    // By definition of edge, if the edge value is a non-memref value,
    // then the dependence is between a graph node which defines an SSA value
    // and another graph node which uses the SSA value.
    if (!isa<MemRefType>(edge.value.getType()))
      definingNodes.insert(edge.id);
}

// Computes and returns an insertion point operation, before which the
// the fused <srcId, dstId> loop nest can be inserted while preserving
// dependences. Returns nullptr if no such insertion point is found.
Operation *
DataflowGraph::getFusedLoopNestInsertionPoint(unsigned srcId,
                                                      unsigned dstId) {
  if (outEdges.count(srcId) == 0)
    return getNode(dstId)->op;

  // Skip if there is any defining node of 'dstId' that depends on 'srcId'.
  DenseSet<unsigned> definingNodes;
  gatherDefiningNodes(dstId, definingNodes);
  if (llvm::any_of(definingNodes,
                   [&](unsigned id) { return hasDependencePath(srcId, id); })) {
    LLVM_DEBUG(llvm::dbgs()
               << "Can't fuse: a defining op with a user in the dst "
                  "loop has dependence from the src loop\n");
    return nullptr;
  }

  // Build set of insts in range (srcId, dstId) which depend on 'srcId'.
  SmallPtrSet<Operation *, 2> srcDepInsts;
  for (auto &outEdge : outEdges[srcId])
    if (outEdge.id != dstId)
      srcDepInsts.insert(getNode(outEdge.id)->op);

  // Build set of insts in range (srcId, dstId) on which 'dstId' depends.
  SmallPtrSet<Operation *, 2> dstDepInsts;
  for (auto &inEdge : inEdges[dstId])
    if (inEdge.id != srcId)
      dstDepInsts.insert(getNode(inEdge.id)->op);

  Operation *srcNodeInst = getNode(srcId)->op;
  Operation *dstNodeInst = getNode(dstId)->op;

  // Computing insertion point:
  // *) Walk all operation positions in Block operation list in the
  //    range (src, dst). For each operation 'op' visited in this search:
  //   *) Store in 'firstSrcDepPos' the first position where 'op' has a
  //      dependence edge from 'srcNode'.
  //   *) Store in 'lastDstDepPost' the last position where 'op' has a
  //      dependence edge to 'dstNode'.
  // *) Compare 'firstSrcDepPos' and 'lastDstDepPost' to determine the
  //    operation insertion point (or return null pointer if no such
  //    insertion point exists: 'firstSrcDepPos' <= 'lastDstDepPos').
  SmallVector<Operation *, 2> depInsts;
  std::optional<unsigned> firstSrcDepPos;
  std::optional<unsigned> lastDstDepPos;
  unsigned pos = 0;
  for (Block::iterator it = std::next(Block::iterator(srcNodeInst));
       it != Block::iterator(dstNodeInst); ++it) {
    Operation *op = &(*it);
    if (srcDepInsts.count(op) > 0 && firstSrcDepPos == std::nullopt)
      firstSrcDepPos = pos;
    if (dstDepInsts.count(op) > 0)
      lastDstDepPos = pos;
    depInsts.push_back(op);
    ++pos;
  }

  if (firstSrcDepPos.has_value()) {
    if (lastDstDepPos.has_value()) {
      if (*firstSrcDepPos <= *lastDstDepPos) {
        // No valid insertion point exists which preserves dependences.
        return nullptr;
      }
    }
    // Return the insertion point at 'firstSrcDepPos'.
    return depInsts[*firstSrcDepPos];
  }
  // No dependence targets in range (or only dst deps in range), return
  // 'dstNodInst' insertion point.
  return dstNodeInst;
}

// Updates edge mappings from node 'srcId' to node 'dstId' after fusing them,
// taking into account that:
//   *) if 'removeSrcId' is true, 'srcId' will be removed after fusion,
//   *) memrefs in 'privateMemRefs' has been replaced in node at 'dstId' by a
//      private memref.
void DataflowGraph::updateEdges(unsigned srcId, unsigned dstId,
                                        const DenseSet<Value> &privateMemRefs,
                                        bool removeSrcId) {
  // For each edge in 'inEdges[srcId]': add new edge remapping to 'dstId'.
  if (inEdges.count(srcId) > 0) {
    SmallVector<Edge, 2> oldInEdges = inEdges[srcId];
    for (auto &inEdge : oldInEdges) {
      // Add edge from 'inEdge.id' to 'dstId' if it's not a private memref.
      if (privateMemRefs.count(inEdge.value) == 0)
        addEdge(inEdge.id, dstId, inEdge.value);
    }
  }
  // For each edge in 'outEdges[srcId]': remove edge from 'srcId' to 'dstId'.
  // If 'srcId' is going to be removed, remap all the out edges to 'dstId'.
  if (outEdges.count(srcId) > 0) {
    SmallVector<Edge, 2> oldOutEdges = outEdges[srcId];
    for (auto &outEdge : oldOutEdges) {
      // Remove any out edges from 'srcId' to 'dstId' across memrefs.
      if (outEdge.id == dstId)
        removeEdge(srcId, outEdge.id, outEdge.value);
      else if (removeSrcId) {
        addEdge(dstId, outEdge.id, outEdge.value);
        removeEdge(srcId, outEdge.id, outEdge.value);
      }
    }
  }
  // Remove any edges in 'inEdges[dstId]' on 'oldMemRef' (which is being
  // replaced by a private memref). These edges could come from nodes
  // other than 'srcId' which were removed in the previous step.
  if (inEdges.count(dstId) > 0 && !privateMemRefs.empty()) {
    SmallVector<Edge, 2> oldInEdges = inEdges[dstId];
    for (auto &inEdge : oldInEdges)
      if (privateMemRefs.count(inEdge.value) > 0)
        removeEdge(inEdge.id, dstId, inEdge.value);
  }
}

// Update edge mappings for nodes 'sibId' and 'dstId' to reflect fusion
// of sibling node 'sibId' into node 'dstId'.
void DataflowGraph::updateEdges(unsigned sibId, unsigned dstId) {
  // For each edge in 'inEdges[sibId]':
  // *) Add new edge from source node 'inEdge.id' to 'dstNode'.
  // *) Remove edge from source node 'inEdge.id' to 'sibNode'.
  if (inEdges.count(sibId) > 0) {
    SmallVector<Edge, 2> oldInEdges = inEdges[sibId];
    for (auto &inEdge : oldInEdges) {
      addEdge(inEdge.id, dstId, inEdge.value);
      removeEdge(inEdge.id, sibId, inEdge.value);
    }
  }

  // For each edge in 'outEdges[sibId]' to node 'id'
  // *) Add new edge from 'dstId' to 'outEdge.id'.
  // *) Remove edge from 'sibId' to 'outEdge.id'.
  if (outEdges.count(sibId) > 0) {
    SmallVector<Edge, 2> oldOutEdges = outEdges[sibId];
    for (auto &outEdge : oldOutEdges) {
      addEdge(dstId, outEdge.id, outEdge.value);
      removeEdge(sibId, outEdge.id, outEdge.value);
    }
  }
}

// Adds ops in 'loads' and 'stores' to node at 'id'.
void DataflowGraph::addToNode(
    unsigned id, const SmallVectorImpl<Operation *> &loads,
    const SmallVectorImpl<Operation *> &stores) {
  Node *node = getNode(id);
  llvm::append_range(node->loads, loads);
  llvm::append_range(node->stores, stores);
}

void DataflowGraph::clearNodeLoadAndStores(unsigned id) {
  Node *node = getNode(id);
  node->loads.clear();
  node->stores.clear();
}

// Calls 'callback' for each input edge incident to node 'id' which carries a
// memref dependence.
void DataflowGraph::forEachMemRefInputEdge(
    unsigned id, const std::function<void(Edge)> &callback) {
  if (inEdges.count(id) > 0)
    forEachMemRefEdge(inEdges[id], callback);
}

// Calls 'callback' for each output edge from node 'id' which carries a
// memref dependence.
void DataflowGraph::forEachMemRefOutputEdge(
    unsigned id, const std::function<void(Edge)> &callback) {
  if (outEdges.count(id) > 0)
    forEachMemRefEdge(outEdges[id], callback);
}

// Calls 'callback' for each edge in 'edges' which carries a memref
// dependence.
void DataflowGraph::forEachMemRefEdge(
    ArrayRef<Edge> edges, const std::function<void(Edge)> &callback) {
  for (const auto &edge : edges) {
    // Skip if 'edge' is not a memref dependence edge.
    if (!isa<MemRefType>(edge.value.getType()))
      continue;
    assert(nodes.count(edge.id) > 0);
    // Skip if 'edge.id' is not a loop nest.
    if (!isa<AffineForOp>(getNode(edge.id)->op))
      continue;
    // Visit current input edge 'edge'.
    callback(edge);
  }
}

void DataflowGraph::print(raw_ostream &os) const {
  os << "\nMemRefDependenceGraph\n";
  os << "\nNodes:\n";
  for (const auto &idAndNode : nodes) {
    os << "Node: " << idAndNode.first << "\n";
    auto it = inEdges.find(idAndNode.first);
    if (it != inEdges.end()) {
      for (const auto &e : it->second)
        os << "  InEdge: " << e.id << " " << e.value << "\n";
    }
    it = outEdges.find(idAndNode.first);
    if (it != outEdges.end()) {
      for (const auto &e : it->second)
        os << "  OutEdge: " << e.id << " " << e.value << "\n";
    }
  }
}

void DataflowGraph::printAsDot(raw_ostream &os) const {
  os << "digraph {\n";
  for (const auto &idAndNode : nodes) {
    os << "  " << idAndNode.first << " [label=\"" << idAndNode.first << ": ";
    // idAndNode.second.op->print(os);
    os << "\"];\n";
    auto it = inEdges.find(idAndNode.first);
    if (it != inEdges.end()) {
      for (const auto &e : it->second){
        // if edge is memref make color red, if fifo make blue
        if (isa<MemRefType>(e.value.getType()))
          // os << "  " << e.id << " -> " << idAndNode.first << " [label=\"" << e.value << "\", color=red];\n";
          os << "  " << e.id << " -> " << idAndNode.first << " [label=\"\", color=red];\n";
        else
          // os << "  " << e.id << " -> " << idAndNode.first << " [label=\"" << e.value << "\", color=blue];\n";
          os << "  " << e.id << " -> " << idAndNode.first << " [label=\"\", color=blue];\n";
      }
        // os << "  " << e.id << " -> " << idAndNode.first << " [label=\"" << e.value << "\"];\n";
    }
    // it = outEdges.find(idAndNode.first);
    // if (it != outEdges.end()) {
    //   for (const auto &e : it->second){
    //     // if edge is memref make color red, if fifo make blue
    //     if (isa<MemRefType>(e.value.getType()))
    //       os << "  " << idAndNode.first << " -> " << e.id << " [label=\"" << e.value << "\", color=red];\n";
    //     else
    //       os << "  " << idAndNode.first << " -> " << e.id << " [label=\"" << e.value << "\", color=blue];\n";
    //   }
    //     // os << "  " << idAndNode.first << " -> " << e.id << " [label=\"" << e.value << "\"];\n";
    // }
  }
  os << "}\n";
}

void DataflowGraph::printAsDot(std::fstream &os) const {
  // os << "digraph {\n";
  // for (const auto &idAndNode : nodes) {
  //   os << "  " << idAndNode.first << " [label=\"" << idAndNode.first << ": ";
  //   // idAndNode.second.op->print(os);
  //   os << "\"];\n";
  //   auto it = inEdges.find(idAndNode.first);
  //   if (it != inEdges.end()) {
  //     for (const auto &e : it->second){
  //       // if edge is memref make color red, if fifo make blue
  //       if (isa<MemRefType>(e.value.getType()))
  //         os << "  " << e.id << " -> " << idAndNode.first << " [label=\"" << e.value << "\", color=red];\n";
  //       else
  //         os << "  " << e.id << " -> " << idAndNode.first << " [label=\"" << e.value << "\", color=blue];\n";
  //     }
  //       // os << "  " << e.id << " -> " << idAndNode.first << " [label=\"" << e.value << "\"];\n";
  //   }
  //   // it = outEdges.find(idAndNode.first);
  //   // if (it != outEdges.end()) {
  //   //   for (const auto &e : it->second){
  //   //     // if edge is memref make color red, if fifo make blue
  //   //     if (isa<MemRefType>(e.value.getType()))
  //   //       os << "  " << idAndNode.first << " -> " << e.id << " [label=\"" << e.value << "\", color=red];\n";
  //   //     else
  //   //       os << "  " << idAndNode.first << " -> " << e.id << " [label=\"" << e.value << "\", color=blue];\n";
  //   //   }
  //   //     // os << "  " << idAndNode.first << " -> " << e.id << " [label=\"" << e.value << "\"];\n";
  //   // }
  // }
  // os << "}\n";
}