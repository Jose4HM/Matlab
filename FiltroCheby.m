clc; clear variable;
n=6;%orden del filtro
wp=3;%rizado de banda de paso de pico a pico
wn=0.5;%frecuencia de corte
[num, den]=cheby2(n,wp,wn,'low');
ft=tf(num,den);
[h, w]=freqz(num, den);
plot(w,abs(h))
%%
clc; clear variables;
Fs=512; %frecuencia de muestreo
T=1/Fs; %periodod de muestreo
L=1024; %longitud de la señal
t=(0:L-1)*T;
s=2*sin(2*pi*5*t)+1.5*sin(2*pi*20*t)+0.5*sin(2*pi*45*t);
subplot(2,1,1), plot(t,s),title('x(t)'),grid on;
[fx,s_f]=fourier(s,Fs);
subplot(2,1,2)
plot(fx,s_f)
title('Transformada de Fourier')
xlabel('Frecuencia');ylabel('Amplitud')
%% filtro cheby
n=6;%orden del filtro
wp=3;%rizado de banda de paso de pico a pico
wn=7/(Fs/2);%frecuencia de corte normalizada
[num, den]=cheby1(n,wp,wn,'low');
sfiltrada=filter(num,den,s);%señal filtrada
figure(2)
subplot(2,1,1), plot(sfiltrada),title('Señal filtrada'),grid on;
[fsfiltrada, s_filtrada]=fourier(sfiltrada,Fs);
subplot(2,1,2), plot(fsfiltrada,s_filtrada),title('Transformada de fourier de la señal filtrada'),grid on;
xlabel('Frecuencia');ylabel('Amplitud')