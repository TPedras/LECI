taxa= 10000;
periodo= 1/10000;
t= 0:periodo:0.1-periodo;

x= 2*cos(150*pi*t) + sin(300*pi*t) + 0.5*cos(450*pi*t);

figure(1);
plot(t, x);
title('ex1- a');
xlabel('tempo');
ylabel('amplitude');
grid on;

T= length(x);
X= fft(x);
mag= abs(X)/T;
mag= mag(1:floor(T/2)+1);
mag(2:end-1)= 2*mag(2:end-1);

f= taxa*(0:floor(T/2))/T;

figure(2);
plot(f, mag);
title('ex1- 3');
xlabel('frequencia');
ylabel('magnitude');
xlim([0 300]);
grid on;

treshold= 0.4;
indices= find(mag > treshold);

freqs= f(indices);

print1= sprintf('O sinal contém %d sinusoide(s) no(s) índices %s', length(indices), num2str(indices));
msg_freqs = sprintf('As frequências presentes no sinal são: %s Hz', num2str(freqs, '%.1f '));

disp(print1);
disp(msg_freqs);
