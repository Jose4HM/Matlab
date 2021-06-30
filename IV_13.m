clc;clear variables;
t=0:0.001:1;
fsim=300;%frecuencia analogica
x=cos(2*pi*fsim*t);
subplot(2,2,1);
plot(t,x,'r');grid on;
xlim([0 0.03])
title('Analogic Signal')
xlabel('time(s)')
ylabel('y(n)')
fsamp=80e3; %frecuencia de muestreo 10*fx
Ts=(0:85:fsamp)./fsamp;
xn=cos(2*pi*fsim*Ts);
subplot(2,2,2);
stem(Ts,xn);grid on
xlim([0 0.03])
title('Sampled Signal')
xlabel('samples[n]')
ylabel('y[n]')
y=zeros(1,2*length(xn));
j=1;
for i=1:2:length(y)
y(i)=xn(j);
j=j+1;
end
subplot(2,2,3)
Ts=(0:85/2:fsamp)./fsamp;
y(end)=[];
stem(Ts,y);grid on;
xlim([0 0.03])
title('Zeros Inserted')
xlabel('$$\hat{t}$$','Interpreter','Latex')
ylabel('$$\hat{x}$$(t)','Interpreter','Latex')
fcut=2*(fsim/2)/fsamp;
[num, den]=cheby2(9,60,fcut);
sfiltered=filter(num,den,y);
subplot(2,2,4)
plot(Ts,sfiltered);grid on;
xlim([0 0.03])