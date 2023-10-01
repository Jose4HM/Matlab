% This MATLAB function, interpolate_frequency, performs frequency interpolation
% within the context of a Discrete Fourier Transform (DFT). It calculates the
% interpolated value for a non-integer frequency index in Hz using the DFT of
% the signal and the sampling frequency.
function interpolated_value = bin_interpolate_frequency(signal_dft, frequency_index, Fs)
    % signal_dft is the DFT of the signal (matrix of complex values)
    % frequency_index is the non-integer frequency index in Hz
    % Fs is the sampling frequency in Hz
    
    % Calculate the length of the signal's DFT
    N = length(signal_dft);
    
    % Calculate the base frequency (Hz) corresponding to one bin
    bin_frequency = Fs / N;
    
    % Calculate the frequency index in bins
    k_floor = floor(frequency_index / bin_frequency);
    
    % Calculate the fractional part of the frequency index in bins
    fractional_part = (frequency_index / bin_frequency) - k_floor;
    
    % Calculate the contributions of the two nearest bins
    bin1 = signal_dft(mod(k_floor, N) + 1);
    bin2 = signal_dft(mod(k_floor + 1, N) + 1);
    
    % Linear interpolation between the two bins
    interpolated_value = (1 - fractional_part) * bin1 + fractional_part * bin2;
end
