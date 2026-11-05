# Perguntas de Exames de AC2

## T1 2023

1. Um microcontrolador é um sistema computacional programável que:
   a. inclui, num único circuito integrado, CPU, memória e um conjunto variável de periféricos e portos de I/O.
   b. disponibiliza, através dos seus portos de I/O, a generalidade dos sinais dos barramentos do microprocessador para ligação direta a sensores e atuadores de um sistema embebido.
   c. devido a restrições de custos, suporta um número reduzido de instruções e de registos.
   d. por questões de dimensão, não utiliza mecanismos de multiplexagem para partilha de pinos físicos do circuito entre diversas funcionalidades internas.

2. Num sistema computacional, o espaço de endereçamento de memória é definido como:
   a. um número único que identifica cada posição de memória.
   b. a quantidade de memória fisicamente disponível no sistema, expressa em MBytes.
   c. a gama completa de endereços de memória que o CPU pode gerar.
   d. a dimensão em bits de cada posição de memória.

3. A função de um *bootloader* num sistema baseado em microcontrolador é:
   a. transferir o código executável, a partir do sistema *host* usado no desenvolvimento, para a memória do microcontrolador, permitindo a sua posterior execução.
   b. realizar a compilação do software de alto nível (e.g. C) e iniciar a sua execução após o reset do sistema.
   c. interagir com o *cross-compiler* para efeitos de *debug* da aplicação.
   d. executar o programa e auxiliar no seu *debug* permitindo a introdução de *breakpoints*, visualização do conteúdo de registos e de posições de memória.

4. Dizer-se que num sistema computacional a memória apresenta uma organização do tipo *byte-addressable* significa que:
   a. cada posição de memória é identificada com um endereço de 1 byte.
   b. o acesso apenas pode ser efetuado por instruções que transferem 1 byte de informação.
   c. uma *word* de 32 bits é armazenada em 4 posições de memória consecutivas de 1 byte.
   d. o barramento de endereços e de dados têm obrigatoriamente que ter a mesma dimensão.

5. Na arquitetura de um sistema computacional, o Address Bus permite:
   a. especificar o tipo de operação efetuada sobre a memória ou sobre o periférico.
   b. identificar, na memória ou num periférico, a origem/destino da informação a transferir.
   c. transferir dados entre a memória externa e os registos do CPU.
   d. transferir o código máquina das instruções para o program counter.

6. O *bus matrix*, usado no PIC32, permite:
   a. o acesso do CPU a uma memória RAM para transferência simultânea de dados e instruções.
   b. o acesso do CPU a uma memória FLASH para transferência simultânea de dados e instruções.
   c. a transferência direta de dados ou instruções da memória RAM para a FLASH (ou o contrário) sem intervenção de qualquer outro dispositivo.
   d. o acesso do CPU a uma memória FLASH para leitura de dados constantes e à mesma memória FLASH para leitura de instruções.

7. Um compilador-cruzado (*cross-compiler*) é um programa que corre numa plataforma e:
   a. simula o funcionamento de uma aplicação numa plataforma diferente.
   b. permite o debug de uma aplicação que corre numa plataforma diferente.
   c. gera código que pode ser executado na mesma plataforma em que é gerado.
   d. gera código para uma plataforma com uma arquitetura diferente daquela onde é executado.

8. Quando nos referimos a um "Módulo de I/O" estamos a referir-nos:
   a. à parte de um dispositivo periférico que funciona como adaptador entre as características intrínsecas do periférico e as características do CPU e do sistema de memória.
   b. a um periférico que permite operações de escrita e leitura.
   c. ao software (*device-driver*) que assegura que o acesso ao periférico é transparente para as aplicações.
   d. ao tipo de conector que permite a interface entre um periférico e o canal de comunicação do mesmo com o mundo exterior.

