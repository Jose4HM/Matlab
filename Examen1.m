%Montecarlo Examen 1
clc
[p1,p2,p3,p4] = deal(0, 0, 0, 0);
i=1;
xv=[];
yv=[];
%for i=0:k
   while i<=1000
       x=randi([-100 100]);
       x=0.1*x;
       y=randi([-100 100]);
       y=0.1*y;
       c=(y^2)+(x^2);
       r=sqrt(c);
       if c<=100
           xv=[xv,x];
           yv=[yv,y];
           if (r>0) && (r<=2.5) 
               p1=100+p1;
               i=i+1;
           elseif (r>2.5) && (r<=5) 
               p2=75+p2;
               i=i+1;
           elseif (r>5) && (r<=7.5)
               p3=50+p3;
               i=i+1;
           elseif (r>7.5) && (r<=10)           
               p4=25+p4;
               i=i+1;
           end
       end
 
   end 
%end
t=p1+p2+p3+p4;
media=t/i
sz=40;
scatter(xv,yv,sz,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5)
ylim([-10 10])
xlim([-10 10])