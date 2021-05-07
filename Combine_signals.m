
t1=0:0.1:1;
y1 =t1;
plot(t1,y1)
title('Señal combinada')
ylim([0 3])
hold on

t2=1:0.1:2;
y2 =0*t2+1;
plot(t2,y2)

t3=2:0.1:3;
y3 = t3-1;
plot(t3,y3) 

t4=3:0.1:5;
y4=-t4+5;
plot(t4,y4)

t5=-1:0.1:0
y5=0*t5;
plot(t5,y5)

hold off