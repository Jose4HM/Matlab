close all
clc;
clear;
%% Transmitter
% Generating random preamble and signal (bits)
%barker=comm.BarkerCode('Length',11,'SamplesPerFrame',11);
%auxpre = barker();
auxpre = [1 0 1 0 1 1 1 0 1 1 1 0 0]';
preamble = [auxpre;auxpre;auxpre;auxpre];
length_syncData = 2e3;
syncData = randi([0, 1],  length_syncData,1);

original_image = imread(['a.png' ...
    '']);
figure(1)
imshow(original_image); title('original');
binary_sequence = reshape((dec2bin(typecast(original_image(:), 'uint8') ...
    , 8) - '0').', 1, [])';

length_signal = length(binary_sequence);

%% BPSK modulation
synDataMod = pskmod(syncData, 2);
preambleMod = pskmod(preamble, 2);
datamodulated = pskmod(binary_sequence, 2);
totalData = [synDataMod;preambleMod;datamodulated];

scatterplot(totalData)
%% Filtering
nSpan = 10;
sps = 4;
txFilter = comm.RaisedCosineTransmitFilter("FilterSpanInSymbols",nSpan,...
    "OutputSamplesPerSymbol",sps,"RolloffFactor",0.5);
txSignal = txFilter([totalData; zeros(nSpan,1)]);
plot(real(txSignal))

%% BladeRF
Tx = bladeRF('*:serial=8c1');

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
disp("Begin transmition in:")
for c = 3:-1:1
    fprintf("%d seconds \n",c)
    pause(1)
end
Tx.tx.start();
disp("Starting")
delay_seconds = 0;
Tx.transmit(txSignal, delay_seconds, 0, true, true);
disp("Stopping in 1.5s")
pause(1.5)
Tx.tx.stop();
disp("Stopped")