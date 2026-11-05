b
a
c
d
b
c
a
d
b
d
c
c
a
b
d
a
c
a
a
c
b
b
d
d
b
a
b
d
c
c
d
a

1. Espaço de Endereçamento (Address Space)
  É o conjunto de todos os endereços possíveis que um processador pode gerar. 
   * Como é determinado: Pelo número de bits do barramento de endereços. Por exemplo, um processador com 32 bits de endereçamento (como o MIPS/PIC32) tem um espaço de $2^{32}$ posições (4 GB).
   * O que contém: No PIC32, este espaço é partilhado (mapeado em memória) entre a memória Flash (código), a RAM (dados) e os registos dos periféricos (SFRs - Special Function Registers).

  2. Bus Matrix (Matriz de Barramentos)
  É a infraestrutura interna que interliga os diversos Mestres (CPU, DMA) aos Escravos (RAM, Flash, Periféricos).
   * Função Principal: Permitir acessos paralelos e simultâneos. Enquanto o CPU está a ler instruções da Flash, o controlador de DMA pode estar a transferir dados da RAM para um porto de comunicação ao mesmo
     tempo, sem que um bloqueie o outro (desde que não tentem aceder ao mesmo escravo exatamente no mesmo instante).

  3. Bus Master (Mestre do Barramento)
  É qualquer módulo capaz de iniciar uma transação no barramento (gerar um endereço e pedir uma leitura ou escrita).
   * Exemplos: O CPU é o mestre principal. O controlador de DMA (Direct Memory Access) também pode tornar-se Bus Master para transferir dados sem intervenção do CPU.
   * Diferença para o Escravo: Um escravo (como a RAM) apenas responde a pedidos; nunca inicia uma conversa.
