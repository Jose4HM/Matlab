clc;clear;
t=0:0.01:1;
Fa=4;
subplot(3,1,1)
y=sin(2*pi*Fa*t);
plot(t,y)
Fs=64;
Ts=(0:Fs)./Fs;
xn=sin(2*pi*Fa*Ts);
subplot(3,1,2);
stem(Ts,xn)
n=zeros(1,round(length(y)/16));
t0=zeros(1,round(length(y)/16));
i=1;
for j=1:16:length(y)
    n(i)=y(j);
    t0(i)=t(j);
    i=i+1;
end
subplot(3,1,3)
stem(t0,n)