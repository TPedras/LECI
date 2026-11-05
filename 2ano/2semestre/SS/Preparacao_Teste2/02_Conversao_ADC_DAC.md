# Exercícios de Conversão (ADCs e DACs)

## Fórmulas Úteis
*   **LSB:** $LSB = \frac{V_{ref}^+ - V_{ref}^-}{2^N - 1}$
*   **SNR Teórico de Quantização:** $SNR_{dB} = 6.02N + 1.76 \text{ dB}$
*   **Gama Dinâmica (DR):** $DR_{dB} = 6.02N + 1.76 \text{ dB}$
*   **Aumento de SNR com Sobreamostragem (OSR):** $\Delta SNR_{dB} = 10 \log_{10}(OSR)$
*   **Fator de Sobreamostragem (OSR):** $OSR = \frac{f_s}{2 \times f_{signal\_BW}}$
*   **Critério de Nyquist:** $f_s > 2 \times f_{max}$

---

## Exercício 1: Parâmetros Base de um ADC
Um sensor de temperatura produz uma saída entre $0.5 \text{ V}$ e $2.5 \text{ V}$ para uma gama térmica de $0^\circ\text{C}$ a $100^\circ\text{C}$. O sinal é ligado diretamente a um ADC de 10 bits operando com uma referência de tensão de $V_{ref}^+ = 3.3 \text{ V}$ e $V_{ref}^- = 0 \text{ V}$.

**Pergunta A:** Qual o valor do LSB deste ADC em milivolts?
**Pergunta B:** Qual a resolução da medição de temperatura em $^\circ\text{C}$ (quantos graus representa 1 LSB)?

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
1. Fórmula do LSB: $LSB = \frac{3.3 - 0}{2^{10} - 1} = \frac{3.3}{1023} \approx 0.00322 \text{ V} = 3.22 \text{ mV}$.

**Pergunta B:**
1. A sensibilidade do sensor é: $S = \frac{\Delta V}{\Delta T} = \frac{2.5 - 0.5}{100 - 0} = \frac{2.0}{100} = 0.02 \text{ V/}^\circ\text{C} = 20 \text{ mV/}^\circ\text{C}$.
2. A resolução em temperatura é o LSB dividido pela sensibilidade do sensor:
   $\Delta T = \frac{LSB}{S} = \frac{3.22 \text{ mV}}{20 \text{ mV/}^\circ\text{C}} \approx 0.161^\circ\text{C}$.
   Qualquer alteração de temperatura inferior a $0.161^\circ\text{C}$ não provocará uma mudança no código de saída do ADC.
</details>

---

## Exercício 2: SNR e Sobreamostragem
Pretende-se digitalizar um sinal de áudio com uma largura de banda de $20 \text{ kHz}$. Requer-se uma relação sinal-ruído (SNR) mínima de $100 \text{ dB}$. O sistema possui apenas um conversor ADC de 14 bits.

**Pergunta A:** Qual é o SNR teórico máximo que este ADC consegue fornecer sem sobreamostragem?
**Pergunta B:** Utilizando técnicas de sobreamostragem (oversampling) e decimação, qual a taxa de amostragem mínima ($f_s$) necessária para atingir os $100 \text{ dB}$ desejados?

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
1. Fórmula: $SNR_{base} = 6.02 \times 14 + 1.76 = 84.28 + 1.76 = 86.04 \text{ dB}$.

**Pergunta B:**
1. Aumento de SNR necessário: $\Delta SNR = 100 - 86.04 = 13.96 \text{ dB}$.
2. Qual o OSR que fornece este ganho? $10 \log_{10}(OSR) = 13.96 \implies \log_{10}(OSR) = 1.396 \implies OSR = 10^{1.396} \approx 24.88$.
   Como o OSR é normalmente uma potência de 2, escolhemos a potência superior mais próxima, por conveniência prática, ou pelo menos um valor que satisfaça a condição. Vamos usar $OSR = 25$ (ou 32 se formos puristas de design, mas matematicamente 25 serve).
3. Cálculo de $f_s$: A frequência de amostragem de Nyquist (sem OSR) seria $f_{Nyquist} = 2 \times 20 \text{ kHz} = 40 \text{ kHz}$.
   Com sobreamostragem: $f_s = OSR \times f_{Nyquist} = 24.88 \times 40 \text{ kHz} \approx 995.2 \text{ kHz}$ (praticamente $1 \text{ MHz}$).
</details>

---

## Exercício 3: Fator de Crista e Headroom
Um sinal tem um Fator de Crista (CF - Crest Factor) de $4$ (ou $12 \text{ dB}$). O valor nominal (RMS) do sinal é de $0.5 \text{ V}$.

**Pergunta:** Qual deve ser o valor de fundo de escala (Full Scale) do ADC para acomodar os picos deste sinal sem ocorrer saturação (clipping)?

<details>
<summary><b>Resolução</b></summary>
1. Fórmula do Fator de Crista: $CF = \frac{V_{peak}}{V_{RMS}}$.
2. Logo, $V_{peak} = CF \times V_{RMS} = 4 \times 0.5 \text{ V} = 2.0 \text{ V}$.
3. O ADC deve ter um fundo de escala (e.g. $V_{ref}$) de pelo menos $2.0 \text{ V}$ para garantir que a saturação não ocorre nos momentos de pico de amplitude. O Headroom necessário é a diferença entre o pico e o valor nominal (em log: $20\log_{10}(4) \approx 12 \text{ dB}$).
</details>
