pkg load symbolic
3 clear
4
5 % Ex 1 _1 a ) : x [ n ] = (0.5) ^ n u [ n ]
6 % Verificacao numerica
7 n = 0:20;
8 x_a = (0.5) .^ n ;
9 figure (1) ;
10 stem (n , x_a ) ;
11 title ( ’x [ n ] = (0.5) ^ n u [ n ] ’) ;
12 xlabel ( ’n ’) ; ylabel ( ’x [ n ] ’) ;
13 grid on ;
