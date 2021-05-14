clc;clear;
x=[0,0,1,zeros(1,29)];
n=0:29;
y=zeros(1,32);
for i=3:32
   y(i)=0.3*x(i)+0.6*x(i-1)+0.3*x(i-2)-0.9*y(i-2);
end
y=y(y~=0);
stem(n,y); hold on
%% Filter
A=[1 0 0.9];
B=[0.3 0.6 0.3];
x=[1,zeros(1,29)];
y1=filter(B,A,x);
n=0:29;
stem(n,y1); hold on;
% d=(y-y1)./y1;
% figure(2)
% stem(n,d)
%%
clc;clear;
x=[0,0,1,zeros(1,30)];
n=0:32;
y=zeros(1,33);
for i=3:33
y(i)=x(i)+0.5*x(i-1)-1.8*cos(pi/16)*y(i-1)-0.81*y(i-2);
end
disp(y)
figure(1)
stem(n,y)
%% Filter
A=[1 1.8 0.81];
B=[1 0.5 0];
x=[1,zeros(1,29)];
y1=filter(B,A,x);
n=0:29;
disp(y1)
figure(2)
stem(n,y1)
%% IV.6.2
n=0:29;
y=zeros(1,32);
for i=3:32
   y(i)=0.5^(i-3)+0.25*y(i-2);
end
y=y(y~=0);
stem(n,y); hold on
grid on;
%% Filter
a=[1 0 -0.25];
b=1;
n=0:29;
x=0.5.^n;
y1=filter(b,a,x,[0 0]);
stem(n,y1);
d=(y-y1)./y1;
figure(2)
stem(n,d)
%% IV.7
x=[0,0,1,zeros(1,10)];
y=zeros(1,13);
for i=3:13
   y(i)= x(i)+ 0.5*x(i-1)+y(i-1);
end
n=0:10;
y=y(y~=0);
stem(n,y)
%% FIlter
a=[1 -1];
b=[1 0.5];
x=[1,zeros(1,10)];
y=filter(b,a,x);
n=0:10;
stem(n,y)
%% IV.7
x=[0,0,1,ones(1,10)];
y=zeros(1,13);
for i=3:13
   y(i)= x(i)+ 0.5*x(i-1)+y(i-1);
end
n=0:10;
y=y(y~=0);
stem(n,y)
%% FIlter
a=[1 -1];
b=[1 0.5];
x=[1,ones(1,10)];
y=filter(b,a,x);
n=0:10;
stem(n,y)
