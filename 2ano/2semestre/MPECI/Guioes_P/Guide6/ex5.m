% Guia 6 - Ex. 5: Backup dedicado a conjunto de n primários
clear; clc;

p = 0.999;      % disponibilidade individual
b = 1;          % 1 backup por conjunto

% (a) máximo n tal que A_serv >= 0.9999
target = 0.9999;
n = 1;
while true
    A = Aserv(n, b, p);
    if A < target
        n = n - 1;
        A = Aserv(n, b, p);
        break;
    end
    n = n + 1;
end
fprintf('Maximum value of n = %d\n', n);
fprintf('Resulting VM availability = %.4f%%\n', A*100);

% (b) Gráfico de A_serv para n = 1..1000
n_vals = 1:1000;
A_vals = arrayfun(@(nn) Aserv(nn, b, p), n_vals);
figure;
plot(n_vals, A_vals*100);
xlabel('n');
ylabel('VM availability (%)');
grid on;

% ---- Função A_serv pela fórmula do slide 26 ----
function A = Aserv(n, b, p)
    N = n + b;
    i = 0:N;
    f = arrayfun(@(ii) nchoosek(N,ii), i) .* p.^i .* (1-p).^(N-i);
    % i < n : contribuição parcial (i/n)
    mask_lt = i < n;
    mask_ge = i >= n;
    A = sum(f(mask_lt) .* (i(mask_lt)/n)) + sum(f(mask_ge));
end

