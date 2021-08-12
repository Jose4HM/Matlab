w=-pi:0.1:pi;
y=(1-cos(6.*w)+1i*sin(6.*w))./(1-cos(w)+1i*sin(w));
% stem(w,abs(y),'r')
window=ones(0,length(y));
[pxx,w] = periodogram(y,window);
plot(w,10*log10(pxx))
%%
w=-2*pi:0.1:2*pi;
a=0.5;
x=1./(1-a*exp(-1i.*w));
subplot(2,1,1)
stem(w,real(x))
xlabel('\omega')
ylabel('Re(F(\omega))')
title('\Omega_R(\Omega)')
subplot(2,1,2)
stem(w,imag(x))
xlabel('\omega')
ylabel('Im(F(\omega))')
title('\Omega_I(\Omega)')
figure(2)
stem(w,abs(x))
xlabel('\omega')
ylabel('Abs(F(\omega))')
title('|X(\Omega)|')