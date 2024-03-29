%% Constante
y1=1;
x1=-4;x2=6;
plot([x1, x2], [y1, y1])
%% Dirac
x = -3:1:5;
y = dirac(x-2);
idx = y == Inf; % encontrar Inf
y(idx) = 1;     % poner Inf a un valor finito
ylim([-2 2])
stem(x,y),title('Dirac traslado')
%% Fourier
t=0:0.1:6;
x=t.*exp(-t);
xp=repmat(x,1,4);
tp=linspace(-6,18,length(xp));
plot(tp,xp)
legend('x(t) en 4 periodos')
title('Gr�fica 1')

t0=0;
T=6;
w=2*pi/T;
syms t
x=t*exp(-t);
k=-40:40;
a=(1/T)*int(x*exp(-1i*k*w*t),t,t0,t0+T);
xx=sum(a.*exp(1i*k*w*t));
ezplot(xx,[-6 18]);
legend('Se�al aproximada en 4 periodo usando a_k')
title('Gr�fica 2')

a0=(1/T)*int(x,t0,t0+T);
n=1:81;
b=(2/T)*int(x*cos(n*w*t),t,t0,t0+T);
c=(2/T)*int(x*sin(n*w*t),t,t0,t0+T);
xx=a0+sum(b.*cos(n*w*t))+sum(c.*sin(n*w*t));
ezplot(xx, [-6 18]);
legend('Se�al aproximada en 4 periodos usando b_k, c_k')
title('Gr�fica 3')
%% Laplace
syms t s x
format long
disp("Funcion dada");
f=-1.25+ 3.5*t*exp(-2*t) + 1.25*exp(-2*t);
f;
disp("Transformada de laplace");
g=laplace(f ,s);
disp("Transformada inversa");
h=ilaplace(g,t);
disp(" f es igual a h")
disp("Funcion en laplace")
y=(1/s)+(2/(s+4))+(1/(s+5));
disp("Transformada inversa")
h=ilaplace(y,t);
disp("Fracionciones Parciales")
D=[1,1];
d=[1,2,1,0,0];
[r,p,k]=residue(D,d);

disp("Comando numdem")
f=(28/(s+1))-(4/(s+1)^2)+(s^2)+s-11;
[n,d]=numden(f);
%% Signal
close all
t = (-3:1:3)'; 
%impulse = t==0; 
unitstep = t>=0; 
%ramp = t.*unitstep; 
%quad = t.^2.*unitstep;
stem(t,unitstep,'--r')
ylim([-2 2])
grid on
%% Escalon unitario
close all
t = (-10:10); 
%impulse = t==0; 
%ramp = t.*unitstep; 
%quad = t.^2.*unitstep;
unitstep = t>=0; 
unitstep=6*unitstep;
stem(t,unitstep,'--r')
%%