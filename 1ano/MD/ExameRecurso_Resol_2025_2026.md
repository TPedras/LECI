# Resolução do Exame de Recurso de Matemática Discreta
**Ano Letivo: 2025/2026**  
**Data: 08 de Julho de 2026**  
**Curso: LECI (1º Ano / 2º Semestre)**  
**Universidade de Aveiro**

---

## Questão 1
> **Enunciado:**
> Assuma os seguintes factos no universo (domínio) dos Humanos:
> (a) Toda a pessoa gosta de alguém.
> (b) Há uma pessoa que gosta de todas as pessoas.
> 
> Traduza os factos através de fórmulas bem formadas da lógica de primeira ordem recorrendo aos seguintes predicados:
> $\text{Pessoa}(x)$: "$x$ é pessoa"; $\text{Gosta}(x,y)$: "$x$ gosta de $y$".

### Resolução:

Dependendo da interpretação formal do domínio (universo de discurso):

#### Abordagem A (Considerando que o domínio de discurso já é o conjunto dos Humanos)
Se o domínio $U$ é o conjunto de todos os Humanos, qualquer variável $x, y$ já representa obrigatoriamente um ser humano (pessoa). O predicado $\text{Pessoa}(x)$ é assim universalmente verdadeiro no domínio:
*   **(a)** $\forall x \, \exists y \, \text{Gosta}(x,y)$
*   **(b)** $\exists x \, \forall y \, \text{Gosta}(x,y)$

#### Abordagem B (Considerando um domínio geral com especificação explícita do predicado $\text{Pessoa}$)
Como o enunciado pede explicitamente a utilização dos predicados fornecidos (incluindo $\text{Pessoa}(x)$), a tradução canónica por restrição de tipo é:
*   **(a) "Toda a pessoa gosta de alguém":**
    $$\forall x \, (\text{Pessoa}(x) \rightarrow \exists y \, (\text{Pessoa}(y) \wedge \text{Gosta}(x,y)))$$
*   **(b) "Há uma pessoa que gosta de todas as pessoas":**
    $$\exists x \, (\text{Pessoa}(x) \wedge \forall y \, (\text{Pessoa}(y) \rightarrow \text{Gosta}(x,y)))$$

*(Ambas as abordagens são comuns em critérios de correção da UA; apresentar a Abordagem B garante a pontuação total caso o corretor exija o uso estrito de todos os predicados listados no enunciado).*

---

## Questão 2
> **Enunciado:**
> Considere uma linguagem de primeira ordem com os símbolos de predicado $P$, $R$ e $S$ de um argumento e $Q$ de dois argumentos, sendo $x$ e $y$ símbolos de variáveis, com as seguintes fórmulas:
> *   $F_1 \equiv \forall x \forall y \, ((P(y) \wedge Q(x,y)) \rightarrow R(x))$
> *   $F_2 \equiv \forall x \, (S(x) \rightarrow \exists y \, (P(y) \wedge Q(x,y)))$
> *   $F_3 \equiv \forall x \, (S(x) \rightarrow R(x))$
> 
> Usando o método de resolução mostre que $F_3$ é consequência lógica de $F_1$ e $F_2$. Justifique devidamente.  
> *[Note que as cláusulas necessárias para aplicar o método de resolução devem conter variáveis distintas.]*

### Resolução:

Para provar que $\{F_1, F_2\} \models F_3$ pelo método de resolução, devemos mostrar por refutação que o conjunto $\{F_1, F_2, \neg F_3\}$ é insatisfatível.

#### Passo 1: Conversão para a Forma Normal Cláusula (com variáveis distintas)

1.  **Fórmula $F_1$:**
    $$F_1 \equiv \forall x \forall y \, ((P(y) \wedge Q(x,y)) \rightarrow R(x))$$
    Eliminando a implicação e aplicando De Morgan:
    $$F_1 \equiv \forall x \forall y \, (\neg P(y) \vee \neg Q(x,y) \vee R(x))$$
    Eliminando os quantificadores universais e indexando as variáveis:
    $$\mathcal{C}_1: \neg P(y_1) \vee \neg Q(x_1, y_1) \vee R(x_1)$$

