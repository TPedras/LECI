% =========================================================================
% TEMPLATE: Disponibilidade com Servidores de Backup  (TP13 slides 22-27)
% =========================================================================
% QUANDO USAR ESTE TEMPLATE:
%   - Sistemas com servidores primários + servidores de backup
%   - Calcular disponibilidade do serviço (não do servidor individual)
%   - Comparar backups DEDICADOS vs PARTILHADOS
%
% PARÂMETROS DE ENTRADA TÍPICOS:
%   - A : disponibilidade de cada servidor individual (igual em todos)
%   - n : número de servidores primários (em conjunto, para shared)
%   - b : número de servidores de backup
%
% DOIS CENÁRIOS:
%
% [A] BACKUP DEDICADO (slide 25)
%     Cada primário tem o seu próprio backup. O serviço falha só se o
%     primário E o backup falharem ao mesmo tempo (elementos em paralelo).
%     Para 1 primário + 1 backup:
%       A_serv = 1 - (1-A)^2
%     Para 1 primário + b backups (cadeia paralela de b+1):
%       A_serv = 1 - (1-A)^(b+1)
%
% [B] BACKUP PARTILHADO (slide 26)
%     b backups partilhados por n primários. Cada backup pode substituir
%     qualquer primário, mas só um de cada vez.
%     Fórmula (slide 26):
%       f(i) = C(n+b, i) * p^i * (1-p)^(n+b-i)   [i servidores disponíveis]
%       A_serv = sum_{i=0..n-1} f(i)*(i/n)  +  sum_{i=n..n+b} f(i)
%     Interpretação:
%       - se i >= n: todos os serviços disponíveis
%       - se i  < n: cada serviço tem probabilidade i/n de estar disponível
%
% O QUE PODE SER PEDIDO:
%   (1) Disponibilidade do serviço com b backups
%   (2) Quantos backups precisamos para alcançar X% de disponibilidade
%   (3) Quantos primários podemos suportar com b backups fixos
%   (4) Comparar dedicado vs partilhado
% =========================================================================

clear; clc;

% --------- PARÂMETROS DE ENTRADA (alterar consoante o exercício) ---------
p_servidor = 0.999;     % disponibilidade individual de cada servidor
n_primarios = 213;      % número de primários (no cenário partilhado)
b_backups   = 1;        % número de backups
% -------------------------------------------------------------------------

% =========================================================================
% [A] BACKUP DEDICADO — 1 backup por cada primário
% =========================================================================
% Tomar 1 primário + b backups dedicados (cadeia em paralelo de b+1
% elementos). O sistema só falha se TODOS falharem:
A_dedicado = 1 - (1 - p_servidor)^(b_backups + 1);
fprintf('--- Backup DEDICADO ---\n');
fprintf('  Com %d backup(s) por primário: A = %.6f%%\n', ...
        b_backups, A_dedicado*100);

% =========================================================================
% [B] BACKUP PARTILHADO — b backups para n primários
% =========================================================================
% Aplicar fórmula slide 26 directamente:
N = n_primarios + b_backups;        % total de servidores no grupo
i = 0:N;                            % i = n.º de servidores disponíveis

% f(i) = C(N,i) * p^i * (1-p)^(N-i)   (distribuição binomial)
f = arrayfun(@(ii) nchoosek(N,ii), i) .* p_servidor.^i .* (1-p_servidor).^(N-i);

% Separar as duas somas da fórmula:
mascara_baixa = i <  n_primarios;   % i < n  -> probabilidade parcial i/n
mascara_alta  = i >= n_primarios;   % i >= n -> serviço sempre disponível

A_partilhado = sum( f(mascara_baixa) .* (i(mascara_baixa)/n_primarios) ) ...
             + sum( f(mascara_alta) );

fprintf('\n--- Backup PARTILHADO ---\n');
fprintf('  n=%d primários, b=%d backup(s): A = %.6f%%\n', ...
        n_primarios, b_backups, A_partilhado*100);

% =========================================================================
% VARIANTE 1: Determinar n máximo (com b fixo) para A >= alvo
% =========================================================================
% Útil para "máximo n tal que disponibilidade >= 99.99%"
% Descomentar:
%
% target = 0.9999;
% b_backups = 1;            % manter fixo
% n_max = 1;
% while true
%     N = n_max + b_backups;
%     i = 0:N;
%     f = arrayfun(@(ii) nchoosek(N,ii), i) .* p_servidor.^i .* (1-p_servidor).^(N-i);
%     A = sum(f(i<n_max).*(i(i<n_max)/n_max)) + sum(f(i>=n_max));
%     if A < target
%         n_max = n_max - 1;      % retroceder ao último válido
%         break;
%     end
%     n_max = n_max + 1;
% end
% fprintf('n máximo = %d\n', n_max);

% =========================================================================
% VARIANTE 2: Plotar A em função de n (b fixo)
% =========================================================================
% Útil para "plotar disponibilidade VM para n de 1 a 1000"
% Descomentar:
%
% b_backups = 1;
% n_vals = 1:1000;
% A_vals = zeros(size(n_vals));
% for k = 1:length(n_vals)
%     n_p = n_vals(k);
%     N   = n_p + b_backups;
%     i   = 0:N;
%     f   = arrayfun(@(ii) nchoosek(N,ii), i) .* p_servidor.^i .* (1-p_servidor).^(N-i);
%     A_vals(k) = sum(f(i<n_p).*(i(i<n_p)/n_p)) + sum(f(i>=n_p));
% end
% figure;
% plot(n_vals, A_vals*100);
% xlabel('n (n.º de primários)');
% ylabel('Disponibilidade (%)');
% grid on;

% =========================================================================
% VARIANTE 3: Determinar b mínimo (com n fixo) para A >= alvo
% =========================================================================
% Útil para "quantos backups partilhados são precisos para 99.99%"
% Descomentar:
%
% target = 0.9999;
% n_primarios = 3;          % fixo
% b = 0;
% while true
%     N = n_primarios + b;
%     i = 0:N;
%     f = arrayfun(@(ii) nchoosek(N,ii), i) .* p_servidor.^i .* (1-p_servidor).^(N-i);
%     A = sum(f(i<n_primarios).*(i(i<n_primarios)/n_primarios)) + sum(f(i>=n_primarios));
%     if A >= target, break; end
%     b = b + 1;
% end
% fprintf('b mínimo = %d, A = %.6f%%\n', b, A*100);
