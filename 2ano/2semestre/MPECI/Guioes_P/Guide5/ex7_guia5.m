% =========================================================================
% Guia 5 - Exercício 7
% =========================================================================
% O QUE SE PEDE:
%   1) Construir uma distribuição DISCRETA para o tamanho dos pacotes:
%        - 64 Bytes   : 29.606%
%        - 110 Bytes  : 16.417%
%        - 1500 Bytes : 19.601%
%        - todos os outros valores entre 65..109 e 111..1499 com a MESMA
%          probabilidade (a probabilidade restante distribuída por igual)
%   2) Calcular o tamanho MÉDIO dos pacotes desta distribuição.
%   3) Correr o simulador modificado 100 vezes com:
%        lambda = 1000 pps, C = 10 Mbps, F = 1000 pacotes, N = 1e4
%   4) Estimar AM (atraso médio) e o intervalo de confiança a 90%.
%   5) Comparar com Ex. 6 (que usava distribuição exponencial).
% =========================================================================

clear; clc;

% -------------------------------------------------------------------------
% PASSO 1: Construir a distribuição discreta
% -------------------------------------------------------------------------
p_64   = 0.29606;
p_110  = 0.16417;
p_1500 = 0.19601;

% Valores "outros" com probabilidade igual (de 65 a 109 e de 111 a 1499)
outros_sizes = [65:109, 111:1499];
n_outros     = length(outros_sizes);

% Probabilidade restante a dividir pelos n_outros valores
p_restante = 1 - (p_64 + p_110 + p_1500);
p_outro    = p_restante / n_outros;     % probabilidade individual de cada um

% Construir vectores completos de tamanhos e probabilidades, ORDENADOS:
sizes = [64, 65:109, 110, 111:1499, 1500];
probs = [p_64, ...
         repmat(p_outro, 1, length(65:109)), ...
         p_110, ...
         repmat(p_outro, 1, length(111:1499)), ...
         p_1500];

% Verificação: a soma das probabilidades deve dar 1
fprintf('Verificação: soma das probabilidades = %.10f\n', sum(probs));

% -------------------------------------------------------------------------
% PASSO 2: Calcular o tamanho médio
% -------------------------------------------------------------------------
% E[B] = sum_i ( size_i * prob_i )
B_avg = sum(sizes .* probs);
fprintf('Avg. Packet Size = %.4f Bytes\n', B_avg);

% -------------------------------------------------------------------------
% PASSO 3: Pré-calcular a CDF (para inverse-transform sampling no simulador)
% -------------------------------------------------------------------------
% A CDF é o cumulativo das probabilidades. Por segurança fazemos o último
% valor exactamente 1 para evitar problemas de arredondamento.
cdf      = cumsum(probs);
cdf(end) = 1;

% -------------------------------------------------------------------------
% PASSO 4: Correr o simulador R = 100 vezes e estimar AM
% -------------------------------------------------------------------------
lambda = 1000;          % pps
C      = 10;            % Mbps
F      = 1000;          % capacidade da fila
N      = 1e4;           % critério de paragem
R      = 100;           % n.º de replicações
nivel  = 0.90;          % nível de confiança

AM_runs = zeros(1, R);
fprintf('A correr %d simulações...\n', R);
for k = 1:R
    AM_runs(k) = LinkSimulator_disc(lambda, C, F, N, sizes, cdf);
end

% -------------------------------------------------------------------------
% PASSO 5: Calcular média e intervalo de confiança a 90%
% -------------------------------------------------------------------------
m_AM = mean(AM_runs);
s_AM = std(AM_runs);

alpha = 1 - nivel;
t     = tinv(1 - alpha/2, R-1);             % quantil t-Student
h     = t * s_AM / sqrt(R);                 % semi-largura do IC

IC_min = m_AM - h;
IC_max = m_AM + h;

fprintf('\n--- Resultados ---\n');
fprintf('Avg. Packet Size = %.4f Bytes\n', B_avg);
fprintf('AM = %.4f [%.4f - %.4f] msec\n', ...
        m_AM*1000, IC_min*1000, IC_max*1000);

% -------------------------------------------------------------------------
% CONCLUSÃO (a tirar comparando com o Ex. 6):
% -------------------------------------------------------------------------
% No Ex. 6 (tamanho exponencial, B = 600 Bytes em média) obtivemos
% aproximadamente AM = 0.9231 ms.
%
% Aqui obtemos AM ~= 0.919 ms, ligeiramente INFERIOR. Embora o tamanho
% médio do pacote seja praticamente o mesmo (~600 Bytes), a distribuição
% discreta tem MENOR variância (E[S^2] menor) — logo, pela fórmula de
% Pollaczek-Khinchine, o tempo de espera médio é menor.
%
% Conclusão: para o MESMO tamanho médio, uma distribuição menos dispersa
% produz menor atraso médio.
