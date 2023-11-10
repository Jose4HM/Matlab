clc; clear;  % Clear the command window and workspace.

sampled_signal = csvread("C:\Users\Nitro\Desktop\Universidad\samples1e6.csv");
samples_complex=complex(sampled_signal(1:1e5,1),sampled_signal(1:1e5,2));

sampling_frequency = 4*1e6;  % Set the sampling frequency to xx Hz.

% Perform the Discrete Fourier Transform (DFT) on the sampled signal.
[k_vector, x_freqs] = dft(samples_complex, sampling_frequency);

% Create a stem plot of the magnitude of the DFT.
stem(x_freqs, abs(k_vector));

grid on;  % Turn on the grid in the plot.

title("Discrete Fourier Transform");  % Set the title of the plot.
xlabel("Frecuency");  % Label the x-axis as "Frequency".
ylabel("Magnitude");  % Label the y-axis as "Magnitude".
