% 1) Criar vector com o sinal x(t) com fs = 10 kHz durante 0.1 segundos
fs = 10000;              % Taxa de amostragem (Hz)
T = 0.1;                 % Duração total (s)
t = 0:1/fs:T-1/fs;       % Vetor tempo

% x(t) = 2*cos(150*pi*t) + sin(300*pi*t) + 0.5*cos(450*pi*t)
% Frequências: 75 Hz, 150 Hz, 225 Hz
x = 2*cos(150*pi*t) + sin(300*pi*t) + 0.5*cos(450*pi*t);

% 2) Gere o gráfico do sinal x
figure(1);
plot(t, x);
title('Sinal x(t) no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% 3) Calcule e mostre a magnitude espectral usando FFT
N = length(x);
X = fft(x);
mag = abs(X)/N;          % Normalização pela dimensão do sinal
mag = mag(1:floor(N/2)+1); % Apenas a componente unilateral
mag(2:end-1) = 2*mag(2:end-1); % Compensação de energia

f_axis = (0:floor(N/2)) * fs / N; % Eixo das frequências

figure(2);
stem(f_axis, mag, 'filled');
title('Espectro de Magnitude de x(t)');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 500]);           % Visualizar zona com componentes
grid on;

% 4) Imprimir número de componentes sinusoidais e índices
% Nota: As amplitudes nominais são 2.0, 1.0 e 0.5.
threshold = 0.2;
indices = find(mag > threshold);
freqs = f_axis(indices);

print1= sprintf('O sinal contém %d sinusoide(s) no(s) índices %s', length(indices), num2str(indices))
msg_freqs = sprintf('As frequências presentes no sinal são: %s Hz', num2str(freqs, '%.1f '))



