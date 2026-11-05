# Exercícios de Projeto de Filtros por Polos e Zeros

## Fórmulas Úteis
*   **Frequência associada a um polo/zero:** A frequência analógica $f_0$ é convertida num ângulo $\theta$ no plano Z via $\theta = 2\pi \frac{f_0}{f_s}$.
*   **Pares complexos conjugados:** Um polo em $\theta$ implica outro em $-\theta$ (para garantir coeficientes reais). $p_{1,2} = r e^{\pm j\theta}$.
*   **Largura de Banda (-3dB) de um ressoador (Passa-Banda ou Polo Único):** $BW_{Hz} \approx \frac{(1-r)f_s}{\pi}$
*   **Fator de Qualidade (Q):** $Q = \frac{f_0}{BW}$
*   **Resposta de Filtro Passa-Baixo (2ª Ordem):** $H(z) = K \frac{(z+1)^2}{(z-p_1)(z-p_2)}$. Os zeros estão colocados em $z=-1$ (Nyquist).
*   **Resposta de Filtro Notch:** Zeros na circunferência ($r_z = 1$) em $\pm \theta$. Polos logo "atrás" dos zeros ($r_p \approx 0.9$ a $0.99$) no mesmo ângulo $\pm \theta$.

---

## Exercício 1: Projeto de Filtro Passa-Baixo de 2ª Ordem
Pretende-se projetar um filtro digital Passa-Baixo para atenuar ruído de alta frequência num sistema com taxa de amostragem $f_s = 500 \text{ Hz}$. A frequência de corte desejada ($f_c$) é de $50 \text{ Hz}$. Pretende-se uma transição não muito acentuada, pelo que se vai definir o raio dos polos como $r = 0.8$.

**Pergunta A:** Determine a posição no plano Z dos zeros necessários para este filtro (justificando).
**Pergunta B:** Determine a posição polar (raio e ângulo) dos pares de polos complexos conjugados.
**Pergunta C:** Escreva a função de transferência fatorizada $H(z)$ omitindo o valor de $K$.

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
Um filtro Passa-Baixo tem como objetivo atenuar ao máximo as altas frequências, sendo a mais alta possível a frequência de Nyquist ($f_s/2 = 250\text{Hz}$). A frequência de Nyquist corresponde ao ângulo $\theta = \pi$ ou ao ponto $z = -1$.
Para uma atenuação forte, usamos um zero duplo (pois é 2ª ordem) nesse ponto: $z_1 = z_2 = -1$.

**Pergunta B:**
1. Ângulo dos polos baseado na frequência de corte: $\theta = 2\pi \frac{f_c}{f_s} = 2\pi \frac{50}{500} = \frac{2\pi}{10} = \frac{\pi}{5} \text{ rad}$ (ou $36^\circ$).
2. Raio dado: $r = 0.8$.
3. Polos complexos conjugados: $p_{1,2} = 0.8 e^{\pm j \frac{\pi}{5}}$.

**Pergunta C:**
Forma fatorizada: $H(z) = K \frac{(z - z_1)(z - z_2)}{(z - p_1)(z - p_2)}$
$$H(z) = K \frac{(z - (-1))^2}{(z - 0.8 e^{j\frac{\pi}{5}})(z - 0.8 e^{-j\frac{\pi}{5}})} = K \frac{(z + 1)^2}{(z - p_1)(z - p_2)}$$
</details>

---

## Exercício 2: Projeto de um Filtro Notch (Rejeita-Banda)
Num sistema de monitorização de ECG amostrado a $f_s = 1000 \text{ Hz}$, há uma interferência muito forte e perfeitamente periódica aos $50 \text{ Hz}$ proveniente da rede elétrica. A largura da banda rejeitada deve ser de $20 \text{ Hz}$.

**Pergunta A:** Onde devem ser colocados os **zeros** do filtro (em representação polar) para que a rejeição aos $50 \text{ Hz}$ seja absoluta (infinita)?
**Pergunta B:** Determine o raio $r$ dos **polos** usando a aproximação sugerida pelas fórmulas, sabendo que os polos devem ter o mesmo ângulo dos zeros.

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
1. Para uma rejeição de $-\infty \text{ dB}$ (nulo perfeito), os zeros devem estar posicionados exatamente em cima do círculo unitário ($r=1$).
2. O ângulo corresponde à frequência da interferência: $\theta = 2\pi \frac{50}{1000} = \frac{2\pi}{20} = \frac{\pi}{10} \text{ rad}$.
3. Os dois zeros serão: $z_{1,2} = 1 e^{\pm j\frac{\pi}{10}}$.

**Pergunta B:**
1. É dada a largura de banda (Notch "gap"): $BW = 20 \text{ Hz}$.
2. A fórmula de relação do raio com a largura de banda é: $BW \approx \frac{(1-r)f_s}{\pi}$.
3. Isolando $r$:
   $20 = \frac{(1-r) \times 1000}{\pi} \implies 20\pi = 1000(1-r)$
   $1-r = \frac{20\pi}{1000} \implies 1-r \approx 0.0628$
   $r = 1 - 0.0628 = 0.9372$.
4. Os polos serão colocados no interior do círculo para garantir estabilidade, logo "atrás" dos zeros: $p_{1,2} = 0.9372 e^{\pm j\frac{\pi}{10}}$.
</details>

---

## Exercício 3: Normalização de Ganho
Dado o sistema $H(z) = K \frac{z^2}{z^2 - 0.5z + 0.8}$. Pretende-se que este seja um filtro em que a zona plana não tenha qualquer alteração de amplitude a frequência zero (DC).

**Pergunta:** Qual deve ser o valor de $K$?

<details>
<summary><b>Resolução</b></summary>
1. A frequência zero (DC) no domínio contínuo equivale à posição $z=1$ no círculo unitário (pois $\theta = 2\pi \frac{0}{f_s} = 0$, e $e^{j0} = 1$).
2. Para que não haja alteração de amplitude, o ganho deve ser unitário: $|H(1)| = 1$.
3. Substituindo $z=1$ na função:
   $1 = K \left| \frac{1^2}{1^2 - 0.5(1) + 0.8} \right|$
   $1 = K \left| \frac{1}{1 - 0.5 + 0.8} \right|$
   $1 = K \frac{1}{1.3}$
4. Resulta que $K = 1.3$.
</details>