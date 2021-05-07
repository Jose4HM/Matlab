%señal periodica
close
format compact
t=-2*pi:0.1:2*pi;
x=cos(t)+sin(3*t)
figure(clf)
subplot(2,1,1);%%2 imagenes 1 grafica primera
stem(t,x)
title('periodicidad')
xlabel('t'),ylabel('y(t)')
subplot(2,1,2)
plot(t,x)
xlabel('t'), ylabel('y(t)')
title('continua')