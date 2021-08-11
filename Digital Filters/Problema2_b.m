clear;clc;
A=[1 0 60^2];
B=[1 0.4 60^2];
Hs=tf(A,B);
W=0:100;
hs=freqs(A,B,W);
ModHs=20*log10(abs(hs));
figure(1)
plot(W,ModHs)%sin pre warping
title('Without pre warping')
ylabel('Magnitude(db)')
xlabel('Frequency (\omega)')
T=1e-3;
w=linspace(0,0.2,1000);
figure(2)
[b,a]=bilinear(A,B,1/T,1.04);%el denominador y numerador del filtro
title('With pre warping')
ylabel('Magnitude(db)')
xlabel('Digital Frequency (\Omega)')
Hz=freqz(b,a,w);
ModHz=20*log10(abs(Hz));
figure(2)
hold on
plot(w,ModHz)