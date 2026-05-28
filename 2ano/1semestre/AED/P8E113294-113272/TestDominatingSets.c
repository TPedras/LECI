//
// Algoritmos e Estruturas de Dados --- 2025/2026
//
// Joaquim Madeira, Joao Manuel Rodrigues - Nov 2025
//
// Testing the Dominating Sets algorithms
//
// MODIFIED: Includes complexity tests at the end
//

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h> // Required for randomness

#include "Graph.h"
#include "GraphDominatingSets.h"
#include "IndicesSet.h"
#include "instrumentation.h" // Required to measure time

// ================================================================
// EXTRA FUNCTION: Complexity Tests for Report
// ================================================================
void RunComplexityAnalysis(void) {
  printf("\n\n==============================================\n");
  printf("   GENERATING DATA FOR REPORT (TABLE)    \n");
  printf("==============================================\n");
  printf("%-10s %-15s\n", "Vertices", "Time(s)");
  printf("---------------------------\n");

  srand(time(NULL));

  // Test from 5 to 25 vertices (increment by 5)
  for (int n = 5; n <= 25; n += 5) {
      
      // 1. Create random graph
      Graph* g = GraphCreate(n, 0, 0);
      
      // Edge density ~25%
      int max_edges = n * (n - 1) / 2;
      int num_edges = max_edges / 4; 

      for (int i = 0; i < num_edges; i++) {
          int v1 = rand() % n;
          int v2 = rand() % n;
          if (v1 != v2) {
              GraphAddEdge(g, v1, v2);
          }
      }

      // 2. Measure time
      InstrReset(); 
      double start_time = cpu_time();
      
      IndicesSet* result = GraphComputeMinDominatingSet(g);
      
      double end_time = cpu_time();
      double elapsed = end_time - start_time;

      // 3. Print table row
      printf("%-10d %-15.6f\n", n, elapsed);

      IndicesSetDestroy(&result);
      GraphDestroy(&g);
  }
  printf("==============================================\n");
}

// ================================================================
// ORIGINAL MAIN (WITH EXTRA CALL AT THE END)
// ================================================================
int main(void) {
  // Read an undirected graph from file
  FILE* file = fopen("G_2.txt", "r");
  Graph* g02 = GraphFromFile(file);
  fclose(file);
  // Display in DOT format
  GraphDisplayDOT(g02);
  printf("\n");

  GraphCheckInvariants(g02);

  // A full vertex set is a dominating set
  IndicesSet* full_set = IndicesSetCreateFull(GraphGetNumVertices(g02));
  printf("The full set is a dominating set? %d\n",
         GraphIsDominatingSet(g02, full_set));
  IndicesSetDestroy(&full_set);
  printf("\n");

  // Another set for testing domination
  IndicesSet* test_set = IndicesSetCreateEmpty(GraphGetNumVertices(g02));
  IndicesSetAdd(test_set, 0);
  IndicesSetAdd(test_set, 1);
  IndicesSetDisplay(test_set);
  printf("The test set is a dominating set? %d\n",
         GraphIsDominatingSet(g02, test_set));

  IndicesSetDestroy(&test_set);
  printf("\n");

  printf("Finding a MIN dominating set\n");
  IndicesSet* mdset = GraphComputeMinDominatingSet(g02);
  IndicesSetDisplay(mdset);
  printf("The subgraph defined by the MIN dominating set\n");
  Graph* mdset_graph = GraphGetSubgraph(g02, mdset);
  GraphDisplayDOT(mdset_graph);
  
  IndicesSetDestroy(&mdset);
  GraphDestroy(&mdset_graph);
  printf("\n");

  printf("Finding a MIN WEIGHT dominating set\n");
  IndicesSet* mwdset = GraphComputeMinWeightDominatingSet(g02);
  IndicesSetDisplay(mwdset);
  printf("The subgraph defined by the MIN WEIGHT dominating set\n");
  Graph* mwdset_graph = GraphGetSubgraph(g02, mwdset);
  GraphDisplayDOT(mwdset_graph);
  IndicesSetDestroy(&mwdset);
  GraphDestroy(&mwdset_graph);
  printf("\n");
  
  // Creating another graph
  Graph* g03 = GraphCreateEmpty(4, 0, 0);
  GraphAddVertex(g03, 2);
  GraphAddVertex(g03, 0);
  GraphAddVertex(g03, 1);
  GraphAddVertex(g03, 3);
  GraphAddEdge(g03, 0, 1);
  GraphAddEdge(g03, 0, 2);
  GraphAddEdge(g03, 0, 3);
  GraphAddEdge(g03, 2, 1);
  GraphAddEdge(g03, 2, 3);

  // Displaying in DOT format
  GraphDisplayDOT(g03);
  printf("\n");

  GraphCheckInvariants(g03);

  printf("Finding a MIN dominating set\n");
  mdset = GraphComputeMinDominatingSet(g03);
  IndicesSetDisplay(mdset);
  printf("The subgraph defined by the MIN dominating set\n");
  mdset_graph = GraphGetSubgraph(g03, mdset);
  GraphDisplayDOT(mdset_graph);

  IndicesSetDestroy(&mdset);
  GraphDestroy(&mdset_graph);
  printf("\n");

  // Clearing
  GraphDestroy(&g02);
  GraphDestroy(&g03);

  RunComplexityAnalysis();

  return 0;
}