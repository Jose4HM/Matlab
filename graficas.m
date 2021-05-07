t=-6:0.1:6; %variable independiente
y=t.^4-3*t.^3+4*t.^2-5*t-10; %ingresa la funcion de t
plot(t,y);
ylabel('f(x)') %titulo del eje y
xlabel('x') %titulo del eje x
grid on
title('Pregunta 3.1') %titulo de la grafica
hold on
%plot(t,t)

%lineas horizontales
%y1=1;
%x1=-6;x2=6;
%plot([x1, x2], [y1, y1],'LineStyle','--')
%y2=-1;
%x1=-6;x2=6;
%plot([x1, x2], [y2, y2],'LineStyle','--')
%lineas verticales
%yl = get(gca, 'YLim');
%line([pi pi],yl,'Color','red','LineStyle','--')
%line([-pi -pi],yl,'Color','blue','LineStyle','--')
%xlabel('x')
%ylabel('f(x)')
%hold on
%t2=-6:.1:6;
%y2 =sin(pi*400*t);
%plot(t2,y2) 
%legend('Grafica desfasada en 180',' Grafica desfasada en 0')

%ylim([-4 4]);

%w=2*pi;
%Hw=((3*(1i*w)^2)+4j*w+2)/((1i*w)^2+2j*w+1);
%magn=abs(Hw);
%phas=angle(Hw);

%y=3*abs(Hw)*cos(2*pi*t+pi/2+angle(Hw));
%plot(t,y);
%legend('Respuesta del sistema')
%ylim([-10 10]);
