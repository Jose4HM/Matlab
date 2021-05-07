t=-3:0.1:3;
x=cos(4*pi*t-pi);
plot(t,x)
ylim([-1 1])
grid on
hold on

t2=-3:0.1:3;
x2=cos(2*pi*t2);
plot(t2,x2)

hold off