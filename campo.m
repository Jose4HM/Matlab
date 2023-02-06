function [ E, theta] = campo(R,beta,H)
%Funcion que determina el campo electrico de la antena
theta=0:0.1:2*pi;
E=(60/R)*(cos((beta*H)/2)-cos(beta*H*cos(theta) /2))./sin (theta);
end