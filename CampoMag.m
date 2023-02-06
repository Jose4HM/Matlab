%% EJEMPLO 3_MATLAB  %%
clf, clear, close all
E=.00054;
K=.0000200;
t=0;
w=1000000;
x= -w:w;
B=(E*K)/w; 
[m,n]=size(x);
cero=zeros( m,n);
Esi= E*sin(K*x + t*w);
Bsi= B*sin(K*x + t*w);
plot3(x,Esi,cero)
hold on
plot3(x,cero,Bsi)
grid
