%Objetivo: funcion que recibe los valores de las matrices A,B,C y D de 
%   un modelo de estado y retorna su respectiva funcion de transferencia
%   H(s)

%Entradas: A,B,C,D matrices con valores reales que representan las matrices
%del modelo de estados

%Salidas: Matriz con la funcion de transferencia de cada salida

function [func] = mab(A,B,C,D)
%Aplicando el desarrollo que se observa en el informe adjunto
%se construye las funciones de transferencia siguiendo dicho procedimiento
   s = tf('s');
   I = eye(length(A));
   sI= s*I;
   Y1=sI-A;
   Y2 = inv(Y1);
   Y3=mtimes(C',Y2); 
   Y4=mtimes(Y3,B);
   func= Y4+D;
end

