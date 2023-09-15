%LAB 4-Muestreo
%IV.4
t=0:0.001:1;
fx=7525;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,1);
stem(Ts,xn,'r');grid on
xlim([0 0.01])
title('Sampled signal \it F=7525 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=7650;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=linspace(0,1,Fs+1);
xn=sin(2*pi*fx*Ts);
subplot(2,2,2);
stem(Ts,xn,'g');grid on
xlim([0 0.01])
title('Sampled signal  \it F=7650 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=7775;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,3);
stem(Ts,xn,'m');grid on
xlim([0 0.01])
title('Sampled signal  \it F=7775 Hz')
xlabel('time(s)')
ylabel('y(n)')

fx=7900;%frecuencia analogica
Fs=8e3; %frecuencia de muestreo 10*fx
Ts=(0:Fs)./Fs;
xn=sin(2*pi*fx*Ts);
subplot(2,2,4);
stem(Ts,xn,'b');grid on
xlim([0 0.01])
title('Sampled signal  \it F=7900 Hz')
xlabel('time(s)')
ylabel('y(n)')