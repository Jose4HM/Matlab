% Define simulation parameters
M = 16; % number of subcarriers
L = 4; % length of spreading sequence
beta = 1; % spreading factor
Eb = 1; % energy per bit
N0 = 0.1; % noise power spectral density
numBits = 10000; % number of bits to transmit

% Generate random data bits
data = randi([0 1], M*numBits, 1);

% Generate spreading sequence
spreadingSeq = sign(randn(L,1));

% Reshape data into M subcarriers
dataMatrix = reshape(data, M, numBits);

% Spread data with spreading sequence
spreadData = beta * conv2(spreadingSeq, dataMatrix, 'same');

% Generate random channel coefficients
channelCoefs = sqrt(0.5) * (randn(L, M) + 1i*randn(L, M));

% Compute received signal
receivedSignal = sum(channelCoefs .* spreadData, 1);

% Add AWGN noise to received signal
noise = sqrt(N0/2) * (randn(1, numBits) + 1i*randn(1, numBits));
receivedSignal = receivedSignal + noise;

% Compute decision variable
decisionVar = real(receivedSignal);

% Compute bit error rate
numErrors = sum(data ~= (decisionVar > 0));
ber = numErrors / (M*numBits);

% Display results
fprintf('Bit error rate: %f\n', ber);