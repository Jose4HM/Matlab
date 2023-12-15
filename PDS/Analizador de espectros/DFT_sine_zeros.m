clc; clear;  % Clear the command window and workspace.

% Define a signal function as the sum of two sinusoidal components.
signal_func = @(t) exp(1i*2*pi*2.5/128*t); %0.01953

sampling_frequency = 4*2.5/128;  % Set the sampling frequency to xx Hz.
Tduration = 128;  % Set the duration of the signal to xx seconds.

% Call the 'sample_any_signal' function to sample the signal function.
[sampled_signal, ~] = sample_any_signal(signal_func, sampling_frequency, Tduration);

sampled_signal=[sampled_signal zeros(1,length(sampled_signal)-1)];
time_samples = 0:1/sampling_frequency:2*Tduration;

plot_signal(time_samples,sampled_signal,2,1,1,'b');
% Perform the Discrete Fourier Transform (DFT) on the sampled signal.
[k_vector, x_freqs] = dft(sampled_signal, sampling_frequency);

subplot(2,1,2);
% Create a stem plot of the magnitude of the DFT.
stem(x_freqs, abs(k_vector));

grid on;  % Turn on the grid in the plot.

title("Discrete Fourier Transform");  % Set the title of the plot.
xlabel("Frecuency");  % Label the x-axis as "Frequency".
ylabel("Magnitude");  % Label the y-axis as "Magnitude".
