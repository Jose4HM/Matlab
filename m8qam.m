clear; clc;
m=6;
q=2^m;
data = randi([0 (q-1)],1000,1);%generate 0-7 random array
txSig = qammod(data,q);%Modulate using 8qam
rxSig = awgn(txSig,20,'measured');%Pass la modulate signal through an AWGN
rxData = qamdemod(rxSig.*exp(-1i*0),q);%demodulate using initial phase pi/8
refpts = qammod((0:q-1)',q) .* exp(1i*0);%Generate the reference constellation points
%Plot the received signal points corresponding to symbols 0 and 3 and overlay the reference constellation. The received data corresponding to those symbols is displayed.
for g=0:q
    txt=['Symbols=',num2str(g)];
    plot(rxSig(rxData==g),'.','DisplayName',txt);
    hold on
end
% legend show;
text(real(refpts)+0.1,imag(refpts),num2str((0:q-1)'))
plot(refpts,'r*','DisplayName','Reference constellation');
xlabel('In-Phase')
ylabel('Quadrature')
% legend('location','best')