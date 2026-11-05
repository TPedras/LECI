# Templates MATLAB — Modelos de Resolução MPECI

Cada ficheiro `.m` é um modelo auto-contido que se pode adaptar mudando apenas os parâmetros no topo. Os comentários no início de cada ficheiro explicam **quando usar** o template e **o que pode ser pedido**.

## Como escolher o template

| Característica do problema | Template a usar |
|---|---|
| Ligação de dados com fila finita; chega pacotes Poisson, pacote exponencial; **podem ser descartados** | [`template_MM1m.m`](template_MM1m.m) |
| Servidor de **dados** (Web/CPU) com **m pedidos simultâneos** e Processor Sharing | [`template_MM1m_PS.m`](template_MM1m_PS.m) |
| **Call Center** ou serviço com **m servidores em paralelo + fila infinita** | [`template_MMm.m`](template_MMm.m) |
| **Video-streaming** ou serviço com **m servidores + sem fila** (bloqueia se cheio) | [`template_MMmm.m`](template_MMmm.m) |
| **Disponibilidade** de servidor/sistema com falhas e reparações (HW, SW, VM, Hypervisor) | [`template_Markov_disponibilidade.m`](template_Markov_disponibilidade.m) |
| Disponibilidade com servidores de **backup** (dedicado ou partilhado) | [`template_Backup.m`](template_Backup.m) |
| Estimar média + intervalo de confiança a partir de **N runs de simulador** | [`template_Simulacao_IC.m`](template_Simulacao_IC.m) |

## Como usar

1. Identificar o modelo apropriado pela tabela acima.
2. Abrir o template correspondente no MATLAB.
3. Alterar **apenas a secção "PARÂMETROS DE ENTRADA"** no topo.
4. Se a pergunta for uma das **variantes** (e.g. "encontrar m mínimo", "variar lambda", "plotar"), descomentar o bloco respectivo no fim do ficheiro.
5. Correr o script.

## Tabela-resumo de fórmulas

| Modelo | rho | π_n | Métrica principal |
|--------|-----|-----|-------------------|
| **M/M/1** | λ/μ | (1−ρ)ρⁿ | W = 1/(μ−λ) |
| **M/M/1/m** | λ/μ | (1−ρ)/(1−ρ^(m+1))·ρⁿ | π_m = perda, W = L/(λ(1−π_m)) |
| **M/M/m** | λ/(mμ) | Erlang-C | P_Q, W_Q = ρ/(λ(1−ρ))·P_Q |
| **M/M/m/m** | λ/μ | (λ/μ)ⁿ/n! / Σ | π_m = bloqueio (Erlang-B) |
| **M/M/1/m*PS** | λ/(mμ) | igual a M/M/1/m | π_m = bloqueio, W=L/(λ(1−π_m)) |
| **Markov disp.** | — | resolver Q·π=0 | A = π(estado_disponível) |
| **Backup dedicado** | — | — | 1 − (1−A)^(b+1) |
| **Backup partilhado** | — | binomial | Σ f(i)·i/n + Σ f(i) |

## Notas comuns

- **Unidades**: garante que λ e μ estão na mesma unidade temporal antes de calcular.
- **Estabilidade**: para M/M/1, M/M/1/∞ e M/M/m com fila infinita, é preciso ρ < 1.
- **PASTA**: a probabilidade que um cliente "vê" ao chegar = probabilidade do estado em regime estacionário (válido só com chegadas Poisson).
- **Little**: L = λ·W (uma das relações mais úteis em todos os modelos).
