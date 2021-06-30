%LAB 4-Muestreo
%IV.3
t=0:0.001:1;
fx=100;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,1);
stem(Ts,xn,'r');grid on
xlim([0 0.01])
title('Sampled Signal \it F=100 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=225;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,2);
stem(Ts,xn,'g');grid on
xlim([0 0.01])
title('Sampled Signal \it F=225 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=350;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,3);
stem(Ts,xn,'m');grid on
xlim([0 0.01])
title('Sampled Signal \it F=350 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=475;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,4);
stem(Ts,xn,'b');grid on
xlim([0 0.01])
title('Sampled Signal \it F=475 Hz')
xlabel('time(s)')
ylabel('y(n)')