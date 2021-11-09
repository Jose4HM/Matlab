clc;
clear all;
close all;
%% User Define
t=0:0.001:1;
fc=20;
fm=10;
a=8;
b=5;
%% Code
vc=a.*sawtooth(2*pi*fc*t);
vm=b.*sin(2*pi*fm*t);
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