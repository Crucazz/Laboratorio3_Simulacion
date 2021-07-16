function [func] = mab(A,B,C,D)
   s = tf('s');
   I = eye(length(A));
   sI= s*I;
   Y1=sI-A;
   Y2 = inv(Y1);
   Y3=mtimes(C',Y2); 
   Y4=mtimes(Y3,B);
   func= Y4+D;
end

