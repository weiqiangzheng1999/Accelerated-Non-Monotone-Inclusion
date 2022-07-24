clear
clc

%% variables
syms q;
syms r;      
syms p;     
syms  x0
syms  x [1 3]
syms  u [1 3]
syms  y [1 3]     

%% substitute u(1) and u(3) by definitions
u(1) = (x(1) + 1/(q+1)*(x0 - x(1)) - q/(q+1)*(1 + 2*r)*y(1) - x(2))/((q/(q+1))*(1 + 2*r));
u(3) = x(1) + 1/(q+1)*(x0 - x(1)) - y(2) - 2*r*q/(q+1)*(y(1)+u(1)) - x(3); 

%% LHS
LHS = (q^2/2*(1+2*r) - r*q)*(y(1)+u(1))^2 + q*(y(1)+u(1))*(x(1) - x0);
LHS = LHS - ((q+1)^2/2*(1+2*r) - r*(q+1))*(y(3)+u(3))^2 - (q+1)*(y(3)+u(3))*(x(3) - x0);
LHS = LHS - (q+1)^2/2*(p*(x(2) - x(3))^2 - (y(2) - y(3))^2);  
LHS = LHS - q*(q+1)*((y(3)+u(3)-y(1)-u(1))*(x(3) - x(1))-r*(y(1)+u(1) - y(3) - u(3))^2); 

%% RHS
RHS = (1-p)*(q + 1)^2/2*(x(2) - x(3))^2;

%% identity 2
display(simplify(LHS-RHS))