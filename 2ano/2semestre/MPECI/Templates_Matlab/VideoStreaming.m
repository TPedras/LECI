% =========================================================================
% TEMPLATE: Sistema M/M/m/m  (Erlang-B, sistema com BLOQUEIO sem fila)
% =========================================================================
% QUANDO USAR ESTE TEMPLATE:
%   - Video-streaming (m streams em paralelo, sem fila)
%   - Trunking telefónico clássico (Erlang-B)
%   - Qualquer sistema com m servidores e SEM fila de espera:
%     se chegar quando todos ocupados, o pedido é RECUSADO
%
% PARÂMETROS DE ENTRADA TÍPICOS:
%   - lambda : taxa de chegada
%   - mu     : taxa de serviço de cada servidor (1 / tempo médio)
%   - m      : número de servidores
%
% O QUE PODE SER PEDIDO:
%   (1) PB : probabilidade de bloqueio (= pi_m)
%   (2) DB : débito (throughput) médio = (1-PB) * lambda * B
%            onde B é o débito por sessão (ex.: Mbps por filme)
%   (3) N.º médio de sessões activas: L = (1-PB) * lambda / mu
%
% NOTA: M/M/m/m é ESTÁVEL para qualquer rho (não é preciso rho<1) porque
%       o sistema é finito.
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
lambda      = 2;            % pedidos/minuto
tempo_medio = 100.39;       % duração média da sessão (minutos)
m           = 200;          % número máximo de sessões simultâneas
B_por_sessao = 2;           % débito por sessão (Mbps), só usar se relevante
% -------------------------------------------------------------------------

mu  = 1 / tempo_medio;          % taxa de serviço por servidor
rho = lambda / mu;              % "carga oferecida" — pode ser > 1 no M/M/m/m!

% --- Probabilidades limite (Erlang-B) ------------------------------------
%   pi_n = ( (lambda/mu)^n / n! ) / SUM_{k=0..m} (lambda/mu)^k/k!
n    = 0:m;
termos = rho.^n ./ factorial(n);
pi_n   = termos / sum(termos);

% --- Métricas ------------------------------------------------------------
PB = pi_n(end);                         % probabilidade de bloqueio = pi_m
DB = (1 - PB) * lambda * tempo_medio * B_por_sessao;
%    ^^^^^^^^^^^^^^^^^^   ^^^^^^^^^^^^^^^^^^^^^^^^^
%    pedidos aceites/min  Mbps por pedido sustentados em média
%    Equivalente: DB = L * B_por_sessao, onde L = lambda*(1-PB)/mu
L = (1-PB) * lambda / mu;               % n.º médio de sessões em curso

fprintf('--- M/M/m/m (Erlang-B) ---\n');
fprintf('  lambda/mu (carga oferecida) = %.3f\n', rho);
fprintf('  PB (probabilidade de bloqueio) = %.4f %%\n', PB*100);
fprintf('  L  (n.º médio de sessões)      = %.2f\n', L);
fprintf('  DB (débito médio total)        = %.2f Mbps\n', DB);

% =========================================================================
% VARIANTE 1: Dimensionar m para PB <= alvo
% =========================================================================
% target = 0.01;        % 1%
% m = 1;
% while true
%     n = 0:m;
%     termos = rho.^n ./ factorial(n);
%     pi_n = termos / sum(termos);
%     if pi_n(end) <= target
%         break;
%     end
%     m = m + 1;
% end
% fprintf('m mínimo = %d, PB = %.4f%%\n', m, pi_n(end)*100);

% =========================================================================
% VARIANTE 2: Recursivo (mais robusto para m grande)
% =========================================================================
% Quando m é muito grande, factorial(n) pode overflow. Em alternativa:
% Fórmula recursiva de Erlang-B:
%   B(0) = 1
%   B(n) = (rho * B(n-1)) / (n + rho * B(n-1))
% Descomentar:
%
% Bn = 1;
% for n = 1:m
%     Bn = (rho * Bn) / (n + rho * Bn);
% end
% PB = Bn;
% fprintf('PB (recursivo) = %.4f%%\n', PB*100);
