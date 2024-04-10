% Give it: one theta value and M as int to get a Mx1 vector.
function a_theta = thetavector(theta, M)
    % Director vector a(theta)
    a_theta = zeros(M,1);
    for m = 1:M
        a_theta(m,1)= exp(-1i *(m-1)* pi .* sind(theta));
    end
end
