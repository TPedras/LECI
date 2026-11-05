disp("a)")

num = [2];

den = conv([1 -0.5], [1 -0.3]);
[r,p,k] = residue(num, den);

disp('residue');
disp(r);
disp('polos');
disp(p);
disp("Termo direto");
disp(k);

n = 0:20;
x_n = r(1)*(p(1).^n) + r(2)*(p(2).^n);
stem(n,x_n)
xlabel('n');
grid on;
