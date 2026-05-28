#include <stdio.h>

int Delannoy(int m, int n) {
    if (m == 0 || n == 0) {
        return 1;
    }
    return Delannoy(m - 1, n) + Delannoy(m - 1, n - 1) + Delannoy(m, n - 1);
}

int main(void) {
    int m, n;
    printf("m? ");
    scanf("%d", &m);
    printf("n? ");
    scanf("%d", &n);

    printf("numero de delannoy da funcao D(%d, %d) = %d\n", m, n, Delannoy(m, n));
    return 0;
}

//função dinamica
unsigned int delannoy_d(unsigned int m, unsigned int n) {
    unsigned int ADDS = 0;
    unsigned int D[m + 1] [n + 1];
    for (unsigned int i = 0; i <= m; i++)
        D[i][0] = 1;
    for (unsigned int j = 0; j <= n; j++)
        D[0][j] = 1;

    for (unsigned int i = 1; i <= m; i++) {
        for (unsigned int j = 1; j <= n; j++) {
            ADDS += 2;
            D[i][j] = D[i-1][j] + D[i-1] [j-1] + D[i][j-1];
        }
    }
    return D[m][n];
}
