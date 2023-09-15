%LAB 4-Muestreo
%IV.9
clc;clear;
Fa=3e3;
t=0:1/80e3:0.001;
subplot(3,1,1)
y=sin(2*pi*Fa*t);
plot(t,y)
xlabel('t')
ylabel('x(t)')
title('Con frecuencia analógica')
Fs=8e3;
Ts=0:1/Fs:0.001;
xn=sin(2*pi*Fa*Ts);
subplot(3,1,2);
stem(Ts,xn)
xlabel('n')
ylabel('x[n]')
title('Con frecuencia de muestro')
n=zeros(1,round(length(y)/16));
t0=zeros(1,round(length(y)/16));
i=1;
Fd=Fa/Fs;
Td=round(1/Fd);
fprintf('Frecuencia digital: %f\nPeriodo digital aproximado: %d',Fd,Td)
for j=1:Td:length(y)
    n(i)=y(j);
    t0(i)=t(j);
    i=i+1;
end
subplot(3,1,3)
stem(t0,n)
xlabel('n')
ylabel('x_{dig}[n]')
title('Con frecuencia digítal F_{dig}=F_{sim}/F_{s}')