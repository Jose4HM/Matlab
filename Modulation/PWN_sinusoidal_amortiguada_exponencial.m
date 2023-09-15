%This MATLAB code generates and visualizes three signals: a message signal...with sinusoidal waveform and exponential damping, a carrier signal in the form of a sawtooth wave, and a Pulse Width Modulation (PWM) signal that results from comparing the message and carrier signals.
clc;
clear;
%% Parámetros
t=0: 0.001: 6;%tiempo
fc=50;%frecuencia de señal portadora
fm=5;%frecuencia de señal mensajera
a=10;%amplitud de señal portadora
b=6;%amplitud de señal mensajera
phi=0;%fase de señal mensajera
c=2;%amplitud de señal exponencial
%% Señales
vc=a.*sawtooth(2*pi*fc*t);%señal portadora(diente de sierra)
vm=b.*sin(2*pi*fm*t+phi).*exp(-c*t);%señal mensajera(sinusoidal con amortiguación exponencial)
n=length(vc);
for i=1:n
if(vm(i)>=vc(i))
        pwm(i)=1;
else
        pwm(i)=0;
end
end
subplot(3,1,1);
plot(t,vm);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;
 
subplot(3,1,2);
plot(t,vc);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;
 
subplot(3,1,3);
plot(t,pwm);
xlabel('Time');
ylabel('Amplitude');
title('PWM Signal');
axis([0 1 0 2]);
grid on;