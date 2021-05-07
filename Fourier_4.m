syms t
t0=0;
T=2;
w=2*pi/T;
x=heaviside(t)-heaviside(t-1);
%fplot(x,[0 2])
%legend('x(t)')
%title('Grafica x(t)')
%ylim([-1.5 1.5])

k=-20:20;
a=(1/T)*int(x*exp(-1i*k*w*t),t,t0,t0+T);
a=eval(a);
%stem(k,abs(a));
%legend('|a_k|,k=-20:20')
%title('Magnitudes de a_k')
%stem(k,angle(a));
%legend('\angle a_k,k=-20:20');
%title('Angulos de a_0')

%xx=sum(a.*exp(j*k*w*t));
%fplot(xx,[0 2],'g')
%legend('f(x)- 41 terminos')
%title('Aproximacion con 41 terminos')

k=-100:100;
a=(1/T)*int(x*exp(-1i*k*w*t),t,t0,t0+T);
a=eval(a);
%stem(k,abs(a),'g');
%legend('|a_k|,k=-100:100');
%title('Magnitudes de a_k');

%stem(k,angle(a));
%legend('angulos desde k=-100:100');
%title('\angle a_k')

xx=sum(a.*exp(1i*k*w*t));
fplot(xx,[0 2]);
legend('201 terminos');
title('Aproximacion con 201 terminos')