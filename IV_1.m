%LAB 4-Muestreo
%IV.1
t=0:0.001:1;
fx=300;%frecuencia analogica
x=sin(2*pi*fx*t);
subplot(2,1,1);
plot(t,x,'r');grid on;
xlim([0 0.01])
title('Analogic Signal')
xlabel('time(s)')
ylabel('y(n)')
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:0.01:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,1,2);
stem(Ts,xn);grid on
xlim([0 0.01])
title('Sampled Signal')
xlabel('time(s)')
ylabel('y[n]')
