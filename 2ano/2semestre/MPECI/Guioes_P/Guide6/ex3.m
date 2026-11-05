% =========================================================================
% Guia 6 - Ex. 3: Call Center modelado por um sistema M/M/m
% =========================================================================
% O QUE É UM SISTEMA M/M/m?
%
%   - "M" (1ª letra): chegadas Markovianas/Poisson com taxa lambda
%   - "M" (2ª letra): tempos de serviço exponenciais com média 1/mu
%   - "m": número de servidores em paralelo (operadores do Call Center)
%
%   Os pedidos que chegam quando todos os operadores estão ocupados
%   ficam numa fila INFINITA (ninguém é recusado, todos esperam).
%
% O QUE QUEREMOS CALCULAR?
%
%   - P_Q : probabilidade de um pedido chegar e encontrar TODOS os m
%           operadores ocupados (i.e., probabilidade de ter de esperar)
%   - W_Q : tempo médio que um cliente espera na fila antes de ser
%           atendido (em média)
%
% UNIDADE DE TEMPO ESCOLHIDA: MINUTOS
%
%   O enunciado mistura horas, minutos e segundos. Para evitar erros,
%   convertemos TUDO para minutos no início e só convertemos para
%   segundos quando imprimimos os resultados.
% =========================================================================

clear; clc;     % limpar variáveis e a janela de comandos

% -------------------------------------------------------------------------
% Parâmetro comum às três alíneas:
% -------------------------------------------------------------------------
% Cada chamada dura em média 3 minutos. Como mu é a TAXA de atendimento
% (chamadas por minuto), e cada chamada demora 3 min, então:
%   mu = 1 / (tempo médio de serviço) = 1/3 chamadas por minuto.
mu = 1/3;       % pedidos/minuto


% =========================================================================
% (a) Call Center com m=20 operadores e taxa lambda = 370 pedidos/hora
% =========================================================================
% Queremos:
%   - probabilidade de todos os operadores estarem ocupados (P_Q)
%   - tempo médio de espera em fila (W_Q)
% -------------------------------------------------------------------------

% Converter lambda de pedidos/hora para pedidos/minuto:
% 370 pedidos/hora divididos por 60 min/hora = ~6.167 pedidos/min
lambda = 370/60;

m = 20;         % número de operadores

% --- Intensidade de tráfego (rho) ----------------------------------------
% rho representa a "ocupação média" por servidor.
% Formula:  rho = lambda / (m * mu)
% Se rho >= 1 o sistema explode (fila cresce sem limite); precisamos rho<1.
rho = lambda / (m * mu);

% --- Cálculo de pi_0 (probabilidade de 0 clientes no sistema) -----------
% A fórmula vem do slide 36:
%
%   pi_0 = 1 / [ SUM_{k=0..m-1} (m*rho)^k / k!   +   (m*rho)^m / (m!*(1-rho)) ]
%
% Vamos calcular as duas partes do denominador separadamente para ser claro.

% Primeira parte: soma de k=0 até k=m-1 dos termos (m*rho)^k / k!
% Em MATLAB criamos um vetor k = [0, 1, 2, ..., m-1] e fazemos o cálculo
% sobre o vetor inteiro de uma só vez (operações ".^" e "./" são
% elemento-a-elemento).
k = 0:(m-1);                                   % k = [0,1,2,...,19]
termos_finitos = (m*rho).^k ./ factorial(k);   % vetor com cada termo
sum1 = sum(termos_finitos);                    % soma todos os termos

% Segunda parte: termo único correspondente à "cauda" (estados n >= m)
% Quando todos os operadores estão ocupados, os clientes acumulam-se na
% fila. Esta cauda foi simplificada algebricamente em:
%   (m*rho)^m / (m! * (1-rho))
sum2 = (m*rho)^m / ( factorial(m) * (1-rho) );

% Finalmente pi_0
pi0 = 1 / (sum1 + sum2);

% --- P_Q: probabilidade de todos os m operadores estarem ocupados -------
% É a soma pi_m + pi_{m+1} + pi_{m+2} + ...
% Esta soma simplifica-se para sum2 * pi0 (slide 37).
PQ = sum2 * pi0;

% --- W_Q: tempo médio que um cliente espera na fila ---------------------
% Fórmula do slide 37:  W_Q = ( rho / (lambda*(1-rho)) ) * P_Q
% O resultado vem em MINUTOS porque lambda está em ped/min.
WQ = ( rho / (lambda*(1-rho)) ) * PQ;          % minutos

% --- Mostrar os resultados ----------------------------------------------
% Convertemos W_Q de minutos para segundos (multiplicar por 60).
fprintf('(a) lambda = 370 ped/h, m = %d operadores:\n', m);
fprintf('    Prob. de todos os operadores ocupados = %.3f%%\n', PQ*100);
fprintf('    Tempo médio em fila                   = %.3f segundos\n', WQ*60);


