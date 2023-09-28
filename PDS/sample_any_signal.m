% This MATLAB function, sample_any_signal, generates a sampled signal based on a provided function, sampling frequency, and duration, making it versatile for various signal sampling tasks.
function [sampled_signal, timeV] = sample_any_signal(signal_func, sampling_frequency, duration)
    % Calculate number of samples
    Tsampling = 1/sampling_frequency;

    % Generate vector time
    timeV = 0:Tsampling:duration;

    % Calculated la signal with given function
    sampled_signal = signal_func(timeV);
    % Our sample function is ready
end

