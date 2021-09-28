t=0:0.01:10;
a=8*exp(-t) - exp(t*(- 3/4 - 1i/4))*(4 - 4i) - exp(t*(- 3/4 + 1i/4))*(4 + 4i);
plot(t,a)
T=0.25;
tt=0:0.25:10;hold on;
a=8*exp(-tt) - exp(tt*(- 3/4 - 1i/4))*(4 - 4i) - exp(tt*(- 3/4 + 1i/4))*(4 + 4i);
stem(tt,T.*a)
