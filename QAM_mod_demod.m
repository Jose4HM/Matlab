clc;
clear all;
close all;

M=8;
%M=input(' enter the value of M array for QAM modulation: ');
fprintf('\n\n\n');

Ld=log2(M);
ds=ceil(Ld);
dif=ds-Ld;
if(dif~=0)
    error('el valor de M solo es aceptable si log2 (M) es un número entero');
end


nbit=16; %Numero de bits de informacion
msg=round(rand(nbit,1)); %generacion de informacion como forma binaria
disp(' informacion binaria en el transmisor');
disp(msg)
fprintf('\n\n\n');


x=msg;
bp=.000001; %periodo de bit
bit=[];
for n=1:1:length(x)
    if x(n)==1;
        se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
        bit=[bit se];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
figure(1)
subplot(3,1,1)
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('amplitud(vol)');
xlabel('tiempo (sec)');
title('transmitiendo información como señal digital');


M=M; %ORDEN DE LA MODULACION QAM
msg_reshape=reshape(msg,log2(M),nbit/log2(M))';
disp(' La informacion se reforma para convertir la forma simbolica');
disp(msg_reshape);
fprintf('\n\n\n');

size(msg_reshape);
for (j=1:1:nbit/log2(M))
    for(i=1:1:log2(M))
        a(j,i)=num2str(msg_reshape(j,i));
    end
end


as=bin2dec(a);
ass=as;
figure(1)
subplot(3,1,2);
stem(ass,'lineWidth',2.0);
title('simbolo de serie para la modulacion QAM M-array en el transmisor');
xlabel('n(tiempo discreto)');
ylabel('magnitud');

disp('informacion de forma simbolica para 16QAM');
disp(ass);
fprintf('\n\n\n');


M=M; %ORDEN DE LA MODULACION
x1=(0:M-1);
p=qammod(ass,M) %Diseño de constalacion para QAM M-array segun simbolo
sym=0:1:M-1; %Simbolo considerable de 16QAM, solo para diagrama de dispersión
pp=qammod(sym,M); %diagrama de constatación para 16QAM
scatterplot(pp),grid on;
title('diagrama de constelación para 16QAM');



RR=real(p)
II=imag(p)
sp=bp*2;%periodo de simbolo para QAM de matriz M
sr=1/sp;%velocidad de simbolo
f=sr*2;
t=sp/100:sp/100:sp;
ss=length(t);
m=[];
for (k=1:1:length(RR))
    yr=RR(k)*cos(2*pi*f*t); %componente en fase o real
    yim=II(k)*sin(2*pi*f*t); %componente en cuadratura o imaginario
    y=yr+yim;
    m=[m y];
end
tt=sp/100:sp/100:sp*length(RR);
figure(1);
subplot(3,1,3);
plot(tt,m);
title('forma de onda para la modulacion QAM de matriz M segun informacion simbolica');
xlabel('tiempo(seg)');
ylabel('amplitud(volt)');


m1=[];
m2=[];
for n=ss:ss:length(m)
    t=sp/100:sp/100:sp; 
    y1=cos(2*pi*f*t); %componente en fase
    y2=sin(2*pi*f*t); %cuadratura de componente
    mm1=y1.*m((n-(ss-1)):n);
    mm2=y2.*m((n-(ss-1)):n);
    z1=trapz(t,mm1) %integracion
    z2=trapz(t,mm2) %integracion
    zz1=round(2*z1/sp)
    zz2=round(2*z2/sp)
    m1=[m1 zz1]
    m2=[m2 zz2]
end


clear i;
clear j;
for (k=1:1:length(m1))
    gt(k)=m1(k)+j*m2(k);
end
gt

ax=qamdemod(gt,M);
figure(3);
subplot(2,1,1);
stem(ax,'linewidth',2);
title('volver a obtener el simbolo después de la demodulación QAM de matriz M');
xlabel('n(tiempo discreto)');
ylabel('magnitud');

disp('volver a obtener el simbolo despues de la demodulacion QAM de matriz M');
disp(ax);
fprintf('\n\n');


bi_in=dec2bin(ax);
[row col]=size(bi_in);
p=1;
for(i=1:1:row)
    for(j=1:1:col)
        re_bi_in(p)=str2num(bi_in(i,j));
        p=p+1;
    end
end
disp('recuperar información binaria despues de la demodulacion QAM ');
disp(re_bi_in')
fprintf('\n\n');


x=re_bi_in;
bp=.000001;
bit=[];
for n=1:1:length(x)
    if x(n)==1;
        se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
    bit=[bit se];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
figure(3)
subplot(2,1,2);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([0 bp*length(x) -.5 1.5]);
ylabel('amplitud(volt)');
xlabel('tiempo(seg)');
title('recibir informacion como señal digital despues de la demodicion QAM de M-array');

