%expresado en escalon unitario
syms t
x=heaviside(t)-heaviside(t-1);
t0=0;
T=2;
w=2*pi/T;

n=1:40;
%b=get(0,'Format')
b=(2/T)*int(x*cos(n*w*t),t,t0,t0+T);
c=(2/T)*int(x*sin(n*w*t),t,t0,t0+T);
%vpa(c,4)

A=sqrt(b.^2+c.^2);
%stem(n,eval(A));
%legend('n=1:40')
%title('Amplitudes de A_n')

theta=atan2(-eval(c),eval(b));
%stem(n,theta,'r')
%legend('\theta_n n=1:40')
%title('Gráfica de las fases de \theta_n')

a0=(1/T)*int(x,t0,t0+T);
xx=a0+sum(A.*cos(n*w*t+theta));
%fplot(xx,[0 2],'m')
%legend('41 terminos')
%title('Aproximacion con 41 terminos')

n=1:200;
b=(2/T)*int(x*cos(n*w*t),t,t0,t0+T);
b=(2/T)*int(x*sin(n*w*t),t,t0,t0+T);
stem(n,eval(A),'g');
legend('n=1:200')
title('Valores de A_n')

%theta=atan2(-eval(c),eval(b));
%stem(n,theta)
%legend('n=1:200')
%title('\theta_n')

%xx=a0+sum(A.*cos(n*w*t+theta))
%fplot(xx,[0 2],'g')
%legend('201 terminos')
%title('Aproximacion con 201 terminos')