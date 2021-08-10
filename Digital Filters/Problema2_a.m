clc;clear;
T=3e-3;
a = fir1(100,[0.07 0.13],'stop');
t=linspace(0,3,1000);
load('ecg_recording_signal.mat');
subplot(3,1,1)
y=ecg_60Hz;
plot(t,y)
xlim([0 2]);
%% Filter
y2 = filter(a,1,y);
subplot(3,1,2)
plot(t,y2)
xlim([0 2]);
%% Desired signal
subplot(3,1,3)
y3=ecg_clean;
plot(t,y3)
xlim([0 2])
