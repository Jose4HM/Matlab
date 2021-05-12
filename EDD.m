clc;clear;
x=[0,0,1,zeros(1,30)];
n=0:32;
y=zeros(1,33);
for i=3:33
   y(i)=0.3*x(i)+0.6*x(i-1)+0.3*x(i-2)-0.9*y(i-2);
end
disp(y)
figure(1)
stem(n,y)
%% Filter
A=[1 0 0.9];
B=[0.3 0.6 0.3];
x=[1,zeros(1,29)];
y1=filter(B,A,x);
n=0:29;
disp(y1)
figure(2)
stem(n,y1)