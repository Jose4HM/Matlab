clc;
clear;

%% Create bits and preamble
rng(0); % Reproducibility
% Generating random preamble and signal (bits)
length_preamble = 1e2;
preamble = randi([0, 1], 1, length_preamble);

original_image = imread('lena.png');
gray_image = rgb2gray(original_image);
binary_sequence = reshape(dec2bin(gray_image, 8).' - '0', [], 1)';% Turning matrix into vector

length_signal = length(binary_sequence);

index = randi(length_signal - length_preamble + 1);
signal(index:index + length_preamble - 1) = preamble;
%% BPSK modulation
modulated = pskmod(signal, 2, pi);
scatterplot(modulated);
title('Señal Modulada BPSK');
xlabel('Parte Real');
ylabel('Parte Imaginaria');
grid on;

%% Filtering
nSpan = 10;
sps = 4;
rollOff = 0.5;
txFilter = comm.RaisedCosineTransmitFilter("FilterSpanInSymbols",nSpan,"OutputSamplesPerSymbol",sps,"RolloffFactor",rollOff);

txSignal = txFilter([modulated'; zeros(nSpan,1)]);

%% BladeRF
Tx = bladeRF('*:serial=030');

Tx.tx.frequency = 900e6;
Tx.tx.samplerate = 4e6;
Tx.tx.bandwidth = 2e6;
Tx.tx.gain = 40;

Tx.tx.config.num_buffers = 64;
Tx.tx.config.buffer_size = 16384;
Tx.tx.config.num_transfers = 16;

fprintf('Running with the following settings:\n');
disp(Tx.tx)
disp(Tx.tx.config)
%% Start transmition
Tx.tx.start();
delay_seconds = 0;

Tx.transmit(txSignal, delay_seconds, 0, true, true);