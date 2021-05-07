close all
t=-10:0.001:10;
function z=Dirac(t)
N=length(t);
z=zeros(size(t));
for n=1:N
    if t(n)==0
        z(n)=1
    end
end
plot(t,N)
end