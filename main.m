%Laboratorio 3

%Autor:
%   -Felipe Villalobos 20.139.310-8
clc
clear all
close all
s = tf('s');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                   Parte 1            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = input('Ingresar valor de a: ');
b = input('Ingresar valor de b: ');
c = input('Ingresar valor de c: ');
d = input('Ingresar valor de d: ');
e = input('Ingresar valor de e: ');
f = input('Ingresar valor de f: ');

[A,B,C,D] = bam(a,b,c,d,e,f);

H3 = mab(A,B,C,D);

H1 = a/(b*s - c);
H2 = d/(e*s - f);
[y_esperado,t_esperado] = step(feedback(H1, H2),20);
[y_calculado,t_calculado] = step(H3(2),20);

titulo="Comportamiento sistema con retroalimentación";
var1="Comportamiento esperado";
var2="Comportamiento conseguido";
createfigure1(t_esperado,y_esperado,t_calculado,y_calculado,titulo,var1,var2)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                   Parte 2            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = linspace (0, 12*pi , 5000);
u = 100* sin(t /4);
u(u <0) = 0.;

%Datos entregados por el problema
a1 = 2;
a2 = 4;
r1 = 0.25;
r2 = 0.0625;
rs1 = 0.1;
rs2 = 0.1;
%construccion de las matrices A,B,C y D utilizando el desarrollo matematico
%realizado en el informe adjunto
[A1,B1,C1,D1] = bam2(a1,a2,r1,r2,rs1,rs2);
H4 = mab(A1,B1,C1,D1);

[y2_11,t2_11]=step(H4(1));
[y2_12,t2_12]=step(H4(2));
[y2_21,t2_21]=impulse(H4(1));
[y2_22,t2_22]=impulse(H4(2));
[y2_31,t2_31]=lsim(H4(1),u,t);
[y2_32,t2_32]=lsim(H4(2),u,t);


%grafico de los resultados
createfigure2(t2_11,y2_11,t2_12,y2_12)
createfigure3(t2_21,y2_21,t2_22,y2_22)
createfigure4(t2_31,y2_31,t2_32,y2_32)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                   Parte 3            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t1=0.001;
t2=0.1;
t3=2;

%primer muestreo
M1_z = c2d(H4(1), t1, 'zoh ');
M1_f = c2d(H4(1), t1, 'foh ');


[y3_11,t3_11]=step(M1_z,4);
[y3_12,t3_12]=step(M1_f,4);
titulo="Muestreo con t=0.001";
var1="ZOH";
var2="FOH";
createfigure1(t3_11,y3_11,t3_12,y3_12,titulo,var1,var2)


%segundo tiempo de muestro
M2_z = c2d(H4(1), t2, 'zoh ');
M2_f = c2d(H4(1), t2, 'foh ');

[y3_21,t3_21]=step(M2_z,4);
[y3_22,t3_22]=step(M2_f,4);
titulo="Muestreo con t=0.1";
var1="ZOH";
var2="FOH";
createfigure1(t3_21,y3_21,t3_22,y3_22,titulo,var1,var2)

%tercer tiempo de muestreo
M3_z = c2d(H4(1), t3, 'zoh ');
M3_f = c2d(H4(1), t3, 'foh ');

[y3_31,t3_31]=step(M3_z,5);
[y3_32,t3_32]=step(M3_f,5);
titulo="Muestreo con t=2";
var1="ZOH";
var2="FOH";
createfigure1(t3_31,y3_31,t3_32,y3_32,titulo,var1,var2)
