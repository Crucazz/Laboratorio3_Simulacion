%Objetivo: funcion que recibe los valores a, b, c, d, e y f los cuales 
%   representan los valores numericos presentes en un diagrama de bloques
%   simple con una retroalimentacion negativa, y retorna las matrices
%   correspondientes a dicho modelo de estados

%Entradas: a,b,c,d,e,f valores reales que representan las ecuaciones
%presentes en un diagrama de bloques

%Salidas: A matriz de 2x2 correspondiente al modelo de estados ingresado
%         B,C y D matrizes de 2 filas 1 columna correspondientes al modelo
%         de estados ingresado
function [A,B,C,D] = bam(a,b,c,d,e,f)
    
%Aplicando el desarrollo que se observa en el informe adjunto
%se construyen las matrices siguiendo ese procedimiento
    A= [c/b -a/b; d/e f/e];
    B= [a/b ; 0];
    C = [1; 0];
    D = [0;0];
end

