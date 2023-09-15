%----------------------------------------
%Curso: Antenas
%Laboratorio: Circuitos resonantes
%2022-B
%--------------------------------------
f0=10^6; %Frecuencia Resonancia (Hz)
w0=2*pi*f0; %Frecuencia Resonancia (rad/s)
Z0=100; % Impedancia característica
BW=2*pi*20000; %Ancho de banda (Rad/s)
w1=w0-BW/2; %Limite inferior ancho de banda
w2=w0+BW/2; %Limite superior ancho de banda
R=Z0; %Resistencia
Qos=w0/BW; %Factor de calidad
Vs=20; %Voltaje de operación
L=R*Qos/w0; %Inductancia
C=1/ (w0^2*L); %Capacitancia
%Display información
fprintf (' \n');
fprintf ('R = %5.2f Ohms \t', R);
fprintf ('L = %5.2e H \t', L);
fprintf ('C = %5.2e F \t', C);
fprintf (' \n'); fprintf (' \n');
%%
%Frecuencia para el barrido
w=(500e3:3:1.5e6).*2*pi;
%Frecuencia en Hz
F=w/(2*pi);
%Intensidad
I=Vs./sqrt((R^2+(L.*w-1./(C.*w)).^2));
%Plotear gráficas
semilogx(F,I)
grid on
xlabel('w(rad/s)')
ylabel('abs(I)')
title('abs(I) vs. f')
xlim([10e3 10e7])
%% 10.3
clc
%Inductor
L=0.05e-6;
%Capacitor
C=25;
%Resistencia
R=50;
%Frecuencia de corte
w0=1/sqrt(L*C);
%Ancho de banda
WB=1/(R*C);
%Factor de calidad
Q=R*sqrt(C/L);
fprintf('La frecuencia de corte: %d rad/s\n',w0);
fprintf('Ancho de banda: %d Hz\n',WB);
fprintf('Factor de calidad: %d \n',Q);
%% 10.2
clc
%Inductor
L=0.5e-6;
%Resistecia
R=50;
%Frecuencia
f=1;
%Reactancia inductiva
Xl=2*pi*f*L;
%Impedancia
Z=sqrt(R^2+Xl*2);
%Angulo
theta=atan(Xl/R);
%Frecuencia de corte
fc=R/(2*pi*L);
fprintf('La frecuencia de corte: %d rad/s\n',fc);
fprintf('Impedancia: %d Hz\n',Z);
fprintf('Angulo: %d\n',theta);
%% 10.1
clc
%Capacitor
C=25e-12;
%Resistecia
R=50;
%Frecuencia
f=1;
%Reactancia capacitiva
Xc=1/(2*pi*f*C);
%Impedancia
Z=sqrt(R*2+Xc*2);
%Angulo
theta=atan(Xc/R);
%Frecuencia de corte
fc=1/(2*pi*C*R);
fprintf('La frecuencia de corte: %d rad/s\n',fc);
fprintf('Impedancia: %d Hz\n',Z);
fprintf('Angulo: %d\n',theta);


