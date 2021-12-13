clear;
clc;
b =[1 1 0 0 1 0 1 0];% input ('Ingrese el flujo de bits \ n'); % b = [0 1 0 1 1 1 0];
n = length(b);%tamaño del vector de los bits
t = 0: .01: n;%vector de tiempo
x = 1: 1: (n + 1) * 100;%vector auxiliar para graficar los bits
for i = 1: n
    if (b(i) == 0)%modulacion bpsk 0=-1 1=1
        b_p (i) = -1;
    else
        b_p(i) = 1;
    end
    for j = i: .1: i + 1
        bw (x (i * 100: (i + 1) * 100)) = b_p (i);%Bits a lo largo del tiempo, un segundo se divide en 100 puntos y los puntos se igualan a 1 y -1
    end
end
bw = bw (100: end);%ignorar los 100 primeros samples que son ceros
sint = sin (2 * pi * t);%funcion seno
st = bw.*sint;%multiplicar los bits restantes por la señal seno para modificar la fase
subplot (3,1,1)
plot(t, bw)%señal moduladora
grid on;
axis([0 n -2 +2])
subplot (3,1,2)
plot(t, sint)%señal portadora
grid on 
axis([0 n -2 +2])
subplot(3,1,3)
plot(t, st)%señal modulada
grid on; 
axis ([0 n -2 +2])
