% MATLAB Script to simulate the Rossler system:
%           dX/dt = -(Y + X)
%           dY/dt = X + a*Y
%           dZ/dt = Z*(X + c) + b
%
% The behavior of the system is simulated and time series are
% plotted as well as a three-dimensional figure. Additional
% a relationship between the peak values of the Z-value is 
% explored.
% 
%               Program written for ENME665
%                  Andrew Dick, 2007

% Clear workspace, command window, and close figures
clear all;clc;close all;

% Simulation time parameters
t0=0;
dt=0.01;
T=1000;

% System parameters
a=0.2;
b=0.2;
c=5.7;

% Initial conditions
x0=0.1;
y0=0;
z0=0;

% Perform numerical simulation (w/ Simulink)
sim rossler

% Three-dimensional plot of response
figure;set(gcf,'Color',[1,1,1]);
plot3(x,y,z);
title('Three-Dimensional Plot');
xlabel('X');ylabel('Y');zlabel('Z');

% Plot time series of three states
figure;set(gcf,'Color',[1,1,1]);
subplot(3,1,1);plot(time,x);
title('Time Series');ylabel('X');
subplot(3,1,2);plot(time,y);
ylabel('Y');
subplot(3,1,3);plot(time,z);
ylabel('Z');xlabel('Time, sec');

% Locate peaks of Z state
N=T/dt;m=1;
for n=1:N;if y(n,1)<0;if y(n+1,1)>0;idx(m,1)=n;m=m+1;end;end;end;
for n=1:(m-2);Z(n,1:2)=[z(idx(n)),z(idx(n+1))];end;
[Zz,ID]=sort(Z(:,1));
L=length(Z);
for n=1:L;ZZ(n,1:2)=Z(ID(n),1:2);end;

% Plot peaks of Z state vs the previous peak
figure;set(gcf,'Color',[1,1,1]);
plot(Z(:,1),Z(:,2),'.',ZZ(:,1),ZZ(:,2),'k');
ymax=max(max(Z));
axis([0 ymax 0 ymax]);
title('Poincare Map of Z at Y=0');
xlabel('Z_{peak}(n)');
ylabel('Z_{peak}(n+1)');