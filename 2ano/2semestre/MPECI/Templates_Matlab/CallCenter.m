% =========================================================================
% TEMPLATE: Sistema M/M/m  (Call Center)  (TP12 slides 34-40)
% =========================================================================
% QUANDO USAR ESTE TEMPLATE:
%   - Call Centers, balcões de atendimento, qualquer serviço com:
%     * m servidores em paralelo
%     * fila INFINITA (clientes esperam, NÃO são recusados)
%     * chegadas Poisson, tempos de serviço exponenciais
%
% PARÂMETROS DE ENTRADA TÍPICOS:
%   - lambda : taxa de chegada (clientes / unidade de tempo)
%   - mu     : taxa de serviço de cada servidor (= 1/tempo médio de serviço)
%   - m      : número de servidores
%
% IMPORTANTE: USAR A MESMA UNIDADE DE TEMPO em lambda e mu!
%   (escolher minutos OU horas OU segundos e converter tudo)
%
% O QUE PODE SER PEDIDO:
%   (1) P_Q : probabilidade de TODOS os servidores estarem ocupados
%   (2) W_Q : tempo médio que cada cliente espera em fila
%   (3) L_Q : n.º médio de clientes em fila
%   (4) Dimensionar m mínimo para W_Q <= alvo
%   (5) Variar lambda e plotar W_Q
%
% CONDIÇÃO DE VALIDADE: rho = lambda/(m*mu) < 1 (senão a fila explode)
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
% Atenção às UNIDADES — neste template usamos MINUTOS
lambda  = 370/60;       % pedidos/minuto (370 pedidos/hora -> /60)
mu      = 1/3;          % pedidos/minuto (1 atendimento cada 3 min)
m       = 20;           % número de servidores
% -------------------------------------------------------------------------

% --- Intensidade de tráfego ----------------------------------------------
rho = lambda / (m * mu);

% Verificação de estabilidade
if rho >= 1
    error('Sistema instável (rho >= 1). Aumentar m ou reduzir lambda.');
end

% --- Cálculo de pi_0 (probabilidade de 0 clientes) -----------------------
% Fórmula slide 36 — denominador tem 2 partes:
%   sum1 = sum_{k=0..m-1} (m*rho)^k / k!
%   sum2 = (m*rho)^m / (m! * (1-rho))     (cauda dos estados n >= m)
k    = 0:(m-1);
sum1 = sum( (m*rho).^k ./ factorial(k) );
sum2 = (m*rho)^m / ( factorial(m) * (1-rho) );
pi0  = 1 / (sum1 + sum2);

% --- Métricas (slide 37) -------------------------------------------------
PQ = sum2 * pi0;                            % prob. de todos ocupados
LQ = ( rho/(1-rho) ) * PQ;                  % n.º médio em fila
WQ = LQ / lambda;                           % tempo médio em fila (Little)
% Equivalente: WQ = ( rho / (lambda*(1-rho)) ) * PQ;

fprintf('--- M/M/m ---\n');
fprintf('  rho = %.4f\n', rho);
fprintf('  P_Q (todos ocupados)   = %.3f %%\n', PQ*100);
fprintf('  L_Q (médio em fila)    = %.4f clientes\n', LQ);
fprintf('  W_Q (espera média)     = %.3f minutos = %.3f segundos\n', WQ, WQ*60);

% =========================================================================
% VARIANTE 1: Dimensionar m mínimo para W_Q <= alvo
% =========================================================================
% Útil para "número mínimo de operadores para W_Q <= 10 segundos"
% Descomentar:
%
% target = 10/60;       % 10 segundos em MINUTOS (= 0.1667)
% m = 1;
% while true
%     rho = lambda/(m*mu);
%     if rho < 1
%         k = 0:(m-1);
%         sum1 = sum( (m*rho).^k ./ factorial(k) );
%         sum2 = (m*rho)^m / ( factorial(m)*(1-rho) );
%         pi0  = 1/(sum1+sum2);
%         PQ   = sum2*pi0;
%         WQ   = (rho/(lambda*(1-rho))) * PQ;
%         if WQ <= target, break; end
%     end
%     m = m + 1;
% end
% fprintf('m mínimo = %d, W_Q = %.3f s\n', m, WQ*60);

% =========================================================================
% VARIANTE 2: Variar lambda e plotar W_Q
% =========================================================================
% Útil para "plotar W_Q para lambda = 320, 330, ..., 380"
% Descomentar:
%
% m = 20;
% lambda_h_vals = 320:10:380;       % ped/HORA
% lambda_vals   = lambda_h_vals/60; % converter para ped/MIN
% WQ_vec = zeros(size(lambda_vals));
% for idx = 1:length(lambda_vals)
%     lambda = lambda_vals(idx);
%     rho = lambda/(m*mu);
%     k = 0:(m-1);
%     sum1 = sum( (m*rho).^k ./ factorial(k) );
%     sum2 = (m*rho)^m / ( factorial(m)*(1-rho) );
%     pi0  = 1/(sum1+sum2);
%     PQ   = sum2*pi0;
%     WQ_vec(idx) = ( rho/(lambda*(1-rho)) ) * PQ;
% end
% figure;
% bar(lambda_h_vals, WQ_vec);
% xlabel('Taxa de chegada (ped/hora)');
% ylabel('Tempo médio em fila (minutos)');
% grid on;
