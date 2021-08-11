clc;clear;
T=3e-3;
A=[1 0 0.18];
B=[1 0.8 0.18];
Hs=tf(A,B);
W=0:100;
hs=freqs(A,B,W);
ModHs=20*log10(abs(hs));
w=0:pi/1000:0.5*pi;
[b,a]=bilinear(A,B,1/T,1.04);%el denominador y numerador del filtro
Hz=freqz(b,a,w);
ModHz=20*log10(abs(Hz));
Tt=tf(a,b);
pzmap(Tt)