9. O modelo de programação de um periférico especifica:
   a. o sub-conjunto de instruções assembly do CPU suportadas por esse periférico.
   b. a funcionalidade do periférico e o seu conjunto de registos de dados, de controlo e de estado.
   c. quais os sinais elétricos usados na ligação do periférico a dispositivos externos, tais como sensores e atuadores.
   d. as arquiteturas e as ferramentas de desenvolvimento com as quais o periférico pode ser usado.

10. Na implementação da parte de dados de um porto de saída devem ser usados:
    a. *buffers tri-state* para que a informação presente no barramento de dados só fique disponível para o periférico quando o porto for ativado.
    b. *flip-flops* para armazenar o valor transferido através do barramento de dados durante um ciclo de escrita.
    c. *buffers tri-state* para que a informação só seja colocada no barramento de dados quando o porto é selecionado.
    d. *flip-flops* para armazenar o valor presente no barramento de endereços, se este coincidir com o endereço do porto.

11. A descodificação de endereços consiste em:
    a. representar um endereço em binário de forma a utilizar o menor número de linhas do barramento.
    b. determinar em função do endereço gerado pelo periférico, qual o CPU ou memória que deve ser selecionada.
    c. ocupar a totalidade do espaço de endereçamento do processador com memórias e periféricos.
    d. determinar, em função do endereço presente no barramento, qual o periférico ou memória que deve ser selecionada.

12. Num determinado sistema com uma organização de memória do tipo byte-addressable e um espaço de endereçamento de 16 bits, foi implementado um descodificador de endereços usando a seguinte expressão lógica (lógica negativa): $\overline{CE} = A15 + A14 + \overline{A12}$ (A13 ignorado). Com este descodificador pode ser selecionada uma memória:
    a. de 4k bytes, na gama de endereços 0xD000 a 0xDFFF.
    b. de 8k bytes, na gama de endereços 0xC000 a 0xDFFF.
    c. de 2k bytes, na gama de endereços 0xF000 a 0xF7FF.
    d. de 4k bytes, na gama de endereços 0x3000 a 0x3FFF.

13. Suponha que os bits 7 e 6 do porto B do PIC32 estão configurados como saída e que se pretende atribuir a esses dois portos o valor 1 e 0, respetivamente, sem alterar o valor dos restantes. Para isso, em linguagem C, pode fazer-se:
    a. `LATB = (LATB & 0xFF3F) | (1 << 7);`
    b. `LATB = (LATB & 0xFFBF) | (0 << 6);`
    c. `LATB = (LATB | 0x0080) & ~(1 << 6);`
    d. `LATB = (LATB & 0x0000) | (1 << 7);`

14. Na implementação de um porto de I/O do PIC32, o registo com a designação "PORT" está associado a um conjunto de dois *flip-flops* D ligados em série (*shift register* de dois andares). O objetivo desta organização é:
    a. criar um atraso temporal de dois ciclos de relógio relativamente às alterações do registo TRIS.
    b. assegurar que o registo LAT é adequadamente escrito numa operação "Read Modify Write".
    c. assegurar que há uma adequada sincronização entre o valor lógico presente na entrada e o relógio interno e prevenir a ocorrência, internamente, de fenómenos de meta-estabilidade.
    d. garantir que há tempo para colocar em alta impedância o buffer *tri-state* de saída quando se comuta o porto de modo de saída para modo de entrada.

15. O método de transferência de informação entre um CPU e um periférico, em que o programa executado no CPU inicia, monitoriza e controla a transferência de informação, designa-se por:
    a. entrada/saída por *polling* com vectorização.
    b. entrada/saída por interrupção iniciada pelo CPU.
    c. entrada/saída por interrupção iniciada pelo periférico.
    d. entrada/saída programada (método de *polling*).

