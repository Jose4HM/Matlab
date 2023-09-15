function lorentz_attractor(sigma, rho, beta, tspan)
%     sigma = 10;
%     rho = 28;
%     beta = 8/3;
%     tspan = [0 50];  % Intervalo de tiempo de 0 a 50
%     lorentz_attractor(sigma, rho, beta, tspan);

    % Definir las ecuaciones del sistema de Lorenz
    f = @(t, u) [sigma * (u(2) - u(1)); u(1) * (rho - u(3)) - u(2); u(1) * u(2) - beta * u(3)];

    % Condiciones iniciales
    u0 = [1; 0; 0];

    % Resolver el sistema de ecuaciones diferenciales
    [t, u] = ode45(f, tspan, u0);

    % Extraer las variables x, y y z
    x = u(:, 1);
    y = u(:, 2);
    z = u(:, 3);

    % Graficar el atractor de Lorenz
    figure;
    plot3(x, y, z);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('Atractor de Lorenz');
    grid on;
end
