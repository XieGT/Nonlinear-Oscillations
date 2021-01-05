% MATLAB Script to simulate the behavior of Chua's Circuit:
%           dX/dt = c1*(Y - X - N(X)*X)
%           dY/dt = c2*(X + Z - Y)
%           dZ/dt = c3*Y
%
% This system is capable of producing various types of 
% nonlinear and chaotic behavior. The nonlinearity
% results from the nonlinear function 'N(x)' the exists
% within the circuit as a piecewise-linear resistance.
% The results of the simulation are plotted as a collection
% of times series as well as in a three-dimensional figure. 
% The effective nonlinear resistance is also obtained from
% the simulation and plotted.
%
%                  Program written for ENME665
%                      Andrew Dick, 2007

% Clear workspace, command window, and close figures
clear all;clc;close all;

% Simulation time parameter
t0=0;
dt=0.01;
T=100;

% System parameters
c1=15.6;
c2=1;
c3=25.58;
m0=-8/7;
m1=-5/7;

% Initial conditions
x0=0.1;
y0=0;
z0=0;

% Perform numerical simulation (w/ Simulink)
sim chua_circuit

% Three-dimensional plot of response
figure;set(gcf,'Color',[1,1,1]);
plot3(x,y,z);grid;
title('Three-Dimensional Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');

% Plot time series of three states
figure;set(gcf,'Color',[1,1,1]);
subplot(3,1,1);
plot(time,x);
title('Time Series');
ylabel('X');
subplot(3,1,2);
plot(time,y);
ylabel('Y');
subplot(3,1,3);
plot(time,z);
ylabel('Z');
xlabel('Time, sec');

% Plot effective nonlinear resistance
figure;set(gcf,'Color',[1,1,1]);
plot(x,g,'.');
grid;
title('Nonlinear Resistor Profile');
xlabel('Voltage');
ylabel('Current');