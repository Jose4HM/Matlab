%% Configuraciones del receptor
dev_rx = bladeRF('*:serial=8c1'); % Cambia el número de serie por el del receptor

dev_rx.rx.frequency  = 300e6;
dev_rx.rx.samplerate = 1e6;
dev_rx.rx.bandwidth  = 1e3;

dev_rx.rx.gain  = 60;
dev_rx.rx.vga2 = 0;
dev_rx.rx.vga1 = -20;

dev_rx.rx.config.num_buffers   = 64;
dev_rx.rx.config.buffer_size   = 16384;
dev_rx.rx.config.num_transfers = 16;
dev_rx.rx.timeout_ms           = 5000;

fprintf('Running receiver with the following settings:\n');
disp(dev_rx.rx)
disp(dev_rx.rx.config)

%% Proceso de recepción y demodulación
% Demodulación (recuperación de la señal)
demodulated = filtered_signal .* sin(fases); % Utiliza la misma fase para la demodulación

% Filtrado para eliminar el coseno alzado
demodulated = conv(demodulated, h, 'same');

% Decisión sobre los bits recibidos
received_bits = demodulated > 0; % Decisión simple: si la amplitud es positiva, el bit es 1; de lo contrario, es 0.

% Comparación de bits transmitidos con bits recibidos
bit_errors = sum(xor(received_bits(index:index + length_x - 1), x)); % Conteo de errores

% Visualizar resultados
disp("Número de errores en los bits recibidos:");
disp(bit_errors);

% Si deseas visualizar la señal demodulada
scatterplot(demodulated);
title('Señal Demodulada BPSK');
xlabel('Muestras');
ylabel('Amplitud');
grid on;