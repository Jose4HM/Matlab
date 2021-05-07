close all
t = (-1:0.01:1)'; 
%impulse = t==0; 
unitstep = t>=0; 
%ramp = t.*unitstep; 
%quad = t.^2.*unitstep;
plot(t,[unitstep],'--r')
ylim([-2 2])
grid on