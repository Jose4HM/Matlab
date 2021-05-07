t=-3:0.1:3;
x=2.*heaviside(t).*heaviside(2-t)

plot(t,x)
ylim([-10 10])
grid on