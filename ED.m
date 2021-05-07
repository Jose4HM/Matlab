syms t s Y
x=heaviside(t);
X=laplace(x,s);
y0=1; yd0=3;
Y1=s*Y-y0;
Y2=s*Y1-yd0;
G=Y2+2*Y1+Y-X;
Y=solve(G,Y);
y=ilaplace(Y,t)