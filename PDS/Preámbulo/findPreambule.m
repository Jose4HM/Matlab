function [start_index, end_index] = findPreambule(x, y)
    % Calculate cross correlation
    correlation = conv(x, flip(y));
    
    % Find the indices where the correlation crosses a threshold
    threshold = max(correlation) * 0.9; 
    indices_cruce = find(correlation > threshold);
    % If no crossings were found above the threshold, returns "empty"
    if isempty(indices_cruce)
        start_index = 'empty';
        end_index = 'empty';
        return;
    end
    
    % Find the first and last crossover index
    start_index = indices_cruce(1);
    end_index = indices_cruce(end) + length(x) - 1;
end