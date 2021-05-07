syms t k
x=exp(-t^2);
t0=-3;
T=6;
w=2*pi/T;
a=(1/T)*int(x*exp(-1i*k*w*t),t,t0,t0+T);
k1=-6:6;
ak=subs(a,k,k1);
%stem(k1,abs(ak));
%legend('a_k')
%title('Gráfica 1')

%stem(k1,angle(ak));
%legend('\angle a_k')
%title('Gráfica 2')
%para el componente a_0
%syms n
a0=(1/T)*int(x,t0,t0+T);
%stem(0,eval(a0))
%legend('a_0');
%title('Forma trigonometrica 1')
%para el coeficiente b_n
b=(2/T)*int(x*cos(n*w*t),t,t0,t0+T);
n1=1:10;
bn=subs(b,n,n1);
%stem(n1,bn);
%legend('b_n')
%title('Coeficiente b_n')
c=(2/T)*int(x*sin(n*w*t),t,t0,t0+T);
cn=subs(c,n,n1);
%stem(n1,cn);
%legend('c_n');
%ylim([-.1e-10 .1e-10])
%title('Coeficente c_b')

A=sqrt(b.^2+c.^2);
An=subs(A,n,n1);
%stem(n1,An)
%legend('A_n')
%title('Amplitudes de A_n')

theta=atan2(-cn,bn);
stem(n1,theta)
legend('\theta_n')
title('Fases theta_n')