16. Num sistema que implemente "*interrupções vetorizadas*", a sequência de operações efetuada pelo CPU na fase de atendimento a uma interrupção é, **pela ordem indicada**, a seguinte:
    a. salto para a RSI, identificação da fonte, determinação do endereço da RSI, salvaguarda do endereço de retorno.
    b. determinação do endereço da RSI, identificação da fonte, salvaguarda do endereço de retorno, salto para a RSI.
    c. salvaguarda do endereço de retorno, identificação da fonte, determinação do endereço da RSI, salto para a RSI.
    d. salvaguarda do endereço de retorno, salto para a RSI, identificação da fonte.

17. Numa RSI, o conjunto de instruções designado por "prólogo" destina-se, no essencial, a:
    a. alterar a tabela de vetores de modo a impedir que novos pedidos de interrupção sejam atendidos.
    b. salvaguardar, na *stack*, o contexto atual do programa interrompido, i.e., registos internos do CPU.
    c. identificar a fonte de interrupção (quando isso é feito por software) e obter o endereço inicial da RSI.
    d. regressar ao programa interrompido.

18. Na organização do sistema de interrupções designada por "identificação da fonte por software", o processador identifica o periférico gerador da interrupção:
    a. através da leitura do valor presente no barramento de endereços uma vez que quando o periférico ativa a linha de interrupção coloca simultaneamente nesse barramento o seu vetor.
    b. antes de saltar para a rotina de serviço à interrupção lendo o registo de estado de cada um dos periféricos do sistema.
    c. na rotina de serviço à interrupção lendo o registo de estado de cada um dos periféricos do sistema.
    d. num ciclo de *interrupt acknowledge* durante o qual o periférico gerador da interrupção coloca o vetor no barramento de dados.

19. Quando nos referimos a uma "*secção crítica*", num trecho de código executado por um CPU, estamos a referir-nos:
    a. a uma sequência de instruções cuja execução não pode ser interrompida por uma interrupção, por usar/atualizar um recurso partilhado com o código da rotina de serviço à interrupção.
    b. à secção mais importante do código em execução e que não pode deixar de ser executado.
    c. a um conjunto consecutivo de instruções onde não é possível chamar uma função.
    d. a uma secção de código que, em certas circunstâncias, pode gerar uma exceção.

20. Quando é usada a técnica de transferência de dados por DMA para transferir informação entre a memória e um periférico:
    a. o CPU configura o controlador de DMA com os endereços de origem e destino e o número de *words* a transferir, e o DMA faz depois a transferência dos dados.
    b. o periférico faz um pedido de interrupção ao controlador de DMA após a conclusão da transferência de dados.
    c. o CPU verifica, através de um ciclo de *polling* ao registo de estado do controlador de DMA, se a transferência já foi concluída.
    d. o DMA verifica, através de um ciclo de *polling* ao registo de estado do periférico, se existem mais dados para serem transferidos.

21. Numa transferência por DMA, o mecanismo de interrupção é utilizado pelo respetivo controlador para:
    a. efetuar ao CPU o pedido de cedência dos barramentos; a transferência tem início quando o DMA receber a confirmação, através do sinal *busgrant*, de que os barramentos foram libertados.
    b. informar o CPU que a transferência de informação vai ter início, permitindo desse modo que o CPU suspenda a atividade de acesso ao exterior.
    c. informar o CPU que a transferência de informação foi completada.
    d. informar o CPU da existência de uma anomalia ocorrida durante o processo de transferência.

22. Numa transferência por DMA, *em modo bloco*, quando o controlador de DMA pretende dar início a uma transferência:
    a. ativa o sinal *busreq* durante um número fixo de ciclos de relógio, e inicia de seguida a transferência.
    b. ativa o sinal *busreq*, efetuando a transferência logo que se torne *bus master*.
    c. gera uma interrupção que é interpretada pelo CPU como um pedido de cedência dos barramentos e a transferência é efetuada quando o DMA reconhecer a ativação do sinal *busgrant*.
    d. informa o CPU, através da linha *busreq*, que vai dar início à transferência e inicia-a de imediato. O sinal *busgrant* é utilizado pelo CPU para suspender a atividade do DMA.

