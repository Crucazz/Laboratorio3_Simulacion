%Objetivo: funcion que recibe los valores del fenomeno femeneológico que
%   que reprenta un sistemas de vasos comunicantes, retornando sus matrices
%   del modelo de estado

%Entradas:  a1,a2: area de cada estanque, valor real positivo
%           r1,r2: flujo de salida de estanques 1 hacia 2 y de estanque 2 hacia 1 
%                  respectivamente, valor real positivo
%           rs1,rs2: flujo de salida de los estanque 1 y 2 respectivamente,
%                    valor real posivo

%Salidas: A matriz de 2x2 correspondiente al modelo de estados ingresado
%         B,C y D matrizes de 2 filas 1 columna correspondientes al modelo
%         de estados ingresado
function [A,B,C,D] = bam2(a1,a2,r1,r2,rs1,rs2)
    %Aplicando el desarrollo que se observa en el informe adjunto
    %se construyen las matrices siguiendo ese procedimiento
    A11= -(1/a1)*((1/r1)+(1/r2)+(1/rs1));
    A12= (1/a1)*((1/r1)+(1/r2));
    A21= (1/a2)*((1/r1)+(1/r2));
    A22= -(1/a2)*((1/r1)+(1/r2)+(1/rs2));
    A = [ A11 A12; A21 A22];
    B = [ 1/a1; 1/a2];
    C = [ 1 0; 0 1];
    D = [ 0 ; 0];

end

