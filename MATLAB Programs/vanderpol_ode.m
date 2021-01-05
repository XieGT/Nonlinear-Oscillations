% function dydt = vanderpol_ode(t,y)
%
% Differential equations for the van der Pol oscillator

function dydt=vanderpol_ode(t,y);

global epsilon;

dydt(1,1)=y(2);
dydt(2,1)=-y(1)-epsilon*(y(1)^2-1)*y(2);