2.  **Fórmula $F_2$:**
    $$F_2 \equiv \forall x \, (S(x) \rightarrow \exists y \, (P(y) \wedge Q(x,y)))$$
    Eliminando a implicação:
    $$F_2 \equiv \forall x \, (\neg S(x) \vee \exists y \, (P(y) \wedge Q(x,y)))$$
    Movendo o quantificador existencial para a frente:
    $$F_2 \equiv \forall x \, \exists y \, (\neg S(x) \vee (P(y) \wedge Q(x,y)))$$
    Skolemização de $y$ (como $\exists y$ está sob o escopo de $\forall x$, $y = f(x)$):
    $$\forall x \, (\neg S(x) \vee (P(f(x)) \wedge Q(x, f(x))))$$
    Distribuindo $\vee$ sobre $\wedge$:
    $$(\neg S(x) \vee P(f(x))) \wedge (\neg S(x) \vee Q(x, f(x)))$$
    **Padronização de variáveis distintas em cada cláusula** (conforme a nota do enunciado):
    $$\mathcal{C}_2: \neg S(x_2) \vee P(f(x_2))$$
    $$\mathcal{C}_3: \neg S(x_3) \vee Q(x_3, f(x_3))$$

3.  **Fórmula $\neg F_3$:**
    $$\neg F_3 \equiv \neg \forall x \, (S(x) \rightarrow R(x)) \equiv \exists x \, (S(x) \wedge \neg R(x))$$
    Skolemização de $x$ (constante de Skolem $a$, pois não há quantificadores universais precedentes):
    $$S(a) \wedge \neg R(a)$$
    Resulta nas cláusulas unitárias:
    $$\mathcal{C}_4: S(a)$$
    $$\mathcal{C}_5: \neg R(a)$$

---

#### Passo 2: Dedução da Cláusula Vazia ($\square$) por Resolução

Conjunto de cláusulas de partida:
1. $\mathcal{C}_1: \neg P(y_1) \vee \neg Q(x_1, y_1) \vee R(x_1)$
2. $\mathcal{C}_2: \neg S(x_2) \vee P(f(x_2))$
3. $\mathcal{C}_3: \neg S(x_3) \vee Q(x_3, f(x_3))$
4. $\mathcal{C}_4: S(a)$
5. $\mathcal{C}_5: \neg R(a)$

Passos de resolução:
*   **Entre $\mathcal{C}_2$ e $\mathcal{C}_4$:**
    *   Unificador mais geral: $\theta_1 = \{a / x_2\}$
    *   Resolvente:
        $$\mathcal{C}_6: P(f(a))$$

*   **Entre $\mathcal{C}_3$ e $\mathcal{C}_4$:**
    *   Unificador mais geral: $\theta_2 = \{a / x_3\}$
    *   Resolvente:
        $$\mathcal{C}_7: Q(a, f(a))$$

*   **Entre $\mathcal{C}_1$ e $\mathcal{C}_6$:**
    *   Unificador mais geral: $\theta_3 = \{f(a) / y_1\}$
    *   Resolvente:
        $$\mathcal{C}_8: \neg Q(x_1, f(a)) \vee R(x_1)$$

*   **Entre $\mathcal{C}_8$ e $\mathcal{C}_7$:**
    *   Unificador mais geral: $\theta_4 = \{a / x_1\}$
    *   Resolvente:
        $$\mathcal{C}_9: R(a)$$

*   **Entre $\mathcal{C}_9$ e $\mathcal{C}_5$:**
    *   Unificador mais geral: $\emptyset$
    *   Resolvente:
        $$\mathcal{C}_{10}: \square \quad (\text{Cláusula Vazia})$$

Conclusão: Sendo derivada a cláusula vazia $\square$, o conjunto $\{F_1, F_2, \neg F_3\}$ é insatisfatível, logo fica demonstrado que $F_1, F_2 \models F_3$.

---

## Questão 3
> **Enunciado:**
> Num grupo constituído por 22 turistas, 10 são espanhóis e os restantes 12 são portugueses, não existindo indivíduos com dupla nacionalidade nem de qualquer outra nacionalidade.
> 
> (a) Quantos grupos de 6 indivíduos é possível escolher de entre os 22 turistas para visitar um dado local, de modo a garantir que em cada um desses grupos (de 6 indivíduos diferentes) estão pelo menos 2 espanhóis e 2 portugueses? Justifique.
> 
> (b) O grupo de 22 turistas pretende visitar 4 locais, cada um deles apenas visitável com, no mínimo, 4 turistas. Determine o número de possibilidades de distribuir os 22 turistas pelos 4 locais tendo apenas em conta o número de visitantes por local. Justifique devidamente.  
> *[Note que, cada possibilidade de distribuição pode ser representada por um 4-uplo. Por exemplo, (4,4,6,8), (6,4,8,4), (5,6,6,5), (7,6,4,5), correspondem a 4 possibilidades de distribuição.]*

