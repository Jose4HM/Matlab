n1=-7:1:7;
y=zeros(1,length(n1));
for i=1:length(n1)
   if abs(n1(i))<=3
       y(i)=2*n1(i);
   end       
end
figure(1)
stem(n1,y)
title('Ejercicio IV.2.1')
xlabel('n')
ylabel('y')
%%
n2=-5:1:5;
y=zeros(1,length(n2));
for i=1:length(n2)
   if abs(n2(i))<=3
       y(i)=2*n2(i);
   end       
end
figure(2)
stem(n2,y)
title('Ejercicio IV.2.2')
xlabel('n')
ylabel('y')
%%
n3=-20:1:20;
y=zeros(1,length(n3));
for i=1:length(n3)
   if abs(n3(i))<=3
       y(i)=2*n3(i);
   end       
end
figure(3)
stem(n3,y)
title('Ejercicio IV.2.3')
xlabel('n')
ylabel('y')
%%
a1=input('Limite inferior: ');
a2=input('Limite superior: ');
n=a1:a2;
r=n.*heaviside(n);
a3=2.^n;
figure(1)
stem(n,a3);
figure(2)
stem(n,r)
%%
n=0:30;
x1=sin(pi*n./4);
x2=cos(pi*n./7);
y1=x1+x2;
y2=x1-x2;
y3=x1.*x2;
y4=x1./x2;
y5=2*x1;
y6=x1.^x2;
subplot(2,3,1)
stem(n,y1)
subplot(2,3,2)
stem(n,y2)
subplot(2,3,3)
stem(n,y3)
subplot(2,3,4)
stem(n,y4)
subplot(2,3,5)
stem(n,y5)
subplot(2,3,6)
stem(n,y6)
%%
op=1;
a1 = input ('Limite inferior : ') ;
a2 = input ('Limite superior : ') ;
while op==1
    clc
    fprintf('Selecciones una de las opciones\n 1)y1=x1+x2;\n 2)y2=x1-x2;\n 3)y3=x1.*x2;\n 4)y4=x1./x2\n 5)y5=2*x1;\n 6)y6=x1.^x2;\n')
    o=input('Opcion:');
    n=a1:a2;
    x1=sin(pi*n./4);
    x2=cos(pi*n./7);
    y1=x1+x2;
    y2=x1-x2;
    y3=x1.*x2;
    y4=x1./x2;
    y5=2*x1;
    y6=x1.^x2;
    if o==1
        stem(n,y1)
    elseif o==2
        stem(n,y2)
    elseif o==3
        stem(n,y3)
    elseif o==4
        stem(n,y4)
    elseif o==5
        stem(n,y5)
    elseif o==6
        stem(n,y6)
    end
    op=input('Continuar:1=si, 0=no ');
end
clc
%%
% a1=input('Limite inferior: ');
% a2=input('Limite superior: ');
y11=rampa(-5,5);
y22=expo(-8,3);
function [y1]=rampa(a1,a2)
n=a1:a2;
y1=n.*heaviside(n);  
figure(1)
stem(n,y1)
end
function [y2]=expo(a1,a2)
n=a1:a2;
y2=2.^n;
figure(2)
stem(n,y2);
end
%%
