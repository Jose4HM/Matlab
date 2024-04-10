clc 
clear
close all
D = 4;% Wireless signals
M  = 14;%Number of receiver's antennas
theta = 180 * (pi * rand(1, D) - pi/2) / pi; %Random angles (degres)
% theta = pi * rand(1, D) - pi/2; %Random angles (rad)
T = 1000; %Samples
disp("Angles of arrival random:")
theta_length = length(theta);
freq= 2.4e9;
lambda = 3e8/freq;
d   = lambda/2; %Receiver's antennas spacing d=lambda/2
SNR = 50; %(dB)
A = zeros(M,theta_length);
for k=1:theta_length
    A(:,k) = exp(-1j*2*pi*d*sind(theta(k))*(0:M-1)'/lambda); %Deg
    % A(:,k) = exp(-1j*pi*d*sin(theta(k))*(0:M-1)'/lambda); %Rad
end
s = (randn(theta_length,T) + 1j*randn(theta_length,T));
X = A*s;
X = awgn(X,SNR,'measured');
disp(sort(theta))
%% MUSIC
Rx = cov(X');%covarivance matrix
[eigenVec,eigenVal] = eig(Rx);%Find the eigenvalues and eigenvectors of Rx 
Eigen_vector = eigenVec(:,1:M-theta_length);
theta = -90:0.05:90; %Deg
% theta_2 = -pi:0.05:pi; %Rad
P = zeros(1,length(theta));
for i=1:length(theta)
    % thetaVector = zeros(M,1); 
    thetaVector = exp(-1j*2*pi*d*(0:M-1)'*sind(theta(i))/lambda); %Deg
    % thetaVector = exp(-1j*pi*d*(0:M-1)'*sin(theta_2(i))/lambda); %Rad
    Rxx = thetaVector'*(Eigen_vector*Eigen_vector')*thetaVector;
    P(i) = 1/ Rxx;
end
P = pow2db(real(P));
%% Plotting
%Get max points
[pks,locs] = findpeaks(P,theta,'SortStr','descend','Annotate','extents');
MUSIC_Estim_max = sort(locs(1:theta_length));
disp("Angles of arrival:")
disp(MUSIC_Estim_max)

% Plot-max point
plot(theta,P,'-b',locs(1:theta_length),pks(1:theta_length)+0.15,'rv');
hold on
xlabel('Angle \theta (deg)');
ylabel('P (dB)')
title(sprintf('Spatial spectrum at %d Hz', freq))
xlim([min(theta) max(theta)])
grid on
% just deg:  
text(locs(1:theta_length)+2*sign(locs(1:theta_length))-5, ...
    pks(1:theta_length)+0.4,num2str(locs(1:theta_length)'))