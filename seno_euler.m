t=-10:0.5:10;
y=cos(0.8*t)+sin(0.8*t);
stem(t,y),grid on,title ('Sin(t) Euler')
ylim([-2 2])
