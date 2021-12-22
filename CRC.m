%% Generación de bits
clc,clear
bits=[1 1 1 1 1];%randi([0 1],1,5);%Se puede generar bits aleatorios
disp('Bits originales son:')
disp(bits)
%% Emisor
clc
polinomio=[1 0 1 0 1]; %polinomio g(x)=1+x^2+x^4
senttrama=zeros(1,length(bits)+length(polinomio)-1);%pre-alojan las variables
senttrama(1:length(bits))=senttrama(1:length(bits))+bits;%Se juntan los bits del trama con zeros pre alojados
n=1;
while n<length(senttrama)-length(polinomio)-1
    for m=1:length(polinomio)-1%Se ignoran los ceros a la derecha
        if senttrama(n)==0
            n=n+1;
        end
    end
    if n>length(senttrama)-(length(polinomio)-1)%Se establece un tope para el for
        return
    end
    disp('Trama')
    disp(senttrama)
    disp('Divisor')
    disp(polinomio)
    disp('Residuo')
    senttrama(n:length(polinomio)-1+n)=xor(polinomio,senttrama(n:length(polinomio)-1+n));%Se hace la division logica
    disp(senttrama)
    disp('-----------------------------------------------------------')
end
%% Receptor
clc
corruptedsignal=awgn(bits,50,'measured');%Se corrompe la señal
reconstructed=ones(1,length(bits));%Se pre-aloja la señal
reconstructed(corruptedsignal<0.5)=0;%Se intenta recuperar la señal
disp('Bits orignales')
disp(bits)
disp('Bits recibidos')
disp(reconstructed)%dato recibido 
disp('***********************************************************************')
checksum=senttrama(senttrama~=0);%residuo
receivedtrama=zeros(1,length(reconstructed)+length(polinomio)-1);%Se prealoja el vector
receivedtrama(1:length(reconstructed))=reconstructed;%Se une la trama 
receivedtrama(length(reconstructed)+1:(length(reconstructed)+length(checksum)))=checksum;%Se une el residuo
n=1;
while n<length(receivedtrama)-4
    for m=1:length(polinomio)-1%Se ignoran los ceros a la derecha
        if receivedtrama(n)==0
            n=n+1;
        end
    end
    if n>length(receivedtrama)-(length(polinomio)-1)%Suma de la trama sin el residuo
        a=sum(receivedtrama);
        if a==0
            disp('Trama sin errores')
        else
            disp('Error detectado, se necesita reenviar.')
        end
        return
    end
    
    disp('Trama')
    disp(receivedtrama)
    disp('Divisor')
    disp(polinomio)
    disp('Residuo')
    receivedtrama(n:4+n)=xor(polinomio,receivedtrama(n:4+n));
    disp(receivedtrama)
    disp('-----------------------------------------------------------')
    
end
a=sum(receivedtrama);
if a==0
    disp('Trama sin errores')
else
    disp('Error detectado, se necesita reenviar.')
end