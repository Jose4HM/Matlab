clc
b=[0.148 7.4];%Coeficientes del numerador
a=[1 1.8 4];%Coeficientes del denominador
Hs=tf(b,a);%Funcion de transferencia analogica
W=(-2000:2000);%Omega analogica
hs=freqs(b,a,W);%respuesta en frecuencia 
ModHs=20*log10(abs(hs));%Transforman en decibelios
figure(1)
plot(W,ModHs)%Plotear la respuestan en frecuencia
title('Filtro analogico')
xlabel("Frecuencia analogia \omega (Hz)")
ylabel("Respuesta en frecuencia del filtro(dB)")
grid on
T=1e-3;%Periodo de muestreo 1000Hz
w=-0.5*pi:pi/100:0.5*pi;%Frecuencia digital
[B,A]=bilinear(b,a,1/T);%el denominador(A) y numerador(B) de la función de transferencia del filtro
ts = 0.1;
z = tf('z',ts);
sys = (7.578e-05*z^2 + 3.697e-06*z - 7.209e-05) / (z^2 - 1.998*z + + 0.9982);
Hz=freqz(B,A,w);%respuesta en frecuencia del filtro
ModHz=20*log10(abs(Hz));%Decibelios dek filtro digital
figure(2)
hold on
plot(w,ModHz)
title('Filtro digital')
xlabel("Frecuencia digital \Omega(\pi rad/s)")
ylabel("Respuesta en frecuencia del filtro(dB)")
hold on
grid on