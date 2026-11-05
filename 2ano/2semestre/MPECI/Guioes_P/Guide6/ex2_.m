% Guia 6 - Ex. 2: Servidor de dados M/M/1/m*PS
clear; clc;

% Parâmetros
mu = 1/200e-6;          % 1/200 µs = 5000 pedidos/seg
lambda = 1.23e6;        % pedidos/seg

% (a) B = 250
B = 250;
rho = lambda / (B*mu);
n = 0:B;
pi_n = (1-rho)/(1-rho^(B+1)) .* rho.^n;
P_block = pi_n(end);
L = sum(n .* pi_n);
W = L / (lambda*(1-P_block));

fprintf('(a) B = %d:\n', B);
fprintf('    Service blocking probability = %.5f%%\n', P_block*100);
fprintf('    Avg. service time per request = %.3f microseconds\n', W*1e6);

% (b) Varrer B = 200, 250, 300, 350, 400
B_vals = [200 250 300 350 400];
P_block_v = zeros(size(B_vals));
W_v       = zeros(size(B_vals));

for k = 1:length(B_vals)
    B = B_vals(k);
    rho = lambda / (B*mu);
    n = 0:B;
    pi_n = (1-rho)/(1-rho^(B+1)) .* rho.^n;
    P_block_v(k) = pi_n(end);
    L = sum(n .* pi_n);
    W_v(k) = L / (lambda*(1-P_block_v(k)));
end

figure;
subplot(1,2,1);
bar(B_vals, P_block_v*100);
xlabel('Acceptance limit B (no. of requests)');
ylabel('Blocking probability (%)');

subplot(1,2,2);
bar(B_vals, W_v*1e6);
xlabel('Acceptance limit B (no. of requests)');
ylabel('Avg. service time per request (microsec.)');

