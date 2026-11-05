% =========================================================================
% TEMPLATE: Desempenho de Ligação de Dados  (TP11)
% =========================================================================
% Este template cobre TODOS os modelos teóricos de ligação ponto-a-ponto:
%
%   [A] M/M/1     -> fila INFINITA, pacotes exponenciais
%   [B] M/M/1/m   -> fila FINITA (m = capacidade total = F + 1)
%   [C] M/G/1     -> fila INFINITA, tamanho GERAL (não exponencial)
%                    Usado quando o tamanho do pacote é uma distribuição
%                    discreta, uniforme, determinística, etc.
%   [D] Construir uma distribuição discreta de tamanhos de pacote
%
% Para SIMULAÇÕES (correr LinkSimulator R vezes e calcular IC), ver
% template_Simulacao_IC.m
%
% PERGUNTAS TÍPICAS que se respondem aqui:
%   - Calcular AM (atraso médio) e PD (taxa de perda)
%   - Dimensionar a fila F para perda <= alvo
%   - Comparar resultados teóricos com simulações (Ex. 13 Guia 5)
%   - Calcular atraso teórico quando o tamanho NÃO é exponencial
%   - Calcular o tamanho MÉDIO e E[S²] de uma distribuição discreta
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
lambda = 1800;          % taxa de chegada (pps - pacotes por segundo)
% lambda = (throughput / (8 * B(tamanho médio do pacote (Bytes))))
C      = 10e6;          % capacidade da ligação (bps)
B      = 600;           % tamanho médio do pacote (Bytes)
F      = 50;            % capacidade da fila (em pacotes; só para M/M/1/m)
% -------------------------------------------------------------------------

% --- Conversões base -----------------------------------------------------
% Cada pacote de B Bytes ocupa 8*B bits. Numa ligação de C bps, demora:
%   tempo_servico = 8*B / C  segundos
% A taxa de serviço (pacotes/seg) é o inverso:
mu  = C / (8*B);                % pacotes/segundo
rho = lambda / mu;              % intensidade de tráfego

fprintf('=== Parâmetros base ===\n');
fprintf('  mu  (taxa de serviço) = %.4f pps\n', mu);
fprintf('  rho (utilização)      = %.4f\n', rho);


% =========================================================================
% [A] MODELO M/M/1 (fila infinita, pacote exponencial)
% =========================================================================
% Condição de validade: rho < 1
if rho < 1
    W_mm1  = 1/(mu - lambda);           % atraso total médio (s)
    WQ_mm1 = rho/(mu - lambda);         % tempo médio em fila (s)
    L_mm1  = rho/(1 - rho);             % n.º médio no sistema
    fprintf('\n=== M/M/1 (fila infinita) ===\n');
    fprintf('  W  = %.4f msec\n', W_mm1*1000);
    fprintf('  WQ = %.4f msec\n', WQ_mm1*1000);
    fprintf('  L  = %.4f pacotes\n', L_mm1);
else
    fprintf('\n=== M/M/1 ===  INSTÁVEL (rho >= 1)\n');
end


% =========================================================================
% [B] MODELO M/M/1/m (fila finita)
% =========================================================================
% m = F + 1 (1 em transmissão + F na fila)
m    = F + 1;
n    = 0:m;
pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;     % probabilidades limite

PD = pi_n(end);                             % perda (= pi_m, PASTA)
L  = sum(n .* pi_n);                        % n.º médio no sistema
W  = L / ( lambda * (1-PD) );               % Teorema de Little
WQ = W - 1/mu;                              % tempo médio em fila

fprintf('\n=== M/M/1/m (F = %d) ===\n', F);
fprintf('  AM (atraso médio)   = %.4f msec\n', W*1000);
fprintf('  WQ (espera em fila) = %.4f msec\n', WQ*1000);
fprintf('  PD (taxa de perda)  = %.4f %%\n', PD*100);
fprintf('  L  (médio sistema)  = %.4f\n', L);


% =========================================================================
% [C] MODELO M/G/1 (Pollaczek-Khinchine)
% =========================================================================
% Quando o tamanho do pacote NÃO é exponencial (discreto, uniforme,
% constante, etc), a fórmula do M/M/1 já não vale. Usar Pollaczek-Khinchine:
%
%      W_Q = lambda * E[S²] / ( 2 * (1 - rho) )
%      W   = W_Q + E[S]
%      E[S]  = tempo médio de s% Guia 6 - Ex. 5: Backup dedicado a conjunto de n primários
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
erviço (em segundos)
%      E[S²] = momento de 2ª ordem do tempo de serviço
%
% Para usar este bloco, é preciso ter um vector de tamanhos `sizes` (Bytes)
% e respectivas probabilidades `probs` (ver bloco [D] abaixo para construir).

