clear;
clc;
rng(0);%Just for reproducibility
% Generate random signal x (preamble) and signal y (with preamble or noise)
length_x = 50;% Signal length x (you can adjust it)
length_y = 200; % Signal length y (you can adjust it)
x = rand(1, length_x);  % Random signal of length x
y = rand(1, length_y); % Random signal length y
index = randi(length_y - length_x + 1) % Generate a random index to insert x into y
y(index:index + length_x - 1) = x; % Insert the preamble of x into y in a random place

% Call function to find preamble
[start_index, end_index] = findPreambule(x, y);

% Check the result
if ischar(start_index)
    disp('The preamble was not found in the signal.');
else
    disp(['The preamble was found in the index ', num2str(start_index), ' to index signal: ', num2str(end_index)]);
    
    % Plot the y signal and highlight the preamble
    subplot(2, 1, 1);
    plot(1:length_x, x,'r');
    xlabel('Sample Index');
    ylabel('Amplitud');
    title('Signal X (preamble)');
    grid on;
    
    subplot(2, 1, 2);
    plot(1:length_y, y);
    xlabel('Sample Index');
    ylabel('Amplitud');
    title('Signal (with preamble)');
    hold on;
    grid on;
    if start_index >= 1 && end_index <= length_y
        plot(start_index:end_index, y(start_index:end_index), 'r', 'LineWidth', 2);
        % Show indices to the right of the graph without overlapping
        text(length_y + 5, y(start_index - 10), ['Start: ', num2str(start_index)], 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle', 'FontSize', 12, 'Color', 'r');
        text(length_y + 5, y(end_index + 10), ['End: ', num2str(end_index)], 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'FontSize', 12, 'Color', 'r');
    else
        disp('The preamble index is outside the limits of the y signal.');
    end
    legend("Signal","Preamble")
    hold off;
end
