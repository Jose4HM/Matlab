clc;clear
%Entrada de datos
disp("Complejos como A+B*i")
lambda=input('Longitud de onda (Lambda): ');
Z0=input('Impedancia Característica (Z_0): ');
ZL=input('Impedancia de carga (Z_L): ');
vol=input('Voltaje (V): ');
%Cálculos
bl=2*pi*lambda;%Calculo de beta de la linea
Zin=Z0*((ZL+Z0*1i*tan(bl))/(Z0+ZL*1i*tan(bl)));%Calculo de la impedancia de entrada
coef=(ZL-Z0)/(ZL+Z0);%Coeficiente de reflexión
swr=(1+abs(coef))/(1-abs(coef));%SWR
rl=-20*log10(abs(coef));%Perdida por retorno
pr=(abs(coef)^2)*vol;%Perdida por retorno potencia
%Tabla
Def=["Impedancia de entrada";"Coeficiente de reflexión";"SWR";"Perdida por retorno dB";"Coefiiente de reflexión en potencia"];
Value=[Zin;abs(coef);swr;abs(rl);pr];
tab=table(Def,Value);
disp(tab)