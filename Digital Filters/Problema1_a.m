clear; clc;
N=8; %orden del filtro
Wc=4e3; %frecuencia de corte
T=16e3; %periodo de muestro
F=1/T; %frecuencia de muestreo
%% butterworth
[b,a]=butter(N,0.5);
freqz(b,a);
subplot(2,1,1);hold on;
subplot(2,1,2);hold on;
%% cheby1
[b,a]=cheby1(N,1,0.5);
freqz(b,a);
%% cheby2
[b,a] = cheby2(N,30,0.55);
freqz(b,a);
%% Elliptic
[b,a] = ellip(N,1,30,0.5);
freqz(b,a);
legend('Butterworth','Chebyshev 1','Chebyshev 2','Eliptic','Location','southwest')
lines = findall(gcf,'type','line');
lines(1).Color = 'red';
lines(2).Color = 'green';
lines(3).Color = 'blue';
lines(4).Color = 'black';
lines(5).Color = 'red';
lines(6).Color = 'blue';
lines(7).Color = 'green';
lines(8).Color = 'black';



% 
% figure
% subplot(2,1,1)
% xlabel('Normalized frequency (\times\pi rad/samples )')
% ylabel('Magnitude (dB)')
% hold on
% for k = 1:1
%     plot(w{k},20*log10(abs(h{k})))
% end
% hold off

% grid
% subplot(2,1,2)
% xlabel('Normalized frequency (\times\pi rad/samples )')
% ylabel('Phase (degrees)')
% hold on
% for k = 1:1
%     plot(w{k},unwrap(angle(h{k})))
% end
% hold off
% legend('Butterworth','Chebyshev 1','Chebyshev 2','Eliptic')
% grid
% 