### Resolução:

#### Alínea (a)
Pretende-se formar um grupo de 6 pessoas com $E \ge 2$ espanhóis e $P \ge 2$ portugueses, onde $E + P = 6$.
As partições possíveis são:
1.  **$E=2, P=4$:** $\binom{10}{2} \times \binom{12}{4} = 45 \times 495 = 22\,275$
2.  **$E=3, P=3$:** $\binom{10}{3} \times \binom{12}{3} = 120 \times 220 = 26\,400$
3.  **$E=4, P=2$:** $\binom{10}{4} \times \binom{12}{2} = 210 \times 66 = 13\,860$

Total de grupos possíveis:
$$\text{Total} = 22\,275 + 26\,400 + 13\,860 = 62\,535$$

*(Verificação por contagem complementar: $\binom{22}{6} - \left[\binom{10}{0}\binom{12}{6} + \binom{10}{1}\binom{12}{5} + \binom{10}{5}\binom{12}{1} + \binom{10}{6}\binom{12}{0}\right] = 74\,613 - [924 + 7\,920 + 3\,024 + 210] = 74\,613 - 12\,078 = 62\,535$).*

---

#### Alínea (b)
Trata-se de encontrar o número de 4-uplos ordenados $(x_1, x_2, x_3, x_4)$ de inteiros tais que:
$$x_1 + x_2 + x_3 + x_4 = 22, \quad \text{com } x_i \ge 4 \text{ para todo } i \in \{1, 2, 3, 4\}$$

Definindo $y_i = x_i - 4 \ge 0$:
$$y_1 + y_2 + y_3 + y_4 = 22 - 4 \times 4 = 6$$

O número de soluções inteiras não-negativas é dado por combinações com repetição de 4 elementos 6 a 6:
$$\binom{4 + 6 - 1}{6} = \binom{9}{6} = \binom{9}{3} = \frac{9 \times 8 \times 7}{3 \times 2 \times 1} = 84 \text{ possibilidades.}$$

---

## Questão 4
> **Enunciado:**
> Determine a equação de recorrência linear homogénea que tem como raízes características $1$ com multiplicidade $2$ e $-1$ com multiplicidade $1$, e obtenha a solução dessa equação de recorrência que satisfaz as condições iniciais $a_0 = 0$, $a_1 = 3$ e $a_2 = 2$.

### Resolução:

1.  **Equação de recorrência:**
    O polinómio característico associado às raízes dadas é:
    $$P(r) = (r - 1)^2 (r + 1) = (r^2 - 2r + 1)(r + 1) = r^3 - r^2 - r + 1$$
    A equação característica é $r^3 - r^2 - r + 1 = 0$, que corresponde à relação de recorrência linear homogénea:
    $$a_n - a_{n-1} - a_{n-2} + a_{n-3} = 0 \quad (\text{ou } a_n = a_{n-1} + a_{n-2} - a_{n-3}), \quad n \ge 3$$

2.  **Forma da solução geral:**
    Pela multiplicidade das raízes:
    $$a_n = (\alpha + \beta n) \cdot 1^n + \gamma \cdot (-1)^n = \alpha + \beta n + \gamma (-1)^n$$

3.  **Condições iniciais:**
    *   $n=0$: $a_0 = \alpha + \gamma = 0 \implies \gamma = -\alpha$
    *   $n=1$: $a_1 = \alpha + \beta - \gamma = 3 \implies 2\alpha + \beta = 3$
    *   $n=2$: $a_2 = \alpha + 2\beta + \gamma = 2 \implies 2\beta = 2 \implies \beta = 1$

    Com $\beta = 1$:
    $$2\alpha + 1 = 3 \implies \alpha = 1 \implies \gamma = -1$$

4.  **Solução particular:**
    $$a_n = 1 + n - (-1)^n, \quad n \ge 0$$

