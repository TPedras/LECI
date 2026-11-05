# Relação entre Exercícios dos Guiões Práticos e Slides TP

Este documento relaciona os exercícios dos Guiões Práticos com os conteúdos teóricos abordados em aulas TP específicas.

---

## TP11 — Slides 10 a 13: Ligação ponto-a-ponto e Multiplexagem Estatística

**Conteúdo dos slides:**
- Slide 10: Ligação ponto-a-ponto, capacidade C (bps), tempo de serviço S, μ = C/(8×B) pps
- Slide 11: Multiplexagem estatística — Sistema **M/G/1** (chegadas Poisson, fila infinita) — fórmula de Pollaczek-Khinchine para W_Q
- Slide 12: Sistema **M/M/1** (tamanho dos pacotes exponencial) — W = 1/(μ−λ), W_Q = λ/(μ(μ−λ))
- Slide 13: Sistema **M/M/1/m** (fila finita) — θ_m (perda), L, W (Teorema de Little), propriedade PASTA

**Exercícios relacionados:**

| Exercício | Guião | Descrição | Modelo |
|-----------|-------|-----------|--------|
| Ex. 6  | Guia 5 (Task 2) | Simulação de ligação de dados: λ=1000 pps, B=600 Bytes, C=10 Mbps, fila=1000 pacotes — estimar atraso médio AM | M/M/1 (slide 12) |
| Ex. 7  | Guia 5 | Idem 6 com tamanho de pacote discreto (64/110/1500 Bytes) | M/G/1 (slide 11) |
| Ex. 8  | Guia 5 | Variação de λ (1000–2000 pps) e análise do atraso AM | M/M/1 com saturação (slide 12) |
| Ex. 10 | Guia 5 | Simulador com estimação de PD (packet drop) — λ=1800 pps, fila=100 | M/M/1/m (slide 13) |
| Ex. 11 | Guia 5 | Variação da capacidade da fila (5, 10, 20, 50) e análise de AM e PD | M/M/1/m (slide 13) |
| Ex. 13 | Guia 5 | **Resolução teórica** de AM e PD usando M/M/1/m e comparação com simulações | M/M/1/m (slide 13) |
| Ex. 1(a) | Guia 6 | Atraso médio e perda numa ligação de 100 Mbps com Q=8 pacotes | M/M/1/m (slide 13) |
| Ex. 1(b) | Guia 6 | Dimensionamento da fila mínima Q para perdas ≤ 0.1% | M/M/1/m (slide 13) |

---

## TP12 — Slides 16 a 24: Serviços de Dados (M/M/1/m*PS)

**Conteúdo dos slides:**
- Slides 16-17: Atualização de capacidade C' vs k servidores para video-streaming; introdução a serviços de dados limitados por CPU/RAM
- Slide 18: Disciplina **Processor Sharing (PS)** — m pedidos em simultâneo, recusa adicionais
- Slide 19: Modelo **M/M/1/m*PS** — 1 servidor que atende até m clientes, taxa n/(mμ) por cliente
- Slide 20: Comparação cadeias de Markov: M/M/m/m vs M/M/1/m*PS
- Slide 21: Probabilidades limite π_n e π_m (PASTA)
- Slides 22-24: Exemplo 3 — m=4, λ=800 ped/s, 1/μ=2 ms → percentagem de recusas, L (n.º médio), W (Teorema de Little)

**Exercícios relacionados:**

| Exercício | Guião | Descrição | Modelo |
|-----------|-------|-----------|--------|
| Ex. 2(a) | Guia 6 | Servidor de dados com B=250 pedidos simultâneos, 1/μ=200 µs, λ=1.23×10⁶ — probabilidade de bloqueio e tempo médio de serviço | M/M/1/m*PS (slides 19-22) |
| Ex. 2(b) | Guia 6 | Variação de B (200, 250, 300, 350, 400) e análise gráfica de bloqueio e tempo de serviço | M/M/1/m*PS (slide 21) |

---

## TP12 — Slides 34 a 40: Serviços tipo Call Center (M/M/m)

**Conteúdo dos slides:**
- Slide 34: Call Center — m operadores, pedidos atendidos por ordem de chegada, fila infinita
- Slide 35: Sistema **M/M/m** — processo nascimento e morte com m servidores
- Slide 36: Probabilidades limite π_0, π_n (fórmula com (mρ)ⁿ/n! para n≤m e mᵐρⁿ/m! para n>m); condição de validade ρ<1
- Slide 37: Parâmetros de desempenho — P_Q (todos servidores ocupados), L_Q (n.º médio em espera), W_Q (atraso médio na fila)
- Slides 38-40: Exemplo 5 — Call Center com m=4, λ=60 ped/h, 1/μ=3 min: probabilidade de atendimento imediato, tempo médio em fila, n.º médio de operadores ocupados

**Exercícios relacionados:**

| Exercício | Guião | Descrição | Modelo |
|-----------|-------|-----------|--------|
| Ex. 3(a) | Guia 6 | Call Center com m=20, λ=370 ped/h, 1/μ=3 min — probabilidade de todos os operadores ocupados (P_Q) e tempo médio em fila (W_Q) | M/M/m (slides 35-37) |
| Ex. 3(b) | Guia 6 | Dimensionamento: número mínimo m de operadores para W_Q ≤ 10 segundos | M/M/m (slide 37) |
| Ex. 3(c) | Guia 6 | Variação de λ (320 a 380) com m=20 fixo — gráfico de W_Q | M/M/m (slide 37) |

---

