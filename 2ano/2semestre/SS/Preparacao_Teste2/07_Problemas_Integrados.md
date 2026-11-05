# Problemas Integrados (A Cadeia Completa)

Estes exercícios ligam Metrologia, Conversão e Filtragem. É a estrutura típica de uma "pergunta grande" de exame.

---

## Exercício 1: Sistema de Monitorização Industrial
Um sensor de pressão é usado para monitorizar uma caldeira. O sensor tem as seguintes características:
*   **Gama:** $0$ a $200 \text{ kPa}$.
*   **Saída:** $0$ a $2 \text{ V}$.
*   **Dinâmica:** Constante de tempo $\tau = 100 \text{ ms}$.
*   **Ruído:** Afetado por interferência da rede elétrica ($50 \text{ Hz}$).

O sistema utiliza um ADC de 12 bits com $V_{ref} = [0, 5]\text{V}$.

**Alínea A (Metrologia/Dinâmica):** Se a pressão subir instantaneamente de $100$ para $150 \text{ kPa}$, quanto tempo demorará o sensor a indicar $147.5 \text{ kPa}$?
**Alínea B (ADC):** O sinal do sensor é amplificado com um ganho $G=2.5$ antes de entrar no ADC. Qual é a resolução do sistema em kPa/LSB?
**Alínea C (Filtragem/Z):** Para remover o ruído de $50 \text{ Hz}$, decide-se aplicar um filtro Notch digital. Sabendo que a frequência de amostragem é $f_s = 500 \text{ Hz}$, determine a localização (raio e ângulo) dos zeros e dos polos para um Notch com largura de banda de $5 \text{ Hz}$.
**Alínea D (Z/Estabilidade):** O filtro projetado tem a função $H(z)$. Se um dos polos fosse colocado em $z=1.05$, o que aconteceria ao sistema se fosse causal? Justifique.

<details>
<summary><b>Resolução</b></summary>

**Alínea A:**
1. Variação total ($\Delta P$) = $150 - 100 = 50 \text{ kPa}$.
2. Valor alvo acima do inicial = $147.5 - 100 = 47.5 \text{ kPa}$.
3. Percentagem da variação: $47.5 / 50 = 0.95$ (ou seja, atingir 95% do valor final).
4. Pela regra prática dos slides: $95\%$ corresponde a $3\tau$.
5. Tempo = $3 \times 100 \text{ ms} = 300 \text{ ms} = 0.3 \text{ segundos}$.

**Alínea B:**
1. Tensão máxima do sensor na entrada do ADC = $2 \text{ V} \times 2.5 = 5 \text{ V}$ (ajusta-se perfeitamente à $V_{ref}$).
2. $LSB_{V} = 5\text{V} / (2^{12} - 1) = 5 / 4095 \approx 1.22 \text{ mV}$.
3. Sensibilidade do sistema total: $S = \frac{5 \text{ V}}{200 \text{ kPa}} = 0.025 \text{ V/kPa} = 25 \text{ mV/kPa}$.
4. Resolução em kPa: $1.22 \text{ mV} / 25 \text{ mV/kPa} \approx 0.0488 \text{ kPa/LSB}$.

**Alínea C:**
1. Ângulo ($\theta$) para $50 \text{ Hz}$: $\theta = 2\pi (50/500) = 0.2\pi \text{ rad}$ (ou $36^\circ$).
2. Zeros: No círculo unitário para rejeição total: $z_{1,2} = 1 e^{\pm j0.2\pi}$.
3. Raio dos polos ($r$): $BW \approx \frac{(1-r)f_s}{\pi} \implies 5 = \frac{(1-r)500}{\pi} \implies 1-r = \frac{5\pi}{500} \approx 0.0314$.
4. $r = 1 - 0.0314 = 0.9686$.
5. Polos: $p_{1,2} = 0.9686 e^{\pm j0.2\pi}$.

**Alínea D:**
Se um polo estiver em $z=1.05$ ($|p| > 1$) e o sistema for causal, a ROC seria $|z| > 1.05$. Esta ROC não inclui o círculo unitário ($|z|=1$). Logo, o sistema seria **Instável**, com a saída a crescer exponencialmente até saturar.
</details>

---

## Exercício 2: Aquisição de Áudio Hi-Fi
Um sinal de áudio ($20 \text{ Hz}$ - $20 \text{ kHz}$) é adquirido para processamento.

**Alínea A (Conversão/SNR):** Para garantir que o ruído de quantização é inaudível, exige-se um SNR de pelo menos $90 \text{ dB}$. Quantos bits ($N$) deve ter o ADC, no mínimo?
**Alínea B (Nyquist/Aliasing):** Se usarmos um filtro anti-aliasing analógico com uma banda de transição larga, decide-se amostrar a $f_s = 96 \text{ kHz}$. Qual a frequência máxima que o filtro analógico deve deixar passar para garantir que não há aliasing na banda audível ($20 \text{ kHz}$)?
**Alínea C (Filtragem FIR):** Após a aquisição, aplica-se um filtro de Média Móvel de $M=10$ pontos para reduzir ruído térmico aleatório. Em quanto melhora o SNR (em dB) apenas devido a este filtro?
**Alínea D (Z/Implementação):** Escreva a equação recursiva (IIR) deste filtro de média móvel para que a implementação em código seja eficiente.

<details>
<summary><b>Resolução</b></summary>

**Alínea A:**
$90 = 6.02N + 1.76 \implies 88.24 = 6.02N \implies N = 14.65$.
Devem ser usados **15 ou 16 bits**.

**Alínea B:**
Pelo critério de Nyquist, frequências acima de $f_s/2 = 48 \text{ kHz}$ causam aliasing. Para proteger a banda de $20 \text{ kHz}$, qualquer sinal acima de $48 \text{ kHz}$ não pode "cair" abaixo dos $20 \text{ kHz}$ após o rebatimento.
O ponto crítico de rebatimento é $f_{alias} = f_s - f_{sinal}$.
$20 = 96 - f_{stop} \implies f_{stop} = 76 \text{ kHz}$.
O filtro deve atenuar fortemente tudo o que esteja acima de $76 \text{ kHz}$ (frequência de rejeição) para não corromper os $20 \text{ kHz}$ úteis.

**Alínea C:**
1. A redução de ruído aleatório num filtro de média móvel é de $\sqrt{M}$ em amplitude.
2. $\Delta SNR_{dB} = 20 \log_{10}(\sqrt{M}) = 10 \log_{10}(M)$.
3. Para $M=10$, o ganho é de $10 \log_{10}(10) = 10 \text{ dB}$.

**Alínea D:**
A equação recursiva geral é $y[n] = y[n-1] + \frac{1}{M}(x[n] - x[n-M])$.
Para $M=10$:
$y[n] = y[n-1] + 0.1(x[n] - x[n-10])$.
</details>
