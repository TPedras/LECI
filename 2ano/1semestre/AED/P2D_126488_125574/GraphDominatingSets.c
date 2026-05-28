//
// Algoritmos e Estruturas de Dados --- 2025/2026
//
// Joaquim Madeira - Nov 2025
//
// GraphDominatingSets - Computing Vertex Dominating Sets for UNDIRECTED graphs
//

// Student Name : Ricardo Almeida
// Student Number : 125574
// Student Name : Filipe Cruz
// Student Number : 126488

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



#define COUNTER InstrCount[0]   // nº de comparações
#define ACCESS InstrCount[1]    // Acessos à memória


int GraphIsDominatingSet(const Graph* g, IndicesSet* vertSet) {
  assert(g != NULL);
  assert(GraphIsDigraph(g) == 0);
  assert(IndicesSetIsEmpty(vertSet) == 0);

  IndicesSet *GraphVertices = GraphGetSetVertices(g);   // Cria um set com os vertices do grafo

  ACCESS++;
  int v = IndicesSetGetFirstElem(GraphVertices);        // Vai buscar o primeiro vértice do grafo no set

  while (v!=-1){  // Verifica todos os vértices do set 
    COUNTER++;    // Comparação no while
    COUNTER++;    // Para o if a baixo
    // Ignora os casos em que v já está no set em questão
    ACCESS++;
    if (IndicesSetContains(vertSet,v)) {v = IndicesSetGetNextElem(GraphVertices);ACCESS++;continue;}

    ACCESS++;
    IndicesSet *vizinhosV = GraphGetSetAdjacentsTo(g,v);    // Set dos elementos adjacentes a v

    ACCESS++;
    int u = IndicesSetGetFirstElem(vizinhosV);        // Primeiro elemento do set
    int dominado = 0;                                // Vai guardar se este vértice entra em contacto com um vértice do set dominante

    while(u != -1){
      COUNTER++; // Comparação no while  

      COUNTER++; // Comparação no if
      ACCESS++;

      // Verifica se o u é um vértice dominante, se for acaba o ciclo
      if (IndicesSetContains(vertSet, u)){dominado = 1; break;}
      ACCESS++;
      u = IndicesSetGetNextElem(vizinhosV);
    }

    IndicesSetDestroy(&vizinhosV);         // Destrói o set de vizinhos

    if (!dominado){
      IndicesSetDestroy(&GraphVertices);
      return 0;
    }
    ACCESS++;
    v=IndicesSetGetNextElem(GraphVertices);     // Passa ao próximo set
  } 

  IndicesSetDestroy(&GraphVertices);         // Destrói o set criado no inicio


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
  ACCESS++;
  double nVertices = GraphGetNumVertices(g);
  
  
  // Se o grafo estiver vazio acaba aqui a função
  if (nVertices==0)return IndicesSetCreateEmpty(0);

  // Partimos do princípio que no pior caso o grafo total é o grafo dominante
  int minSize = nVertices;
  IndicesSet *dominantSet = IndicesSetCreateFull(nVertices);

  IndicesSet *trialSet = IndicesSetCreateEmpty(nVertices);       // Set que vai correr dentro do loop

  //Corremos todos os subsets 
  while (ACCESS++,IndicesSetNextSubset(trialSet)){
    ACCESS++;
    double tSetSize = IndicesSetGetNumElems(trialSet);

    // Se o subset tem o mesmo tamanho ou é maior que o atual menor então este caso não interessa
    COUNTER++;
    if (tSetSize >= minSize) continue;
    
      
    

    // Não interessam conjuntos vazios
    COUNTER++;
    ACCESS++;
    if (IndicesSetIsEmpty(trialSet)) continue;
    

    // Depois das verificações anteriores 
    COUNTER++;
    if (GraphIsDominatingSet(g, trialSet))
    {
      // Se o trialset for um dominating, destruimos o menor dominant set atual e criamos um novo 
      IndicesSetDestroy(&dominantSet);
      dominantSet = IndicesSetCreateCopy(trialSet);
      minSize = tSetSize;
    }
  }
  IndicesSetDestroy(&trialSet);         // Destrói o trial set
  return dominantSet;
}

//
// TO BE COMPLETED
//
// Compute a MIN WEIGHT VERTEX DOMINATING SET of the graph
// using an EXHAUSTIVE SEARCH approach
// Return the dominating set

// Esta função vai correr todos os pontos do subset e adicionar o peso dos mesmos
static double tSetWeightCalc(IndicesSet *set, const double *weight){
  double tWeight = 0.0;
  ACCESS++;
  int v = IndicesSetGetFirstElem(set);

  while (v!=-1){
    COUNTER++;
    tWeight += weight[v];
    ACCESS++;
    v=IndicesSetGetNextElem(set);
  }
  return tWeight;
}
// Fim da função auxiliar



IndicesSet* GraphComputeMinWeightDominatingSet(const Graph* g) {
  assert(g != NULL);
  assert(GraphIsDigraph(g) == 0);
  ACCESS++;
  int nVertices = GraphGetNumVertices(g);
  

  // Se o grafo estiver vazio acaba aqui a função
  if (nVertices==0)return IndicesSetCreateEmpty(0);
  
  double *weightArray = GraphComputeVertexWeights(g);     // Cria um array com o peso de cada vértice
  
  // Partimos do princípio que no pior caso o grafo total é o grafo dominant
  IndicesSet *dominantSet = IndicesSetCreateFull(nVertices);
  double minWeight = tSetWeightCalc(dominantSet,weightArray);

  // Set que vai correr dentro do loop
  IndicesSet *trialSet = IndicesSetCreateEmpty(nVertices);
  
  // Corremos todos os subsets 
  while (ACCESS++,IndicesSetNextSubset(trialSet)){

    
    // Depois de alguns testes concluimos que era mais fácil fazer uma função auxiliar para calcular o peso
    // total simplificando o código
    
    double tSetWeight = tSetWeightCalc(trialSet,weightArray);

    // Se o subset tem o mesmo tamanho ou é maior que o atual menor então este caso não interssa
    COUNTER++;
    if (tSetWeight >= minWeight) continue;

    // Não interessam conjuntos vazios
    COUNTER++;
    if (IndicesSetIsEmpty(trialSet)) continue;
    

    // Depois das verificações anteriores 
    COUNTER++;
    if (GraphIsDominatingSet(g, trialSet))
    {
      // Se o trialset for um dominating, destruimos o menor dominant set atual e criamos um novo 
      IndicesSetDestroy(&dominantSet);
      dominantSet = IndicesSetCreateCopy(trialSet);
      minWeight = tSetWeight;
    }
  }
  IndicesSetDestroy(&trialSet);     // Destrói o trial set
  return dominantSet;
}