23. Num sistema de comunicação série que use transmissão síncrona:
    a. o sinal de relógio não é transmitido, nem há recuperação do relógio no recetor.
    b. o sinal de relógio é codificado nos dados, ou é transmitido de forma explícita através de um sinal adicional.
    c. os relógios do transmissor e do recetor não precisam de estar sincronizados.
    d. existe obrigatoriamente, para além da linha de dados, uma linha através da qual é transmitido o sinal de relógio.

24. Considere um timer em que a relação entre as frequências de entrada e de saída é uma constante "k" configurável. Considere ainda que se usaram dois desses timers e se ligaram em cascata (i.e., em série). Supondo que a frequência à entrada do primeiro timer é 1 MHz, para obter à saída do segundo timer uma frequência de 200 Hz, as constantes de configuração dos dois timers, "k1" e "k2", poderão ter os seguintes valores:
    a. k1 = 100, k2 = 25.
    b. k1 = 10, k2 = 20.
    c. k1 = 200, k2 = 100.
    d. k1 = 200, k2 = 25.

25. Considere um espaço de endereçamento de 20 bits e o circuito gerador de sinais de seleção programável da figura (igual ao que estudou nas aulas teóricas). Na situação apresentada e considerando que a linha de seleção $CS_1$ está ativa na gama 0xD8200 a 0xD83FF, podemos concluir que o circuito da figura gera:
    a. 16 linhas de seleção.
    b. 64 linhas de seleção.
    c. 8 linhas de seleção.
    d. 32 linhas de seleção.

26. O sinal de seleção "*Sel\*" (lógica negativa) de uma memória de 2k endereços mapeada na gama de endereços 0x01800...0x01FFF, num espaço de endereçamento de 20 bits, pode ser obtido através da expressão lógica:
    a. $\overline{Sel} = \prod_{n=0}^{10} A_n$
    b. $\overline{Sel} = \sum_{n=0}^{10} \overline{A_n}$
    c. $\overline{Sel} = \prod_{n=13}^{19} \overline{A_n} + \prod_{n=11}^{12} A_n$
    d. $\overline{Sel} = \sum_{n=13}^{19} A_n + \sum_{n=11}^{12} \overline{A_n}$

27. Considere um controlador de DMA *não dedicado* de 32 bits (i.e. com barramento de dados de 32 bits), a funcionar a 180 MHz. Suponha ainda que são necessários 2 ciclos de relógio (= $1 T_{BC}$) para efetuar uma operação de leitura ou escrita. A taxa de transferência de pico desse DMA (expressa em Bytes/s), em modo *cycle-stealing* e com um tempo mínimo entre operações elementares de $2 T_{BC}$ é:
    a. 60 MByte/s.
    b. 120 MByte/s.
    c. 12.5 MByte/s.
    d. 40 MByte/s.

---

## T1 2024

1. Os microcontroladores são tipicamente usados em:
   a. sistemas computacionais de uso geral por disponibilizarem sempre coprocessador de virgula flutuante.
   b. sistemas embebidos por disponibilizarem um vasto conjunto de periféricos para interface com sensores e atuadores.
   c. sistemas computacionais de uso geral por disponibilizarem um vasto conjunto de recursos de interface com o utilizador e periféricos para interface com sensores e atuadores.
   d. sistemas embebidos por disponibilizarem sempre coprocessador de vírgula fixarem sempre coprocessador de vírgula fixa.

2. Num sistema computacional, o espaço de endereçamento de memória é definido como:
   a. a gama completa de endereços de memória que o CPU pode gerar.
   b. um número único que identifica cada posição de memória.
   c. a quantidade de memória fisicamente disponível no sistema, expressa em MBytes.
   d. a dimensão em bits de cada posição de memória.

