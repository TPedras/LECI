clear; clc;

C   = 100e6;            % 100 Mbps em bps
B   = 800;              % Bytes
thr = 80e6;             % throughput oferecido em bps
F   = 8;                % capacidade da fila

% Conversões
lambda = thr / (8*B);   % 12500 pps
mu     = C   / (8*B);   % 15625 pps
rho    = lambda/mu;     % 0.8

% M/M/1/m
m    = F + 1;
n    = 0:m;
pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
PD   = pi_n(end);
L    = sum(n .* pi_n);
W    = L / (lambda*(1-PD));

fprintf('lambda = %.0f pps\n', lambda);
fprintf('mu     = %.0f pps\n', mu);
fprintf('rho    = %.4f\n', rho);
fprintf('AM     = %.3f msec\n', W*1000);
fprintf('PD     = %.3f %%\n',  PD*100);


(b) Dimensionar F mínimo para perda ≤ alvo:

target = 0.001;     % 0.1%
F = 1;
while true
    m = F + 1;
    n = 0:m;
    pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
    if pi_n(end) <= target
        break;
    end
    F = F + 1;
end
fprintf('F mínimo = %d, perda = %.5f%%\n', F, pi_n(end)*100);

(c) Varrer vários F e mostrar tabela:

for F = [50 20 10 5]
    m = F + 1;
    n = 0:m;
    pi_n = (1-rho)/(1-rho^(m+1)) .* rho.^n;
    PD = pi_n(end);
    L  = sum(n .* pi_n);
    W  = L / (lambda*(1-PD));
    fprintf('F=%2d: AM = %.4f ms, PD = %.3f %%\n', F, W*1000, PD*100);
end

7. Validação rápida (sanity check)

Antes de entregar, verifica:
- sum(pi_n) ≈ 1 (probabilidades somam a 1)
- 0 ≤ PD ≤ 1
- Se ρ for muito alto (perto de 1), PD será alto; se ρ ≪ 1, PD ≈ 0 → faz sentido?
- O atraso mínimo possível é o tempo de serviço 1/μ (atravessar a fila vazia). Se W < 1/μ, há um erro.

Queres avançar para o Ex2 (M/M/1/m*PS — servidor de dados) ou queres exercitar o Ex1 com um exemplo concreto primeiro?
