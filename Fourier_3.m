%Primero, la expresamos en la forma escalon unitario
syms t
x=t*(heaviside(t)-heaviside(t-1))+(2-t)*(heaviside(t-1)-heaviside(t-2));
%fplot(x,[0 2])
%legend('x(t)');
%title('Señal x(t)')

t0=0;
T=2;
Px=(1/T)*int(abs(x)^2,t0,t0+T);

%k=-1:1;
w=2*pi/T;
%a=(1/T)*int(x*exp(-i*k*w*t),t,t0,t0+T);
%xx=sum(a.*exp(1i*k*w*t));
%fplot(xx,[0 2])
%legend('Aprox. 3 terminos')
%title('Aproximacion con 3 terminos')

%fplot(xx,[-2 4])
%legend('Aprox en 3 peridodos')
%title('Señal aprox. con 3 terminos')

%Pa=sum((abs(a)).^2);
%per=Pa/Px
%porcentaje=eval(per)

%k=-2:2;
%a=(1/T)*int(x*exp(-j*k*w*t),t,t0,t0+T);
%xx=sum(a.*exp(j*k*w*t));
%fplot(xx,[0 2])
%legend('f(x) 5 terminos')
%title('Aproximacion con 5 terminos')

%Pa=sum((abs(a)).^2);
%per=Pa/Px
%porcentaje=eval(per)

%k=-3:3;
%a=(1/T)*int(x*exp(-j*k*w*t),t,t0,t0+T);
%xx=sum(a.*exp(j*k*w*t));
%fplot(xx,[0 2],'r')
%legend('Aprox. 7 terminos')
%title('Aproximacion con 7 terminos')

%Pa=sum((abs(a)).^2);
%per=Pa/Px;
%porcentage=eval(per)

k=-8:8;
a=(1/T)*int(x*exp(-j*k*w*t),t,t0,t0+T);
xx=sum(a.*exp(j*k*w*t));
fplot(xx,[0 2],'r')
legend('f(x) con 17 terminos')
title('Aproximacion con 17 terminos')

Pa=sum((abs(a)).^2);
per=Pa/Px;
porcentage=eval(per)