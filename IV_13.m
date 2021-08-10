clc;clear variables;
%LAB 4-Muestreo
%IV.13
%% Analogic Signal
t=0:0.001:1;
fsim=300;%frecuencia analogica
x=cos(2*pi*fsim*t);
subplot(2,2,1);
plot(t,x,'r');grid on;
xlim([0 0.03])
title('Analogic Signal')
xlabel('time(s)')
ylabel('y(n)')
%% Sampled Signal
fsamp=3e3; %frecuencia de muestreo 10*fx
Ts=0:1/fsamp:1;
xn=cos(2*pi*fsim*Ts);
subplot(2,2,2);
stem(Ts,xn);grid on
xlim([0 0.03])
title('Sampled Signal')
xlabel('samples[n]')
ylabel('y[n]')
%% Zeros Inserted
y=zeros(1,2*length(xn));
j=1;
for i=1:2:length(y)
y(i)=xn(j);
j=j+1;
end
subplot(2,2,3)
Tz=0:1/(2*fsamp):1;
y(end)=[];
stem(Tz,y);grid on;
xlim([0 0.03])
title('Zeros Inserted')
xlabel('$$\hat{t}$$','Interpreter','Latex')
ylabel('$$\hat{x}$$(t)','Interpreter','Latex')
%% Reconstrution Filter
fcut=fsim/(fsamp/2);
[num, den]=cheby2(5,82.5,fcut,'low');
sfiltered=filter(num,den,xn);
subplot(2,2,4)
plot(Ts, sfiltered);grid on;
title('Filtered signal')
xlabel('t')
ylabel('y(t)')
xlim([0 0.03])
figure(2)
% [fsfiltrada, s_filtrada]=fourier(sfiltered,fsamp);
omega=fft(sfiltered);
plot(Ts,abs(omega)),title('Transformada de fourier de la señal filtrada'),grid on;