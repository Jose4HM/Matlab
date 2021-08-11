clc;clear;
T=3e-3;%sample rate
load('ecg_recording_signal.mat');
y=ecg_60Hz;
f_s=1/T;%frecuencia de muestreo
f=60;%freq to supress
Fs=f/(f_s);
N=length(y);
t=(0:N-1)/f_s; %time period(total sample/Fs )
subplot(3,1,1)
plot(t,y); title('Raw ECG Data plotting ')             
xlabel('time')
ylabel('amplitude')
xlim([0 2]);
ylim([-500 100]);
grid on
%% Filter
subplot(3,1,2)
A=[1 0 Fs];
B=[1 0.8 Fs];
w=60/(f_s/2);
[num,den]=bilinear(A,B,w);
ecg_notch=filter(num,den,y);
N1=length(ecg_notch);
t1=(0:N1-1)/f_s;
plot(t1,ecg_notch); title('Filtered ECG signal ')             
xlabel('time')
ylabel('amplitude')
grid on
xlim([0 2]);
ylim([-500 100]);
%% Desired signal
subplot(3,1,3)
y3=ecg_clean;
plot(t,y3)
title('Expected ECG signal')             
xlabel('time')
ylabel('amplitude')
grid on
xlim([0 2])
ylim([-500 100]);