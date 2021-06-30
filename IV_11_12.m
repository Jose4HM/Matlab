clc; clear variables;
fsamp=300;
fsim=100;
fcut=2*(fsim/2)/fsamp;
[b,a]=cheby2(9,60,fcut);
w=-pi:0.01:pi;
freqz(b,a,w)
title("Con f_{samp}=300 y f_{sim}=100")