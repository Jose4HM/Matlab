clc
j=[0.02 0.11 0.44 0.77 0.44 0.11 0.02];
fc=100e3;%frecuencia portadora
fm=10e3;%frecuencia moduladora
n=3;%número de laterales
Ns=fc+n*fm;
Nl=fc-n*fm;
t=(n*fm);
f=fc:fm:Ns;
g=Nl:fm:fc;
g(end)=[];
ff=[g f]
stem(ff,j)
ylabel('A[v]')
xlabel('f[Hz]')