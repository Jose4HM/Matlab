close all
clc
clear
%% Load samples
samples = load_sc16q11('D:\Archivos de programas\bladeRF\bpsk.sc16q11');
%% Coarse frecuencia
nSpan = 1;
sps = 4;
decimationFactor = 2;
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
    'DampingFactor',40, ...
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

prbdet.Threshold = max(detmetSort); 

startIdx = prbdet(rxCarrierSync);
%[startIdx] = prbdet(pskmod(demodulated,2));

imagencolor = imread('a.png');
orig_size = size(imagencolor);
% orig_size = [225 225 3];

dataAfterPreamble = demodulated(startIdx+1:startIdx+orig_size(1)*orig_size(2)*orig_size(3)*8);
%% Reconstruct the image
reconstructed = reshape(typecast(uint8(bin2dec(char(reshape( ...
    dataAfterPreamble, 8, [])+'0').')), 'uint8'), orig_size);
imshow(reconstructed);

title('reconstructed')