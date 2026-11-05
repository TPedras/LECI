# Exercícios de Filtros Digitais FIR e Windowed-Sinc

## Fórmulas Úteis
*   **Filtro de Média Móvel:** $y[i] = \frac{1}{M} \sum_{j=0}^{M-1} x[i+j]$ (ou fórmula simétrica).
*   **Resposta Impulsional do Windowed-Sinc (Passa-Baixo):**
    $$h[n] = K \frac{\sin(2\pi f_c (n - M/2))}{(n - M/2)\pi} \times w[n]$$
    *Onde $M$ é inteiro par. Em $n=M/2$, usa-se o limite $h[M/2] = 2\pi f_c K \times w[M/2]$.*
*   **Comprimento do Filtro vs. Largura de Banda de Transição ($BW$):** $M \approx \frac{4}{BW}$ (onde BW é uma fração de $f_s$, i.e. frequência normalizada).
*   **Inversão Espectral (Passa-Baixo $\to$ Passa-Alto):** $\delta[n] - h[n]$. (Inverter o sinal de todas as amostras do kernel original, exceto no centro, onde se deve somar 1).

---

## Exercício 1: Projeto de um Filtro Passa-Baixo Windowed-Sinc
Pretende-se projetar um filtro FIR Passa-Baixo para processar um sinal amostrado a $f_s = 2000 \text{ Hz}$.
**Requisitos:**
*   Frequência de corte: $f_{cutoff} = 300 \text{ Hz}$.
*   A banda de transição deve ser de, no máximo, $40 \text{ Hz}$.
*   Janela a usar: Hamming.

**Pergunta A:** Determine o valor adequado para a frequência de corte normalizada ($f_c$) e a ordem mínima ($M$) do filtro (garantindo que $M$ seja par).
**Pergunta B:** Escreva a expressão matemática para a componente "sinc" do núcleo do filtro. Não precisa de expandir a janela de Hamming, mas especifique o intervalo de $n$.

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
1. Frequência de corte normalizada: $f_c = \frac{300}{2000} = 0.15$.
2. Largura de banda de transição normalizada: $BW = \frac{40}{2000} = 0.02$.
3. Cálculo do comprimento $M$: Usando a fórmula empírica $M \approx \frac{4}{BW} = \frac{4}{0.02} = 200$.
   Como 200 é um número par, adotamos $M = 200$. O filtro terá $M+1 = 201$ coeficientes (amostras).

**Pergunta B:**
1. Expressão geral para a componente Sinc ideal deslocada:
   $h_{ideal}[n] = \frac{\sin(2\pi f_c (n - M/2))}{(n - M/2)\pi}$
2. Substituindo $f_c = 0.15$ e $M/2 = 100$:
   $h_{ideal}[n] = \frac{\sin(2\pi \times 0.15 (n - 100))}{(n - 100)\pi} = \frac{\sin(0.3\pi (n - 100))}{(n - 100)\pi}$
   O intervalo de índices será $0 \le n \le 200$.
   *(Nota: para obter a $h[n]$ final, multiplicar-se-ia isto pela equação da janela de Hamming para o mesmo intervalo de $n$, seguida da normalização de ganho $K$)*.
</details>

---

## Exercício 2: Inversão Espectral (Low-Pass para High-Pass)
Considere um filtro FIR passa-baixo muito curto projetado com $M=2$. Os coeficientes do kernel, já truncados e normalizados, são:
$$h_{LP} = \{ 0.25, 0.5, 0.25 \}$$
(índices $n=0, 1, 2$, sendo $n=1$ o centro de simetria).

**Pergunta:** Obtenha os coeficientes de um filtro Passa-Alto a partir da técnica de Inversão Espectral e explique o resultado em frequência (o que aconteceu à componente DC).

<details>
<summary><b>Resolução</b></summary>
1. A técnica de Inversão Espectral é definida matematicamente por: $h_{HP}[n] = \delta[n - M/2] - h_{LP}[n]$.
2. Ou seja, inverte-se o sinal de todos os coeficientes, e soma-se 1 ao coeficiente central.
   *   $n=0$: $h_{HP}[0] = 0 - 0.25 = -0.25$
   *   $n=1$: $h_{HP}[1] = 1 - 0.5 = 0.5$ (Este é o centro de simetria $M/2 = 1$)
   *   $n=2$: $h_{HP}[2] = 0 - 0.25 = -0.25$
3. **Novo Kernel Passa-Alto:** $h_{HP} = \{ -0.25, 0.5, -0.25 \}$.
4. **Análise de Frequência (DC):**
   A frequência DC corresponde a analisar o filtro aplicando um sinal constante, o que equivale a somar os coeficientes.
   Ganho DC Passa-Baixo = $0.25 + 0.5 + 0.25 = 1.0$ (Deixa passar DC).
   Ganho DC Passa-Alto = $-0.25 + 0.5 - 0.25 = 0.0$ (Rejeita perfeitamente DC).
</details>
