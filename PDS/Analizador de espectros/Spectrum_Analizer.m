%Calculate DFT using nested loop.
%This program need: sample_any_signal.m, dft.m and plot_signal.m
clc; clear;  % Clear the command window and workspace.

% Define a signal function as the sum of two sinusoidal components and white noise.
signal_func = @(t) sin(2*pi*4*t)+sin(2*pi*1*t);%+ 0.2 * randn(size(t));

sampling_frequency = 10;  % Set the sampling frequency to xx Hz.
Tduration = 10;  % Set the duration of the signal to xx seconds.

%Analog signal
timeAnalog = 0:0.01:Tduration;
signal_analog = signal_func(timeAnalog);
plot_signal(timeAnalog, signal_analog,2,2,1,'b');
hold on
grid on;
title("Analog signal vs Reconstructed signal after filtering");
xlabel("Time");
ylabel("Amplitude");

% Call the 'sample_any_signal' function to sample the signal function.
[sampled_signal, time_samples] = sample_any_signal(signal_func, sampling_frequency, Tduration);

plot_signal(time_samples,sampled_signal,2,2,2,'b');

% % Adding gaussian noise to our signal
% sampled_signal = noisy_channel(sampled_signal,0,1);

% Plot signal with noise
subplot(2,2,3);
stem_signal(time_samples, sampled_signal,2,2,3);
grid on;
title("Sampled signal + gaussian noise");
xlabel("Time");
ylabel("Amplitude");

% Perform the Discrete Fourier Transform (DFT) on the sampled signal.
[k_vector, x_freqs] = dft(sampled_signal, sampling_frequency);

% Create a stem plot of the magnitude of the DFT.
subplot(2,2,4);
stem(x_freqs, abs(k_vector),'b', 'LineWidth', 1.5);
grid on;
title("Discrete Fourier Transform");
xlabel("Frecuency");
ylabel("Magnitude");

%Creating BIN calculation
bin_interpolated = bin_interpolate_frequency(k_vector,1.3,sampling_frequency);
magnitude = abs(bin_interpolated);
phase = angle(bin_interpolated);

%Disp BIN
output_string = sprintf('Magnitud: %.2f, Fase: %.2f radianes', magnitude, phase);
disp(output_string);

%Filtering signal with zeros
half_vector = floor(length(k_vector)/2);
k_vector(half_vector:end) = 0;
signal_time = idft(k_vector);

%Plot reconstructed signal
time_filtered = linspace(0,Tduration,length(signal_time));
subplot(2,2,1);
plot_signal(time_filtered, signal_time,2,2,1,'r');
legend('Corrupted signal', 'Filtered signal');
xlabel('Tiempo');
ylabel('Amplitud');