## TP13 — Slides 11 a 16: Disponibilidade de um Servidor (com TP9 slide 18 — Resolução das equações de balanço)

**Conteúdo dos slides:**
- Slide 11: **Disponibilidade (i)** — servidor como elemento único; cadeia de Markov de 2 estados (disponível/em reparação); taxa de falha λ e de reparação μ
- Slide 12: Análise mais realista — servidor = Hardware + Software (falhas não independentes)
- Slide 13: **Disponibilidade (ii)** — modelo 3 estados (disponível, reparação HW, reparação SW); reparação de HW **inclui** reparação do SW
- Slide 14: **Disponibilidade (iii)** — idem, mas reparação de HW **não inclui** reparação do SW
- Slide 15: Virtualização — Hypervisor Tipo 1 e Tipo 2
- Slide 16: **Disponibilidade (iv)** — modelo 4 estados (HW + Hypervisor + VM)

**TP9 slide 18 — Resolução das equações de balanço em MATLAB:**
- Construção da matriz T das taxas de transição
- Matriz Q (subtração da soma de cada coluna na diagonal)
- Sistema M = [Q; ones(1,n)], x = [zeros(n,1); 1], solução u = M\x

**Exercícios relacionados:**

| Exercício | Guião | Descrição | Modelo |
|-----------|-------|-----------|--------|
| Ex. 4(a) | Guia 6 | Definir matriz de taxas de transição (em dias⁻¹) da cadeia de Markov para VM com HW (MTBF=2 anos, MTTR=2 dias), Hypervisor (MTBF=180d, MTTR=6h, inclui VM) e VM (MTBF=90d, MTTR=1h) | TP13 slide 16 + TP9 slide 18 (método MATLAB) |
| Ex. 4(b) | Guia 6 | Calcular disponibilidade do servidor (probabilidade limite do estado 1) | TP13 slide 16 |
| Ex. 4(c) | Guia 6 | Calcular MTBF (dias) e MTTR (horas) a partir das probabilidades limite | TP13 slides 11-16 |

> **Nota:** O exercício 4 do Guia 6 corresponde ao caso da reparação do Hypervisor incluir a recuperação da VM (semelhante ao slide 13 mas com 3 elementos: HW + Hypervisor + VM = slide 16).

---

## TP13 — Slides 22 a 27: Disponibilidade de Serviços com Servidores de Backup

**Conteúdo dos slides:**
- Slide 22: Servidores de backup em standby; ativação quando primário falha; elementos em paralelo (serviços só falham se todos falharem)
- Slide 23: Duas estratégias com múltiplos primários: **backup dedicado** (1 backup por primário) vs **backup partilhado** (qualquer backup substitui qualquer primário)
- Slides 24-25: Exemplo — n=3 primários, disponibilidade individual 0.995, requisito 99.99%; cálculo para backups dedicados: 1 − (1−0.995)² = 99.9975%
- Slide 26: Fórmula para backups partilhados — distribuição binomial f(i) = C(n+b, i)·pⁱ·(1−p)^(n+b−i); disponibilidade = Σ(f(i)/n · i) + Σf(i)
- Slide 27: Resultados comparativos do exemplo (dedicados vs 1, 2, 3 partilhados)

**Exercícios relacionados:**

| Exercício | Guião | Descrição | Modelo |
|-----------|-------|-----------|--------|
| Ex. 5(a) | Guia 6 | Estratégia com **1 backup dedicado** para cada conjunto de n primários, disponibilidade VM 99.9%; determinar n máximo para disponibilidade ≥ 99.99% | Backup dedicado (slides 22-25) |
| Ex. 5(b) | Guia 6 | Gráfico da disponibilidade VM para n de 1 a 1000 primários | Backup dedicado (slide 25) |

---

## Resumo Visual

```
TP11 (10-13) ──── M/M/1, M/M/1/m, M/G/1
                  └─ Guia 5: Ex. 6, 7, 8, 10, 11, 13
                  └─ Guia 6: Ex. 1

TP12 (16-24) ──── M/M/1/m*PS (Processor Sharing)
                  └─ Guia 6: Ex. 2

TP12 (34-40) ──── M/M/m (Call Center)
                  └─ Guia 6: Ex. 3

TP13 (11-16) ──── Disponibilidade (HW+SW+VM)
   + TP9 (18) ─── Resolução equações de balanço (MATLAB)
                  └─ Guia 6: Ex. 4

TP13 (22-27) ──── Backup dedicado vs partilhado
                  └─ Guia 6: Ex. 5
```

---

## Notas práticas para resolução

- **M/M/1/m** (TP11 slide 13) → fórmulas π_n = (1−ρ)/(1−ρ^(m+1)) · ρⁿ; usar Teorema de Little W = L / (λ(1−θ_m)).
- **M/M/1/m*PS** (TP12 slide 21) → mesma estrutura de π_n que M/M/m/m, mas com ρ = λ/(mμ); a probabilidade de bloqueio é π_m.
- **M/M/m** (TP12 slide 37) → diferenciar P_Q (slide 37) e π_m; W_Q usa Teorema de Little com L_Q.
- **Cadeia de Markov para disponibilidade** (TP13 + TP9 slide 18) → construir T linha-a-linha com taxas (1/MTBF para falhas, 1/MTTR para reparações), depois aplicar o método MATLAB do TP9.
- **Backups dedicados** → simples produto de probabilidades: A_total = 1 − (1−A)^(1+b_por_grupo).
- **Backups partilhados** → distribuição binomial sobre n+b servidores.
