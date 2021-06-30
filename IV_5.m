%LAB 4-Muestreo
%IV.5
t=0:0.001:1;
fx=32100;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,1);
stem(Ts,xn,'r');grid on
xlim([0 0.01])
title('Sampled signal \it F=32100 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=32225;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,2);
stem(Ts,xn,'g');grid on
xlim([0 0.01])
title('Sampled signal  \it F=32225 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=32350;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,3);
stem(Ts,xn,'m');grid on
xlim([0 0.01])
title('Sampled signal  \it F=32350 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=32475;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,4);
stem(Ts,xn,'b');grid on
xlim([0 0.01])
title('Sampled signal  \it F=32475 Hz')
xlabel('time(s)')
ylabel('y(n)')