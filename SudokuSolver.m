syms x
sudo=[2 1 8 x 7 4 5 9 x;x x x x x x 6 x x;x 7 x 5 3 x 2 x x;4 x 7 1 x x x x 6;
    x 3 x 8 6 x 4 x x;x x 9 x x 3 x 7 1;x 6 2 x x x 9 x 8;x x 1 x 4 x x x 5;x 5 x 3 9 8 x x 2];
options1=[1 2 3 4 5 6 7 8 9 ];
options2=[1 2 3 4 5 6 7 8 9 ];
options3=[1 2 3 4 5 6 7 8 9 ];
options4=[1 2 3 4 5 6 7 8 9 ];
options5=[1 2 3 4 5 6 7 8 9 ];
options6=[1 2 3 4 5 6 7 8 9 ];
options7=[1 2 3 4 5 6 7 8 9 ];
options8=[1 2 3 4 5 6 7 8 9 ];
options9=[1 2 3 4 5 6 7 8 9 ];
%options=zeros(1,9);
%for n=1:9
%   options(n,:)=[1,2,3,4,5,6,7,8,9]; 
%end
for j=1:3
   for i=1:3
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options1(options1==sudo(j,i))=[];
       end
   end  
   for i=4:6
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options2(options2==sudo(j,i))=[];
       end
   end
   for i=7:9
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options3(options3==sudo(j,i))=[];
       end
   end
end
for j=4:6
   for i=1:3
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options4(options4==sudo(j,i))=[];
       end
   end  
   for i=4:6
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options5(options5==sudo(j,i))=[];
       end
   end
   for i=7:9
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options6(options6==sudo(j,i))=[];
       end
   end
end
for j=7:9
   for i=1:3
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options7(options7==sudo(j,i))=[];
       end
   end  
   for i=4:6
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options8(options8==sudo(j,i))=[];
       end
   end
   for i=7:9
       if sudo(j,i)==x
           sudo(j,i)=sudo(j,i);
       else 
           options9(options9==sudo(j,i))=[];
       end
   end
end
miss=zeros(5);%numero de valores faltantes, por ahora iguales
miss(1,1:1:length(options1))=options1;
miss(2,1:1:length(options2))=options2;
miss(3,1:1:length(options3))=options3;
miss(4,1:1:length(options4))=options4;
miss(5,1:1:length(options5))=options5;
miss(6,1:1:length(options6))=options6;
miss(7,1:1:length(options7))=options7;
miss(8,1:1:length(options8))=options8;
miss(9,1:1:length(options9))=options9;%numeros faltantes
for m=1:5
    for j=1:3
        for i=1:3
           pos = randi(5);
           number = miss(1,pos);
           if sudo(j,i)==x
           sudo(j,i)=number;
           end
        end
    end
end
