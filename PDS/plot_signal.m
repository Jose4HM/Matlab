%Send to this function data and time,  if data is real, it'll plot 2D, if
%it's complex, it'll plot 3D.
function plot_signal(data, time)
    if isreal(data)
        % Data is real, plot in 2D
        subplot(2,1,1);
        plot(time, data);
        title("Signal in the Time Domain (Real)");
        xlabel("Time");
        ylabel("Amplitude");
        grid on;
    else
        % Data is complex, plot in 3D
        subplot(2,1,1);
        plot3(time, real(data), imag(data));
        title("Signal in the Time Domain (Complex)");
        xlabel("Time");
        ylabel("Real Part");
        zlabel("Imaginary Part");
        grid on;
    end
end