# 📚 Plano de Estudo - Arquitetura de Computadores II (Teste 2)

Este plano foi elaborado com base nos exames de 2023 e 2024, na análise de tópicos e nos acetatos das aulas teóricas.

---

## 📌 Módulo 1: Arquitetura Básica, Portos de E/S e Descodificação
Foco na comunicação básica do processador com os periféricos e na sua configuração bit-a-bit (PIC32).

*   **Material de Estudo:** 
    *   `AC2-T-Aula02.pdf` (Estrutura básica de portos de I/O)
    *   `AC2-T-Aula06.pdf` (Endereçamento e descodificação)
*   **Foco Principal:**
    *   Saber o que faz o *Data Bus* e o *Address Bus* (ex: organização *word-addressable*).
    *   Operações bit-a-bit em linguagem C para configurar o registo `TRIS` (definir pins de Input e Output sem alterar os restantes).
    *   Escrever a equação lógica booleana ($CE$ ou $Sel$) dado um intervalo de endereços em hexadecimal.
*   **Questões de Treino:**
    *   **2023:** Grupo I (1, 3, 5)
    *   **2024:** Grupo I (1, 2, 4, 5)

---

## 📌 Módulo 2: Interrupções, Timers e DMA
Gestão eficiente de dados e o cálculo obrigatório da taxa de transferência do DMA.

*   **Material de Estudo:** 
    *   `AC2-T-Aula03_04.pdf` (Transferência de informação, Interrupções e DMA)
    *   `AC2-T-Aula05.pdf` (Timers)
*   **Foco Principal:**
    *   **Interrupções:** Conceito de interrupções vetorizadas e *interrupt acknowledge*.
    *   **Timers:** Cascateamento de Timers (divisão de frequências).
    *   **DMA:** Sinais *BusRequest*/*BusGrant* e **cálculo da taxa de transferência em "modo bloco"** (Fórmula: `(Freq / Ciclos_por_BusCycle) * Bytes_do_barramento`).
*   **Questões de Treino:**
    *   **2023:** Grupo I (2, 4, 6) | Grupo II (24)
    *   **2024:** Grupo I (3, 6) | Grupo II (24)

---

## 📌 Módulo 3: Comunicação Série I (RS-232 / UART)
Conceitos de comunicações assíncronas ponto-a-ponto e tratamento de erros.

*   **Material de Estudo:** 
    *   `AC2-T-Aula07.pdf` (Conceitos gerais de sincronismo)
    *   `AC2-T-Aula09.pdf` (Interface RS-232C)
*   **Foco Principal:**
    *   Relógio implícito, explícito e codificado.
    *   Estrutura da trama (start, dados, paridade, stop).
    *   Erros: *Framing* e erros de fase cumulativos.
    *   *Device drivers*: Uso de FIFOs circulares e interrupções.
*   **Questões de Treino:**
    *   **2023:** Grupo I (7, 8, 9, 17) | Grupo II (29 - análise visual)
    *   **2024:** Grupo I (7, 8, 9, 16)

---

## 📌 Módulo 4: Comunicação Série II (SPI, I2C, CAN)
Redes, identificação de dispositivos e protocolos industriais.

*   **Material de Estudo:** 
    *   `AC2-T-Aula08.pdf` (SPI, I2C e introdução CAN)
*   **Foco Principal:**
    *   **SPI:** Topologia, Slave Select (SS) e relógio explícito.
    *   **I2C:** 1º byte (Endereço + R/W) e arbitragem bit a bit.
    *   **CAN:** *Bit stuffing*, cenários de aplicação e arbitragem (ID mais baixo ganha).
    *   **Cálculo:** Tempo de aquisição de múltiplos sensores (Frequência vs Total de bits).
*   **Questões de Treino:**
    *   **2023:** Grupo I (10 a 16) | Grupo II (27)
    *   **2024:** Grupo I (10 a 15) | Grupo II (27) e Grupo I (15 - Máscara/Filtro CAN)

---

## 📌 Módulo 5: Tecnologias de Memória e Caches
A base para a maioria das questões de cálculo do teste.

*   **Material de Estudo:** 
    *   `AC2-T-Aula10.pdf` (SRAM e DRAM)
    *   `AC2-T-Aula11.pdf` (Hierarquia e Caches)
*   **Foco Principal:**
    *   **SRAM/DRAM:** Design de módulos e refrescamento *RAS only*.
    *   **Caches (Teoria):** *Write-Through* vs *Write-Back* (*dirty bit*).
    *   **Caches (Cálculos):** Tag/Index/Offset, nº de comparadores (vias) e **Hit Ratio** ($T_{médio} = T_{cache} \cdot H + T_{mem} \cdot (1 - H)$).
*   **Questões de Treino:**
    *   **2023:** Grupo I (18, 19, 20, 21) | Grupo II (25, 26, 28, 30)
    *   **2024:** Grupo I (17, 18, 19, 20) | Grupo II (25, 26, 28)

---

## 📌 Módulo 6: Memória Virtual e Paginação
Tradução de endereços e gestão de memória pelo SO/Hardware.

*   **Material de Estudo:** 
    *   `AC2-T-Aula12_13.pdf` (Memória Virtual)
*   **Foco Principal:**
    *   Papel da MMU e o conceito de que cada processo tem a sua *Page Table*.
    *   VPN (Virtual Page Number) -> PPN (Physical Page Number).
    *   TLB (Translation Lookaside Buffer): Função de cache de traduções.
    *   **Cálculos:** Tamanho da Page Table e cálculo de endereços físicos a partir de virtuais.
*   **Questões de Treino:**
    *   **2023:** Grupo I (22, 23) | Grupo II (31, 32)
    *   **2024:** Grupo I (21, 22, 23)

---

### 💡 Dicas Finais
- **Padronização:** As questões de cálculo repetem-se quase ipsis verbis, mudando apenas os valores.
- **CAN:** Lembra-te que "0" é o bit dominante. IDs menores têm mais prioridade.
- **TRIS:** Pratica as máscaras de bits (`& ~` para limpar, `|` para ativar).
