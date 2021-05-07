syms t b s 
%f=sin(pi*(t+1));
%g=laplace(f, s)

%g=ilaplace(2,t)
%f=11+5*exp(4*s)-6*sin(2*s)
%g=laplace(f,s)

%Transformada inversa de Laplace

f=2.5*s/(0.5*s^2 +2.5*s)
disp('La transformada inversa es')
g=ilaplace(f,t)

%f=(5/(s-4))-(12/(s^2+4)) +11/s
%g=ilaplace(f,t)