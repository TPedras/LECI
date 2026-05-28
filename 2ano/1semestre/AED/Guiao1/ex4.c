#include <stdio.h>

int main() {
    printf("Tamanhos dos tipos primitivos em C (em bytes):\n\n");

    printf("char:                %zu bytes\n", sizeof(char));
    printf("short:               %zu bytes\n", sizeof(short));
    printf("int:                 %zu bytes\n", sizeof(int));
    printf("long:                %zu bytes\n", sizeof(long));
    printf("long long:           %zu bytes\n", sizeof(long long));
    printf("float:               %zu bytes\n", sizeof(float));
    printf("double:              %zu bytes\n", sizeof(double));
    printf("long double:         %zu bytes\n", sizeof(long double));
    printf("void * (ponteiro):   %zu bytes\n", sizeof(void*));

    return 0;
}
