% =========================================================================
% TEMPLATE: Simulação com Intervalos de Confiança  (TP10)
% =========================================================================
% QUANDO USAR ESTE TEMPLATE:
%   - Sempre que se usa um simulador (LinkSimulator, VideoStreamingSimulator,
%     LinkSimulator_disc, etc.) e é preciso estimar uma média + IC
%   - Trabalha com QUALQUER simulador que devolva 1 ou mais métricas
%
% MÉTODO:
%   1. Correr o simulador R vezes (replicações independentes)
%   2. Guardar o valor da métrica em cada run
%   3. Calcular média = mean(samples)
%   4. Calcular intervalo de confiança usando t-Student:
%        IC = média ± t * desvio_padrão / sqrt(R)
%      onde t = tinv(1 - alpha/2, R-1)  e  alpha = 1 - nível_confiança
%
% EXERCÍCIOS COBERTOS POR ESTE TEMPLATE:
%   - Ex. 2 Guia 5  : PB e DB com IC (video-streaming exponencial)
%   - Ex. 6 Guia 5  : AM exponencial
%   - Ex. 7 Guia 5  : AM com tamanho de pacote DISCRETO (modificar sim.)
%   - Ex. 8 Guia 5  : variar lambda
%   - Ex. 9 Guia 5  : bar chart com error bars
%   - Ex. 10 Guia 5 : adicionar estimação de PD
%   - Ex. 11 Guia 5 : variar F (capacidade da fila)
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
lambda = 1000;          % pps
B      = 600;           % Bytes
C      = 10;            % Mbps
F      = 1000;          % capacidade da fila
N      = 1e4;           % critério de paragem (n.º de pacotes)

R          = 100;       % n.º de runs (replicações)
nivel_conf = 0.90;      % nível de confiança (90%)
% -------------------------------------------------------------------------

% =========================================================================
% CASO BASE: simulador original com pacote exponencial (Ex. 6 Guia 5)
% =========================================================================
AM_runs = zeros(1, R);
for k = 1:R
    AM_runs(k) = LinkSimulator(lambda, B, C, F, N);
end

% Cálculo de média e IC
m_AM  = mean(AM_runs);
s_AM  = std(AM_runs);
alpha = 1 - nivel_conf;
t     = tinv(1 - alpha/2, R-1);             % quantil t-Student bilateral
h_AM  = t * s_AM / sqrt(R);                 % semi-largura

fprintf('Caso base (pacote exponencial):\n');
fprintf('  AM = %.4f [%.4f - %.4f] msec\n', ...
        m_AM*1000, (m_AM-h_AM)*1000, (m_AM+h_AM)*1000);


% =========================================================================
% VARIANTE PARA Ex. 7: Tamanho de pacote DISCRETO
% =========================================================================
% PASSO A: construir a distribuição discreta
% PASSO B: pré-calcular a CDF para amostragem rápida no simulador
% PASSO C: usar LinkSimulator_disc (versão modificada do simulador)
% PASSO D: calcular média + IC como no caso base
% -------------------------------------------------------------------------
% PASSO A: construir distribuição -----------------------------------------
% Exemplo do Ex. 7 do Guia 5:
%   - 64 Bytes  com probabilidade 29.606%
%   - 110 Bytes com probabilidade 16.417%
%   - 1500 Bytes com probabilidade 19.601%
%   - todos os outros valores (65..109 e 111..1499) com a mesma prob.
p_64   = 0.29606;
p_110  = 0.16417;
p_1500 = 0.19601;
outros = [65:109, 111:1499];                            % 1434 valores
p_outro = (1 - p_64 - p_110 - p_1500) / length(outros);

% Vector de tamanhos ORDENADO + vector de probabilidades correspondentes
sizes = [64,   65:109,                          110, ...
         111:1499,                              1500];
probs = [p_64, repmat(p_outro, 1, 45), ...      p_110, ...
         repmat(p_outro, 1, 1389),              p_1500];

% Sanity check
fprintf('\nSanity check da distribuição:\n');
fprintf('  Soma probs   = %.10f (deve ser 1)\n', sum(probs));
fprintf('  Tamanho médio = %.4f Bytes\n',         sum(sizes.*probs));

% PASSO B: pré-calcular CDF -----------------------------------------------
cdf      = cumsum(probs);
cdf(end) = 1;                                   % forçar para evitar arred.

% PASSO C: correr o simulador modificado R vezes --------------------------
% A função LinkSimulator_disc(lambda, C, F, N, sizes, cdf) faz inverse-
% transform sampling em cada serviço (ver código no Guia 5).
AM_runs_d = zeros(1, R);
for k = 1:R
    AM_runs_d(k) = LinkSimulator_disc(lambda, C, F, N, sizes, cdf);
