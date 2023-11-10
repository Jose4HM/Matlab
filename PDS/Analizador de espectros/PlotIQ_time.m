data = csvread("C:\Users\Nitro\Desktop\Universidad\samples911.csv");
time = 0:(length(data)-1);
subplot(2,1,1);
plot(time,data(:,1));
title("I in time domain");
xlabel("Time");
ylabel("I value");
    
subplot(2,1,2);
plot(time,data(:,2),"r");
title("Q in time domain");
xlabel("Time");
ylabel("Q value");
