%LAB 4-Muestreo
%IV.7
t=0:0.001:1;
fx=300;%frecuencia analogica
x=cos(2*pi*fx*t);
subplot(3,1,1);
plot(t,x,'r');grid on;
xlim([0 0.03])
title('Analogic Signal')
xlabel('time(s)')
ylabel('y(n)')
Fs=80e3; %frecuencia de muestreo 10*fx
Ts=(0:85:Fs)./Fs;
xn=cos(2*pi*fx*Ts);
subplot(3,1,2);
stem(Ts,xn);grid on
xlim([0 0.05])
title('Sampled Signal')
xlabel('time[s]')
ylabel('y[n]')
subplot(3,1,3)
plot(Ts,xn);grid on
xlim([0 0.05])
title('Reconstructed signal')
xlabel('time(s)')
ylabel('y(n)')