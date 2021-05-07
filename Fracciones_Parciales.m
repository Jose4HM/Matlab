syms t s x
disp("Fracionciones Parciales")
D=[1 0 20 0 64];%polinomio del numerador
d=[1 0 34 0 225 0];%polinomio del denominador
[r,p,k]=residue(D,d)
%las k van ordenadas desde una constantes hasta una X^n-1(n=numero de k's)
%forma r(1)/(x-p(1))+r(2)7(x-p(2))...+r(n)/(x-p(n))+[k(1)+k(2)]
%disp("Comando numdem")
%f=(28/(s+1))-(4/(s+1)^2)+(s^2)+s-11
%[n,d]=numden(f)