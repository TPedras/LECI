# Exercícios de AC2 
## Questão 1 [5 valores]
Escreva e teste um programa que faça todas as configurações necessárias e que gere na saída OC2 do PIC32 um sinal com uma frequência de 120Hz e "duty-cycle" dependente do estado dos "switches" DS3 e DS1 (ligados aos portos RB2 e RB0, respetivamente), de acordo com a especificação seguinte (valor inicial do "duty-cycle" - 75%):

*   **RB2: 0, RB0: 0** - 30%
*   **RB2: 1, RB0: 1** - 55%
*   **Restantes combinações** - mantém o valor de "duty-cycle" anterior

O programa deve verificar, a cada 360 µs, o valor presente nos "switches" e alterar o "duty-cycle" do sinal de saída, em conformidade (para esta temporização deve ser usado o Core Timer).

**Deve ser usado o timer T3 como referência e a sua configuração deve permitir a geração do sinal PWM com a máxima resolução possível.**

Edite o seu programa no ficheiro **f11.c** (pode verificar o correto funcionamento do programa usando o osciloscópio).

---

## Questão 2 [8 valores]
Considere que a gama de tensão na entrada AN4/RB4 da ADC (0 a 3.3V) da placa DETPIC32 representa um valor de temperatura na gama 10ºC a 75ºC. Escreva e teste um programa que realize todas as configurações necessárias e que apresente continuamente o valor da temperatura nos dois displays de sete segmentos, em decimal.

**Especificações:**
1.  A ADC deve fazer duas (2) conversões por cada amostra.
2.  A frequência de amostragem da ADC deve ser 5Hz, obtida através da utilização do Core Timer.
3.  O fim de conversão da ADC deve ser processado por polling.
4.  A frequência de refrescamento dos displays deve ser 140Hz; o refrescamento dos displays deve ser feito por interrupção, usando o timer T3.

Edite o seu programa no ficheiro **f12.c**.

---

## Questão 3 [7 valores]
Escreva e teste um programa que faça todas as configurações necessárias e que implemente a comunicação série entre a placa DETPIC32 (UART2) e o PC, funcionando de acordo com as seguintes especificações:
1.  Parâmetros de comunicação: 2400 bps, even parity, 8 data bits, 2 stop bits.
2.  Deve ser feito o eco de todos os carateres recebidos.
3.  Deve ser mostrado nos 4 LED ligados aos portos RE3 a RE0 o valor binário de um contador crescente módulo 10; o valor do contador deve ser incrementado sempre que for recebido o carater 'F' (o valor inicial do contador deve ser o seu valor mínimo).
4.  Quando for recebido o caracter 'C' o valor do contador deve ser reposto com o seu valor mínimo, o resultado deve ser mostrado nos 4 LED, e deve ser transmitida a string "VALOR MINIMO".

**O processamento de receção de um caracter deve ser feito, obrigatoriamente, por interrupção.** O processamento de transmissão deve ser feito por polling.

**Nota importante: nesta questão não podem ser usados system calls.**

Edite o seu programa no ficheiro **f13.c**.

(exemplo de configuração do "pterm": **pterm 230400, N, 8, 1**)
