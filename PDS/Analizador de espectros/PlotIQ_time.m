clc; clear;
data = readmatrix("D:\Archivos de programas\bladeRF\samples_received.csv");
time = 0:(length(data)-1);
figure(1)
grid on;
plot(time,data(:,1),'b');
title("I in time domain");
xlabel("Time");
ylabel("I value");
hold on
plot(time,data(:,2),"r");
title("Q in time domain");
xlabel("Time");
ylabel("Q value");
legend("I","Q")
%% Constelation
figure(2)
scatter(data(:,1),data(:,2),'filled')
title('Constelation Diagram');
xlabel('I');
ylabel('Q');
