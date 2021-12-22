clc;clear;
t=0:0.01:3;
A=3;
y=A*sin(2*pi*1*t);
level=5;
sublevel=[A,A/2,0,-A/2,-A];
quantize=zeros(1,length(y));
symbols=zeros(1,length(y));
for i=1:length(y)
    if y(i)>=2.5
        quantize(i)=3;
        symbols(i)=7;
        
    elseif 1.5<=y(i)&& y(i)<2.5
        quantize(i)=2;
        symbols(i)=6;
        
    elseif 0.5<=y(i)&& y(i)<1.5
        quantize(i)=1;
        symbols(i)=5;
        
    elseif -0.5<=y(i)&& y(i)<0.5
        quantize(i)=0;
        symbols(i)=4;
        
    elseif -1.5<=y(i) && y(i)<-0.5
        quantize(i)=-1;
        symbols(i)=3;
        
    elseif -2.5<=y(i) && y(i)<-1.5
        quantize(i)=-2;
        symbols(i)=2;
        
    elseif y(i)<=-2.5
        quantize(i)=-3;
        symbols(i)=1;
    end
end
plot(t,y,'red')
hold on
stem(t,quantize)