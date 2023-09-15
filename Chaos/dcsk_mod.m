% Generar la señal caótica de referencia (por ejemplo, usando el mapa logístico)
% Define los parámetros del mapa logístico
r = 3.9;
x_0 = 0.1;
num_samples = 1000;

% Genera la señal caótica de referencia
x = x_0; % Valor inicial de x (puede ser cualquier valor entre 0 y 1)

% Preparar vector para almacenar los valores de x
chaotic_signal = zeros(num_samples, 1);

% Iterar el mapa logístico
for i = 1:num_samples
    chaotic_signal(i) = x;
    x = r * x * (1 - x);
end

% Define una secuencia de bits de ejemplo (puedes reemplazarla con tus datos)
input_bits = randi([0, 1], 1, num_samples) * 2 - 1;

% Modula la secuencia de bits utilizando DCSK
modulated_signal = dcsk_modulate(input_bits, chaotic_signal);

% Visualiza la señal modulada (esto es solo para fines de demostración)
plot(1:num_samples, chaotic_signal, 1:num_samples, modulated_signal);

xlabel('Muestras');
ylabel('Valor');
title('Señal Caótica de Referencia y Señal Modulada DCSK');
legend('Señal de Referencia', 'Señal Modulada', 'Location', 'NorthEast');
xlabel('Muestras');
ylabel('Valor');
title('Señal Caótica de Referencia y Señal Modulada DCSK');
legend('Señal de Referencia', 'Señal Modulada', 'Location', 'NorthEast');
