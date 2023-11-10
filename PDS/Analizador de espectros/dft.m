% Computes the Discrete Fourier Transform (DFT) of a given signal
%using a nested loop-based approach
function [X,freq_hz] = dft(x,fs)
    N = length(x);  % Samples of the DFT
    X = zeros(1, N);  % Initialize vector k-th dft sample
    freq_resolution = fs/N;
    
    for k = 0:N-1
        X(k+1) = 0;
        for n = 0:N-1
            X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
        end
    end
    
%     freq_hz = (-fs/2:freq_resolution:fs/2-freq_resolution);
    freq_hz = (0:N-1) * freq_resolution;
%     freq_hz = -fs/2:fs/(N-1):fs/2;
end
