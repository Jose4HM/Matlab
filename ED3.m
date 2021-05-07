syms t s Y
y0=1; yd0=3; y2d0=1;
x=dirac(t);
x=laplace(x,s);
Y1=s*Y-y0;
Y2=s*Y1-yd0;
Y3=s*Y2-y2d0;
G=Y3+Y1-2*Y-X;
Y=solve(G,Y);
y=ilaplace(Y,t);
ezplot(y,[0 5])
legend('y(t):solucion')