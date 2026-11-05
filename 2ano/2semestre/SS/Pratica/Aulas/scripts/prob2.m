% Problema 2 - Estudo da Amostragem e Aliasing
% NMec: 100000
% Nome: Primeiro Ultimo

% -------------------------------------------------------------------------
% 1) Geração do Sinal "Analógico" (xa)
% Usamos uma frequência de amostragem muito elevada (20 kHz) para que o sinal
% pareça contínuo (analógico) quando comparado com as frequências de teste.
% -------------------------------------------------------------------------
fs_a = 20000;                  % fs alta para simular sinal analógico
T = 0.05;                      % Duração (50ms permite ver vários ciclos de 800Hz)
t_a = 0:1/fs_a:T-1/fs_a;       % Vetor tempo (N = fs*T amostras exatas)
f_sig = 800;                   % Frequência do sinal original (Hz)
xa = cos(2*pi*f_sig*t_a);      % Sinal original

% -------------------------------------------------------------------------
% 2) Amostragem a diferentes taxas (fs)
% O Teorema de Nyquist diz que fs deve ser > 2*f_sig (neste caso, > 1600 Hz).
% - 400 Hz: fs < f_sig (Sub-amostragem severa -> Aliasing para 0 Hz/DC)
% - 1200 Hz: fs < 2*f_sig (Sub-amostragem -> Aliasing: |800 - 1200| = 400 Hz)
% - 3200 Hz: fs > 2*f_sig (Amostragem correta -> Recupera os 800 Hz)
% -------------------------------------------------------------------------
fs_list = [400, 1200, 3200];
names = {'x4', 'x12', 'x32'};

signals = {xa};                % Cell array para facilitar o ciclo de desenho
times = {t_a};
fss = [fs_a];

for i = 1:length(fs_list)
    fs_curr = fs_list(i);
    t_curr = 0:1/fs_curr:T-1/fs_curr; % Vetor tempo para a nova taxa
    x_curr = cos(2*pi*f_sig*t_curr);  % Gerar amostras à nova taxa
    signals{end+1} = x_curr;
    times{end+1} = t_curr;
    fss(end+1) = fs_curr;
end

% -------------------------------------------------------------------------
% 3) Visualização no Domínio do Tempo
% Comparamos a forma de onda. Note como em 400 Hz o sinal parece uma constante.
% -------------------------------------------------------------------------
figure(3);
for i = 1:4
    subplot(4,1,i);
    % O uso de '-o' permite ver os pontos exatos onde o sinal foi amostrado
    plot(times{i}, signals{i}, '-o'); 
    if i == 1
        title('Sinal "Analógico" xa (fs = 20 kHz)');
    else
        title(sprintf('Sinal %s (fs = %d Hz)', names{i-1}, fss(i)));
    end
    xlabel('Tempo (s)'); ylabel('Amp'); grid on;
end

% -------------------------------------------------------------------------
% 4) Análise no Domínio da Frequência (FFT)
% A FFT transforma o sinal do tempo para a frequência para identificar os
% componentes sinusoidais presentes após a amostragem.
% -------------------------------------------------------------------------
figure(4);
threshold = 0.2;               % Limiar para ignorar ruído numérico

for i = 1:4
    x_curr = signals{i};
    fs_curr = fss(i);
    N = length(x_curr);        % Número de amostras
    
    X = fft(x_curr);           % Transformada Rápida de Fourier
    mag = abs(X)/N;            % Magnitude normalizada (divide-se por N)
    
    % Como o sinal é real, o espetro é simétrico. 
    % Selecionamos apenas a metade positiva (0 até fs/2).
    mag = mag(1:floor(N/2)+1);
    
    % Para manter a energia correta no espetro unilateral, dobramos a 
    % magnitude de todas as frequências exceto DC e Nyquist (se existir).
    mag(2:end-1) = 2*mag(2:end-1);
    
    % O eixo das frequências vai de 0 a fs/2, com passo fs/N
    f_axis = (0:floor(N/2)) * fs_curr / N;
    
    subplot(4,1,i);
    stem(f_axis, mag, 'filled'); % Representação por riscas (espetro discreto)
    if i == 1
        title('Espectro xa (Frequência Real: 800 Hz)');
    else
        title(sprintf('Espectro %s (fs = %d Hz)', names{i-1}, fss(i)));
    end
    xlabel('Frequência (Hz)'); ylabel('Magnitude'); grid on;
    
    % ---------------------------------------------------------------------
    % 5) Deteção Automática de Componentes
    % Identifica as riscas que ultrapassam o threshold.
    % ---------------------------------------------------------------------
    indices = find(mag > threshold);
    n_comp = length(indices);
    freqs = f_axis(indices);
    
    % Construção da mensagem de texto formatada
    if n_comp > 0
        f_list = sprintf('%.1f', freqs(1));
        for j = 2:n_comp
            f_list = sprintf('%s e %.1f', f_list, freqs(j));
        end
    else
        f_list = 'nenhuma';
    end
    
    if i == 1
        label = 'xa';
    else
        label = names{i-1};
    end
    
    % 6) Saída de dados conforme especificações do enunciado
    fprintf('O sinal %s contém %d sinusoide(s)\n', label, n_comp);
    fprintf('As frequências presentes no sinal %s são: %s Hz\n', label, f_list);
end
