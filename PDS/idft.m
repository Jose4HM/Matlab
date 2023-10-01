function x = idft(k)
    % Calculate the length of the DFT coefficients
    N = length(k);
    
    % Initialize the output vector x
    x = zeros(1, N);
    
    % Calculate the IDFT using the inverse formula
    for n = 0:N-1
        for k_val = 0:N-1
            x(n+1) = x(n+1) + k(k_val+1) * exp(1j * 2 * pi * k_val * n / N);
        end
    end
    
    % Scale the result by 1/N
    x = x / N;
end
