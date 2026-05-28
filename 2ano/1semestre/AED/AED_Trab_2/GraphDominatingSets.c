//
// Algoritmos e Estruturas de Dados --- 2025/2026
//
// Joaquim Madeira - Nov 2025
//
// GraphDominatingSets - Computing Vertex Dominating Sets for UNDIRECTED graphs
//

// Student Name : Filipe Oliveira
// Student Number : 114640
// Student Name : António Videira
// Student Number : 125623

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

  // Check if all vertices are dominated
  for (unsigned int i = 0; i < GraphGetVertexRange(g); i++) {
    if (IndicesSetContains(vertSet, i)) {
      continue;  
    }

    IndicesSet* adjacents = GraphGetSetAdjacentsTo(g, i);
    int dominated = 0;

    int u = IndicesSetGetFirstElem(adjacents);
    while (u != -1) {
      if (IndicesSetContains(vertSet, (uint16_t)u)) {
      dominated = 1;
        break;
      }
      u = IndicesSetGetNextElem(adjacents);
    }

    IndicesSetDestroy(&adjacents);

    if (!dominated) {
      return 0;  
    }
  }
  return 1;  
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

  const unsigned int n = GraphGetVertexRange(g);

  IndicesSet* gVerts = GraphGetSetVertices(g);

  IndicesSet* cand = IndicesSetCreateEmpty(n);

  IndicesSet* best = NULL;
  int bestSize = (int)n + 1;

  do {

    if (IndicesSetIsEmpty(cand)) continue;


    if (!IndicesSetIsSubset(cand, gVerts)) continue;

    if (GraphIsDominatingSet(g, cand)) {
      int sz = (int)IndicesSetGetNumElems(cand);
      if (sz < bestSize) {
        if (best != NULL) IndicesSetDestroy(&best);
        best = IndicesSetCreateCopy(cand);
        bestSize = sz;

        if (bestSize == 1) break;
      }
    }
  } while (IndicesSetNextSubset(cand));

  IndicesSetDestroy(&cand);
  IndicesSetDestroy(&gVerts);

  // Fallback (shouldn't happen for non-empty graphs): return all vertices
  if (best == NULL) {
    best = GraphGetSetVertices(g);
  }

  return best;
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

  const unsigned int n = GraphGetVertexRange(g);

  double* w = GraphComputeVertexWeights(g);

  IndicesSet* gVerts = GraphGetSetVertices(g);
  IndicesSet* cand = IndicesSetCreateEmpty(n);

  IndicesSet* best = NULL;
  double bestWeight = 1e300; 
  int bestSize = (int)n + 1; 

  do {
    if (IndicesSetIsEmpty(cand)) continue;
    if (!IndicesSetIsSubset(cand, gVerts)) continue;

    if (GraphIsDominatingSet(g, cand)) {
      double total = 0.0;

      int v = IndicesSetGetFirstElem(cand);
      while (v != -1) {
        total += w[(unsigned int)v];
        v = IndicesSetGetNextElem(cand);
      }

      int sz = (int)IndicesSetGetNumElems(cand);

      if (total < bestWeight || (total == bestWeight && sz < bestSize)) {
        if (best != NULL) IndicesSetDestroy(&best);
        best = IndicesSetCreateCopy(cand);
        bestWeight = total;
        bestSize = sz;
      }
    }
  } while (IndicesSetNextSubset(cand));

  free(w);
  IndicesSetDestroy(&cand);
  IndicesSetDestroy(&gVerts);

  if (best == NULL) {
    best = GraphGetSetVertices(g);
  }

  return best;
}

