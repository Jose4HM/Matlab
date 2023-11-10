% Generate a random signal
rnd_signal = randn(1, 100); % Random signal of length 100

% Calculate the autocorrelation of the random signal
autocorrelation = crossCorrelation(rnd_signal, rnd_signal);

% Plot the random signal and autocorrelation
subplot(2,1,1);
plot(rnd_signal);
title('Senal Aleatoria');
xlabel('Tiempo (n)');
ylabel('Amplitud');
grid on;

subplot(2,1,2);
stem(autocorrelation);
title('Autocorrelacion de la Senal Aleatoria');
xlabel('Desplazamiento k');
ylabel('Autocorrelacion');
grid on;