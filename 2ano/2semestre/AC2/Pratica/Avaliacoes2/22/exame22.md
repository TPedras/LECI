# Arquitetura de Computadores 2 (2021/22)

**Teste prático 2, 15-06-2022** &nbsp;&nbsp;&nbsp; [8:30-9:45] &nbsp;&nbsp;&nbsp; **[Sessão 1]**

## Notas importantes

1. Na sua área de trabalho foram colocados todos os ficheiros necessários para a realização deste exame. **Os nomes e localização dos ficheiros não podem ser alterados. Não é permitido apagar qualquer ficheiro, em especial fora do diretório de trabalho (Desktop/prova)**.
2. Os elementos de avaliação permitidos estão disponíveis no Desktop do computador.
3. A colocação do nome e número mecanográfico no cabeçalho dos ficheiros é obrigatória.
4. Hardware da placa fornecida para o teste (igual à usada nas aulas práticas):

| Componente | Detalhe | Portos |
|---|---|---|
| LED | LED7 ... LED0 | RE7 ... RE0 |
| Switches¹ | DS4 ... DS1 | RB3 ... RB0 |
| Segmentos dos displays² | Seg G ... Seg A | RB14 ... RB8 |
| Controlo dos displays | Display mais significativo, Display menos significativo | RD6, RD5 |
| Pontos de teste | OC5 ... OC1 | RD4 ... RD0 |
| Entrada analógica 0 a 3.3V | Potenciómetro R30 | RB4 (ADC de 10 bits) |
| Comunicação | RS-232C | UART2 |
| Frequência dos sinais de relógio | Core Timer, PBCLK | f = 20MHz |

¹ - Nos switches a posição ON corresponde ao nível lógico 1.
² - Por display entende-se sempre display de 7 segmentos.

No seu diretório de trabalho (Desktop/prova/) encontra os seguintes ficheiros: **f11.c, f12.c e f13.c**.

---

## Questão 1 [5 valores]

Escreva um programa que faça todas as configurações necessárias e que gere na saída OC2 do PIC32 um sinal com uma frequência de 150Hz e "duty-cycle" dependente do estado dos "switches" DS4 e DS1 (ligados aos portos RB3 e RB0, respetivamente), de acordo com a especificação seguinte (valor inicial do "duty-cycle" - 25%):

- **RB3: 0, RB0: 1** - 25%
- **RB3: 1, RB0: 0** - 70%
- **Restantes combinações** - mantém "duty-cycle" anterior

O programa deve verificar, a cada 250 µs, o valor presente nos "switches" e alterar o "duty-cycle" do sinal de saída, em conformidade (para esta temporização deve ser usado o Core Timer). **Deve ser usado o timer T2 como referência e a sua configuração deve permitir a geração do sinal PWM com a máxima resolução possível.**

Edite o seu programa no ficheiro **f11.c** (pode verificar o correto funcionamento do programa usando o osciloscópio).

---

## Questão 2 [8 valores]

Considere que a gama de tensão na entrada da ADC (0 a 3.3V) da placa DETPIC32-IO representa um valor de temperatura na gama 15ºC a 65ºC. Escreva e teste um programa que realize todas as configurações necessárias e que apresente continuamente o valor da temperatura nos dois displays de sete segmentos, em decimal.

**Especificações:**
1. A ADC deve fazer duas (2) conversões por cada amostra.
2. A frequência de amostragem da ADC deve ser 10Hz, obtida através da utilização do Core Timer.
3. O fim de conversão da ADC deve ser processado por polling.
4. A frequência de refrescamento dos displays deve ser 120Hz.
5. O refrescamento dos displays deve ser feito por interrupção, usando o timer T2.

Edite o seu programa no ficheiro **f12.c**.

---

## Questão 3 [7 valores]

Escreva e teste um programa que faça todas as configurações necessárias e que implemente a comunicação série entre a placa DETPIC32 (UART2) e o PC, funcionando de acordo com as seguintes especificações:

1. Parâmetros de comunicação: 9600 bps, odd parity, 8 data bits, 2 stop bits.
2. Quando for recebido o caracter 'U', deve ser incrementado um contador módulo 16 e o resultado deve ser mostrado nos 4 LED ligados aos portos RE4 a RE1; o valor inicial do contador deve ser o seu valor máximo.
3. Quando for recebido o caracter 'R' o valor do contador deve ser reposto com o seu valor mínimo, o resultado deve ser mostrado nos 4 LED, e deve ser transmitida a string "RESET".

**O processamento de receção de um caracter deve ser feito, obrigatoriamente, por interrupção.** O processamento de transmissão deve ser feito por *polling*.

**Nota importante: nesta questão não podem ser usados system calls.**

Edite o seu programa no ficheiro **f13.c**.

(exemplo de configuração do "pterm": **pterm 230400,N,8,1**)

---

*No final do teste guarde os ficheiros, feche o(s) editor(es) e faça "LOGOUT".*
**NÃO DESLIGUE O COMPUTADOR!**
