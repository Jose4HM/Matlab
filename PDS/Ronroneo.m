fm=48e3;
Tm=1/fm;
tf=10;
t=0:Tm:tf;

fr=30;
yr=cos(2*pi*fr*t);

fa=0.5;
ya=cos(2*pi*fa*t);

ron=yr.*ya;
plot(t,ron)
title("Ronroneo")
legend('cos(2*pi*fr*t)*cos(2*pi*fa*t)')
sound(ron,fm)
filename = 'cat.wav';
audiowrite(filename,ron,fm);
clear y Fs