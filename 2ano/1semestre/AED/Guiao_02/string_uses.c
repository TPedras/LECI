#include <string.h>

int main(void) {
    char frase1[] = "dastrsdasd dsdvsvdas";
    char frase2[] = "Universida de Aveiro";
    printf("First phrase: %s", frase1);
    printf("Second phrase: %s", frase2);


    if (('a'<= frase1[0] <= 'z')|| ('A'<= frase1[0] <= 'Z')){
        printf("The first letter from the first phrase is a letter from the alphabet");
    } 
    else{
        printf("The first letter from the first phrase isn't a letter from the alphabet ");
    }

    



    


}