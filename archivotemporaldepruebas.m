[r1, r2]=deal(200,100);
veces=input('Numero de juegos de experimentos= ');
k=0; %casos a favor
i=0; %contador de casos
while i<veces
    R1=r1+randi([-10 10])*r1/100;
    R2=r2+randi([-5 5])*r2/100;
    R=R1+R2;
    if R>300
        k=k+1;
        i=i+1;
    else
        i=i+1;
    end
    
end 
p=k/veces;
p %resultado final