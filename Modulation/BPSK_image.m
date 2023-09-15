%This MATLAB program modulates a grayscale image using BPSK, visualizes the resulting signal, and then attempts to recover and display the original image.
clc;clear;
I_in = imread('lena1.tif');
% encoding image into array of bits
B = dec2bin(I_in,1);
C = reshape(B',1,numel(B)); % converted into bits
b=zeros(1,length(C));
n = length(b);
for l=1:n
   bhat=C(l);
   if bhat==49
       b(l)=1;
   else
       b(l)=0;
   end
end
bpsk=zeros(1,length(C));
for j=1:n
    if b(j)==1
       bpsk(j)=1;
       
   else
       bpsk(j)=-1;
   end
end
t = 0: 0.01: 1;
sint = sin (2 * pi * t);%funcion seno
bitsreceived=zeros(1,length(C));
for i = 1: 10
    time=i-1:0.01:i;
    graph=bpsk(i)*sint;
    figure(1)
    plot(time,graph,'r')
    grid on
    hold on
end
for i = 1: n
    graph=bpsk(i)*sint;
    if graph==-1*sint
        bitsreceived(i)=0;
    else
        bitsreceived(i)=1;
    end
end
charbpsk=mat2str(bitsreceived);
charbpsk=strrep(charbpsk,'[','');
charbpsk=strrep(charbpsk,']','');
charbpsk=strrep(charbpsk,' ','');
scatterplot(bpsk,2)
% decoding image from bits
D = reshape(charbpsk,size(B,2),size(B,1));
I_out = reshape(bin2dec(D'),size(I_in));
figure(3)
subplot(121), imshow(I_in), title('Input Image')
subplot(122), imshow(uint8(I_out)), title('Reconstracted Image')