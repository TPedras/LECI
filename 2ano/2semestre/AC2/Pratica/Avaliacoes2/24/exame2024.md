# Exercícios de AC2

## Questão 1 [5 valores] (tempo estimado de resolução: 15')
Escreva e teste um programa que faça todas as configurações necessárias e que gere na saída OC4 do PIC32 um sinal com uma frequência de 130Hz e "duty-cycle" dependente do estado do "switch" DS2 (ligado ao porto RB1), de acordo com a especificação seguinte, considerando um valor inicial de "duty-cycle" de 50%:

*   **RB1: 0** - "duty-cycle" alterna entre 25% e 75%, a cada 1.3s (para esta temporização deve ser usado o Core Timer).
*   **RB1: 1** - o sinal gerado mantém o último valor de "duty-cycle" aplicado.

**NOTE:** O valor do porto RB2 deve ser verificado antes da mudança para um novo valor de "duty-cycle".

**Deve ser usado o timer T3 como referência e a sua configuração deve permitir a geração do sinal PWM com a máxima resolução possível.**

Edite o seu programa no ficheiro **f21.c** (pode verificar o correto funcionamento do programa usando o osciloscópio).

---

## Questão 2 [7 valores] (tempo estimado de resolução: 22')
Considere que a gama de tensão na entrada AN4/RB4 da ADC (0 a 3.3V) da placa DETPIC32 representa um valor de temperatura na gama 7ºC a 73ºC. Escreva e teste um programa que realize todas as configurações necessárias e que apresente continuamente o valor da temperatura nos dois displays de sete segmentos, em decimal

**Especificações:**
1.  A ADC deve fazer duas (2) conversões por cada amostra.
2.  A frequência de amostragem da ADC deve ser 5Hz, obtida através da utilização do Core Timer.
3.  O fim de conversão da ADC deve ser processado por polling.
4.  A frequência de refrescamento dos displays deve ser 250Hz; o refrescamento dos displays deve ser feito por interrupção, usando o timer T3.

Edite o seu programa no ficheiro **f22.c**.

## Questão 3 [8 valores] (tempo estimado de resolução: 25')
Escreva e teste um programa que faça todas as configurações necessárias e que implemente a comunicação série entre a placa DETPIC32 (UART2) e o PC, funcionando de acordo com as seguintes especificações:
1.  Parâmetros de comunicação: 9600 bps, odd parity, 8 data bits, 2 stop bits.
2.  Deve ser feito o eco de todos os carateres recebidos.
3.  O estado do LED7 (ligado ao porto RE7), deve mudar sempre que for recebido um novo carater (valor inicial: 0).
4.  Quando for recebido o carater 'D' deve ser enviada a string "DSD=", seguida do valor decimal definido pelos 4 switches DS4 a DS1, ligados aos portos RB3 a RB0 (e.g. DSD=12).

**O processamento de receção de um caracter deve ser feito, obrigatoriamente, por interrupção.** O processamento de transmissão deve ser feito por polling.

**NOTA:** Nesta questão, a transmissão de informação deve ser realizada exclusivamente utilizando o código de acesso à UART que escrever para a resolução do exercício. Não é permitido o uso de system calls ou de qualquer outra função de impressão disponível.

Edite o seu programa no ficheiro **f23.c**.

**Notas:**
1.  Para visualizar uma tabela ASCII, digite o comando **ascii** (na linha de comando).
2.  Exemplo de configuração do "pterm": **pterm 600, N, 8, 1**

