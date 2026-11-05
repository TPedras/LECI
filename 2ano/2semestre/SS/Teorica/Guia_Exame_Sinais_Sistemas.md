# 📝 Guia para Folha de Fórmulas: Sinais e Sistemas

Este guia está organizado por blocos lógicos, otimizado para consulta rápida durante o exame.

---

## 1. Fundamentos Matemáticos (Números Complexos)
*   **Forma Retangular:** $z = a + bi$
*   **Forma Polar:** $z = r e^{j\theta} = r\angle\theta$
*   **Conversão $R \to P$:** $r = \sqrt{a^2 + b^2} \quad | \quad \theta = \arctan(b/a)$
*   **Conversão $P \to R$:** $a = r \cos(\theta) \quad | \quad b = r \sin(\theta)$
*   **Fórmula de Euler:** $e^{j\theta} = \cos(\theta) + j\sin(\theta)$
*   **Identidades Úteis:**
    *   $e^{j\pi} = -1$
    *   $e^{j\pi/2} = j$
    *   $e^{-j\pi/2} = -j$
    *   $e^{j2\pi} = 1$

---

## 2. Sistemas LTI e Convolução
*   **Fórmula da Convolução:** $y[n] = x[n] * h[n] = \sum_{k=-\infty}^{+\infty} x[k]h[n-k]$
*   **Propriedades:**
    *   **Tamanho da Saída:** Se $x$ tem tamanho $L$ e $h$ tem tamanho $M$, $y$ tem tamanho $L+M-1$.
    *   **Estabilidade (BIBO):** $\sum_{n=-\infty}^{+\infty} |h[n]| < \infty$
    *   **Causalidade:** $h[n] = 0$ para $n < 0$.
*   **Convolução com Impulso:** $x[n] * \delta[n-n_0] = x[n-n_0]$ (Deslocamento).

---

## 3. Amostragem e Nyquist
*   **Teorema de Nyquist:** $f_s > 2 \cdot f_{max}$
*   **Frequência de Nyquist:** $f_{nyq} = f_s / 2$
*   **Frequência Aparente (Aliasing):** $f_{app} = |f_s \cdot m - f_a|$ (onde $m$ é o inteiro mais próximo da razão $f_a/f_s$).
    *   *Regra simples:* Se $f_a > f_s/2$, o sinal "dobra" para trás a partir de $f_s$.
*   **Resolução Espectral:** $\Delta f = \frac{f_s}{N}$ (distância entre bins da DFT).

---

## 4. Transformada Discreta de Fourier (DFT)
*   **Análise (DFT):** $X[k] = \sum_{n=0}^{N-1} x[n] e^{-j\frac{2\pi}{N}nk}$
*   **Síntese (IDFT):** $x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] e^{j\frac{2\pi}{N}nk}$
*   **Componente DC ($k=0$):** $X[0] = \sum x[n]$ (Soma de todas as amostras).
*   **Simetria Conjugada (para $x[n]$ real):** $X[k] = X^*[N-k]$
*   **Teorema de Parseval:** $\sum |x[n]|^2 = \frac{1}{N} \sum |X[k]|^2$ (Energia).
*   **Dualidade:** Multiplicação no Tempo $\leftrightarrow$ Convolução na Frequência.

---

## 5. Filtros Digitais (FIR e IIR)
*   **Equação de Diferenças (IIR Geral):** $y[n] = \sum_{i=0}^{P} b_i x[n-i] + \sum_{j=1}^{Q} a_j y[n-j]$
*   **Filtro Média Móvel (MA):** $y[n] = \frac{1}{M} \sum_{k=0}^{M-1} x[n-k]$ (Atenua ruído por $\sqrt{M}$).
*   **Inversão Espectral (LP $\to$ HP):** $h_{hp}[n] = \delta[n] - h_{lp}[n]$
    *   *Na prática:* Inverter sinal de todos os termos e somar 1 ao termo central.
*   **Ganho em dB:** $G_{dB} = 20 \log_{10}(A_{out}/A_{in})$
    *   $-3\text{ dB} \approx 0.707$ (metade da potência).
    *   $-6\text{ dB} \approx 0.5$ (metade da amplitude).

---

## 6. Dicas de Ouro para o Exame
1.  **DFT de 4 pontos:** Os termos $e^{-j\frac{2\pi}{4}nk}$ são sempre $\{1, -j, -1, j\}$.
2.  **Sistemas em Cascata:** $H_{total}(z) = H_1(z) \cdot H_2(z)$ | Ganho Total(dB) = $G_1 + G_2$.
3.  **Sistemas em Paralelo:** $H_{total}(z) = H_1(z) + H_2(z)$.
4.  **Leakage:** Ocorre quando o sinal não é periódico na janela $N$ (não completa ciclos inteiros).
5.  **Padding de zeros:** Aumentar $N$ com zeros melhora a resolução visual (interpolação), mas **não** melhora a resolução espectral real ($\Delta f$).