---

## Questão 5
> **Enunciado:**
> Considere o problema da determinação do número de possibilidades de distribuir $n$ bolas de futebol iguais por 5 adeptos de uma dada equipa, tendo em conta que cada adepto recebe pelo menos uma bola. Mostre que a função geradora ordinária associada à solução do problema é dada por
> $$\mathcal{F}(x) = \frac{x^5}{(1-x)^5}$$

### Resolução:

Queremos o número de soluções de $c_1 + c_2 + c_3 + c_4 + c_5 = n$ com $c_i \ge 1$ para $i=1,\dots,5$.
A função geradora associada a cada um dos adeptos (que pode receber $1, 2, 3, \dots$ bolas) é:
$$f(x) = x^1 + x^2 + x^3 + \dots = \sum_{k=1}^{\infty} x^k = x \sum_{k=0}^{\infty} x^k = \frac{x}{1-x} \quad (|x| < 1)$$

Pela independência da distribuição das bolas entre os 5 adeptos, a função geradora ordinária conjunta $\mathcal{F}(x)$ é o produto das 5 funções geradoras individuais:
$$\mathcal{F}(x) = (f(x))^5 = \left(\frac{x}{1-x}\right)^5 = \frac{x^5}{(1-x)^5}$$
como se pretendia demonstrar.

---

## Questão 6
> **Enunciado:**
> Considere o grafo $G = (V,E)$ com custos positivos nas arestas representado por
> *(Grafo com os 8 vértices $A, B, C, D, E, F, G, H$)*
> 
> (a) Aplicando o algoritmo de Prim determine uma árvore abrangente de custo mínimo, $T$, para $G$. Inicie o algoritmo escolhendo o vértice $A$ e utilize uma tabela adequada com o cabeçalho:
> $$\text{| Iteração | Vértices } V' \text{ | Arestas } E' \text{ | } (ij, w_{ij}), i \in V', j \in V \setminus V' \text{ | } e^* = i^*j^* \text{ | } T = (V', E') \text{ |}$$
> 
> (b) Seja $G_1 = (V_1, E_1)$ um subgrafo de $G$, onde $G_1 = G[V_1]$, com $V_1 = \{B, C, D, F, H\}$. Indique um subgrafo $G_2 = (V_2, E_2)$ de $G$ com $V_1 \neq V_2$, de modo a que $G_2$ seja isomorfo a $G_1$ e defina o respetivo isomorfismo. Justifique.

### Resolução:

#### Alínea (a)

O grafo possui os vértices $V = \{A, B, C, D, E, F, G, H\}$ e 13 arestas com os seguintes custos:
*   $AB: 1$, $AF: 2$, $AE: 3$
*   $BF: 2$, $BC: 3$
*   $CD: 1$, $CH: 4$
*   $DH: 2$
*   $EF: 4$, $EG: 4$
*   $FG: 1$, $FH: 5$
*   $GH: 3$

Execução do algoritmo de Prim partindo de $A$:

