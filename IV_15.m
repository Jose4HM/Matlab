clc;clear variales;
Fsampling=100e3;%input('Frecuencia de muestro:'); %Frecuenca de muestreo
fmax=Fsampling/2; %velocidad de nyquist
ts=1/(Fsampling); %intervalo de nyquist
TT=Fsampling*ts; %generacion de tiempo de adquisision
fo=6e3;%input('Frecuencia analógica: '); %frecuencias de la señal analogica a muestrear
Fo=fo/Fsampling; %obtencion de la frecuencia digital
%tiempo durante el que se toman las muestras
t=0:TT/10000:TT;
Ta=0:ts:TT;
Fa=0:1/TT:Fsampling;
wo=2*pi*fo;
x_t=cos(wo*t);
x_k2=cos(wo*Ta);
%se determina la TF de x_k
X2_jw=fft(x_k2);
%diseño del filtro pasabajos enventanado
wp=fo; %Hz banda de paso
ws=fmax; %Hz Banda de rechazo
%calculo del filtro pasabajos
wc=(ws+wp)/2;
wcl=(wc/Fsampling)/2;
[num, den]=cheby1(10,360,wcl,'low');
%apliacion de filtros FIR
fil=filter(num,den,x_k2);
w = linspace(0,pi);
[h,w]=freqz(num,den,w);
% fr=fr*2*s; %ajuste para la frecuencia
Fil=fft(fil);
subplot(2,3,1);
plot(t,x_t)
title('Señal analogica')
subplot(2,3,2)
stem(Ta,x_k2,'o')
title('Señal muestreada')
subplot(2,3,3)
plot(Fa,abs(X2_jw))
title('Espectro de la señal muestreada')
subplot(2,3,4)
plot(Ta,fil)
title('Señal filtrada')
subplot(2,3,5)
plot(w/pi,20*log10(abs(h)))
% plot(w,20*log10(abs(den)+eps))
title('Respuesta de filtro')
subplot(2,3,6)
plot(Fa, abs(Fil))
title('Espectro de la señal filtrada')