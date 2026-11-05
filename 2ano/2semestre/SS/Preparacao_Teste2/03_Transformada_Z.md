# Exercícios de Transformada de Z

## Fórmulas Úteis
*   **Equação às Diferenças para $H(z)$:** Atrasos no tempo ($y[n-k]$ ou $x[n-k]$) transformam-se em potências negativas de $z$ ($z^{-k}$). A função de transferência é $H(z) = \frac{Y(z)}{X(z)}$.
*   **Polos e Zeros:** As raízes do numerador são os **zeros** ($z_i$); as raízes do denominador são os **polos** ($p_i$).
*   **Causalidade:** O sistema é causal se a Região de Convergência (ROC) for o exterior de um círculo definido pelo polo de maior magnitude. $N_{polos} \ge N_{zeros}$.
*   **Estabilidade:** O sistema é estável se (e só se) a Região de Convergência (ROC) **incluir o círculo unitário** ($|z| = 1$). Em sistemas causais, isto implica que *todos* os polos devem estar dentro do círculo unitário ($|p_i| < 1$).

---

## Exercício 1: Determinação de H(z) a partir de uma Equação às Diferenças
Considere um sistema LTI descrito pela seguinte eqVuação às diferenças:
$$y[n] - 0.5y[n-1] = x[n] + 0.25x[n-2]$$

**Pergunta A:** Determine a função de transferência do sistema $H(z)$.
**Pergunta B:** Determinea a localização dos polos e zeros deste sistema no plano $Z$.

<details>
<summary><b>Resolução</b></summary>
**Pergunta A:**
1. Aplicar a Transformada Z a ambos os lados da equação:
   $Y(z) - 0.5z^{-1}Y(z) = X(z) + 0.25z^{-2}X(z)$
2. Isolar $Y(z)$ e $X(z)$:
   $Y(z)[1 - 0.5z^{-1}] = X(z)[1 + 0.25z^{-2}]$
3. Obter a função de transferência $H(z) = \frac{Y(z)}{X(z)}$:
   $H(z) = \frac{1 + 0.25z^{-2}}{1 - 0.5z^{-1}}$
4. Para facilitar a determinação de polos e zeros, multiplicamos o numerador e o denominador por $z^2$ (a maior potência de atraso):
   $H(z) = \frac{z^2(1 + 0.25z^{-2})}{z^2(1 - 0.5z^{-1})} = \frac{z^2 + 0.25}{z^2 - 0.5z} = \frac{z^2 + 0.25}{z(z - 0.5)}$

**Pergunta B:**
1. **Zeros (Raízes do Numerador):**
   $z^2 + 0.25 = 0 \implies z^2 = -0.25 \implies z = \pm\sqrt{-0.25} \implies z = \pm j0.5$.
   Existem dois zeros puramente imaginários: $z_1 = j0.5$ e $z_2 = -j0.5$.
2. **Polos (Raízes do Denominador):**
   $z(z - 0.5) = 0 \implies z = 0$ ou $z = 0.5$.
   Existem dois polos reais: $p_1 = 0$ e $p_2 = 0.5$.
</details>

---

## Exercício 2: ROC, Estabilidade e Causalidade
Dado o sistema caracterizado pela função de transferência:
$$H(z) = \frac{z}{z - 1.2}$$

O sistema tem um polo em $z = 1.2$.
**Pergunta:** Discuta a estabilidade e a causalidade deste sistema com base na Região de Convergência (ROC). Especifique as ROCs possíveis e as suas implicações.

<details>
<summary><b>Resolução</b></summary>
Um pólo em $z=1.2$ divide o plano em duas possíveis ROCs:
**Hipótese 1: Sistema Causal**
Para um sistema ser causal, a ROC tem de ser o exterior do círculo definido pelo polo mais externo.
*   **ROC:** $|z| > 1.2$
*   **Estabilidade:** O círculo unitário ($|z|=1$) **NÃO** está contido nesta ROC. Logo, se o sistema for assumido como causal, ele será **instável**. O polo encontra-se no exterior do círculo unitário.

**Hipótese 2: Sistema Anticausal (Lateral Esquerda)**
Para um sistema ter o círculo unitário na sua ROC, a ROC tem de ser para dentro do polo.
*   **ROC:** $|z| < 1.2$
*   **Estabilidade:** O círculo unitário ($|z|=1$) **ESTÁ** contido nesta ROC. Logo, o sistema é **estável**. No entanto, devido à forma da ROC, o sistema não depende apenas de amostras passadas, mas de amostras futuras (é não-causal/anticausal). Em aplicações de hardware em tempo real isto é impossível de implementar, mas pode ser feito em processamento offline.
</details>
