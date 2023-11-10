function Ccorrelation = crossCorrelation(x, y)
    % Calculate the discrete cross-correlation between two signals x and y
    
    % Length of input signals
    N_x = length(x);
    N_y = length(y);  
    
    % Initializes the cross correlation result
    Ccorrelation = zeros(1, N_x + N_y - 1);
    
    % Perform cross correlation
    for k = -(N_y - 1):(N_x - 1)
        suma = 0;
        for n = max(1, 1 - k):min(N_x, N_x - k)
            suma = suma + x(n + k) * y(n);
        end
        Ccorrelation(k + N_y) = suma;
    end
end