3. A função de um *programa monitor* num sistema baseado em microcontrolador é:
   a. interagir com o *cross-compiler* para efeitos de *debug* da aplicação.
   b. transferir o código fonte, a partir do sistema *host* usado no desenvolvimento, para a memória do microcontrolador, permitindo a sua posterior compilação e execução.
   c. transferir o código executável, executar o programa e auxiliar no seu *debug* permitindo a introdução de *breakpoints*, visualização do conteúdo de registos e de posições de memória.
   d. realizar a compilação do software de alto nível (e.g. C) e iniciar a sua execução após o reset do sistema.

4. Dizer-se que num sistema computacional a memória apresenta uma organização do tipo *byte-addressable* significa que:
   a. cada posição de memória é identificada com um endereço de 1 byte.
   b. o acesso apenas pode ser feito por instruções que transferem 1 *byte* de informação.
   c. o barramento de endereços e de dados têm obrigatoriamente que ter a mesma dimensão.
   d. uma *word* de 32 bits é armazenada em 4 posições de memória consecutivas de 1 byte.

5. Na arquitetura de um sistema computacional, os sinais de controlo RD e WR (*read e write*) permitem:
   a. identificar, na memória ou num periférico, a origem/destino da informação a transferir.
   b. especificar o tipo de operação efetuada sobre a memória ou sobre o periférico.
   c. transferir dados entre a memória externa e os registos do CPU.
   d. transferir o código máquina das instruções para o *program counter*.

6. O *bus matrix*, usado no PIC32, permite:
   a. o acesso do CPU a uma memória RAM para transferência simultânea de dados e instruções.
   b. o acesso do CPU a uma memória FLASH para transferência simultânea de dados e instruções.
   c. o acesso do CPU a uma memória FLASH para leitura de dados constantes e à mesma memória FLASH para leitura de instruções.
   d. a transferência direta de dados ou instruções da memória RAM para a FLASH (ou o contrário) sem intervenção de qualquer outro dispositivo.

7. Um compilador-cruzado (*cross-compiler*) é um programa que corre numa plataforma e:
   a. gera código para uma plataforma com uma arquitetura diferente daquela onde é executado.
   b. simula o funcionamento de uma aplicação numa plataforma diferente.
   c. permite o *debug* de uma aplicação que corre numa plataforma diferente.
   d. gera código que pode ser executado na mesma plataforma em que é gerado.

8. O modelo de programação de um periférico especifica:
   a. o sub-conjunto de instruções *assembly* do CPU suportadas por esse periférico.
   b. quais os sinais elétricos usados na ligação do periférico a dispositivos externos, tais como sensores e atuadores.
   c. as arquiteturas e as ferramentas de desenvolvimento com as quais o periférico pode ser usado.
   d. a funcionalidade do periférico e o seu conjunto de registos de dados, de controlo e de estado.

9. Na implementação de um porto de entrada simples devem ser usados:
   a. *buffers tri-state* para que a informação presente no barramento de dados só fique disponível para o periférico quando o porto for ativado.
   b. *buffers tri-state* para que a informação só seja colocada no barramento de dados quando o porto for selecionado.
   c. *flip-flops* para armazenar o valor presente no barramento de endereços, se este coincidir com o endereço do porto.
   d. *buffers tri-state* para armazenar o valor transferido através do barramento de dados durante um ciclo de escrita.

10. A descodificação de endereços consiste em:
    a. representar um endereço em binário de forma a utilizar o menor número de linhas do barramento.
    b. determinar, em função do endereço gerado pelo periférico, qual o CPU ou memória que deve ser selecionada.
    c. ocupar a totalidade do espaço de endereçamento do processador com memórias e periféricos.
    d. determinar, em função do endereço presente no respetivo barramento, qual o periférico ou memória que deve ser selecionada.

11. Num determinado sistema com uma organização de memória do tipo *byte-addressable* e um espaço de endereçamento de 16 bits, foi implementado um descodificador de endereços usando a seguinte expressão lógica: $\overline{CE} = A15 + overline,A14 + A13$. Com este descodificador pode ser selecionada uma memória:
    a. na gama de endereços 0xA000 a 0xAFFF
    b. na gama de endereços 0xA000 a 0xBFFF
    c. na gama de endereços 0x5000 a 0x5FFF
    d. na gama de endereços 0x4000 a 0x4FFF

