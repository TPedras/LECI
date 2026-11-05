%% Exercício 2 - Servidor de Dados (Erlang-B)
clear all; clc;

% Parâmetros fixos
lambda = 1.23e6;        % pedidos/segundo
avg_time_at_250 = 200e-6; % tempo total quando B=250
B_base = 250;

% O tempo de serviço de cada "unidade" de processamento
service_time_per_unit = avg_time_at_250 * B_base; % 0.05 segundos
mu_unit = 1 / service_time_per_unit;
A = lambda / mu_unit;   % Carga em Erlangs (0.984)

%% Alínea (a) - Cálculo para B = 250
B_a = 250;
PB_a = erlangB(A, B_a);
% Tempo médio por pedido processado
avg_service_time_a = (service_time_per_unit / B_a) * (1 - PB_a) * 1e6;

fprintf('--- Alínea (a) ---\n');
fprintf('Service blocking probability = %.5f%%\n', PB_a * 100);
fprintf('Avg. service time per request = %.3f microseconds\n\n', avg_service_time_a);

%% Alínea (b) - Gráficos para B = [200, 250, 300, 350, 400]
B_list = [200, 250, 300, 350, 400];
PB_list = zeros(1, length(B_list));
T_list = zeros(1, length(B_list));

for i = 1:length(B_list)
    B = B_list(i);
    PB_list(i) = erlangB(A, B) * 100; % em %
    % O tempo de serviço reflete a partilha de recursos
    T_list(i) = (avg_time_at_250 * B_base / B) * 1e6;
end

% Plotting
figure;
subplot(1,2,1);
bar(B_list, PB_list);
xlabel('Acceptance limit B'); ylabel('Blocking probability (%)');
title('Blocking Probability'); grid on;

subplot(1,2,2);
bar(B_list, T_list);
xlabel('Acceptance limit B'); ylabel('Avg. service time (usecs)');
title('Average Service Time'); grid on;

%% Função Erlang-B (Recursiva para evitar factoriais gigantes)
function b = erlangB(A, B)
invB = 1;
for i = 1:B
    invB = 1 + (i / A) * invB;
end
b = 1 / invB;
end
