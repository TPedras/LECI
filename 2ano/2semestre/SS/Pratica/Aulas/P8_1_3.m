% (a) Definição dos coeficientes a partir da equação de diferença
b = [1, 0.5];  % Coeficientes de x[n]
a = [1, -0.8]; % Coeficientes de y[n]

% (b) Determinação dos polos e zeros
zeros_H = roots(b);
disp('Zeros:'); disp(zeros_H);
poles_H = roots(a);
disp('Polos:'); disp(poles_H);

% ( c ) Diagrama de Polos e Zeros
figure (3) ;
zplane (b , a ) ;
grid on ;
% Adicionar circulo unitario para verificacao de estabilidade
hold on ;
 theta = linspace (0 , 2* pi , 100) ;
 plot ( cos ( theta ) , sin ( theta ) , ’r - - ’ , ’ LineWidth ’ , 1.5) ;
 hold off ;

 % ( d ) Resposta ao Impulso
 N = 40;
 impulse = [1 zeros (1 , N -1) ];
 h = filter (b , a , impulse ) ;

 figure (4) ;
 stem (0: N -1 , h ) ;
 title ( ’ Resposta ao Impulso h [ n ] ’) ;
 xlabel ( ’n ’) ; ylabel ( ’h [ n ] ’) ;
 grid on ;

 % ( e ) Verificacao de estabilidade
 if all ( abs ( poles_H ) < 1)
disp ( ’ Sistema e ESTAVEL ( todos os polos dentro do circulo unitario ) ’) ;
 else
 disp ( ’ Sistema e INSTAVEL ’) ;
 end

 % Resposta em Frequencia
 [H , w ] = freqz (b , a , 512) ;
 figure (5) ;
 subplot (2 ,1 ,1) ;
 plot ( w / pi , 20* log10 ( abs ( H ) ) ) ;
 title ( ’ Resposta em Magnitude ’) ;
 xlabel ( ’ Frequencia Normalizada (\ times \ pi rad / amostra ) ’) ;
ylabel ( ’ Magnitude ( dB ) ’) ;
 grid on ;

 subplot (2 ,1 ,2) ;
 plot ( w / pi , angle ( H ) *180/ pi ) ;
 title ( ’ Resposta em Fase ’) ;
 xlabel ( ’ Frequencia Normalizada (\ times \ pi rad / amostra ) ’) ;
 ylabel ( ’ Fase ( graus ) ’) ;
 grid on ;
