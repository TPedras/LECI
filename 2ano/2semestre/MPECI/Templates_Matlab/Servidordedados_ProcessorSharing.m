% =========================================================================
% TEMPLATE: Sistema M/M/1/m*PS  (Processor Sharing)  (TP12 slides 16-24)
% =========================================================================
% QUANDO USAR ESTE TEMPLATE:
%   - Servidores de DADOS (Web, CPU/RAM limitados, não a ligação)
%   - 1 servidor que atende ATÉ m pedidos em simultâneo
%   - Disciplina Processor Sharing: recursos divididos por igual entre os
%     pedidos em processamento
%   - Quando os m pedidos estão a ser servidos, pedidos novos são RECUSADOS
%   - Tempo de serviço por pedido em estado n: n/(m*mu)
%     -> Quando há n=m pedidos, cada um demora 1/mu (capacidade máxima)
%
% PARÂMETROS DE ENTRADA TÍPICOS:
%   - lambda : taxa de chegada (pedidos/segundo)
%   - mu     : taxa de serviço por pedido quando o servidor está cheio
%              (calculada a partir do tempo médio que cada pedido demora
%               quando há m pedidos em simultâneo)
%   - m      : número máximo de pedidos simultâneos
%
% O QUE PODE SER PEDIDO:
%   (1) Probabilidade de bloqueio (pedido recusado) = pi_m
%   (2) Tempo médio de serviço por pedido aceite = W (Little)
%   (3) Número médio de pedidos em processamento = L
%   (4) Dimensionar m para bloqueio <= alvo
%
% IMPORTANTE: as FÓRMULAS são iguais ao M/M/1/m, mas com rho = lambda/(m*mu)
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
lambda      = 1.23e6;       % pedidos/segundo
tempo_max   = 200e-6;       % tempo de serviço por pedido EM CAPACIDADE MÁX. (s)
m           = 250;          % capacidade (pedidos simultâneos máximos)
% -------------------------------------------------------------------------

% --- Taxa de serviço por pedido ------------------------------------------
% Quando há m pedidos no sistema, cada um vê tempo de serviço 1/mu.
% Portanto:  mu = 1 / tempo_max
mu  = 1 / tempo_max;            % pedidos/segundo

% --- Intensidade de tráfego ----------------------------------------------
% rho = lambda / (m*mu)   (ATENÇÃO: dividir por m, não por mu apenas!)
rho = lambda / (m * mu);

% --- Probabilidades limite pi_n (n = 0,...,m) ----------------------------
% Mesma fórmula do M/M/1/m
n    = 0:m;
pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;

% --- Métricas principais -------------------------------------------------
P_block = pi_n(end);                            % bloqueio = pi_m (PASTA)
L       = sum(n .* pi_n);                       % n.º médio no sistema
W       = L / ( lambda * (1 - P_block) );       % tempo médio por pedido aceite

fprintf('--- M/M/1/m*PS ---\n');
fprintf('  rho                              = %.4f\n', rho);
fprintf('  Probabilidade de bloqueio        = %.5f %%\n', P_block*100);
fprintf('  Tempo médio de serviço (Little)  = %.3f microssegundos\n', W*1e6);
fprintf('  N.º médio de pedidos a processar = %.3f\n', L);

% =========================================================================
% VARIANTE 1: Varrer vários valores de m (capacidade do servidor)
% =========================================================================
% Útil para "comparar bloqueio e tempo médio para m = 200,250,300,350,400"
% Descomentar o bloco abaixo:
%
% m_vals = [200 250 300 350 400];
% P_vec = zeros(size(m_vals));
% W_vec = zeros(size(m_vals));
% for k = 1:length(m_vals)
%     m = m_vals(k);
%     rho = lambda / (m*mu);
%     n = 0:m;
%     pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
%     P_vec(k) = pi_n(end);
%     L = sum(n .* pi_n);
%     W_vec(k) = L / (lambda*(1-P_vec(k)));
% end
% figure;
% subplot(1,2,1); bar(m_vals, P_vec*100);
% xlabel('m'); ylabel('Bloqueio (%)');
% subplot(1,2,2); bar(m_vals, W_vec*1e6);
% xlabel('m'); ylabel('Tempo médio (µs)');

% =========================================================================
% VARIANTE 2: Dimensionar m para bloqueio <= alvo
% =========================================================================
% target = 0.0001;      % 0.01%
% m = 1;
% while true
%     rho = lambda / (m*mu);
%     if rho < 1
%         n = 0:m;
%         pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
%         if pi_n(end) <= target
%             break;
%         end
%     end
%     m = m + 1;
% end
% fprintf('m mínimo = %d, bloqueio = %.5f%%\n', m, pi_n(end)*100);
