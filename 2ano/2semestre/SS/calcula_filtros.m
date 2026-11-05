% Parâmetros do sistema
fs = 20000;         % Frequência de amostragem (Hz)
taps = 151;         % Tamanho do filtro (FIR_LEN)
N = taps - 1;       % A ordem do filtro no Octave é taps - 1 (150)
nyquist = fs / 2;   % Frequência de Nyquist (10000 Hz)

% Frequências Centrais (Hz)
f0 = 2500;
f1 = 3260;
f2 = 4020;

% Largura de banda do filtro (+/- 100 Hz ao redor do centro)
bw = 100;

% Calcular frequências de corte normalizadas (entre 0 e 1)
Wn_0 = [(f0 - bw)/nyquist, (f0 + bw)/nyquist];
Wn_1 = [(f1 - bw)/nyquist, (f1 + bw)/nyquist];
Wn_2 = [(f2 - bw)/nyquist, (f2 + bw)/nyquist];

% Gerar os coeficientes (passa-banda)
pkg load signal;
h_f0 = fir1(N, Wn_0);
h_f1 = fir1(N, Wn_1);
h_f2 = fir1(N, Wn_2);

% Função para imprimir o array numa única linha com vírgulas
function print_array(h)
    for i = 1:length(h)
        printf('%.15ff', h(i));
        if i < length(h)
            printf(', ');
        end
    end
    printf('\n');
endfunction

print_array(h_f0);
print_array(h_f1);
print_array(h_f2);