end

% PASSO D: média + IC
m_AM_d = mean(AM_runs_d);
s_AM_d = std(AM_runs_d);
h_AM_d = t * s_AM_d / sqrt(R);
fprintf('\nEx. 7 (pacote discreto):\n');
fprintf('  Avg. Packet Size = %.4f Bytes\n', sum(sizes.*probs));
fprintf('  AM = %.4f [%.4f - %.4f] msec\n', ...
        m_AM_d*1000, (m_AM_d-h_AM_d)*1000, (m_AM_d+h_AM_d)*1000);


% =========================================================================
% VARIANTE PARA Ex. 8/9: Variar lambda, plotar barras com error bars
% =========================================================================
% Descomentar:
%
% lambda_vals = [1000 1250 1500 1750 2000];
% medias  = zeros(size(lambda_vals));
% larguras = zeros(size(lambda_vals));
% for idx = 1:length(lambda_vals)
%     samples = zeros(1, R);
%     for k = 1:R
%         samples(k) = LinkSimulator_disc(lambda_vals(idx), C, F, N, sizes, cdf);
%     end
%     medias(idx)   = mean(samples)*1000;     % ms
%     larguras(idx) = tinv(1-alpha/2, R-1)*std(samples)/sqrt(R)*1000;
% end
% figure;
% bar(lambda_vals, medias); hold on;
% errorbar(lambda_vals, medias, larguras, 'k.', 'LineWidth', 1.5);
% xlabel('lambda (pps)'); ylabel('AM (ms)');
% grid on; hold off;


% =========================================================================
% VARIANTE PARA Ex. 10/11: Simulador devolve VÁRIAS métricas (AM + PD)
% =========================================================================
% Requer modificar o simulador para também devolver PD (contar pacotes
% descartados na chegada quando a fila está cheia).
% Descomentar:
%
% F_vals = [50 20 10 5];
% for F = F_vals
%     AM_v = zeros(1, R);
%     PD_v = zeros(1, R);
%     for k = 1:R
%         [AM_v(k), PD_v(k)] = LinkSimulator_disc_PD(lambda, C, F, N, sizes, cdf);
%     end
%     m_A = mean(AM_v); h_A = tinv(1-alpha/2,R-1)*std(AM_v)/sqrt(R);
%     m_P = mean(PD_v); h_P = tinv(1-alpha/2,R-1)*std(PD_v)/sqrt(R);
%     fprintf('F=%2d: AM = %.4f [%.4f - %.4f] ms\n', F, ...
%             m_A*1000, (m_A-h_A)*1000, (m_A+h_A)*1000);
%     fprintf('      PD = %.3f [%.3f - %.3f] %%\n', ...
%             m_P*100, (m_P-h_P)*100, (m_P+h_P)*100);
% end


% =========================================================================
% VARIANTE PARA Ex. 2 Guia 5: Comparar IC para R = 10 vs R = 100
% =========================================================================
% Descomentar:
%
% for R = [10 100]
%     samples = zeros(1, R);
%     for k = 1:R
%         samples(k) = LinkSimulator(lambda, B, C, F, N);
%     end
%     t  = tinv(1-alpha/2, R-1);
%     h_ = t*std(samples)/sqrt(R);
%     fprintf('R=%3d: AM = %.4f [%.4f - %.4f] ms\n', R, ...
%             mean(samples)*1000, (mean(samples)-h_)*1000, ...
%             (mean(samples)+h_)*1000);
% end
% % NOTA: a largura do IC diminui como 1/sqrt(R)
% %        R*10 => largura ~ 3.16x menor


% =========================================================================
% NOTAS IMPORTANTES
% =========================================================================
%
% (1) Para o EXERCÍCIO 7 (distribuição discreta), é preciso TER o ficheiro
%     LinkSimulator_disc.m (versão modificada do simulador) na pasta de
%     trabalho. Ver o script "ex7_guia5.m" no Guide5/ para o código
%     completo do simulador modificado.
%
% (2) A modificação chave em LinkSimulator_disc é substituir
%        tTime = 8 * exprnd(B) / (C*1e6);
%     por
%        pkt_size = sizes( find(rand <= cdf, 1) );
%        tTime    = 8 * pkt_size / (C*1e6);
%
% (3) Para o Ex. 10 (com PD), é preciso adicionar um contador de pacotes
%     descartados no simulador (no ramo "if QUEUE_N < F ... else descarta").
%
% (4) tinv(1 - alpha/2, R-1):
%       - 90% => alpha = 0.10 => 1 - alpha/2 = 0.95
%       - 95% => alpha = 0.05 => 1 - alpha/2 = 0.975
%       - 99% => alpha = 0.01 => 1 - alpha/2 = 0.995
