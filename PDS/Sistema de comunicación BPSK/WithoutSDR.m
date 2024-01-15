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

%% AWGN
txNoise = awgn(txSignal,50,'measured');
plot(real(txNoise))
%txNoise = txSignal;

%% Receiver
samples = txNoise;
%% Coarse frecuencia
Fs = 4e6;

coarseSync = comm.CoarseFrequencyCompensator( ...
    Modulation="BPSK", ...
    SampleRate=Fs, ...
    SamplesPerSymbol=sps,...
    FrequencyResolution=1);

[compensatedData,aux1] = coarseSync(samples);
%% Raised cosine filter
rxFilter = comm.RaisedCosineReceiveFilter(...
    "FilterSpanInSymbols",10,...
    "InputSamplesPerSymbol",sps,...
    "DecimationFactor",2,...
    "RolloffFactor",0.5);

rxFilteredSignal = rxFilter(compensatedData);
%% Symbol
symbolSync = comm.SymbolSynchronizer(...
    'SamplesPerSymbol',2, ...
    'NormalizedLoopBandwidth',0.1, ...
    'DampingFactor',30, ...
    'TimingErrorDetector','Mueller-Muller (decision-directed)');

rxSync = symbolSync(rxFilteredSignal);
scatterplot(rxSync)
%% Carrier Synchronize
fineSync = comm.CarrierSynchronizer( ...
    'DampingFactor',0.7, ...
    'NormalizedLoopBandwidth',0.005, ...
    'SamplesPerSymbol',1, ...
    'Modulation','BPSK');

rxCarrierSync = fineSync(rxSync);
scatterplot(rxCarrierSync)
%% BPSK Demodulation
% rxFilteredSignal=totalData;
%reales = real(rxCarrierSync);

demodulated = pskdemod(rxCarrierSync, 2);
%% Find preamble
%barker=comm.BarkerCode('Length',11,'SamplesPerFrame',11);
%auxpre2 = barker();
auxpre = [1 0 1 0 1 1 1 0 1 1 1 0 0]';
preamble = [auxpre;auxpre;auxpre;auxpre];
preambleMod = pskmod(preamble, 2);
prbdet = comm.PreambleDetector(preambleMod);

[startIdx2,detmet] = prbdet(rxCarrierSync);
detmetSort = sort(detmet,'descend');

prbdet.Threshold = 50;

startIdx = prbdet(rxCarrierSync);
%[startIdx] = prbdet(pskmod(demodulated,2));
              
orig_size = size(original_image);
% orig_size = [225 225 3];

dataAfterPreamble = demodulated(startIdx+1:startIdx+orig_size(1)*orig_size(2)*orig_size(3)*8);
%% Reconstruct the image
reconstructed = reshape(typecast(uint8(bin2dec(char(reshape( ...
    dataAfterPreamble, 8, [])+'0').')), 'uint8'), orig_size);
imshow(reconstructed);

title('reconstructed')