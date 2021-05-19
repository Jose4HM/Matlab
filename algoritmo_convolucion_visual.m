%*********************************************************************
%% Nombre: convolucion.m
%% IV.3
%%*********************************************************************
clear;
% Definicion de las señales a convolucionar
Lx=4; %Longitud de x(n)
equis=[1 2 1 1]; %x(n)
if size(equis) ~= Lx
error('Error: la senhal x(n) esta mal definida')
end
Lh=3; %Longitud de h(n)
hache=[1 -1 1]; %h(n)
if size(hache) ~= Lh
error('Error: la senhal h(n) esta mal definida')
end
% Dibujo de x(n) y h(n). Se añaden Lh ceros antes y despues
% para visualizar mejor las señales
ndib=-Lh:Lx+Lh;
subplot(211)
equisdib=[zeros(1,Lh) equis zeros(1,Lh+1)];
stem(ndib,equisdib);
title('x(n)');
subplot(212)
hachedib=[zeros(1,Lh) hache zeros(1,Lx+1)];
stem(ndib,hachedib);
title('h(n)');
pause(0.3);
saveas(gcf,'Grafico1.png')
% Bucle que realiza la convolucion
for n=0:Lx+Lh-1
% Construccion y dibujo de x(k)
xdek=[zeros(1,Lh) equis zeros(1,Lh+1)];
subplot(221)
stem(ndib,xdek);
title('x(k)')
xlabel('k')
grid;
% Construccion y dibujo de h(n-k)
hdenmenosk=[zeros(1,n+1) hache(Lh:-1:1) zeros(1,Lx+Lh-n)];
subplot(223)
stem(ndib,hdenmenosk);
title('h(n-k)')
xlabel('k')
grid;
% Dibujo de x(k)h(n-k)
subplot(222)
stem(ndib,xdek.*hdenmenosk);
title('x(k)h(n-k)')
xlabel('k')
grid;
% Obtencion y dibujo de y(n)
yden(n+1)=sum(xdek.*hdenmenosk);
subplot(224)
stem(-1:Lx+Lh,[0 yden zeros(1,Lx+Lh-n)]);
title('y(n)')
xlabel('n')
grid;
pause(0.3);
saveas(gcf,sprintf('FIG%d.png',n))
end