% =========================================================================
% (b) Quantos operadores são precisos para que W_Q <= 10 segundos?
% =========================================================================
% Estratégia: começamos com m=1 operador e vamos aumentando 1 a 1 até o
% tempo de espera descer abaixo dos 10 segundos. Como cada iteração só
% depende do valor de m, basta copiar os cálculos da alínea (a) para
% dentro do ciclo while.
% -------------------------------------------------------------------------

% lambda continua a ser 370/60 (definido em cima, mas reescrevemos por
% clareza para que esta alínea seja auto-contida)
lambda = 370/60;        % pedidos/minuto
mu     = 1/3;           % pedidos/minuto

target = 10/60;         % 10 segundos convertidos para MINUTOS (=0.1667 min)

m = 1;                  % começamos com 1 operador
PQ = NaN;               % valores iniciais (NaN = "ainda não calculado")
WQ = NaN;

% Ciclo "infinito" — só sai quando encontrarmos o m que satisfaz o alvo,
% através de um "break".
while true
    rho = lambda / (m * mu);

    % VERIFICAÇÃO IMPORTANTE: o sistema só é estável se rho < 1.
    % Para m muito pequeno (poucos operadores) rho >= 1 e o tempo de
    % espera diverge para infinito. Nesses casos saltamos os cálculos
    % e passamos directamente para m+1.
    if rho < 1
        % Repetir exactamente os mesmos cálculos da alínea (a):
        k = 0:(m-1);
        sum1 = sum( (m*rho).^k ./ factorial(k) );
        sum2 = (m*rho)^m / ( factorial(m)*(1-rho) );
        pi0  = 1 / (sum1 + sum2);
        PQ   = sum2 * pi0;
        WQ   = ( rho/(lambda*(1-rho)) ) * PQ;       % em minutos

        % Verificar se já atingimos o objectivo (W_Q <= 10 segundos)
        if WQ <= target
            break;      % saímos do while — encontrámos o m mínimo
        end
    end

    % Se ainda não atingiu o alvo (ou rho>=1), tentar com mais um operador
    m = m + 1;
end

fprintf('(b) Número mínimo de operadores = %d\n', m);
fprintf('    Prob. de todos os operadores ocupados = %.3f%%\n', PQ*100);
fprintf('    Tempo médio em fila                   = %.3f segundos\n', WQ*60);


% =========================================================================
% (c) Variar lambda (com m=20 fixo) e fazer gráfico de W_Q
% =========================================================================
% Repetimos o cálculo para vários valores de lambda (de 320 a 380 ped/hora
% em passos de 10) e desenhamos um gráfico de barras com o tempo médio
% em fila para cada caso.
% -------------------------------------------------------------------------

m  = 20;            % número de operadores fixo
mu = 1/3;           % pedidos/min (igual ao resto do exercício)

% Vetor com os valores de lambda em PEDIDOS POR HORA (para o eixo x)
lambda_h_vals = 320:10:380;             % [320 330 340 350 360 370 380]

% Converter cada valor para PEDIDOS POR MINUTO (para usar nas fórmulas)
lambda_vals = lambda_h_vals / 60;

% Vetor onde vamos guardar o W_Q de cada ponto, inicializado com zeros
WQ_vec = zeros(size(lambda_vals));

% Ciclo: para cada valor de lambda, calcular W_Q exactamente como em (a)
for idx = 1:length(lambda_vals)
    lambda = lambda_vals(idx);          % lambda deste ponto (ped/min)
    rho    = lambda / (m * mu);

    % Cálculo de pi_0
    k = 0:(m-1);
    sum1 = sum( (m*rho).^k ./ factorial(k) );
    sum2 = (m*rho)^m / ( factorial(m)*(1-rho) );
    pi0  = 1 / (sum1 + sum2);

    % P_Q e W_Q
    PQ   = sum2 * pi0;
    WQ_vec(idx) = ( rho/(lambda*(1-rho)) ) * PQ;   % em minutos
end

% --- Gráfico de barras ---------------------------------------------------
% No eixo x mostramos os lambdas em ped/hora (mais intuitivo de ler).
% No eixo y mostramos o W_Q em minutos.
figure;
bar(lambda_h_vals, WQ_vec);
xlabel('Arrival request rate per hour');
ylabel('Average queuing time (minutes)');
title('M/M/m: tempo médio em fila vs. taxa de chegada (m = 20)');
grid on;

% CONCLUSÃO: à medida que lambda aumenta, W_Q cresce de forma não-linear
% (acelerada). É a característica típica de sistemas de filas: quando a
% ocupação rho se aproxima de 1, o tempo de espera dispara.

