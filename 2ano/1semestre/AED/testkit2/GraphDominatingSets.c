//
// Algoritmos e Estruturas de Dados --- 2025/2026
//
// Joaquim Madeira - Nov 2025
//
// GraphDominatingSets - Computing Vertex Dominating Sets for UNDIRECTED graphs
//

// Student Name : Diogo Silva
// Student Number : 113294
// Student Name : Diogo Silva
// Student Number : 113272

/*** COMPLETE THE GraphIsDominatingSet FUNCTION ***/
/*** COMPLETE THE GraphMinDominatingSet FUNCTION ***/
/*** COMPLETE THE GraphMinWeightDominatingSet FUNCTION ***/

#include "GraphDominatingSets.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Graph.h"
#include "IndicesSet.h"
#include "instrumentation.h"

//
// TO BE COMPLETED
//
// Check if the given set is a dominating set for the graph
// Return 1 if true, or 0 otherwise
//
// A dominating set is a set of graph vertices such that every other
// graph vertex not in the set is adjacent to a graph vertex in the set
//
int GraphIsDominatingSet(const Graph* g, IndicesSet* vertSet) {
  assert(g != NULL);
  assert(GraphIsDigraph(g) == 0);
  assert(IndicesSetIsEmpty(vertSet) == 0);

  //
  // TO BE COMPLETED
  //

  // A dominating set D covers all vertices V.
  // Meaning V = D U Neighbors(D).
  
  // We can create a "covered" set. Start with elements in vertSet.
  IndicesSet* covered = IndicesSetCreateCopy(vertSet);
  
  // Iterate through vertices in vertSet
  int v_index = IndicesSetGetFirstElem(vertSet);
  while (v_index != -1) {
    // Get neighbors of v
    IndicesSet* neighbors = GraphGetSetAdjacentsTo(g, (unsigned int)v_index);
    // Union neighbors into covered
    IndicesSetUnion(covered, neighbors);
    IndicesSetDestroy(&neighbors);
    
    v_index = IndicesSetGetNextElem(vertSet);
  }
  
  // Check if covered contains all vertices of the graph
  // i.e., graph vertices set is a subset of covered
  IndicesSet* graphVertices = GraphGetSetVertices(g);
  int isDominating = IndicesSetIsSubset(graphVertices, covered);
  
  IndicesSetDestroy(&covered);
  IndicesSetDestroy(&graphVertices);

  return isDominating;
}

//
// TO BE COMPLETED
//
// Compute a MIN VERTEX DOMINATING SET of the graph
// using an EXHAUSTIVE SEARCH approach
// Return the/a dominating set
//
IndicesSet* GraphComputeMinDominatingSet(const Graph* g) {
  assert(g != NULL);
  assert(GraphIsDigraph(g) == 0);

  // Initialize best set as the set of all vertices (worst case dominating set)
  IndicesSet* minSet = GraphGetSetVertices(g);
  unsigned int minSize = IndicesSetGetNumElems(minSet);

  // Iterator set
  IndicesSet* candidate = IndicesSetCreateEmpty(GraphGetVertexRange(g));
  
  // Get the actual valid vertices to ensure we only check valid subsets (optimization check)
  IndicesSet* validVertices = GraphGetSetVertices(g);

  // Exhaustive search: iterate all subsets
  // Note: IndicesSetNextSubset iterates 0..2^Range.
  // This is inefficient if Range >> NumVertices, but strictly follows the "Exhaustive Search" requirement via the provided ADT.
  
  // Start with empty set (which will return false for IsDominating usually, unless graph is empty)
  // IndicesSetNextSubset logic: start empty, then bitwise increment.
  
  do {
    // Optimization: If candidate size >= minSize, we don't need to check it 
    // (unless we wanted all optimal solutions, but we just need one).
    if (IndicesSetGetNumElems(candidate) >= minSize) {
      continue;
    }

    // Optimization/Validity: Ensure candidate contains only vertices that actually exist in the graph
    if (!IndicesSetIsSubset(candidate, validVertices)) {
       continue; 
    }

    if (IndicesSetIsEmpty(candidate)) {
        // Empty set only dominates an empty graph.
        if (GraphGetNumVertices(g) == 0) {
             IndicesSetDestroy(&minSet);
             IndicesSetDestroy(&validVertices);
             return candidate;
        }
        continue;
    }

    if (GraphIsDominatingSet(g, candidate)) {
      unsigned int currentSize = IndicesSetGetNumElems(candidate);
      if (currentSize < minSize) {
        minSize = currentSize;
        IndicesSetDestroy(&minSet);
        minSet = IndicesSetCreateCopy(candidate);
      }
    }
  } while (IndicesSetNextSubset(candidate));

  IndicesSetDestroy(&candidate);
  IndicesSetDestroy(&validVertices);

  return minSet;
}

//
// TO BE COMPLETED
//
// Compute a MIN WEIGHT VERTEX DOMINATING SET of the graph
// using an EXHAUSTIVE SEARCH approach
// Return the dominating set
//
IndicesSet* GraphComputeMinWeightDominatingSet(const Graph* g) {
  assert(g != NULL);
  assert(GraphIsDigraph(g) == 0);

  // Pre-calculate vertex weights to avoid re-computation inside the loop
  double* weights = GraphComputeVertexWeights(g);
  unsigned int range = GraphGetVertexRange(g);

  // Initialize best set with all vertices
  IndicesSet* minSet = GraphGetSetVertices(g);
  double minWeight = 0.0;
  
  // Calculate initial minWeight
  int v_index = IndicesSetGetFirstElem(minSet);
  while(v_index != -1) {
      if(weights[v_index] != -1.0)
        minWeight += weights[v_index];
      v_index = IndicesSetGetNextElem(minSet);
  }

  // Iterator set
  IndicesSet* candidate = IndicesSetCreateEmpty(range);
  IndicesSet* validVertices = GraphGetSetVertices(g);

  do {
    // Validity check
    if (!IndicesSetIsSubset(candidate, validVertices)) {
       continue; 
    }
    
    if (IndicesSetIsEmpty(candidate)) {
        if (GraphGetNumVertices(g) == 0) {
             IndicesSetDestroy(&minSet);
             IndicesSetDestroy(&validVertices);
             free(weights);
             return candidate;
        }
        continue;
    }

    // Calculate candidate weight first (Pruning)
    double currentWeight = 0.0;
    v_index = IndicesSetGetFirstElem(candidate);
    while (v_index != -1) {
        if (weights[v_index] != -1.0)
            currentWeight += weights[v_index];
        v_index = IndicesSetGetNextElem(candidate);
    }

    // Pruning: if current weight already exceeds found min, skip IsDominating check
    if (currentWeight >= minWeight) {
        continue;
    }

    if (GraphIsDominatingSet(g, candidate)) {
       // We already know currentWeight < minWeight because of the check above
       minWeight = currentWeight;
       IndicesSetDestroy(&minSet);
       minSet = IndicesSetCreateCopy(candidate);
    }

  } while (IndicesSetNextSubset(candidate));

  IndicesSetDestroy(&candidate);
  IndicesSetDestroy(&validVertices);
  free(weights);

  return minSet;
}