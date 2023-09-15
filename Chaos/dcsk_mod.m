% Generar la se�al ca�tica de referencia (por ejemplo, usando el mapa log�stico)
% Define los par�metros del mapa log�stico
r = 3.9;
x_0 = 0.1;
num_samples = 1000;

% Genera la se�al ca�tica de referencia
x = x_0; % Valor inicial de x (puede ser cualquier valor entre 0 y 1)

% Preparar vector para almacenar los valores de x
chaotic_signal = zeros(num_samples, 1);

% Iterar el mapa log�stico
for i = 1:num_samples
    chaotic_signal(i) = x;
    x = r * x * (1 - x);
end

% Define una secuencia de bits de ejemplo (puedes reemplazarla con tus datos)
input_bits = randi([0, 1], 1, num_samples) * 2 - 1;

% Modula la secuencia de bits utilizando DCSK
modulated_signal = dcsk_modulate(input_bits, chaotic_signal);

% Visualiza la se�al modulada (esto es solo para fines de demostraci�n)
plot(1:num_samples, chaotic_signal, 1:num_samples, modulated_signal);

xlabel('Muestras');
ylabel('Valor');
title('Se�al Ca�tica de Referencia y Se�al Modulada DCSK');
legend('Se�al de Referencia', 'Se�al Modulada', 'Location', 'NorthEast');
xlabel('Muestras');
ylabel('Valor');
title('Se�al Ca�tica de Referencia y Se�al Modulada DCSK');
legend('Se�al de Referencia', 'Se�al Modulada', 'Location', 'NorthEast');
