% function dydt = lorenz_ode(t,y)
%
% Differential equations for the Lorenz system

function dydt=lorenz_ode(t,y);

global sigma rho beta;

dydt(1,1)=sigma*(y(2)-y(1));
dydt(2,1)=rho*y(1)-y(2)-y(1)*y(3);
dydt(3,1)=-beta*y(3)+y(1)*y(2);
