pkg load symbolic
clear

n = 0:20;
x_a = (0.5).^n;
figure(1)

stem(n, x_a);
title ('x [ n ] = (0.5)^n u[ n ]');
xlabel ('n') ; ylabel ('x[n] ');
grid on;
