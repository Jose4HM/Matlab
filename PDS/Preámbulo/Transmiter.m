clc; clear;
%% Creation of bits
rng(0);%Just for reproducibility
% Generate random signal x (preamble) and signal y (with preamble or noise)
length_x = 50;% Signal length x (you can adjust it)
length_y = 1e6; % Signal length y (you can adjust it)
x = rand(1, length_x);  % Random signal of length x
y = rand(1, length_y); % Random signal length y
index = randi(length_y - length_x + 1); % Generate a random index to insert x into y
y(index:index + length_x - 1) = x; % Insert the preamble of x into y in a random place
plot(1:length(y),y)
%% Modulation
% Parámetros de la modulación 4QAM
% Modulación BPSK
fase_0 = 0;  % Fase para el bit 0
fase_1 = pi; % Fase para el bit 1

% Asignar fases según los bits
fases = y * fase_1 + (1 - y) * fase_0;

% Modulación BPSK
modulated = cos(fases);

% Visualizar la señal modulada
% stem(modulated);
scatterplot(modulated);
title('Señal Modulada BPSK');
xlabel('Muestras');
ylabel('Amplitud');
grid on;

%% Setup device
dev = bladeRF('*:serial=030');

dev.tx.frequency  = 300e6;
dev.tx.samplerate = 1e6;
dev.tx.bandwidth  = 1e3;

dev.tx.gain  = 60;
dev.tx.vga2 = 0;
dev.tx.vga1 = -20;

dev.tx.config.num_buffers = 64;
dev.tx.config.buffer_size = 16384;
dev.tx.config.num_transfers = 16;

fprintf('Running with the following settings:\n');
disp(dev.tx)
disp(dev.tx.config)

dev.tx.start();

num_seconds = 10;

dev.transmit(modulated, 2 * num_seconds, 0, true, true);

end_i = round(10 * dev.tx.config.buffer_size);
dev.transmit(modulated(1:end_i), num_seconds, 0, true, false);

start_i = end_i + 1;
end_i = round(length(modulated) * 2 / 3);
dev.transmit(modulated(start_i:end_i), num_seconds, 0, false, false);

start_i = end_i + 1;
dev.transmit(modulated(start_i:end), num_seconds, 0, false, true);



% save_csv("bpsk_modulated.csv",complex(modulated'))
% % Visualizar la constelación
% grid on
% scatterplot(modulated);
% title('Constelación BPSK');
% Guardar la señal modulada en un archivo CSV
% writematrix(matrizAB,'D:\Archivos de programas\bladeRF\senal_modulada.csv');
