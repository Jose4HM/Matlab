%LAB 4-Muestreo
%IV.6
t=0:0.001:1;
fx=300;%frecuencia analogica
x=cos(2*pi*fx*t);
subplot(2,1,1);
plot(t,x,'r');grid on;
xlim([0 0.03])
title('Analogic Signal')
xlabel('time(s)')
ylabel('y(n)')
Fs=80e3; %frecuencia de muestreo 10*fx
Ts=(0:85:Fs)./Fs;
xn=cos(2*pi*fx*Ts);
subplot(2,1,2);
stem(Ts,xn);grid on
xlim([0 0.03])
title('Sampled Signal')
xlabel('time(s)')
ylabel('y[n]')
