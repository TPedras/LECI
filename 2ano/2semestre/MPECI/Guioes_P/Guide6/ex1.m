
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
C      = 100e6;      % capacidade da ligação (bps)
B      = 800;           % tamanho médio do pacote (Bytes)
F      = 8;       % capacidade da fila (em pacotes; só para M/M/1/m)
lambda = (80e6) / (8*B); % taxa de chegada (pps - pacotes por segundo)

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

fprintf('  AM (atraso médio)   = %.4f msec\n', W*1000);
fprintf('  WQ (espera em fila) = %.4f msec\n', WQ*1000);


% b

  while true
    m = m -1;
    n    = 0:m;
    pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;     % probabilidades limite

    PD = pi_n(end);                             % perda (= pi_m, PASTA)
    L  = sum(n .* pi_n);                        % n.º médio no sistema
    W  = L / ( lambda * (1-PD) );               % Teorema de Little
    WQ = W - 1/mu;                              % tempo médio em fila
    if (WQ*1000) < 0.1

    endif

  endwhile

% da taxa de chegada?"
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