12. Para que um porto de entrada e um porto de saída estejam mapeados no mesmo endereço do espaço de endereçamento de um processador, é necessário:
    a. que o sinal de seleção do porto de entrada tome em consideração o sinal "write" e o do porto de saída o sinal "read".
    b. que os sinais de seleção sejam independentes e que tomem em consideração o "ou exclusivo" dos sinais "read" e "write".
    c. que o sinal de seleção seja comum aos dois portos.
    d. utilizar descodificação parcial, e cada um deles usar um endereço de uma réplica diferente.

13. Suponha que os bits 7 e 6 do porto B do PIC32 estão configurados como saída e que se pretende atribuir a esses dois portos o valor 1 e 0, respetivamente, sem alterar o valor dos restantes. Essa operação pode ser realizada, em linguagem C, através da seguinte expressão:
    a. `LATB = (LATB | 0x0080) & ~(1 << 6);`
    b. `LATB = LATB & 0xFFBF;`
    c. `LATB = (LATB | 0x0080) & ~(0 << 6);`
    d. `LATB = (LATB & 0x0000) | (1 << 7);`

14. Na implementação de um porto de I/O do PIC32, o registo com a designação "PORT" está associado a um conjunto de dois *flip-flops* D ligados em série (*shift register* de dois andares). O objetivo desta organização é:
    a. criar um atraso temporal de dois ciclos de relógio relativamente às alterações do registo TRIS.
    b. assegurar que há uma adequada sincronização entre o valor lógico presente na entrada e o relógio interno e prevenir a ocorrência, internamente, de fenómenos de meta-estabilidade.
    c. assegurar que o registo LAT é adequadamente escrito numa operação "Read Modify Write".
    d. garantir que há tempo para colocar em alta impedância o *buffer tri-state* de saída quando se comuta o porto de modo de saída para modo de entrada.

15. A técnica de entrada/saída de dados por interrupção:
    a. permite transferir eficientemente (i.e. com elevada taxa de transferência) grandes quantidades de dados.
    b. consiste na execução de um ciclo de *polling* que é interrompido quando o periférico estiver pronto para realizar a transferência.
    c. consiste na interrupção do periférico sempre que o CPU pretende transferir dados.
    d. permite mascarar a latência do periférico.

16. Num sistema que implemente "*interrupções vetorizadas*", a sequência de operações efetuada pelo CPU na fase de atendimento a uma interrupção é, **pela ordem indicada**, a seguinte:
    a. salvaguarda do endereço de retorno, identificação da fonte, determinação do endereço da RSI, salto para a RSI.
    b. salto para a RSI, identificação da fonte, determinação do endereço da RSI, salvaguarda do endereço de retorno.
    c. determinação do endereço da RSI, identificação da fonte, salvaguarda do endereço de retorno, salto para a RSI.
    d. salvaguarda do endereço de retorno, salto para a RSI, identificação da fonte.

17. Numa RSI, o conjunto de instruções designado por "epílogo" destina-se, no essencial, a:
    a. alterar a tabela de vetores de modo a permitir que novos pedidos de interrupção sejam atendidos.
    b. detetar se há uma nova interrupção pendente para ser atendida e identificar a sua origem.
    c. repor o contexto do programa interrompido e retomar a execução desse mesmo programa.
    d. calcular o endereço da RSI da próxima interrupção que se encontra em espera para ser atendida.

