% MATLAB Script to plot the bifurcation diagram for the
% logistic map:
%        X(n+1) = a*X(n)*(1 - X(n))
%
% While simulating the system for various values of the
% parameter 'a' in order to produce the bifurcation
% diagram, the program also calculated the value of the
% Lypunov Exponent. This is done so that the values can
% be compared with the bifurcation diagram.
%
%               Program Written for ENME665
%                  Andrew Dick, 2007

% Clear workspace, command window, and close figures
clear all;clc;close all;

% Simulation parameters
N=1000;                 % Number of iterations
M=500;                  % Number of increments of 'a'
P=50;                   % Length of data set for analysis

% System parameters
a_start=2;              % Initial 'a' value
a_stop=4;               % Final 'a' value
y_start=0;              % Y-axis minimum
y_stop=1;               % Y-axis maximum

% Simulate the logistic map and calculate Lyapunov
% Exponents for multiple 'a' values
for m=1:M;
    a=a_start+(a_stop-a_start)/(M-1)*(m-1);
    x=zeros(N,1);
    x(1,1)=rand;
    for n=1:N;
        x(n+1,1)=a*x(n)*(1-x(n,1));
        if abs(a-2*a*x(n+1,1))~=0;
            lyp(n+1,1)=log(abs(a-2*a*x(n+1,1)));
        else;
            lyp(n+1,1)=log(1e-16);
        end;
    end;
    LYP(m,1)=mean(lyp(N-P+2:N+1,1));
    X(1:P,m)=x(N-P+2:N+1,1);
    A(1,m)=a;
end;

% Plot bifurcation diagram
figure;set(gcf,'Color',[1,1,1]);
plot(A,X,'k.');grid;
title('Bifurcation Diagram');
xlabel('Parameter a');
ylabel('State y');
xlim([a_start a_stop]);
ylim([y_start y_stop]);

% Plot Lyapunov Exponent
figure;set(gcf,'Color',[1,1,1]);
plot([a_start,a_stop],[0,0],'k',A,LYP,'r');grid;
ylim([-1 1]);xlim([a_start,a_stop]);
title('Lyapunov Exponent vs. Parameter');
xlabel('Parameter a');
ylabel('Exponent Value');
