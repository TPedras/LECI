//
// TO DO : desenvolva um algoritmo para verificar se um numero inteiro positivo
//         e uma capicua
//         Exemplos: 12321 e uma capiacua, mas 123456 nao e
//         USE uma PILHA DE INTEIROS (STACK) e uma FILA DE INTEIROS (QUEUE)
//
// TO DO : design an algorithm to check if the digits of a positive decimal
//         integer number constitue a palindrome
//         Examples: 12321 is a palindrome, but 123456 is not
//         USE a STACK of integers and a QUEUE of integers
//

#include <stdio.h>

#include "IntegersQueue.h"
#include "IntegersStack.h"

int main(void) {
    printf("Escreve um numero\n");
    char *str = (char *)malloc(100 * sizeof(char));
    scanf("%s", str);
    Stack *stack = createStack();
    Queue *queue = createQueue();
    for (int i = 0; str[i] != '\0'; i++) {
        int digit = str[i] - '0';
        push(stack, digit);
        enqueue(queue, digit);
    }
    int isPalindrome = 1;
    while (!isStackEmpty(stack) && !isQueueEmpty(queue)) {
        int stackTop = pop(stack);
        int queueFront = dequeue(queue);
        if (stackTop != queueFront) {
            isPalindrome = 0;
            break;
        }
    }

    free(str);
    destroyStack(stack);
    destroyQueue(queue);

    if (isPalindrome) {
        printf("É uma capicua!\n");
    } else {
        printf("Não é uma capicua.\n");
    }

    return 0; 
}
