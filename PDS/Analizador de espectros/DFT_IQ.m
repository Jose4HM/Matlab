clc; clear;  % Clear the command window and workspace.

sampled_signal = readmatrix("D:\Archivos de programas\bladeRF\samplesGain60.csv");
samples_complex=complex(sampled_signal(1:1e4,1),sampled_signal(1:1e4,2));

sampling_frequency = (93.5*10e6)*2;  % Set the sampling frequency to xx Hz.

% Perform the Discrete Fourier Transform (DFT) on the sampled signal.
[k_vector, x_freqs] = dft(samples_complex, sampling_frequency);

% Create a stem plot of the magnitude of the DFT.
plot(x_freqs, abs(k_vector));

grid on;  % Turn on the grid in the plot.

title("Discrete Fourier Transform");  % Set the title of the plot.
xlabel("Frecuency");  % Label the x-axis as "Frequency".
ylabel("Magnitude");  % Label the y-axis as "Magnitude".

%% Analizados de espectros
figure(2)
mag_esp = abs(fftshift(k_vector));
hold on
plot(x_freqs,20*log10(mag_esp));
title('Spectrum Analyzer (dB)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
% [picos, ubicaciones] = findpeaks(mag_esp, x_freqs);
% scatter(ubicaciones,picos)