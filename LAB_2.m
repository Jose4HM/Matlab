syms t s x
format long
%disp("Funcion dada");
%f=-1.25+ 3.5*t*exp(-2*t) + 1.25*exp(-2*t);
%f
%disp("Transformada de laplace");
%g=laplace(f ,s)
%disp("Transformada inversa");
%h=ilaplace(g,t)
%disp(" f es igual a h")
%disp("Funcion en laplace")
%y=(1/s)+(2/(s+4))+(1/(s+5))
%disp("Transformada inversa")
%h=ilaplace(y,t)
disp("Fracionciones Parciales")
%D=[1,1]
%d=[1,2,1,0,0]
%[r,p,k]=residue(D,d)

%disp("Comando numdem")
%f=(28/(s+1))-(4/(s+1)^2)+(s^2)+s-11
%[n,d]=numden(f)
