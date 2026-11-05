% =========================================================================
% TEMPLATE: Disponibilidade via Cadeia de Markov  (TP13 + TP9 slide 18)
% =========================================================================
% QUANDO USAR ESTE TEMPLATE:
%   - Calcular disponibilidade (uptime) de servidores, sistemas, VMs...
%   - Sempre que há múltiplos modos de falha (HW, SW, Hypervisor, VM...)
%     com taxas de falha e reparação diferentes
%   - Necessário: desenhar a cadeia de Markov ANTES de programar
%
% MÉTODO (TP9 slide 18):
%   1. Construir matriz T onde T(i,j) = TAXA DE TRANSIÇÃO DO ESTADO j PARA i
%      (ATENÇÃO: a convenção é "destino na linha, origem na coluna")
%   2. Q = T  com diagonal substituída por Q(i,i) = -soma(coluna i)
%   3. Adicionar equação de normalização: soma(pi) = 1
%   4. Resolver sistema linear M * pi = x
%   5. Disponibilidade = pi(estado_disponível)
%
% PARÂMETROS DE ENTRADA TÍPICOS:
%   - Tempos médios entre falhas (MTBF) de cada componente
%   - Tempos médios de reparação (MTTR) de cada componente
%   - Topologia da cadeia (que estados se ligam a que estados)
%
% O QUE PODE SER PEDIDO:
%   (1) Matriz T
%   (2) Disponibilidade A = pi(1)
%   (3) MTBF e MTTR globais do sistema
%       MTBF = 1 / (soma das taxas de falha a sair do estado "disponível")
%       MTTR = MTBF * (1-A)/A
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
% Escolher uma unidade de TEMPO (aqui: dias)
% Taxas de FALHA (1/MTBF):
lambda_h = 1/(2*365);       % HW: MTBF = 2 anos = 730 dias
lambda_s = 1/180;           % Hypervisor: MTBF = 180 dias
lambda_v = 1/90;            % VM: MTBF = 90 dias

% Taxas de REPARAÇÃO (1/MTTR):
mu_h = 1/2;                 % HW reparado em 2 dias
mu_s = 24/6;                % Hypervisor reparado em 6 horas (6/24 dia)
mu_v = 24/1;                % VM reparado em 1 hora (1/24 dia)
% -------------------------------------------------------------------------

% --- Matriz T : T(i,j) = taxa de transição de j -> i ---------------------
% IMPORTANTE: a coluna é a ORIGEM, a linha é o DESTINO!
% Definir os estados (decidir antes da matriz):
%   estado 1 = disponível
%   estado 2 = reparação HW
%   estado 3 = reparação Hypervisor (ou SW)
%   estado 4 = reparação VM
%
% Topologia deste exemplo:
%   1 -> 2 (falha HW, taxa lambda_h)
%   2 -> 3 (HW reparado MAS o software ainda precisa de recuperação)
%   3 -> 1 (Hypervisor reparado, INCLUI recuperação da VM)
%   1 -> 3 (falha de Hypervisor directa)
%   1 -> 4 (falha de VM)
%   4 -> 1 (VM reparada)
%
% Construir T preenchendo só as transições que existem:
%       de:    1          2     3      4
%       para:
T = [ 0         0     mu_s   mu_v ;   % chegadas ao estado 1
      lambda_h  0     0      0    ;   % chegadas ao estado 2
      lambda_s  mu_h  0      0    ;   % chegadas ao estado 3
      lambda_v  0     0      0    ];  % chegadas ao estado 4

disp('Matriz das taxas de transição T:');
disp(T);

% --- Método TP9 slide 18 -------------------------------------------------
% Q tem os mesmos valores de T fora da diagonal e cada diagonal Q(i,i)
% é o SIMÉTRICO da soma da respectiva coluna de T.
% Resultado: as colunas de Q somam 0 (conservação de probabilidade).
n = length(T);
Q = T;
for i = 1:n
    Q(i,i) = -sum(T(:,i));
end

% Para resolver Q*pi = 0 com a restrição sum(pi)=1, anexamos uma linha
% de 1s a Q e um 1 no vector x (e zeros nos restantes).
M = [Q; ones(1,n)];                 % (n+1) x n
x = [zeros(n,1); 1];                % (n+1) x 1
pi_vec = M \ x;                     % resolve por mínimos quadrados

% --- Resultados ----------------------------------------------------------
A = pi_vec(1);                      % disponibilidade = pi do estado 1

fprintf('Probabilidades limite:\n');
for i = 1:n
    fprintf('  pi(%d) = %.6f\n', i, pi_vec(i));
end
fprintf('\nDisponibilidade do servidor = %.3f%%\n', A*100);

% --- MTBF e MTTR globais -------------------------------------------------
% MTBF = tempo médio em estado 1 antes de falhar = 1/(somar taxas de saída)
% Aqui: somar TODAS as taxas que saem do estado 1 (todos os lambdas)
MTBF_dias  = 1 / (lambda_h + lambda_s + lambda_v);
MTTR_dias  = MTBF_dias * (1-A)/A;
MTTR_horas = MTTR_dias * 24;

fprintf('MTBF = %.2f dias\n', MTBF_dias);
fprintf('MTTR = %.2f horas\n', MTTR_horas);

% =========================================================================
% NOTAS PARA ADAPTAR A OUTROS EXERCÍCIOS:
% =========================================================================
% 1. DESENHAR A CADEIA DE MARKOV NO PAPEL primeiro
%    - identificar estados
%    - identificar transições e respectivas taxas
%
% 2. CONVERTER UNIDADES — todas as taxas têm de estar na MESMA unidade
%    (todos em /dia, ou todos em /hora, ou todos em /segundo)
%    Conversões úteis:
%       1 ano  = 365 dias
%       1 dia  = 24 horas
%       1 hora = 60 minutos
%
% 3. PREENCHER T:
%    - se há transição "i -> j" com taxa r, então T(j, i) = r
%    - a diagonal de T pode ficar 0 (será substituída em Q)
%
% 4. INTERPRETAR pi_vec:
%    - cada componente é a probabilidade limite (estacionária) de estar
%      em cada estado
%    - somar as componentes dos estados "disponível" se o sistema for
%      considerado disponível em mais do que um estado
%
% 5. EXEMPLOS DE TOPOLOGIAS COMUNS:
%    (a) Servidor único (2 estados):     1 <-> 2
%    (b) HW + SW, HW inclui SW (3 estados, slide 13):
%        1 -> 2 (HW), 1 -> 3 (SW), 2 -> 1, 3 -> 1
%    (c) HW + SW, HW não inclui SW (slide 14):
%        1 -> 2 (HW), 2 -> 3 (HW pronto, SW falta), 3 -> 1
%    (d) HW + Hypervisor + VM (slide 16): 4 estados
