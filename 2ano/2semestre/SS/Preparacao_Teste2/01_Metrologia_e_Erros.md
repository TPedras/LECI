# Exercícios de Metrologia e Tratamento de Erros

## Fórmulas Úteis
*   **Erro de Quantização (Máximo):** $\pm \frac{1}{2} LSB$
*   **Desvio Máximo de Linearidade:** $\frac{\text{Desvio máx.}}{\text{Escala total}} \times 100\%$
*   **Propagação de Erro Determinístico:** $\Delta y = \sum_i \left| \frac{\partial f}{\partial x_i} \right| |\Delta x_i|$
*   **Propagação de Erro Aleatório:** $s_y^2 = \left(\frac{\partial f}{\partial x_1}\right)^2 s_{x_1}^2 + \left(\frac{\partial f}{\partial x_2}\right)^2 s_{x_2}^2 + \dots$
*   **Orçamento de Erro (Root Sum Square - RSS):** $\sigma_{total} = \sqrt{\sigma_1^2 + \sigma_2^2 + \dots}$
*   **Probabilidade Normal:** $\eta = \frac{x - \mu}{\sigma}$. $F_X(x) = \Phi(\eta)$

---

## Exercício 1: Propagação de Erros
A potência dissipada por uma resistência é calculada medindo a tensão ($V$) e a corrente ($I$), usando a fórmula $P = V \cdot I$.
Sabe-se que:
*   $V = 10.0 \text{ V}$ com um desvio padrão (erro aleatório) $s_V = 0.1 \text{ V}$.
*   $I = 2.0 \text{ A}$ com um desvio padrão (erro aleatório) $s_I = 0.05 \text{ A}$.

**Pergunta:** Qual é o valor da potência calculada e a sua respetiva incerteza padrão (erro aleatório)?

<details>
<summary><b>Resolução</b></summary>
1. **Valor calculado:** $P = 10.0 \times 2.0 = 20.0 \text{ W}$.
2. **Propagação de Erro Aleatório:**
   A fórmula é $s_P = \sqrt{ \left(\frac{\partial P}{\partial V}\right)^2 s_V^2 + \left(\frac{\partial P}{\partial I}\right)^2 s_I^2 }$
   Derivadas parciais:
   $\frac{\partial P}{\partial V} = I = 2.0$
   $\frac{\partial P}{\partial I} = V = 10.0$
3. **Cálculo:**
   $s_P = \sqrt{ (2.0)^2 (0.1)^2 + (10.0)^2 (0.05)^2 } = \sqrt{ 4 \times 0.01 + 100 \times 0.0025 } = \sqrt{ 0.04 + 0.25 } = \sqrt{0.29} \approx 0.538 \text{ W}$.
   **Resultado:** $P = 20.0 \pm 0.54 \text{ W}$.
</details>

---

## Exercício 2: Orçamento de Erro (RSS) e Lei Normal
Um sistema de medição de pressão tem as seguintes fontes independentes de erro aleatório especificadas em % do Fundo de Escala (FS):
*   Exatidão do sensor: $\sigma_1 = 0.2\%$
*   Ruído do amplificador: $\sigma_2 = 0.1\%$
*   Erro de conversão (ADC): $\sigma_3 = 0.05\%$

A pressão medida é de $50 \text{ kPa}$ e a gama total do sistema é de $100 \text{ kPa}$.
**Pergunta A:** Calcule a incerteza total do sistema em kPa (com nível de confiança de $1\sigma$).
**Pergunta B:** Qual a probabilidade do valor real da pressão estar entre $49.5 \text{ kPa}$ e $50.5 \text{ kPa}$? (Use a tabela da normal do formulário).

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
1. Usando a regra RSS: $\sigma_{total\_\%} = \sqrt{0.2^2 + 0.1^2 + 0.05^2} = \sqrt{0.04 + 0.01 + 0.0025} = \sqrt{0.0525} \approx 0.229\%$.
2. Incerteza absoluta: $\sigma_{total} = 0.229\% \text{ de } 100 \text{ kPa} = 0.229 \text{ kPa}$.

**Pergunta B:**
1. Intervalo desejado: $\pm 0.5 \text{ kPa}$ em torno da média de $50 \text{ kPa}$.
2. Quantos $\sigma$ isto representa? $k = \frac{0.5}{\sigma_{total}} = \frac{0.5}{0.229} \approx 2.18$.
3. Consultando a tabela de $P[x \in \mathcal{V}_{k\sigma}(\mu)]$:
   Para $k=2$, $P = 0.955$ (95.5%).
   Para $k=3$, $P = 0.997$ (99.7%).
   Como $k=2.18$, a probabilidade é superior a 95.5%, estimando-se que seja muito alta (a maior parte da "nuvem" de erros está contida num raio de $2.18\sigma$).
</details>

---

## Exercício 3: Erro Determinístico
Considere a medição da distância através de ultrassons: $d = \frac{t}{2} c$, com $c = 343 \text{ m/s}$.
Se o temporizador tiver um erro sistemático (atraso fixo) de $\Delta t = +2 \text{ ms}$, qual será o erro introduzido na medição da distância?

<details>
<summary><b>Resolução</b></summary>
1. Fórmula do erro determinístico: $\Delta d = \frac{\partial d}{\partial t} \Delta t$.
2. Derivada: $\frac{\partial d}{\partial t} = \frac{c}{2} = \frac{343}{2} = 171.5 \text{ m/s}$.
3. Cálculo do erro (ter em atenção as unidades! $2 \text{ ms} = 0.002 \text{ s}$):
   $\Delta d = 171.5 \times 0.002 = 0.343 \text{ metros}$.
   O sistema apresentará uma medição $34.3 \text{ cm}$ maior do que o valor real. Sendo um erro sistemático, pode ser calibrado subtraindo este valor às leituras.
</details>
