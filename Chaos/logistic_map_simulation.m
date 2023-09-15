function logistic_map_simulation(r,x_0,iterations)
    %logistic_map_simulation(3.7, 1000);
    
    % Par�metros iniciales
    x = x_0; % Valor inicial de x (puede ser cualquier valor entre 0 y 1)

    % Preparar vector para almacenar los valores de x
    x_values = zeros(iterations, 1);

    % Iterar el mapa log�stico
    for i = 1:iterations
        x_values(i) = x;
        x = r * x * (1 - x);
    end

    % Graficar los resultados
    figure;
    plot(1:iterations, x_values, '-o');
    xlabel('Iteraciones');
    ylabel('Valor de x');
    title(['Simulaci�n del Mapa Log�stico con r = ', num2str(r)]);
end

