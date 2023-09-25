clc; clear;  % Clear the command window and workspace.

% Define a signal function as the sum of two sinusoidal components.
signal_func = @(t) sin(2 * pi * 1 * t) + sin(2 * pi * 4 * t);

sampling_frequency = 10;  % Set the sampling frequency to 10 Hz.
Tduration = 10;  % Set the duration of the signal to 10 seconds.

% Call the 'sample_any_signal' function to sample the signal function.
[sampled_signal, time] = sample_any_signal(signal_func, sampling_frequency, Tduration);

% Perform the Discrete Fourier Transform (DFT) on the sampled signal.
[k_vector, x_freqs] = myDFT(sampled_signal, sampling_frequency);

% Create a stem plot of the magnitude of the DFT.
stem(x_freqs, abs(k_vector));

grid on;  % Turn on the grid in the plot.

title("Discrete Fourier Transform");  % Set the title of the plot.
xlabel("Frecuency");  % Label the x-axis as "Frequency".
ylabel("Magnitude");  % Label the y-axis as "Magnitude".
