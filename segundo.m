close all
t = (-5:0.01:10)'; 
%impulse = t==0; 
unitstep = t>=0; 
%ramp = t.*unitstep; 
%quad = t.^2.*unitstep;
plot(t,[unitstep],'--r')
ylim([-2 2])
grid on