data = csvread('samples.csv');
data = data./1024;
scatter(data(:, 1), data(:, 2));
title('Diagrama de Constelación');
xlabel('I (In-Phase)');
ylabel('Q (Quadrature)');
grid on;

%set frequency rx 93.5MHz
%set bandwidth rx 1.50MHz
%set samplerate rx 3M
%rx config file=samples.csv format=csv n=10M
%rx
%rx start
%rx
%rx wait
%rx
%Press ctrl+c