% Frecuencia de muestreo
fs = 1000; % Reemplaza con tu frecuencia de muestreo en Hz

% Número de muestras
N = length(x);

% Calcular las frecuencias correspondientes a las componentes de la DFT
frequencies_hz = (0:N-1) * (fs / N);

% Plotear la magnitud de la DFT
subplot(2, 1, 1);
stem(frequencies_hz, abs(X));
title('Magnitud de la DFT');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');

% Plotear la fase de la DFT
subplot(2, 1, 2);
stem(frequencies_hz, angle(X));
title('Fase de la DFT');
xlabel('Frecuencia (Hz)');
ylabel('Fase (radianes)');
