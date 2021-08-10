%LAB 4-Muestreo
%IV.12 & IV.12
clc; clear variables;
fsamp=300;
fsim=100;
fcut=fsim/(fsamp/2);
[b,a]=cheby2(9,60,fcut);
w=-pi:0.01:pi;
freqz(b,a,w)
title("Con f_{samp}=300 y f_{sim}=100")