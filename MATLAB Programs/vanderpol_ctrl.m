% MATLAB Script to simulate and plot the behavior of the
% van der Pol oscillator:
%
%        d^2X/dt^2 = -X - epsilon*(X^2 - 1)*dX/dt
%
% The system is capable of producing nonlinear behavior
% for different values of the parameter 'epsilon'. The 
% response of the system to a set of initial conditions
% is simulated and plotted in a figure. It is then possible
% to select additional initial condition values and further
% study the behavior of the system
%
%                  Program Written for ENME665
%                        Andrew Dick, 2007

% Clear workspace, command window, and close figures
clear all;clc;%close all;

% Define system parameter 'epsilon' and 'N', the number of
% additional simulations to perform.
global epsilon;
epsilon=1.0;
N=5;

% Define time parameters for the simulation
t0=0;
dt=0.01;
T=20;
TSPAN=[t0:dt:T];

% Define initial conditions for first simulation
x0=1;
dx0=1;
Y0=[x0;dx0];

% Perform numerical simulation
[t,y]=ode45('vanderpol_ode',TSPAN,Y0);

% Plot simulated behavior of van der Pol oscillator
figure;set(gcf,'Color',[1,1,1]);
plot(y(:,1),y(:,2),x0,dx0,'+k');
title(['van der Pol Oscillator, \epsilon = ',num2str(epsilon)]);
xlabel('X Values')
ylabel('dX/dt Values');

% Simulate and plot responses to additional initial conditions
for n=1:N;
    [x0,dx0]=ginput(1);
    Y0=[x0;dx0];
    [t,y]=ode45('vanderpol_ode',TSPAN,Y0);
    figure(gcf);
    hold on;plot(y(:,1),y(:,2),x0,dx0,'+k');hold off;
end;