

#5 a
vetor_x = linspace(-10,10,300);
vetor_y = linspace(-10,10,300);
[x,y] = meshgrid(vetor_x, vetor_y);

z = x + j*y;

condicao = abs(z - 3j) > 4;

x_validos = x(condicao);
y_validos = y(condicao);
plot(x_validos, y_validos, 'r.');
axis equal;
axis([-10 10 -10 10]);

