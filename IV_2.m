%LAB 4-Muestreo
%IV.2
t=0:0.001:1;
fx=300;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:0.01:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,1,1);
stem(Ts,xn,'r');grid on
xlim([0 0.01])
title('Sampled Signal')
xlabel('time(s)')
ylabel('y(n)')
subplot(2,1,2)
plot(Ts,xn,'g');grid on
xlim([0 0.01])
title('Sampled Signal')
xlabel('time(s)')
ylabel('y(n)')