% MATLAB Script to simulate and plot the behavior of the
% Lorenz system:
%               dX/dt = sigma*(Y - X)
%               dY/dt = rho*X - Y - X*Z 
%               dZ/dt = - beta*Z + X*Y 
%
% The system is capable of producing various types of
% nonlinear behavior for different values of the parameters
% 'sigma', 'rho', and 'beta'. The results are plotted in
% a three-dimensional figure.
%
%                 Program written for ENME665
%                  Andrew Dick, 2007

% Clear workspace, command window, and close figures
clear all;clc;close all;

% Define values of 'sigma', rho', and 'beta'
global sigma rho beta
sigma = 10;
rho   = 28;
beta  = 8/3;

% Define time parameters for simulation
t0=0;
dt=0.001;
T=100;
TSPAN=[t0:dt:T];

% Define initial conditions
x0=0.1;
y0=0.1;
z0=0.1;
Y0=[x0,y0,z0];

% Perform numerical simulation
[time,y]=ode45('lorenz_ode',TSPAN,Y0);
N=length(y);
N1=floor(0.7*N);

% Plot results of simulation, after a length of time to allow
% for the decay of transient behavior.
figure;set(gcf,'Color',[1,1,1]);
plot3(y(N1:N,1),y(N1:N,2),y(N1:N,3));
grid;
title(['Lorenz System at \beta = ',num2str(beta),...
    ', \rho = ',num2str(rho),', & \sigma = ',num2str(sigma)]);
xlabel('X');
ylabel('Y');
zlabel('Z');
