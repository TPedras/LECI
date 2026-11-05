# Modelos de Resolução em MATLAB — Exercícios Práticos MPECI

Este documento apresenta modelos de resolução em MATLAB para cada exercício, agrupados pelos slides TP correspondentes, com explicação passo a passo do processo.

---

## ÍNDICE

1. [Guia 5 Ex. 13 — M/M/1/m teórico (TP11)](#g5-ex13)
2. [Guia 6 Ex. 1 — Ligação IP com fila finita (TP11)](#g6-ex1)
3. [Guia 6 Ex. 2 — Servidor de Dados M/M/1/m*PS (TP12)](#g6-ex2)
4. [Guia 6 Ex. 3 — Call Center M/M/m (TP12)](#g6-ex3)
5. [Guia 6 Ex. 4 — Disponibilidade VM com cadeia de Markov (TP13 + TP9)](#g6-ex4)
6. [Guia 6 Ex. 5 — Backup dedicado a conjunto de primários (TP13)](#g6-ex5)
7. [Guia 5 Ex. 6, 7, 8, 10, 11 — Simulação (TP10/TP11)](#g5-sim)

---

<a name="g5-ex13"></a>
## 1. Guia 5 — Exercício 13: Resolução teórica M/M/1/m

**Slides:** TP11 slide 13

### Modelo teórico

Uma ligação de dados com fila finita modela-se como sistema **M/M/1/m**:
- Chegadas Poisson com taxa λ (pps)
- Capacidade de serviço μ = C / (8·B) pps
- Fila com capacidade para m−1 pacotes (sistema acomoda m pacotes no total)
- ρ = λ/μ

Fórmulas:
```
π_n = (1−ρ)/(1−ρ^(m+1)) · ρⁿ      (probabilidades limite)
π_m = taxa de perda PD             (propriedade PASTA)
L   = Σ n·π_n                      (n.º médio no sistema)
W   = L / (λ·(1−π_m))              (Teorema de Little)
AM  = W                            (atraso médio por pacote aceite)
```

### Processo

1. Converter capacidade de Mbps para pps usando o tamanho médio do pacote.
2. Calcular ρ = λ/μ.
3. Para cada valor de F (capacidade da fila), m = F + 1 (1 em serviço + F na fila).
4. Calcular π_m e L pelas fórmulas.
5. AM via Teorema de Little.

### Código MATLAB

```matlab
% Guia 5 - Ex. 13: Modelagem teórica M/M/1/m
clear; clc;

% Parâmetros
lambda = 1800;          % pps
B = 600;                % Bytes (tamanho médio do pacote)
C = 10e6;               % bps (10 Mbps)
mu = C / (8*B);         % pps

F_vals = [50 20 10 5];  % capacidades da fila

fprintf('Exercise 13:\n');
for F = F_vals
    m = F + 1;          % capacidade total do sistema
    rho = lambda/mu;
    
    n = 0:m;
    pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
    
    PD = pi_n(end);             % π_m = taxa de perda (PASTA)
    L  = sum(n .* pi_n);        % n.º médio no sistema
    W  = L / (lambda*(1-PD));   % Teorema de Little
    AM = W * 1000;              % converter para ms
    
    fprintf('  F=%2d: AM = %.4f msec\n', F, AM);
    fprintf('         PD = %.3f %%\n', PD*100);
end
```

### Resultados esperados

```
F= 50: AM = 3.5152 msec, PD = 0.008 %
F= 20: AM = 3.0386 msec, PD = 0.658 %
F= 10: AM = 2.2070 msec, PD = 3.294 %
F=  5: AM = 1.4780 msec, PD = 8.832 %
```

---

<a name="g6-ex1"></a>
## 2. Guia 6 — Exercício 1: Ligação IP com fila finita

**Slides:** TP11 slide 13

### Modelo teórico

Idêntico ao anterior: sistema **M/M/1/m**.
- C = 100 Mbps, λ = 80 Mbps (em throughput) → convertido para pps
- B = 800 Bytes em média
- λ (pps) = (80 × 10⁶) / (8 × 800) = 12500 pps
- μ (pps) = (100 × 10⁶) / (8 × 800) = 15625 pps

### Processo

**(a)** Calcular AM e PD para Q = 8 pacotes diretamente.

**(b)** Iterar Q até PD ≤ 0.1%.

### Código MATLAB

```matlab
% Guia 6 - Ex. 1: Ligação IP com fila finita
clear; clc;

B = 800;                            % Bytes
C = 100e6;                          % bps
throughput = 80e6;                  % bps (oferecido)
lambda = throughput / (8*B);        % pps
mu     = C / (8*B);                 % pps
rho    = lambda/mu;

% (a) Q = 8 pacotes
Q = 8;
m = Q + 1;
n = 0:m;
pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
PD = pi_n(end);
L  = sum(n .* pi_n);
W  = L / (lambda*(1-PD));

fprintf('(a) Q = %d:\n', Q);
fprintf('    Avg. packet delay = %.3f msec.\n', W*1000);
fprintf('    Packet loss rate  = %.3f%%\n', PD*100);

% (b) Determinar Q mínimo para PD <= 0.1%
target = 0.001;
Q = 1;
while true
    m = Q + 1;
    n = 0:m;
    pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
    PD = pi_n(end);
    if PD <= target
        break;
    end
    Q = Q + 1;
end

fprintf('(b) Minimum queue size = %d packets\n', Q);
fprintf('    Packet loss rate    = %.5f%%\n', PD*100);
```

### Resultados esperados

```
(a) Avg. packet delay = 0.231 msec, Packet loss rate = 3.007%
(b) Minimum queue size = 23 packets, Packet loss rate = 0.09481%
```

---

<a name="g6-ex2"></a>
## 3. Guia 6 — Exercício 2: Servidor de Dados (M/M/1/m*PS)

**Slides:** TP12 slides 16–24

### Modelo teórico

Servidor com disciplina **Processor Sharing**: até m clientes em simultâneo, cada um servido à taxa μ quando o servidor está à capacidade máxima (n = m). Em estado n, cada cliente vê tempo de serviço n/(mμ).

Probabilidades limite e bloqueio:
```
ρ   = λ/(mμ)
π_n = (1−ρ)/(1−ρ^(m+1)) · ρⁿ
π_m = probabilidade de bloqueio
L   = Σ n·π_n
W   = L / (λ·(1−π_m))    (tempo médio de permanência por pedido aceite)
```

Para o exercício: 1/μ = 200 µs quando há m=250 pedidos em simultâneo.

### Processo

1. Definir μ = 1/(200×10⁻⁶) = 5000 pedidos/seg.
2. Para cada B (capacidade), calcular ρ, π_m e tempo médio W.

### Código MATLAB

```matlab
% Guia 6 - Ex. 2: Servidor de dados M/M/1/m*PS
clear; clc;

% Parâmetros
mu = 1/200e-6;          % 1/200 µs = 5000 pedidos/seg
lambda = 1.23e6;        % pedidos/seg

% (a) B = 250
B = 250;
rho = lambda / (B*mu);
n = 0:B;
pi_n = (1-rho)/(1-rho^(B+1)) .* rho.^n;
P_block = pi_n(end);
L = sum(n .* pi_n);
W = L / (lambda*(1-P_block));

fprintf('(a) B = %d:\n', B);
fprintf('    Service blocking probability = %.5f%%\n', P_block*100);
fprintf('    Avg. service time per request = %.3f microseconds\n', W*1e6);

% (b) Varrer B = 200, 250, 300, 350, 400
B_vals = [200 250 300 350 400];
P_block_v = zeros(size(B_vals));
W_v       = zeros(size(B_vals));

for k = 1:length(B_vals)
    B = B_vals(k);
    rho = lambda / (B*mu);
    n = 0:B;
    pi_n = (1-rho)/(1-rho^(B+1)) .* rho.^n;
    P_block_v(k) = pi_n(end);
    L = sum(n .* pi_n);
    W_v(k) = L / (lambda*(1-P_block_v(k)));
end

figure;
subplot(1,2,1);
bar(B_vals, P_block_v*100);
xlabel('Acceptance limit B (no. of requests)');
ylabel('Blocking probability (%)');

subplot(1,2,2);
bar(B_vals, W_v*1e6);
xlabel('Acceptance limit B (no. of requests)');
ylabel('Avg. service time per request (microsec.)');
```

### Resultados esperados

```
Service blocking probability  = 0.02888%
Avg. service time per request = 46.389 microseconds
```

**Conclusão (b):** com B maior, o bloqueio diminui mas o tempo médio de serviço aumenta (mais pedidos partilham os recursos).

---

<a name="g6-ex3"></a>
## 4. Guia 6 — Exercício 3: Call Center (M/M/m)

**Slides:** TP12 slides 34–40

### Modelo teórico

Sistema **M/M/m** com m operadores, fila infinita:
```
ρ   = λ/(mμ)                    (condição de validade: ρ < 1)
π_0 = 1 / [ Σ_{k=0}^{m−1} (mρ)ᵏ/k! + (mρ)ᵐ/(m!·(1−ρ)) ]
P_Q = (mρ)ᵐ/(m!·(1−ρ)) · π_0    (probabilidade de todos ocupados)
L_Q = ρ/(1−ρ) · P_Q             (n.º médio em fila)
W_Q = L_Q / λ = ρ/(λ·(1−ρ)) · P_Q   (tempo médio de espera)
```

### Processo

1. Escolher uma unidade consistente para tudo (vamos usar **minutos**).
2. Calcular os parâmetros do M/M/m com as fórmulas dos slides 36–37, sem usar funções (todo o cálculo é feito directamente no script).
3. **(a)** Calcular P_Q e W_Q para m=20, λ=370/h.
4. **(b)** Iterar m até W_Q ≤ 10 segundos.
5. **(c)** Variar λ com m=20 fixo e plotar W_Q.

### Código MATLAB

```matlab
% =========================================================================
% Guia 6 - Ex. 3: Call Center modelado por um sistema M/M/m
% =========================================================================
% O QUE É UM SISTEMA M/M/m?
%
%   - "M" (1ª letra): chegadas Markovianas/Poisson com taxa lambda
%   - "M" (2ª letra): tempos de serviço exponenciais com média 1/mu
%   - "m": número de servidores em paralelo (operadores do Call Center)
%
%   Os pedidos que chegam quando todos os operadores estão ocupados
%   ficam numa fila INFINITA (ninguém é recusado, todos esperam).
%
% O QUE QUEREMOS CALCULAR?
%
%   - P_Q : probabilidade de um pedido chegar e encontrar TODOS os m
%           operadores ocupados (i.e., probabilidade de ter de esperar)
%   - W_Q : tempo médio que um cliente espera na fila antes de ser
%           atendido (em média)
%
% UNIDADE DE TEMPO ESCOLHIDA: MINUTOS
%
%   O enunciado mistura horas, minutos e segundos. Para evitar erros,
%   convertemos TUDO para minutos no início e só convertemos para
%   segundos quando imprimimos os resultados.
% =========================================================================

clear; clc;     % limpar variáveis e a janela de comandos

% -------------------------------------------------------------------------
% Parâmetro comum às três alíneas:
% -------------------------------------------------------------------------
% Cada chamada dura em média 3 minutos. Como mu é a TAXA de atendimento
% (chamadas por minuto), e cada chamada demora 3 min, então:
%   mu = 1 / (tempo médio de serviço) = 1/3 chamadas por minuto.
mu = 1/3;       % pedidos/minuto


% =========================================================================
% (a) Call Center com m=20 operadores e taxa lambda = 370 pedidos/hora
% =========================================================================
% Queremos:
%   - probabilidade de todos os operadores estarem ocupados (P_Q)
%   - tempo médio de espera em fila (W_Q)
% -------------------------------------------------------------------------

% Converter lambda de pedidos/hora para pedidos/minuto:
% 370 pedidos/hora divididos por 60 min/hora = ~6.167 pedidos/min
lambda = 370/60;

m = 20;         % número de operadores

% --- Intensidade de tráfego (rho) ----------------------------------------
% rho representa a "ocupação média" por servidor.
% Formula:  rho = lambda / (m * mu)
% Se rho >= 1 o sistema explode (fila cresce sem limite); precisamos rho<1.
rho = lambda / (m * mu);

% --- Cálculo de pi_0 (probabilidade de 0 clientes no sistema) -----------
% A fórmula vem do slide 36:
%
%   pi_0 = 1 / [ SUM_{k=0..m-1} (m*rho)^k / k!   +   (m*rho)^m / (m!*(1-rho)) ]
%
% Vamos calcular as duas partes do denominador separadamente para ser claro.

% Primeira parte: soma de k=0 até k=m-1 dos termos (m*rho)^k / k!
% Em MATLAB criamos um vetor k = [0, 1, 2, ..., m-1] e fazemos o cálculo
% sobre o vetor inteiro de uma só vez (operações ".^" e "./" são
% elemento-a-elemento).
k = 0:(m-1);                                   % k = [0,1,2,...,19]
termos_finitos = (m*rho).^k ./ factorial(k);   % vetor com cada termo
sum1 = sum(termos_finitos);                    % soma todos os termos

% Segunda parte: termo único correspondente à "cauda" (estados n >= m)
% Quando todos os operadores estão ocupados, os clientes acumulam-se na
% fila. Esta cauda foi simplificada algebricamente em:
%   (m*rho)^m / (m! * (1-rho))
sum2 = (m*rho)^m / ( factorial(m) * (1-rho) );

% Finalmente pi_0
pi0 = 1 / (sum1 + sum2);

% --- P_Q: probabilidade de todos os m operadores estarem ocupados -------
% É a soma pi_m + pi_{m+1} + pi_{m+2} + ...
% Esta soma simplifica-se para sum2 * pi0 (slide 37).
PQ = sum2 * pi0;

% --- W_Q: tempo médio que um cliente espera na fila ---------------------
% Fórmula do slide 37:  W_Q = ( rho / (lambda*(1-rho)) ) * P_Q
% O resultado vem em MINUTOS porque lambda está em ped/min.
WQ = ( rho / (lambda*(1-rho)) ) * PQ;          % minutos

% --- Mostrar os resultados ----------------------------------------------
% Convertemos W_Q de minutos para segundos (multiplicar por 60).
fprintf('(a) lambda = 370 ped/h, m = %d operadores:\n', m);
fprintf('    Prob. de todos os operadores ocupados = %.3f%%\n', PQ*100);
fprintf('    Tempo médio em fila                   = %.3f segundos\n', WQ*60);


% =========================================================================
% (b) Quantos operadores são precisos para que W_Q <= 10 segundos?
% =========================================================================
% Estratégia: começamos com m=1 operador e vamos aumentando 1 a 1 até o
% tempo de espera descer abaixo dos 10 segundos. Como cada iteração só
% depende do valor de m, basta copiar os cálculos da alínea (a) para
% dentro do ciclo while.
% -------------------------------------------------------------------------

% lambda continua a ser 370/60 (definido em cima, mas reescrevemos por
% clareza para que esta alínea seja auto-contida)
lambda = 370/60;        % pedidos/minuto
mu     = 1/3;           % pedidos/minuto

target = 10/60;         % 10 segundos convertidos para MINUTOS (=0.1667 min)

m = 1;                  % começamos com 1 operador
PQ = NaN;               % valores iniciais (NaN = "ainda não calculado")
WQ = NaN;

% Ciclo "infinito" — só sai quando encontrarmos o m que satisfaz o alvo,
% através de um "break".
while true
    rho = lambda / (m * mu);
    
    % VERIFICAÇÃO IMPORTANTE: o sistema só é estável se rho < 1.
    % Para m muito pequeno (poucos operadores) rho >= 1 e o tempo de
    % espera diverge para infinito. Nesses casos saltamos os cálculos
    % e passamos directamente para m+1.
    if rho < 1
        % Repetir exactamente os mesmos cálculos da alínea (a):
        k = 0:(m-1);
        sum1 = sum( (m*rho).^k ./ factorial(k) );
        sum2 = (m*rho)^m / ( factorial(m)*(1-rho) );
        pi0  = 1 / (sum1 + sum2);
        PQ   = sum2 * pi0;
        WQ   = ( rho/(lambda*(1-rho)) ) * PQ;       % em minutos
        
        % Verificar se já atingimos o objectivo (W_Q <= 10 segundos)
        if WQ <= target
            break;      % saímos do while — encontrámos o m mínimo
        end
    end
    
    % Se ainda não atingiu o alvo (ou rho>=1), tentar com mais um operador
    m = m + 1;
end

fprintf('(b) Número mínimo de operadores = %d\n', m);
fprintf('    Prob. de todos os operadores ocupados = %.3f%%\n', PQ*100);
fprintf('    Tempo médio em fila                   = %.3f segundos\n', WQ*60);


% =========================================================================
% (c) Variar lambda (com m=20 fixo) e fazer gráfico de W_Q
% =========================================================================
% Repetimos o cálculo para vários valores de lambda (de 320 a 380 ped/hora
% em passos de 10) e desenhamos um gráfico de barras com o tempo médio
% em fila para cada caso.
% -------------------------------------------------------------------------

m  = 20;            % número de operadores fixo
mu = 1/3;           % pedidos/min (igual ao resto do exercício)

% Vetor com os valores de lambda em PEDIDOS POR HORA (para o eixo x)
lambda_h_vals = 320:10:380;             % [320 330 340 350 360 370 380]

% Converter cada valor para PEDIDOS POR MINUTO (para usar nas fórmulas)
lambda_vals = lambda_h_vals / 60;

% Vetor onde vamos guardar o W_Q de cada ponto, inicializado com zeros
WQ_vec = zeros(size(lambda_vals));

% Ciclo: para cada valor de lambda, calcular W_Q exactamente como em (a)
for idx = 1:length(lambda_vals)
    lambda = lambda_vals(idx);          % lambda deste ponto (ped/min)
    rho    = lambda / (m * mu);
    
    % Cálculo de pi_0
    k = 0:(m-1);
    sum1 = sum( (m*rho).^k ./ factorial(k) );
    sum2 = (m*rho)^m / ( factorial(m)*(1-rho) );
    pi0  = 1 / (sum1 + sum2);
    
    % P_Q e W_Q
    PQ   = sum2 * pi0;
    WQ_vec(idx) = ( rho/(lambda*(1-rho)) ) * PQ;   % em minutos
end

% --- Gráfico de barras ---------------------------------------------------
% No eixo x mostramos os lambdas em ped/hora (mais intuitivo de ler).
% No eixo y mostramos o W_Q em minutos.
figure;
bar(lambda_h_vals, WQ_vec);
xlabel('Arrival request rate per hour');
ylabel('Average queuing time (minutes)');
title('M/M/m: tempo médio em fila vs. taxa de chegada (m = 20)');
grid on;

% CONCLUSÃO: à medida que lambda aumenta, W_Q cresce de forma não-linear
% (acelerada). É a característica típica de sistemas de filas: quando a
% ocupação rho se aproxima de 1, o tempo de espera dispara.
```

### Resultados esperados

```
(a) Prob. all operators occupied = 64.813%, Avg. queuing time = 77.776 s
(b) Min. operators = 23, Prob. all occupied = 23.598%, Avg. queue = 9.439 s
```

---

<a name="g6-ex4"></a>
## 5. Guia 6 — Exercício 4: Disponibilidade VM (HW + Hypervisor + VM)

**Slides:** TP13 slides 11–16 + TP9 slide 18 (resolução das equações de balanço)

### Modelo teórico

Cadeia de Markov com 4 estados:
- Estado 1: servidor disponível
- Estado 2: reparação de falha de HW
- Estado 3: reparação de falha de Hypervisor (após HW ou diretamente)
- Estado 4: reparação de falha de VM

**Convenção da matriz T (TP9):** `T(i,j)` = taxa de transição do estado **j** para o estado **i**.

Transições neste exercício:
- 1 → 2 (falha HW, taxa λ_h)
- 2 → 3 (HW reparado, mas SW ainda precisa de recuperação)
- 3 → 1 (Hypervisor reparado, inclui VM)
- 1 → 3 (falha de Hypervisor)
- 1 → 4 (falha de VM)
- 4 → 1 (VM reparada)

### Método (TP9 slide 18)

```matlab
Q = T;
for i = 1:n
    Q(i,i) = -sum(T(:,i));   % colunas de Q somam zero
end
M = [Q; ones(1,n)];          % adiciona equação Σπ_i = 1
x = [zeros(n,1); 1];
pi_vec = M\x;                % resolve sistema linear
```

### Processo

1. Converter todos os tempos para a mesma unidade (dias).
2. Construir matriz T.
3. Resolver pelo método do TP9.
4. Disponibilidade = π_1.
5. MTBF = 1/(λ_h + λ_s + λ_v) (tempo médio em estado 1).
6. MTTR = MTBF · (1−A)/A (relação A = MTBF/(MTBF+MTTR)).

### Código MATLAB

```matlab
% Guia 6 - Ex. 4: Disponibilidade VM com cadeia de Markov
clear; clc;

% Taxas de falha (dia^-1)
lambda_h = 1/(2*365);    % HW: MTBF 2 anos
lambda_s = 1/180;        % Hypervisor: MTBF 180 dias
lambda_v = 1/90;         % VM: MTBF 90 dias

% Taxas de reparação (dia^-1)
mu_h = 1/2;              % HW: 2 dias
mu_s = 24/6;             % Hypervisor: 6 horas
mu_v = 24/1;             % VM: 1 hora

% (a) Matriz T : T(i,j) = taxa de j -> i
% Estados: 1=disponível, 2=rep HW, 3=rep Hypervisor, 4=rep VM
T = [0          0       mu_s    mu_v
     lambda_h   0       0       0
     lambda_s   mu_h    0       0
     lambda_v   0       0       0];

disp('Matrix of the state transition rates:');
disp(T);

% (b) Disponibilidade — método TP9 slide 18
n = length(T);
Q = T;
for i = 1:n
    Q(i,i) = -sum(T(:,i));
end
M = [Q; ones(1,n)];
x = [zeros(n,1); 1];
pi_vec = M\x;

A = pi_vec(1);
fprintf('Server availability = %.3f%%\n', A*100);

% (c) MTBF e MTTR
MTBF = 1/(lambda_h + lambda_s + lambda_v);           % dias
MTTR_days  = MTBF * (1-A)/A;
MTTR_hours = MTTR_days * 24;

fprintf('MTBF = %.2f days\n', MTBF);
fprintf('MTTR = %.2f hours\n', MTTR_hours);
```

### Resultados esperados

```
Server availability = 99.509%
MTBF = 55.44 days
MTTR = 6.57 hours
```

### Notas

- **Conferir a topologia da cadeia** — neste exercício, a reparação de HW **não** inclui SW (vai para estado 3), mas a reparação de Hypervisor **inclui** VM (volta diretamente a 1). Isto é diferente do slide 16 (que tem HW a incluir tudo).
- **MTBF alternativo:** também pode ser calculado como π_1 / (taxa total de saídas de estado 1 ponderada pelo tempo total). A fórmula 1/(Σλ) usa o tempo médio em estado 1 antes de sair.

---

<a name="g6-ex5"></a>
## 6. Guia 6 — Exercício 5: Backup dedicado a conjunto

**Slides:** TP13 slides 22–27

### Modelo teórico

Um servidor de backup partilhado entre n primários (dedicado ao conjunto). Cada servidor (primário ou backup) tem disponibilidade A = 0.999. Total de servidores no conjunto: n + 1.

**Fórmula (slide 26):**
```
f(i)  = C(n+b, i) · pⁱ · (1−p)^(n+b−i)        (i servidores OK)
A_serv = Σ_{i=0}^{n−1} f(i)·(i/n)  +  Σ_{i=n}^{n+b} f(i)
```
Com b = 1.

Interpretação:
- Se i ≥ n servidores OK, todos os n serviços estão disponíveis.
- Se i < n, cada serviço tem probabilidade i/n de estar disponível.

### Processo

1. Definir função `Aserv(n, b, p)` que aplica a fórmula.
2. **(a)** Iterar n até A_serv < 0.9999, retroceder 1.
3. **(b)** Plotar A_serv para n = 1..1000.

### Código MATLAB

```matlab
% Guia 6 - Ex. 5: Backup dedicado a conjunto de n primários
clear; clc;

p = 0.999;      % disponibilidade individual
b = 1;          % 1 backup por conjunto

% (a) máximo n tal que A_serv >= 0.9999
target = 0.9999;
n = 1;
while true
    A = Aserv(n, b, p);
    if A < target
        n = n - 1;
        A = Aserv(n, b, p);
        break;
    end
    n = n + 1;
end
fprintf('Maximum value of n = %d\n', n);
fprintf('Resulting VM availability = %.4f%%\n', A*100);

% (b) Gráfico de A_serv para n = 1..1000
n_vals = 1:1000;
A_vals = arrayfun(@(nn) Aserv(nn, b, p), n_vals);
figure;
plot(n_vals, A_vals*100);
xlabel('n');
ylabel('VM availability (%)');
grid on;

% ---- Função A_serv pela fórmula do slide 26 ----
function A = Aserv(n, b, p)
    N = n + b;
    i = 0:N;
    f = arrayfun(@(ii) nchoosek(N,ii), i) .* p.^i .* (1-p).^(N-i);
    % i < n : contribuição parcial (i/n)
    mask_lt = i < n;
    mask_ge = i >= n;
    A = sum(f(mask_lt) .* (i(mask_lt)/n)) + sum(f(mask_ge));
end
```

### Resultados esperados

```
Maximum value of n = 213
Resulting VM availability = 99.9900%
```

**Conclusão (b):** com mais primários a partilhar um único backup, a disponibilidade diminui (em torno de 99.96% quando n=1000).

---

<a name="g5-sim"></a>
## 7. Guia 5 — Exercícios 6, 7, 8, 10, 11: Simulação

**Slides:** TP10 (intervalos de confiança), TP11 (modelos de ligação)

Estes exercícios usam o simulador `LinkSimulator.m` fornecido. O modelo de resolução consiste em:

1. **Correr N vezes** o simulador (10, 20 ou 100 runs).
2. **Estimar a média e o intervalo de confiança a 90%** (slides 40–41 TP10):
   ```
   IC = média ± t·s/√N
   ```
   onde `t` é o quantil 95% da distribuição t-Student com N−1 graus de liberdade.

### Esqueleto genérico

```matlab
function [media, IC_min, IC_max] = estimar(samples, conf)
    N = length(samples);
    media = mean(samples);
    s = std(samples);
    alpha = 1 - conf;
    t = tinv(1 - alpha/2, N-1);
    h = t * s / sqrt(N);
    IC_min = media - h;
    IC_max = media + h;
end
```

### Exemplo: Ex. 6 — AM com 100 runs

```matlab
% Guia 5 - Ex. 6
clear; clc;

lambda = 1000;  B = 600;  C = 10;   % C em Mbps (conforme help)
F = 1000;       N = 1e4;
n_runs = 100;

AM_runs = zeros(1, n_runs);
for k = 1:n_runs
    AM_runs(k) = LinkSimulator(lambda, B, C, F, N);
end

[m, lo, hi] = estimar(AM_runs, 0.90);
fprintf('AM = %.4f [%.4f - %.4f] msec\n', m*1000, lo*1000, hi*1000);
```

### Exemplo: Ex. 10 — adicionar estimação de PD

Para isto é necessário **modificar** `LinkSimulator.m` para retornar também a contagem de pacotes descartados:

```matlab
% Pseudo-código das alterações no simulador
% no início:
%   n_drops = 0;
% no evento de chegada com fila cheia:
%   n_drops = n_drops + 1;
% no fim:
%   PD = n_drops / N_total_chegadas;
```

Script de invocação:
```matlab
lambda = 1800; B = 600; C = 10; F = 100; N = 1e4;
n_runs = 100;
AM_v = zeros(1,n_runs);  PD_v = zeros(1,n_runs);
for k = 1:n_runs
    [AM_v(k), PD_v(k)] = LinkSimulator(lambda, B, C, F, N);
end
[m, lo, hi]    = estimar(AM_v, 0.90);
[mp, lop, hip] = estimar(PD_v, 0.90);
fprintf('AM = %.4f [%.4f - %.4f] msec\n', m*1000, lo*1000, hi*1000);
fprintf('PD = %.3f [%.3f - %.3f] %%\n',   mp*100, lop*100, hip*100);
```

### Exemplo: Ex. 11 — variar F

```matlab
F_vals = [50 20 10 5];
lambda = 1800; B = 600; C = 10; N = 1e4;
n_runs = 100;

for F = F_vals
    AM_v = zeros(1,n_runs);  PD_v = zeros(1,n_runs);
    for k = 1:n_runs
        [AM_v(k), PD_v(k)] = LinkSimulator_mod(lambda, B, C, F, N);
    end
    [m, lo, hi]    = estimar(AM_v, 0.90);
    [mp, lop, hip] = estimar(PD_v, 0.90);
    fprintf('F=%2d: AM = %.4f [%.4f - %.4f] msec\n', F, m*1000, lo*1000, hi*1000);
    fprintf('      PD = %.3f [%.3f - %.3f] %%\n', mp*100, lop*100, hip*100);
end
```

---

## Apêndice: Funções utilitárias

### Resolução de cadeia de Markov (TP9 slide 18)

```matlab
function pi_vec = solve_markov(T)
% T(i,j) = taxa de transição do estado j para o estado i
    n = size(T,1);
    Q = T;
    for i = 1:n
        Q(i,i) = -sum(T(:,i));
    end
    M = [Q; ones(1,n)];
    x = [zeros(n,1); 1];
    pi_vec = M\x;
end
```

### Intervalo de confiança (slide TP10 40–41)

```matlab
function [m, lo, hi] = ci(samples, conf)
    N = length(samples);
    m = mean(samples);
    s = std(samples);
    t = tinv(1 - (1-conf)/2, N-1);
    h = t*s/sqrt(N);
    lo = m - h;  hi = m + h;
end
```

### Probabilidades M/M/1/m

```matlab
function pi_n = pi_mm1m(lambda, mu, m)
    rho = lambda/mu;
    n   = 0:m;
    pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
end
```

### Probabilidades M/M/m

```matlab
function pi_n = pi_mmm(lambda, mu, m, n_max)
    rho = lambda/(m*mu);
    k = 0:(m-1);
    sum1 = sum((m*rho).^k ./ factorial(k));
    sum2 = (m*rho)^m / (factorial(m)*(1-rho));
    pi0  = 1/(sum1 + sum2);
    pi_n = zeros(1, n_max+1);
    for n = 0:n_max
        if n <= m
            pi_n(n+1) = (m*rho)^n / factorial(n) * pi0;
        else
            pi_n(n+1) = m^m * rho^n / factorial(m) * pi0;
        end
    end
end
```

---

## Tabela-resumo de fórmulas-chave

| Sistema | ρ | π_n | Métricas |
|---------|---|-----|----------|
| **M/M/1** | λ/μ | (1−ρ)ρⁿ | W=1/(μ−λ), W_Q=ρ/(μ−λ) |
| **M/M/1/m** | λ/μ | (1−ρ)/(1−ρ^(m+1))·ρⁿ | π_m = perda, W=L/(λ(1−π_m)) |
| **M/M/m** | λ/(mμ) | ver slide 36 | P_Q, L_Q=ρ/(1−ρ)·P_Q, W_Q=L_Q/λ |
| **M/M/m/m** | λ/μ | (λ/μ)ⁿ/n! / Σ(λ/μ)ᵏ/k! | π_m = bloqueio (Erlang-B) |
| **M/M/1/m*PS** | λ/(mμ) | mesma de M/M/1/m | π_m = bloqueio, W=L/(λ(1−π_m)) |
| **Disponibilidade** | — | π via Markov | A = π_1 |
| **Backup dedicado** | — | binomial | A = 1−(1−A)^(b+1) |
| **Backup partilhado** | — | binomial | Σ f(i)·i/n + Σ f(i) |