% Exemplo de uso (descomentar):
%
% % S = tempo de serviço (em segundos) para cada tamanho possível
% S = 8 * sizes / C;                   % vector de tempos de serviço
% E_S  = sum( S    .* probs );         % E[S]
% E_S2 = sum( S.^2 .* probs );         % E[S²]
% rho  = lambda * E_S;                 % rho com tempo de serviço geral
% WQ_pk = lambda * E_S2 / (2*(1-rho));
% W_pk  = WQ_pk + E_S;
% fprintf('\n=== M/G/1 (Pollaczek-Khinchine) ===\n');
% fprintf('  W  = %.4f msec\n', W_pk*1000);
% fprintf('  WQ = %.4f msec\n', WQ_pk*1000);


% =========================================================================
% [D] CONSTRUIR UMA DISTRIBUIÇÃO DISCRETA DE TAMANHOS (Ex. 7 Guia 5)
% =========================================================================
% Útil quando o enunciado dá probabilidades específicas para alguns
% tamanhos e diz "todos os outros valores com a mesma probabilidade".
% Descomentar e adaptar:
%
% % --- Probabilidades específicas dadas no enunciado ---
% p_64   = 0.29606;
% p_110  = 0.16417;
% p_1500 = 0.19601;
%
% % --- Os "outros" valores partilham a probabilidade restante ---
% outros = [65:109, 111:1499];                % tamanhos com prob. igual
% p_outro = (1 - p_64 - p_110 - p_1500) / length(outros);
%
% % --- Construir vectores ordenados de sizes e probs ---
% sizes = [64,          65:109,                       110, ...
%          111:1499,                                  1500];
% probs = [p_64,        repmat(p_outro, 1, 45), ...   p_110, ...
%          repmat(p_outro, 1, 1389),                  p_1500];
%
% % --- Tamanho médio (sanity check) ---
% B_avg = sum(sizes .* probs);
% fprintf('Avg. Packet Size = %.4f Bytes\n', B_avg);
% fprintf('Soma das probabilidades = %.10f\n', sum(probs));


% =========================================================================
% VARIANTE 1: Varrer vários valores de F para M/M/1/m
% =========================================================================
% Exemplo: "comparar AM e PD para F = 5,10,20,50" (Ex. 13 Guia 5)
% Descomentar:
%
% F_vals = [50 20 10 5];
% for F = F_vals
%     m = F + 1;
%     n = 0:m;
%     pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
%     PD = pi_n(end);
%     L  = sum(n .* pi_n);
%     W  = L / (lambda*(1-PD));
%     fprintf('F=%2d: AM = %.4f msec, PD = %.3f %%\n', F, W*1000, PD*100);
% end


% =========================================================================
% VARIANTE 2: Dimensionar F mínimo para perda <= alvo
% =========================================================================
% Exemplo: "qual o menor F tal que perda <= 0.1%?" (Ex. 1(b) Guia 6)
% Descomentar:
%
% target = 0.001;       % 0.1%
% F = 1;
% while true
%     m = F + 1;
%     n = 0:m;
%     pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
%     if pi_n(end) <= target
%         break;
%     end
%     F = F + 1;
% end
% fprintf('F mínimo = %d, perda = %.5f %%\n', F, pi_n(end)*100);


% =========================================================================
% VARIANTE 3: Variar lambda e plotar W (curva de saturação)
% =========================================================================
% Útil para "Como varia AM com o aumento da taxa de chegada?"
% Descomentar:
%
% lambda_vals = 500:100:2000;       % pps
% W_vec = zeros(size(lambda_vals));
% for k = 1:length(lambda_vals)
%     rho = lambda_vals(k)/mu;
%     m = F + 1;
%     n = 0:m;
%     pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
%     PD = pi_n(end);
%     L  = sum(n .* pi_n);
%     W_vec(k) = L / (lambda_vals(k)*(1-PD));
% end
% figure;
% plot(lambda_vals, W_vec*1000, '-o');
% xlabel('lambda (pps)'); ylabel('AM (ms)'); grid on;


% =========================================================================
% NOTAS IMPORTANTES
% =========================================================================
%   - Se o tamanho do pacote é exponencial    -> usar M/M/1 ou M/M/1/m
%   - Se o tamanho do pacote é DETERMINÍSTICO -> M/D/1 ou aproximar M/G/1
%   - Se o tamanho é uma distribuição discreta -> M/G/1 (bloco [C])
%   - Para SIMULAR (validar a teoria) -> usar template_Simulacao_IC.m
%   - Para sistemas com TIPO DE SERVIÇO PARTILHADO (CPU/RAM) -> M/M/1/m*PS
%     (ver template_MM1m_PS.m)
