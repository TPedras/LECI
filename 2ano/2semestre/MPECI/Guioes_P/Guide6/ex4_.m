% Guia 6 - Ex. 4: Disponibilidade VM com cadeia de Markov
clear; clc;

% Taxas de falha (dia^-1)
lambda_h = 1/(2*365);    % HW: MTBF 2 anos
lambda_s = 1/180;        % Hypervisor: MTBF 180 dias
lambda_v = 1/90;         % VM: MTBF 90 dias

% Taxas de reparação (dia^-1)
mu_h = 1/2;              % HW: 2 dias
mu_s = 24/6;             % Hypervisor: 6 horas
mu_v = 24/1;             % VM: 1 hora

% (a) Matriz T : T(i,j) = taxa de j -> i
% Estados: 1=disponível, 2=rep HW, 3=rep Hypervisor, 4=rep VM
T = [0          0       mu_s    mu_v
     lambda_h   0       0       0
     lambda_s   mu_h    0       0
     lambda_v   0       0       0];

disp('Matrix of the state transition rates:');
disp(T);

% (b) Disponibilidade — método TP9 slide 18
n = length(T);
Q = T;
for i = 1:n
    Q(i,i) = -sum(T(:,i));
end
M = [Q; ones(1,n)];
x = [zeros(n,1); 1];
pi_vec = M\x;

A = pi_vec(1);
fprintf('Server availability = %.3f%%\n', A*100);

% (c) MTBF e MTTR
MTBF = 1/(lambda_h + lambda_s + lambda_v);           % dias
MTTR_days  = MTBF * (1-A)/A;
MTTR_hours = MTTR_days * 24;

fprintf('MTBF = %.2f days\n', MTBF);
fprintf('MTTR = %.2f hours\n', MTTR_hours);

