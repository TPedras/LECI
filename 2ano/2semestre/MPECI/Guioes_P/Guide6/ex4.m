%% Exercício 4 - Disponibilidade e Fiabilidade de uma VM
clear all; clc;

% -------------------------------------------------------------------------
% Alínea (a) - Matriz de Taxas de Transição (Infinitesimal)
% Convenção do curso: Linha = Destino, Coluna = Origem
% -------------------------------------------------------------------------

% Inicializar matriz 4x4 vazia
R = zeros(4,4);

% Entradas da Coluna 1 (Saídas do Estado 1 - Disponível)
R(2,1) = 1 / (2 * 365);  % Para Est. 2 (Falha Hardware): ~0.0014
R(3,1) = 1 / 180;        % Para Est. 3 (Falha Hypervisor): ~0.0056
R(4,1) = 1 / 90;         % Para Est. 4 (Falha VM): ~0.0111

% Entradas da Coluna 2 (Saídas do Estado 2 - Reparação Hardware)
R(3,2) = 1 / 2;          % Transita para o Est. 3 (Precisa recuperar Hypervisor)

% Entradas da Coluna 3 (Saídas do Estado 3 - Reparação Hypervisor)
R(1,3) = 1 / (6/24);     % Transita para o Est. 1 (6 horas = 0.25 dias -> taxa = 4)

% Entradas da Coluna 4 (Saídas do Estado 4 - Reparação VM)
R(1,4) = 1 / (1/24);     % Transita para o Est. 1 (1 hora = 1/24 dias -> taxa = 24)

% Ajustar a diagonal principal: cada elemento d_ii é a soma negativa da sua coluna
for c = 1:4
    R(c,c) = -sum(R(:,c));
end

disp('--- (a) Matriz de Taxas de Transição (R): ---');
disp(R);

% -------------------------------------------------------------------------
% Alínea (b) - Determinar a Disponibilidade do Servidor
% -------------------------------------------------------------------------
% Para resolver o estado estacionário em tempo contínuo: R * p = 0  com sum(p)=1
M = R;
M(4,:) = ones(1,4); % Substituir a última equação pela restrição de soma = 1
b = [0; 0; 0; 1];

p_estacionario = M \ b;
disponibilidade = p_estacionario(1) * 100; % Estado 1 é o único disponível

fprintf('--- (b) Disponibilidade: ---\n');
fprintf('Server availability = %.3f%%\n\n', disponibilidade);

% -------------------------------------------------------------------------
% Alínea (c) - Determinar MTBF e MTTR
% -------------------------------------------------------------------------
% A taxa global de falha (quando o sistema está operacional no Estado 1)
% é a soma de todas as taxas que saem do Estado 1.
taxa_falha_global = sum(R(:,1)) + R(1,1); % Remove o termo da diagonal

MTBF = 1 / taxa_falha_global; % Em dias

% Usando a relação clássica de disponibilidade: Disponibilidade = MTBF / (MTBF + MTTR)
% Logo: MTTR = MTBF * (1 - A) / A
A_prob = p_estacionario(1); % Disponibilidade em formato probabilístico [0, 1]
MTTR_dias = MTBF * (1 - A_prob) / A_prob;
MTTR_horas = MTTR_dias * 24; % Converter para horas

fprintf('--- (c) Métricas de Fiabilidade: ---\n');
fprintf('MTBF (mean time between failures) = %.2f days\n', MTBF);
fprintf('MTTR (mean time to repair)       = %.2f hours\n', MTTR_horas);
