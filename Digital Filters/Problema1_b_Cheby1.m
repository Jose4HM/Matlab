clc;clear;
duracion=2.5;
%% If you want to record new audio
% recObj = audiorecorder(16000,24,1);
% disp('Start speaking.')
% recordblocking(recObj, duracion);
% disp('End of Recording.');
% audio = getaudiodata(recObj);
% filename = 'speech_dft.wav';
% audiowrite(filename, audio, 16000)
%% Read original audio in time domain
[audio,Fs]=audioread('speech_dft.wav');
sound(audio,Fs)
t=0:seconds(1/Fs):seconds(duracion);
t=t(1:end-1);
subplot(2,2,1)
plot(t,audio)
grid on
title('Original audio')
xlabel('Time')
ylabel('Audio Signal')
%% Freq Domain
nfft=1024;
f=linspace(0,Fs,nfft);
Y=abs(fft(audio,nfft));
subplot(2,2,2)
plot(f(1:nfft/2), Y(1:nfft/2)); grid on
title('Frequency Domain')
xlabel('Freqcueny')
ylabel('Abs')
%% Time domain audio filtered
N=8;%Orden del filtro
[b,a]=cheby1(N,1,0.5);
yfil=filter(b,a,audio); 
subplot(2,2,3)
plot(t,yfil)
title('Filtered audio with Cheby 1')
xlabel('Time')
ylabel('Audio Signal')
grid on
%% Freq Domain audio filtered
nfft=1024;
f=linspace(0,Fs,nfft);
Y=abs(fft(yfil,nfft));
subplot(2,2,4)
plot(f(1:nfft/2), Y(1:nfft/2)); grid on
title('Frequency Domain')
xlabel('Frequency')
ylabel('Abs')
pause(2.6)
sound(yfil,Fs) 