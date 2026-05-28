#include <stdio.h>
#include <math.h>  // Necessário para usar sqrt()

int main() {
    int n;
    printf("Quantas linhas deve ter a tabela? ");
    scanf("%d", &n);

    printf("\n%-10s %-10s %-10s\n", "Número", "Quadrado", "Raiz");
    printf("-----------------------------------\n");

    for (int i = 1; i <= n; i++) {
        printf("%-10d %-10d %-10.4f\n", i, i * i, sqrt(i));
    }

    return 0;
}
