%% Modulating signal
clc;clear
t=0:0.0001:5;%Creating time vector
n=length(t);%Finding l vector length
r = randi([1 5],1,5);%Generating random frecuency from 1 to 5(5 terms)
vm=zeros(1,length(t));%Pre-allocating variables
vm(1:round(n/5))=5*sin(2*pi*r(1)*t(1:round(n/5)));%Bucle to generate random sine signal modulating
for o=1:4
vm(round(o*n/5):round((o+1)*n/5))=5*sin(2*pi*r(o+1)*t(round(o*n/5):round((o+1)*n/5)));
end
fmx=max(r);%Max frecuency
%% Carrier signal
fc=2*fmx;%Twice max frecuency(Nyquist theorem)
vc = 15*sawtooth(2*pi*fc*t);%Sawtooth signal: carrier
%% Code
pwm=zeros(1,n);%Pre-allocating variables
for i=1:n%comparing both vector: Carrier and modulating signals
    if(vm(i)>=vc(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end
%subploting signals
subplot(3,1,1);
plot(t,vm,'r');
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
xlim([0 5])

subplot(3,1,2); 
plot(t,vc,'m');
xlim([0 5])
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;

subplot(3,1,3);
plot(t,pwm,'k');
xlabel('Time');
ylabel('Amplitude');
title('PWM Signal');
axis([0 5 0 2]);
grid on;