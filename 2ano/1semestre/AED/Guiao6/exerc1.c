#include <stdio.h>

#define MAX 51
#define MAX_PRINT 51  // até onde imprimir a tabela (para caber na tela)

unsigned long long Delannoy(int m, int n);
unsigned long long DelannoyIter(int m, int n);

int add_rec = 0;
int add_iter = 0;
unsigned long long memo[MAX][MAX];

int main() {
    for (int i = 0; i < MAX; i++)
        for (int j = 0; j < MAX; j++)
            memo[i][j] = -1;

    add_rec = 0;
    int m = 15;
    int n = 15;

    unsigned long long result = Delannoy(m, n);
    printf("Delannoy Recursivo (Memoization) = %llu | adições = %d\n", result, add_rec);

    unsigned long long result3 = DelannoyIter(m, n);
    printf("\nDelannoy Iterativo = %llu | adições = %d\n", result3, add_iter);

    return 0;
}

// ----------------------------
// Versão recursiva com memoization
// ----------------------------
unsigned long long Delannoy(int m, int n) {
    if (m == 0 || n == 0) {
        return 1;
    }
    if (memo[m][n] != -1)
        return memo[m][n];
    add_rec += 2;
    memo[m][n] = Delannoy(m - 1, n) + Delannoy(m - 1, n - 1) + Delannoy(m, n - 1);
    return memo[m][n];
}

// ----------------------------
// Versão iterativa (DP) com tabela impressa
// ----------------------------
unsigned long long DelannoyIter(int m, int n) {
    unsigned long long D[MAX][MAX];
    add_iter = 0;

    // Casos base
    for (int i = 0; i <= m; i++)
        D[i][0] = 1;
    for (int j = 0; j <= n; j++)
        D[0][j] = 1;

    // Preenchendo tabela
    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            D[i][j] = D[i - 1][j] + D[i - 1][j - 1] + D[i][j - 1];
            add_iter += 2;
        }
    }

    // Impressão parcial (até MAX_PRINT)
    int limit = (m < MAX_PRINT) ? m : MAX_PRINT;
    printf("\n=== Tabela de números de Delannoy (Iterativa, até %d) ===\n\n", limit);

    printf("      ");
    for (int j = 0; j <= limit; j++)
        printf("%12d", j);
    printf("\n");

    printf("      ");
    for (int j = 0; j <= limit; j++)
        printf("-------------");
    printf("\n");

    for (int i = 0; i <= limit; i++) {
        printf("%3d |", i);
        for (int j = 0; j <= limit; j++) {
            printf("%12llu", D[i][j]);
        }
        printf("\n");
    }

    return D[m][n];
}
