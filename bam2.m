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

