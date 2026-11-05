# Exercícios de Tópicos Complementares

## 1. Transformada de Z Inversa (Frações Parciais)
Este método é usado para decompor uma $X(z)$ complexa em somas de termos simples que constam na tabela do formulário.

**Exercício:**
Determine $x[n]$ para o sistema causal com:
$$X(z) = \frac{1}{(1 - 0.5z^{-1})(1 - 0.25z^{-1})}$$

<details>
<summary><b>Resolução</b></summary>
1. **Decomposição em Frações Parciais:**
   $\frac{1}{(1 - 0.5z^{-1})(1 - 0.25z^{-1})} = \frac{A}{1 - 0.5z^{-1}} + \frac{B}{1 - 0.25z^{-1}}$
2. **Cálculo de A (cobrir o termo de A e substituir $z^{-1} = 1/0.5 = 2$):**
   $A = \left. \frac{1}{1 - 0.25z^{-1}} \right|_{z^{-1}=2} = \frac{1}{1 - 0.25(2)} = \frac{1}{1 - 0.5} = 2$
3. **Cálculo de B (cobrir o termo de B e substituir $z^{-1} = 1/0.25 = 4$):**
   $B = \left. \frac{1}{1 - 0.5z^{-1}} \right|_{z^{-1}=4} = \frac{1}{1 - 0.5(4)} = \frac{1}{1 - 2} = -1$
4. **Reescrever $X(z)$:**
   $X(z) = \frac{2}{1 - 0.5z^{-1}} - \frac{1}{1 - 0.25z^{-1}}$
5. **Inversão pela Tabela:**
   Sabemos que $a^n u[n] \longleftrightarrow \frac{1}{1 - az^{-1}}$.
   **Resultado:** $x[n] = 2(0.5)^n u[n] - (0.25)^n u[n]$.
</details>

---

## 2. Realizações de Sistemas (Diagramas de Blocos)
Saber como $H(z)$ se transforma em hardware/software.

**Pergunta Teórica/Prática:**
Dada a função $H(z) = H_1(z) \cdot H_2(z)$, como se realiza o sistema? E se for $H(z) = H_1(z) + H_2(z)$?

<details>
<summary><b>Resposta</b></summary>
*   **Cascata (Série):** Se $H(z)$ for um produto de duas funções, os blocos são colocados em série. A saída de um é a entrada do outro.
*   **Paralela:** Se $H(z)$ for uma soma (resultado de frações parciais), a entrada $x[n]$ vai para ambos os blocos e as saídas são somadas no final.
*   **Forma Direta:** Usa os coeficientes da equação às diferenças diretamente com atrasos ($z^{-1}$), multiplicadores e somadores.
</details>

---

## 3. Dinâmica de Sensores (Tempo de Resposta)
Focado na resposta ao degrau de 1ª ordem: $y(t) = y_{final}(1 - e^{-t/\tau})$.

**Exercício:**
Um sensor de temperatura tem uma constante de tempo $\tau = 5 \text{ segundos}$.
**Pergunta:** Se o sensor for mergulhado subitamente em água a $100^\circ\text{C}$ (partindo de $20^\circ\text{C}$), quanto tempo demorará até que a leitura atinja $96^\circ\text{C}$?

<details>
<summary><b>Resolução</b></summary>
1. Identificar valores: $y_{final} = 100 - 20 = 80^\circ\text{C}$ (variação total). O valor alvo é $96 - 20 = 76^\circ\text{C}$ acima do inicial.
2. Usar a fórmula: $76 = 80(1 - e^{-t/5})$
3. Isolar o termo exponencial:
   $\frac{76}{80} = 1 - e^{-t/5} \implies 0.95 = 1 - e^{-t/5} \implies e^{-t/5} = 0.05$
4. Aplicar logaritmo natural ($\ln$):
   $-t/5 = \ln(0.05) \implies -t/5 \approx -2.996$
5. Calcular $t$:
   $t = 5 \times 2.996 \approx 15 \text{ segundos}$.
   *(Nota: Repara que $15s$ é exatamente $3\tau$. Como vimos nos slides, $3\tau$ corresponde a 95% da variação final, o que bate certo com os nossos cálculos).*
</details>

---

## 4. Questões Teóricas Rápidas (Checklist)
*   **Arquitetura Flash:** É a mais rápida (atraso de apenas 1 comparador) mas consome muita energia e área.
*   **Sigma-Delta:** Usa sobreamostragem e "noise shaping" para empurrar o ruído para frequências altas. Ideal para áudio (alta resolução).
*   **SAR:** Equilibrada, muito comum em microcontroladores (Arduino/ESP32). Usa pesquisa binária bit-a-bit.
*   **Ponto Fixo (Q15):** Usado em processadores sem unidade de vírgula flutuante (FPU) para ganhar velocidade, mas requer cuidado com o *overflow*.