| Iteração | Vértices $V'$ | Arestas $E'$ | Candidatos $(ij, w_{ij})$, $i \in V', j \in V \setminus V'$ | $e^* = i^*j^*$ | Árvore $T = (V', E')$ |
| :---: | :--- | :--- | :--- | :---: | :--- |
| **0** | $\{A\}$ | $\emptyset$ | $(AB, 1), (AF, 2), (AE, 3)$ | $AB$ | $(\{A\}, \emptyset)$ |
| **1** | $\{A, B\}$ | $\{AB\}$ | $(AF, 2), (BF, 2), (AE, 3), (BC, 3)$ | $BF$* | $(\{A, B\}, \{AB\})$ |
| **2** | $\{A, B, F\}$ | $\{AB, BF\}$ | $(FG, 1), (AE, 3), (BC, 3), (FE, 4), (FH, 5)$ | $FG$ | $(\{A, B, F\}, \{AB, BF\})$ |
| **3** | $\{A, B, F, G\}$ | $\{AB, BF, FG\}$ | $(AE, 3), (BC, 3), (GH, 3), (FE, 4), (GE, 4), (FH, 5)$ | $GH$* | $(\{A, B, F, G\}, \{AB, BF, FG\})$ |
| **4** | $\{A, B, F, G, H\}$ | $\{AB, BF, FG, GH\}$ | $(HD, 2), (AE, 3), (BC, 3), (HC, 4), (FE, 4), (GE, 4)$ | $HD$ | $(\{A, B, F, G, H\}, \{AB, BF, FG, GH\})$ |
| **5** | $\{A, B, D, F, G, H\}$ | $\{AB, BF, FG, GH, HD\}$ | $(DC, 1), (AE, 3), (BC, 3), (HC, 4), (FE, 4), (GE, 4)$ | $CD$ | $(\{A, B, D, F, G, H\}, \{AB, BF, FG, GH, HD\})$ |
| **6** | $\{A, B, C, D, F, G, H\}$ | $\{AB, BF, FG, GH, HD, CD\}$ | $(AE, 3), (FE, 4), (GE, 4)$ | $AE$ | $(\{A, B, C, D, F, G, H\}, \{AB, BF, FG, GH, HD, CD\})$ |
| **7** | $\{A, B, C, D, E, F, G, H\}$ | $\{AB, BF, FG, GH, HD, CD, AE\}$ | *(todos os vértices de $V$ incluídos)* | — | **$T = (V, E')$** |

*\*Critérios de desempate:*
*   Na iteração 1, $AF$ e $BF$ têm ambos custo 2. Optou-se por $BF$ (a escolha de $AF$ seria igualmente válida e produziria uma árvore alternativa com o mesmo custo total).
*   Na iteração 3, $AE, BC, GH$ têm ambos custo 3. A escolha de $GH$ coincide com as marcações desenhadas no enunciado.

Árvore de Custo Mínimo obtida:
$$E(T) = \{AB, BF, FG, GH, HD, CD, AE\}$$
$$\text{Custo Total} = 1 + 2 + 1 + 3 + 2 + 1 + 3 = 13$$

---

#### Alínea (b)

O subgrafo $G_1 = G[V_1]$ induzido por $V_1 = \{B, C, D, F, H\}$ possui:
*   **Vértices:** $V_1 = \{B, C, D, F, H\}$
*   **Arestas:** $E_1 = \{BC, BF, CD, CH, DH, FH\}$
*   **Graus dos vértices em $G_1$:**
    *   $\text{grau}_{G_1}(B) = 2$ (adjacente a $C, F$)
    *   $\text{grau}_{G_1}(F) = 2$ (adjacente a $B, H$)
    *   $\text{grau}_{G_1}(D) = 2$ (adjacente a $C, H$)
    *   $\text{grau}_{G_1}(C) = 3$ (adjacente a $B, D, H$)
    *   $\text{grau}_{G_1}(H) = 3$ (adjacente a $C, D, F$)
*   **Estrutura topológica:** Consiste num triângulo $\{C, D, H\}$ que partilha a aresta $CH$ com um ciclo de 4 vértices $\{B, C, H, F\}$.

#### Escolha do Subgrafo Isomorfo $G_2$:
Podemos tomar como $G_2$ o subgrafo induzido $G[V_2]$ com **$V_2 = \{A, B, C, F, H\} \neq V_1$**:
*   **Arestas de $G_2$:** $E_2 = \{AB, AF, BF, BC, CH, FH\}$
*   **Graus dos vértices em $G_2$:**
    *   $\text{grau}_{G_2}(A) = 2$ (adjacente a $B, F$)
    *   $\text{grau}_{G_2}(C) = 2$ (adjacente a $B, H$)
    *   $\text{grau}_{G_2}(H) = 2$ (adjacente a $C, F$)
    *   $\text{grau}_{G_2}(B) = 3$ (adjacente a $A, C, F$)
    *   $\text{grau}_{G_2}(F) = 3$ (adjacente a $A, B, H$)
*   **Estrutura topológica:** Consiste num triângulo $\{A, B, F\}$ que partilha a aresta $BF$ com o ciclo de 4 vértices $\{B, C, H, F\}$.

#### Definição do Isomorfismo $\phi: V_1 \to V_2$:
Mapeamos os vértices preservando a estrutura de incidência:
*   $\phi(D) = A$  *(vértice de grau 2 do triângulo que não está na aresta partilhada)*
*   $\phi(C) = B$  *(vértice de grau 3 adjacente ao vértice $B$ do ciclo)*
*   $\phi(H) = F$  *(vértice de grau 3 adjacente ao vértice $F$ do ciclo)*
*   $\phi(B) = C$  *(vértice de grau 2 do ciclo, adjacente a $C$ em $G_1$)*
*   $\phi(F) = H$  *(vértice de grau 2 do ciclo, adjacente a $H$ em $G_1$)*

#### Justificação da Validade do Isomorfismo:
1.  **Bijeção:** $\phi$ é bijetiva entre $V_1 = \{B, C, D, F, H\}$ e $V_2 = \{A, B, C, F, H\}$.
2.  **Preservação de Arestas ($uv \in E_1 \iff \phi(u)\phi(v) \in E_2$):**
    *   $CD \in E_1 \iff \phi(C)\phi(D) = BA = AB \in E_2$ (Verdadeiro)
    *   $DH \in E_1 \iff \phi(D)\phi(H) = AF \in E_2$ (Verdadeiro)
    *   $CH \in E_1 \iff \phi(C)\phi(H) = BF \in E_2$ (Verdadeiro)
    *   $BC \in E_1 \iff \phi(B)\phi(C) = CB = BC \in E_2$ (Verdadeiro)
    *   $FH \in E_1 \iff \phi(F)\phi(H) = HF = FH \in E_2$ (Verdadeiro)
    *   $BF \in E_1 \iff \phi(B)\phi(F) = CH \in E_2$ (Verdadeiro)

Como todas as adjacências são preservadas, $\phi$ é um isomorfismo e $G_2 \cong G_1$.

*(Nota: Outra escolha válida para $G_2$ é o subgrafo induzido com $V_2' = \{B, C, F, G, H\}$, onde o triângulo é formado por $\{F, G, H\}$ partilhando a aresta $FH$ com o mesmo 4-ciclo).*

---

## Questão 7
> **Enunciado:**
> Usando um argumento combinatório adequado prove a igualdade seguinte:
> $$\sum_{k=0}^{n} \binom{n}{k}^2 = \binom{2n}{n}, \quad n \ge 0$$

### Prova Combinatória:

A prova assenta no método da **dupla contagem** do número de subconjuntos de tamanho $n$ que podem ser formados a partir de um conjunto de $2n$ elementos.

#### 1. Contagem Global (Membro Direito - RHS)
Seja um conjunto $S$ de $2n$ pessoas, dividido em dois subconjuntos disjuntos de cardinalidade $n$:
*   Um grupo $H$ de $n$ homens;
*   Um grupo $M$ de $n$ mulheres.

O número total de formas de escolher uma comissão de $n$ pessoas a partir do conjunto total $S$ de $2n$ pessoas é diretamente dado por:
$$\binom{2n}{n}$$

---

#### 2. Contagem por Casos Disjuntos (Membro Esquerdo - LHS)
Podemos particionar o conjunto de todas as comissões possíveis de $n$ pessoas segundo o número $k$ de homens incluídos na comissão, onde $0 \le k \le n$:
*   Se a comissão tiver $k$ homens, terá obrigatoriamente de ter os restantes $n - k$ membros escolhidos de entre as mulheres.

Para cada valor fixo de $k$:
1.  O número de formas de escolher $k$ homens de entre os $n$ homens é $\binom{n}{k}$;
2.  O número de formas de escolher $n - k$ mulheres de entre as $n$ mulheres é $\binom{n}{n - k}$.

Pelo Princípio Multiplicativo, existem:
$$\binom{n}{k} \times \binom{n}{n - k}$$
comissões com exatamente $k$ homens.

Pela propriedade de simetria dos coeficientes binomiais, sabemos que $\binom{n}{n - k} = \binom{n}{k}$. Logo:
$$\binom{n}{k} \times \binom{n}{n - k} = \binom{n}{k} \times \binom{n}{k} = \binom{n}{k}^2$$

Pelo Princípio Aditivo, somando sobre todos os valores possíveis de $k \in \{0, 1, \dots, n\}$:
$$\text{Total} = \sum_{k=0}^{n} \binom{n}{k}^2$$

---

#### Conclusão
Dado que ambas as expressões contam rigorosamente o mesmo conjunto de comissões, conclui-se que:
$$\sum_{k=0}^{n} \binom{n}{k}^2 = \binom{2n}{n}, \quad \forall n \ge 0$$
como queríamos demonstrar.
