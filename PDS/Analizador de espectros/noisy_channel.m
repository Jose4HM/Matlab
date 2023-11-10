function noisy_signal=noisy_channel(signal,mean,desviation)
    %Add noise; uncomment the next line if you want adding noise
    tamano = [1, length(signal)];    % Length

    % Generar ruido gaussiano
    gaussian_noise = mean + desviation * randn(tamano);
    noisy_signal = signal + gaussian_noise;
end