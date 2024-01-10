clear all;
%%addpath("D:\Program Files\files math\inalambrica\tools");

rxSignal = load_sc16q11("new_samples.sc16q11");
%%load('preambulo_data.mat','preambulo');

M = 2; % Orden de modulación (BPSK)
Fc = 100; % Frecuencia portadora, Hz
Fb = 100; % Velocidad de bits (baudios), bps
Fs = 10*Fc; % Frecuencia de muestreo, Hz
spb = Fs/Fb; % Muestras por bit
fSpan = 1; % Rango de filtrado en símbolos

constdiagram = comm.ConstellationDiagram( ...
    'ReferenceConstellation',pskmod(0:M-1,M), ...
    'SamplesPerSymbol',spb, ...
    'SymbolsToDisplaySource','Property', ...
    'SymbolsToDisplay',100000, ...
    'XLimits',[-2 2], ...
    'YLimits',[-2 2]);
constdiagram(rxSignal)