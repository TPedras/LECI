# Análise Comparativa: AC2 - Teste 2 (2023 vs 2024)

Este documento resume os tópicos abordados nos dois testes e destaca as principais semelhanças estruturais e de conteúdo para facilitar a preparação.

## 1. Tópicos Abordados

Ambos os testes cobrem os conceitos fundamentais de Arquitetura de Computadores II, focando-se em periféricos, barramentos, memórias e sistemas de memória.

### Barramentos e I/O
- **Barramentos de Sistema:** Funções do *Data Bus* e *Address Bus*.
- **Interrupções:** Funcionamento de interrupções vetorizadas e identificação de periféricos.
- **DMA (Direct Memory Access):** Sinais de controlo (*BusRequest*, *BusGrant*), modos de transferência (bloco) e cálculo de taxas de transferência.

### Protocolos de Comunicação Série
- **UART / RS232:** Tipos de erros (*framing*, paridade), sincronização de relógio e erros de fase.
- **SPI (Serial Peripheral Interface):** Configuração master/slave, sinais de seleção (SS), relógio explícito e topologias.
- **I2C (Inter-Integrated Circuit):** Estrutura do primeiro byte, arbitragem de barramento e cálculo de tempo de aquisição de dados.
- **CAN (Controller Area Network):** Cenários de aplicação, técnica de *bit stuffing*, arbitragem por identificadores e mecanismos de filtragem (máscaras e filtros).

### Memória e Hierarquia
- **Tecnologias de Memória:** SRAM (design de módulos) e DRAM (organização interna e ciclos de refrescamento).
- **Memória Cache:** Políticas de escrita (*write-back* vs *write-through*), *dirty bit*, mapeamento direto e associativo, cálculo de bits de *tag* e número de comparadores.
- **Memória Virtual:** Tradução de endereços (VPN para PPN), função da MMU, estrutura da *Page Table* e TLB (*Translation Lookaside Buffer*).
- **Desempenho:** Cálculo de *hit ratio* e tempo médio de acesso.

### Programação (PIC32)
- Configuração de portos através dos registos `TRIS` usando operações bit-a-bit.
- Implementação de *device drivers* (uso de FIFOs e interrupções).

---

## 2. Semelhanças e Padrões

Os testes seguem um padrão muito rígido, o que indica uma estrutura previsível para o exame:

### Estrutura do Exame
- **Grupo I:** Questões teóricas de escolha múltipla (conceitos e lógica).
- **Grupo II:** Questões de cálculo (DMA, Cache, DRAM, Memória Virtual, Performance).

### Questões "Clássicas" (Presentes em ambos)
1.  **Configuração TRIS:** Uma questão sobre configurar bits específicos de um porto (ex: bits 7/6 em 2023, bits 5/3 em 2024).
2.  **Descodificação de Endereços:** Expressão lógica para sinal de seleção (*Sel* ou *CE*) baseada numa gama de endereços.
3.  **Cálculo de DMA:** Taxa de transferência em modo bloco com barramento de 64-bits a 120MHz.
4.  **Arbitragem CAN:** Determinar qual master ganha o barramento com base em identificadores hexadecimais (o menor identificador ganha).
5.  **Máscara/Filtro CAN:** Tabela de aceitação de mensagens baseada em bits de máscara e filtro.
6.  **Comparadores de Cache:** Cálculo do número de comparadores para cache parcialmente associativa (igual ao número de vias).
7.  **Refrescamento DRAM:** Tempo para refrescamento completo de uma memória DRAM 4Mx64.
8.  **Hit Ratio:** Cálculo do *hit ratio* dado o tempo médio de acesso e os tempos de cache/memória central (os valores no enunciado de 2023 e 2024 para esta questão são exatamente os mesmos).
9.  **Device Drivers:** UART com FIFO e interrupções como a abordagem típica.

### Observação sobre os Valores
Muitas questões de cálculo mantêm exatamente a mesma lógica, alterando apenas ligeiramente os valores (ou mantendo-os, como no caso do *hit ratio*), o que torna a resolução dos testes anteriores uma excelente estratégia de estudo.
