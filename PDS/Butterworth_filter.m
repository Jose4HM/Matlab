clear; clc
ap=1.5;
ar=30;
wp=1; 
wr=1.35;
T=1/10000;

Wp=wp/T; Wr=wr/T;

N=(log10((10^(ar/10)-1)/(10^(ap/10)-1)))/(2*log10(Wr/Wp));
N=ceil(N);

Wc=Wp/(10^(ap/10)-1)^(1/(2*N));

k=0:N-1;%k's para generar las fases de s_k
theta=(pi*(N+1)+k*(2*pi))/(2*N);%fase de Sk en forma fasorial
j=sqrt(-1);

sk=Wc*cos(theta)+j*Wc*sin(theta);%cambiar la forma fosorial a forma de euler
%Construir  Ha(a)
B=Wc^N;%numerador de Ha
A=poly(sk);%denominador de Ha

%Hallamos los polos de Ha
[R,P,K]=residue(B,A);%Residues Poles Kpolinomios
pk=exp(P*T);%polos digitales en base a los polos de Ha
[b,a]=residuez(R,pk,K);%digital en e^jw, usamos pk que son los nuevos polos de Ha

b=real(b);
a=real(a);

w=0:pi/50:0.35*pi;
H=freqz(b,a,w);%en dominio Z
%plot la respuesta en frecuencia Z
Hdb=20*log10(abs(H));
plot(w/pi,Hdb);
grid on;