18. Na organização do sistema de interrupções designada por "identificação da fonte por software", o processador identifica o periférico gerador da interrupção:
    a. através da leitura do valor presente no barramento de endereços uma vez que quando o periférico ativa a linha de interrupção coloca simultaneamente nesse barramento o seu vetor.
    b. antes de saltar para a rotina de serviço à interrupção lendo o registo de estado de cada um dos periféricos do sistema.
    c. num ciclo de *interrupt acknowledge* durante o qual o periférico gerador da interrupção coloca o vetor no barramento de dados.
    d. na rotina de serviço à interrupção lendo o registo de estado de cada um dos periféricos do sistema.

19. Quando nos referimos a uma "*secção crítica*", num trecho de código executado por um CPU, estamos a referir-nos:
    a. a uma sequência de instruções cuja execução não pode ser interrompida por uma interrupção, por usar/atualizar um recurso partilhado com o código da rotina de serviço à interrupção.
    b. à secção mais importante do código em execução e que não pode deixar de ser executada.
    c. a um conjunto consecutivo de instruções onde não é possível chamar uma função.
    d. a uma secção de código que, em certas circunstâncias, pode gerar uma exceção.

20. Quando é usada a técnica de transferência de dados por DMA para transferir informação entre a memória e um periférico:
    a. o periférico faz um pedido de interrupção ao controlador de DMA após a conclusão da transferência de dados.
    b. o CPU verifica, através de um ciclo de *polling* ao registo de estado do controlador de DMA, se a transferência já foi concluída.
    c. o CPU configura o controlador de DMA com os endereços de origem e destino e o número de dados a transferir, e o DMA faz depois a transferência dos dados.
    d. o DMA verifica, através de um ciclo de *polling* ao registo de estado do periférico, se existem mais dados para serem transferidos.

21. Numa transferência por DMA, o respetivo controlador gera uma interrupção:
    a. quando se torna *bus master*.
    b. quando termina a transferência de dados para o qual foi previamente configurado.
    c. quando recebe um *DMA Request* proveniente de um periférico.
    d. sempre que inicia uma nova transferência de dados.

22. Numa transferência por DMA, *em modo bloco*, quando o controlador de DMA pretende dar início a uma transferência:
    a. ativa o sinal *BusReq* durante um número fixo de ciclos de relógio, e inicia de seguida a transferência.
    b. ativa o sinal *BusReq*, efetuando a transferência logo que se torne *bus master*.
    c. gera uma interrupção que é interpretada pelo CPU como um pedido de cedência dos barramentos e a transferência é efetuada quando o DMA reconhecer a ativação do sinal *BusGrant*.
    d. informa o CPU, através da linha *BusReq*, que vai dar início à transferência e inicia-a de imediato. O sinal *BusGrant* é utilizado pelo CPU para suspender a atividade do DMA.

23. Considere um timer, a funcionar como divisor de frequência, construído com base num contador crescente síncrono. Se se ligarem dois desses timers em série, configurados com constantes de divisão k1 e k2 respetivamente, o sinal na saída do segundo timer terá uma frequência dada pela seguinte expressão:
    a. $f_{out} = f_{in} * (k1 * k2)$
    b. $f_{out} = f_{in} / (k1 + k2)$
    c. $f_{out} = f_{in} * (k1 + k2)$
    d. $f_{out} = f_{in} / (k1 * k2)$

24. Considere um timer de 16 bits, cujo relógio interno provém de um sinal com uma frequência de entrada de 10 MHz. O timer está a ser usado em modo alternado, com duas constantes de divisão kA e kB, utilizadas alternadamente a cada ciclo. Sabendo que o tempo durante o qual o sinal de saída tem o valor lógico 1 é determinado pela constante kA, para se obter na saída um sinal com um período de 10ms e *duty-cycle* de 40%, a constante kA deverá ser:
    a. 1000
    b. 10000
    c. 40000
    d. 4000

25. Considere um espaço de endereçamento de 20 bits e o circuito gerador de sinais de seleção programável da figura (igual ao que estudou nas aulas teóricas). Na situação apresentada e considerando que a linha de seleção $CS_1$ está ativa na gama 0x9CC00 a 0x9CFFF, podemos concluir que o circuito da figura gera:
    a. 8 linhas de seleção.
    b. 16 linhas de seleção.
    c. 32 linhas de seleção.
    d. 64 linhas de seleção.

