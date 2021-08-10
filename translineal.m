clear;clc;
A=[0 1];
B=[1 1];
Hs=tf(A,B);

W=0:1000;
hs=freqs(A,B,W);

ModHs=20*log10(abs(hs));

plot(W,ModHs)
%%
T=1e-3;
w=-0.5*pi:pi/100:0.5*pi;
[b,a]=bilinear(A,B,1/T);%el denominador y numerador del filtro
Hz=freqz(b,a,w);
ModHz=20*log10(abs(Hz));
figure(2)
hold on
plot(w,ModHz)
