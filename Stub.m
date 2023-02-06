%Adaptación de impedancia
clc;clear
%Entrada de datos
disp('-------Adaptacion de impedancias-Guía 7-------')
ZL=input('Impedancia de la carga (a+j*b) ZL: ');
Z0=input('Impedancia caracteristica Z0: ');
freq=input('Frecuencia: ');
circuito=input('1=Circuito Abierto/0=Corto Circuito: ');
%Calculo de datos
RL=real(ZL);
XL=imag(ZL);
t1=(XL+((RL*((Z0-RL)^2+XL^2))/Z0)^0.5)/(RL-Z0);
t2=(XL-((RL*((Z0-RL)^2+XL^2))/Z0)^0.5)/(RL-Z0);
lambda=3e8/(freq*1);
if circuito==1%Si es circuito abierto
    Dist1TL=1/(2*pi)*atan(t1);
    if atan(t1)<0
        Dist1TL=Dist1TL+0.5;
    end
    Dist2TL=1/(2*pi)*atan(t2);
    if atan(t2)<0
        Dist2TL=Dist2TL+0.5;
    end
    B2=(RL^2*t1-(Z0-XL*t1)*(XL+Z0*t1))/(Z0*(RL^2+(XL+Z0*t1)^2));
    B1=(RL^2*t2-(Z0-XL*t2)*(XL+Z0*t2))/(Z0*(RL^2+(XL+Z0*t2)^2));
    Y0=1/Z0;
    Stub1A=1/(2*pi)*atan(B1/Y0);
    if atan(Y0/B1)<0
        Stub1A=Stub1A+0.5;
    end
    Stub2A=1/(2*pi)*atan(B2/Y0);
    if atan(Y0/B2)<0
        Stub2A=Stub2A+0.5;
    end

    d1_L=Dist1TL*lambda;
    d2_L=Dist2TL*lambda;
    L1_L=Stub1A*lambda;
    L2_L=Stub2A*lambda;
else   
    Dist1TL=1/(2*pi)*atan(t1);
    if atan(t1)<0
        Dist1TL=Dist1TL+0.5;
    end
    Dist2TL=1/(2*pi)*atan(t2);
    if atan(t2)<0
        Dist2TL=Dist2TL+0.5;
    end
    B1=(RL^2*t1-(Z0-XL*t1)*(XL+Z0*t1))/(Z0*(RL^2+(XL+Z0*t1)^2));
    B2=(RL^2*t2-(Z0-XL*t2)*(XL+Z0*t2))/(Z0*(RL^2+(XL+Z0*t2)^2));
    Y0=1/Z0;
    Dstub1C=1/(2*pi)*atan(Y0/B1);
    if atan(Y0/B1)<0
        Dstub1C=Dstub1C+0.5;
    end
    Dstub2C=1/(2*pi)*atan(Y0/B2);
    if atan(Y0/B2)<0
        Dstub2C=Dstub2C+0.5;
    end
    d1_L=Dist1TL*lambda;
    d2_L=Dist2TL*lambda;
    L1_L=Dstub1C*lambda;
    L2_L=Dstub2C*lambda;
end
%Tabla
Valores=["distancia 1";"longitud stub 1";"distancia 2";"longitud stub 2"];
Lambda=[Dist1TL;Stub1A;Dist2TL;Stub2A];
Metros=[d1_L;L1_L;d2_L;L2_L];
tab=table(Valores,Lambda,Metros);
disp(tab)  