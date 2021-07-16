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

tiledlayout(2,1)
% Top plot
ax1 = nexttile;
plot(ax1,t_calculado,y_esperado)
title(ax1,'Comportamiento esperado')
ylabel(ax1,'y(t)','FontSize',11);
xlabel(ax1,'Tiempo [s]','FontSize',11);
ax1.FontSize = 14;
%ax1.XColor = 'red';
box(ax1,'on');
grid(ax1,'on');
hold(ax1,'off');

% Bottom plot
ax2 = nexttile;
plot(ax2,t_calculado,y_calculado)
title(ax2,'Comportamiento Conseguido')
ylabel(ax2,'y(t)','FontSize',11);
xlabel(ax2,'Tiempo [s]','FontSize',11);
ax2.FontSize = 14;
%ax2.XColor = 'blue';
box(ax2,'on');
grid(ax2,'on');
hold(ax2,'off');




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

[y2_1,t2_1]=step(H4(1));
[y2_2,t2_2]=impulse(H4(2));
[y2_3,t2_3]=lsim(H4(2),u,t);


%grafico de los resultados

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                   Parte 3            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t1=0.001;
t2=0.1;
t3=2;

%primer muestreo
M1_z = c2d(H4(1), t1, 'zoh ');
M1_f = c2d(H4(1), t1, 'foh ');

%segundo tiempo de muestro
M2_z = c2d(H4(1), t2, 'zoh ');
M2_f = c2d(H4(1), t2, 'foh ');

%tercer tiempo de muestreo
M3_z = c2d(H4(1), t3, 'zoh ');
M3_f = c2d(H4(1), t3, 'foh ');
