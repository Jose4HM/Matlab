x = -3:1:5;
y = dirac(x-2);
idx = y == Inf; % encontrar Inf
y(idx) = 1;     % poner Inf a un valor finito
ylim([-2 2])
stem(x,y),title('Dirac traslado')