clc;
clear;

%- Creación de bits y preámbulo
rng(0); % Para reproducibilidad
% Generar preámbulo aleatorio (preamble) y señal (signal)
length_preamble = 8; % Longitud del preámbulo [0 1 1 0 1 0 0 1]
length_signal = 1e6; % Longitud de la señal
preamble = [0 1 1 0 1 0 0 1]; % Preamble esperado
signal = randi([0, 1], 1, length_signal); % Señal aleatoria de longitud y con valores de 0 y 1
index = randi(length_signal - length_preamble + 1); % Generar un índice aleatorio para insertar el preámbulo en la señal
signal(index:index + length_preamble - 1) = preamble; % Insertar el preámbulo en la señal en un lugar aleatorio


%- Modulación BPSK
modulated = pskmod(signal, 2, pi); % Modulación BPSK (binario a símbolos)

% Visualizar la señal modulada
scatterplot(modulated); % Mostrar la constelación de la señal modulada
title('Señal Modulada BPSK');
xlabel('Parte Real');
ylabel('Parte Imaginaria');
grid on;

%- Filtrado
nSpan = 10;
sps = 4;
rollOff = 0.5;
txFilter = comm.RaisedCosineTransmitFilter("FilterSpanInSymbols",nSpan,"OutputSamplesPerSymbol",sps,"RolloffFactor",rollOff);

txSignal = txFilter([modulated'; zeros(nSpan,1)]);

                            
% Configuración del dispositivo bladeRF
% (Asegúrate de tener el dispositivo correctamente conectado y que el código pueda acceder a él)
dev = bladeRF('*:serial=0304368977fd40ceb47b263fd29e61d7');

% Configuración del transmisor
dev.tx.frequency = 900e6;
dev.tx.samplerate = 4e6;
dev.tx.bandwidth = 2e6;
dev.tx.gain = 40;

dev.tx.config.num_buffers = 64;
dev.tx.config.buffer_size = 16384;
dev.tx.config.num_transfers = 16;

fprintf('Running with the following settings:\n');
disp(dev.tx)
disp(dev.tx.config)
%%
% Iniciar transmisión
dev.tx.start();

delay_seconds = 0;

% Transmitir la señal modulada
dev.transmit(txSignal, delay_seconds, 0, true, true);