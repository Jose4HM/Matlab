%Simulacion de modulacion PCM con cuatizacion Uniforme de una señal con una
%frecuencias Fmax.
clear; clc;
Fmax=1;   %Frecuencia de la Señal Analogica
Fs=2*Fmax;  %Frecuencia de muestreo
Ts=1/Fs;    %Periodo de muestreo
N=301;      %Numero de muestras
nb=3;   %Tamaño de la palabra de la codificacion para cada muestra
L=2^nb-1;     %Numero de niveles permitidos
%%
t=0:0.01:3;
A=3;
y=A*sin(2*pi*1*t);
level=5;
quantize=zeros(1,length(y));
symbols=zeros(1,length(y));
for i=1:length(y)
    if y(i)>=2.5
        quantize(i)=3;
        symbols(i)=7;
        
    elseif 1.5<=y(i)&& y(i)<2.5
        quantize(i)=2;
        symbols(i)=6;
        
    elseif 0.5<=y(i)&& y(i)<1.5
        quantize(i)=1;
        symbols(i)=5;
        
    elseif -0.5<=y(i)&& y(i)<0.5
        quantize(i)=0;
        symbols(i)=4;
        
    elseif -1.5<=y(i) && y(i)<-0.5
        quantize(i)=-1;
        symbols(i)=3;
        
    elseif -2.5<=y(i) && y(i)<-1.5
        quantize(i)=-2;
        symbols(i)=2;
        
    elseif y(i)<=-2.5
        quantize(i)=-3;
        symbols(i)=1;
    end
end
x=symbols(1:301);

%%
% x=randi(L,N,1); %Se genera las muestras aleatoria de la señal
xpcm=dec2bin(x)-48; %se codifica en binario natural
xpcm=xpcm(:); %se coloca la señal PCM en un vector
%Aca es necesario calcular la frecuencia de muestreo de la señal PCM
%resultante que esta relacionada con la Fs la señal y el numero de bit y
%el numero de puntos que se usara para construir la representacion digital
%de la cadena PCM.
Np=20;   %Cada pulso se conformara por 20 puntos.
Ts1=(Ts/nb)*(1/Np);
Fs1=1/Ts1;
%Con la información de Fs1 y Ts1 y sabiendo el numero de muestras y la
%cantiadad de bits por muestra se realiza el barrido de tiempo
t=0:Ts1:N*nb*Np*Ts1-Ts1;
%Tambien para mostrar correctamente el espectro es necesario realizar el
%barrido de frecuencias necesarios asi
f=linspace(-Fs1/2,Fs1/2,length(t));
%Se usara codificacion NRZ para esta parte
pnrz=ones(1,Np);    %Pulso basico para transmision
%Realizamos la señalizacion 
senpcm=pnrz'*xpcm';
%conertimos a un vector
senpcm=senpcm(:);
%graficamos
subplot(321)
plot(t,senpcm,'linewidth',2)
% ylim([-0.5 1.5])
title('Señal PCM en el tiempo')
%Podemos obtener mas informacion si  observamos esta señal en el dominio de
%la frecuecia
SENPCM=fft(senpcm)/length(senpcm);
%graficamos
subplot(322)
plot(f,fftshift(abs(SENPCM))/max(abs(SENPCM)))
title('Señal PCM en la frecuencia y filtro ideal')
%Segun nuestros calculos vtx=Fs*5=1000bps, entonces BWtx=vtx/2 (NRZ)
%BWtx=500Hz
hold on
fc_ideal=500;  %Frecuencia de corte ideal, Puede cambiarse para probar
H=(abs(f)<=fc_ideal);  %se construye un filtro ideal
plot(f,H,'r','linewidth',3);
legend('Señal PCM','Filtro Ideal')
SENPCM_FIL=fftshift(H').*(SENPCM);  %se realiaza el fitrado de la señal
subplot(323)
plot(f,fftshift(abs(SENPCM_FIL))/max(abs(SENPCM_FIL)));
title('Señal PCM filtrada en la frecuencia')
%Calculamos la transformada inversa y observamos la señal PCM
senpcm_fil=ifft(SENPCM_FIL)*length(SENPCM_FIL);
subplot(324)
plot(t,real(senpcm_fil))
title('Señal PCM filtrada en el tiempo')
hold on
plot(t,senpcm,'r','linewidth',2)
legend('Señal filtrada','Señal Original')
fcorte=500;
Hrc=1./(1+1i*f/fcorte);   %Funcion de transferencia del filtro
SENPCM_FILrc=fftshift(Hrc').*(SENPCM);
subplot(325)
plot(f,fftshift(abs(SENPCM_FILrc)));
title('Señal PCM filtrada con filtro RC')
senpcm_filrc=ifft(SENPCM_FILrc)*length(SENPCM_FILrc);
subplot(326)
plot(t,real(senpcm_filrc))
title('Señal PCM filtrada en el tiempo')
hold on
plot(t,senpcm,'r','linewidth',2)
legend('Señal filtrada','Señal Original')