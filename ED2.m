syms t s Y
f1=1;
f2=t-2;
f3=2;
t1=3;
t2=6;
f=f1+(f2-f1).*heaviside(t-t1)+(f3-f2).*heaviside(t-t2);
y0=1; yd0=3;
F=laplace(f,s);
Y1=s*Y-y0;
Y2=s*Y1-yd0;
G=Y2+3*Y1+2*Y-F;
Y=solve(G,Y);
y=ilaplace(Y,t)
ezplot(y,[0, 10]);
legend('Solucion y(t)')