26. O sinal de seleção "*Sel\*" (lógica negativa) de uma memória de 8k endereços mapeada na gama de endereços 0x3E000...0x3FFFF, num espaço de endereçamento de 20 bits, pode ser obtido através da expressão lógica:
    a. $\overline{Sel} = \overline{A_{19}} + \sum_{n=16}^{18} A_n + \sum_{n=13}^{15} \overline{A_n}$
    b. $\overline{Sel} = \sum_{n=0}^{19} A_n$
    c. $\overline{Sel} = A_{19} + \sum_{n=16}^{18} \overline{A_n} + \sum_{n=13}^{15} A_n$
    d. $\overline{Sel} = A_{19} \cdot \prod_{n=16}^{18} \overline{A_n} \cdot \prod_{n=13}^{15} A_n$

27. Considere um controlador de DMA *dedicado* de 32 bits (i.e. com barramento de dados de 32 bits), a funcionar a 150 MHz. Suponha ainda que são necessários 3 ciclos de relógio para fazer uma operação de leitura ou escrita. A taxa de transferência de pico desse DMA (expressa em Bytes/s), em modo *cycle-stealing*, com um tempo mínimo entre operações elementares de 2 ciclos de relógio, é:
    a. 150 MByte/s
    b. 120 MByte/s
    c. 100 MByte/s
    d. 300 MByte/s

28. Para fazer uma transferência num barramento de dados de 16 bits, um controlador de DMA não dedicado, a funcionar em modo *bloco*, necessitou de 2048 *bus cycles*. Podemos então concluir que o DMAC transferiu:
    a. 1024 words de 32 bits.
    b. 512 words de 16 bits.
    c. 2048 words de 16 bits.
    d. 512 words de 32 bits.

29. Um programa para transferir dados de um periférico para a memória é implementado com recurso a interrupções. Admitindo que o CPU funciona a 400 MHz e que o programa em causa apresenta um CPI de 2 e executa 10 instruções, em média, por cada byte, qual a máxima taxa de transferência de dados que se consegue obter, supondo um barramento de dados de 32 bits?
    a. 100 MByte/s
    b. 40 MByte/s
    c. 80 MByte/s
    d. 20 MByte/s

30. Considere um sistema baseado num CPU a funcionar a uma frequência de 20 MHz com uma taxa de execução de 10 MIPS (10x$10^6$ instruções por segundo, CPI = 2) que processa por interrupção eventos externos periódicos. Se o *overhead* total de atendimento à interrupção for de 30 ciclos de relógio, e a rotina de serviço à interrupção tiver 10 instruções, a máxima frequência a que esses eventos podem ocorrer é, aproximadamente:
    a. 200 kHz
    b. 300 kHz
    c. 400 kHz
    d. 500 kHz

31. Considere um *watchdog timer*, com uma frequência de entrada de 100 kHz, construído a partir de um contador crescente que atua no processador sempre que a contagem atinge o valor máximo. Em funcionamento normal, o processador faz o reinício do *watchdog timer* em intervalos não superiores a 150 ms. Neste cenário, o número mínimo de bits do contador do *watchdog timer* deverá ser:
    a. 12
    b. 13
    c. 15
    d. 14

32. Considere um timer como o da figura abaixo (semelhante aos dos PIC32) com a sua saída ligada a um pino "Output Compare" (OC). Admita que a frequência do relógio TCLK é de 30MHz, que a constante de *prescaler* tem o valor 4, que a constante PR tem o valor 49999 e que a constante OCK tem o valor 10000. Nestas condições, a frequência do sinal na saída O1 é:
    a. freq=150 Hz
    b. freq=300 Hz
    c. freq=100 Hz
    d. freq=500 Hz
