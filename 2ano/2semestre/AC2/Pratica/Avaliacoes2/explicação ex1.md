1. Inclusão e Função Auxiliar

   1 #include <detpic32.h>
   2
   3 void setDutyCycle(unsigned int dc){
   4     OC4RS = ((PR3 + 1) * dc) / 100;
   5 }
   * #include <detpic32.h>: Biblioteca padrão para a placa, que define os registos (como TRISB, PR3, etc.) e funções como delay().
   * setDutyCycle: O registo OC4RS controla o tempo que o sinal fica em nível alto (ON). A fórmula ((PR3 + 1) * dc) / 100 converte uma percentagem (0 a 100) no valor correspondente para o registo, baseando-se no
     período total definido em PR3.

  2. Configuração de I/O (Entradas/Saídas)

   1 TRISB = TRISB | 0x0006; 
   * O exercício pede RB1 (Switch DS2) e RB2 como entradas.

  3. Configuração do Timer 3 (A base de tempo)

   1 // prescaler = (20 000 000 / 130) / 65536 = 2.34 -> Escolhe-se 4
   2 T2CONbits.TCKPS = 2; // Erro: Devia ser T3CON
   3 PR3 = 38461;         // Cálculo: (20MHz / (4 * 130Hz)) - 1
   4 TMR3 = 0;            // Limpa o contador
   5 T3CONbits.TON = 1;   // Liga o Timer 3
   * O Prescaler de 4 (ajustado no bit TCKPS = 2) reduz a frequência do relógio interno (20MHz) para que o valor caiba no registo de 16 bits (PR3).
   * PR3: Define o fim da contagem. Quando o Timer chega a 38461, recomeça. Isto gera a frequência de 130Hz.

  4. Configuração do Output Compare (PWM)

   1 OC4CONbits.OCM = 6;    // Modo PWM sem proteção de falha
   2 OC4CONbits.OCTSEL = 0; // Erro: 0 seleciona Timer 2, deveria ser 1 para Timer 3
   3 setDutyCycle(50);      // Duty-cycle inicial de 50%
   4 OC4CONbits.ON = 1;     // Ativa o módulo OC4
   * OCM = 6: Configura o pino OC4 para modo PWM.
   * OCTSEL: Este bit escolhe qual Timer o PWM usa como referência. Como o exercício exige o Timer 3, este bit deve ser 1.

  5. Loop Principal e Lógica

    1 while(1) {
    2     if(PORTBbits.RB1 == 1){ 
    3         // Se RB1 for 1, não faz nada (mantém o último duty-cycle)
    4     }
    5     else {
    6         // Se RB1 for 0, alterna entre 25% e 75%
    7         if(flag){
    8             setDutyCycle(25);
    9         } else {
   10             setDutyCycle(75);
   11         }
   12         flag = !flag;    // Inverte a flag para a próxima iteração
   13         delay(1300);     // Espera 1.3 segundos (Core Timer usado internamente no delay)
   14     }
   15 }
   * O código verifica o estado de RB1. Se estiver a 0, altera o PWM e espera 1.3s.