% Theory:
% Pulse Code Modulation
% Pulse-code modulation (PCM) is a method used to digitally represent sampled analog signals. It is the standard
% form of digital audio in computers, Compact Discs, digital telephony and other digital audio applications. In a PCM
% stream, the amplitude of the analog signal is sampled regularly at uniform intervals, and each sample is quantized to
% the nearest value within a range of digital steps.
% PCM streams have two basic properties that determine their fidelity to the original analog signal: the sampling rate,
% the number of times per second that samples are taken; and the bit depth, which determines the number of possible
% digital values that each sample can take.
%
clc;
clear all;
b=input('Enter Quantization Interval:: ');
t = 0:0.0005:10;
% Representation of the Message Signal
x = sin(t);
subplot(3,1,1);
plot(t,x,'black');
title('Message Signal');
xlabel('Time(s) ---->')
ylabel('Amplitude(V) ---->')
legend('Message Signal ---->');
grid on
% Representation of the Quantized Signal
partition = -1:0.1:b;
codebook = -1:0.1:(b+0.1);
[index,quants] = quantiz(x,partition,codebook);
subplot(3,1,2);
plot(t,quants);
title('Quantized Signal');
xlabel('Samples ---->')
ylabel('Amplitude(V) ---->')
legend('Quantized Signal ---->');
grid on
% Representation of the PCM Signal
y = uencode(quants,3);
subplot(3,1,3);
plot(t,y,'red');
title('PCM Signal');
xlabel('Samples ---->');
ylabel('Amplitude(V) ---->')
legend('PCM Signal ---->');
grid on
% Add title to the Overall Plot
ha = axes ('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text (0.5, 1,'\bf Pulse Code Modulation ','HorizontalAlignment','center','VerticalAlignment', 'top')
