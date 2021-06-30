%LAB 4-Muestreo
%IV.8
t=0:0.001:1;
fx=300;%frecuencia analogica
Fs=80e3; %frecuencia de muestreo 10*fx
x=cos(2*pi*fx*t);
f=linspace(-Fs/2,Fs/2,length(x));
plot(f,fftshift(abs(fft(x))),'r');grid on;
title('Analogic Signal')
xlabel('Frequency(\Omega)')
ylabel('F(\Omega)')
