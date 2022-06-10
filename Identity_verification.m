%%%%%%%%%%%%%%
%%% Note %%%%%
%%%%%%%%%%%%%%
% Indentity Verification
%%%%%%%%%%%%%%
clear
clc
%% Variables
syms  q        
syms  p      
syms  x0       
syms  x [1 3]  
syms  c [1 3]  
syms  y [1 3]  

%% Substitution $c(3)$ by definition
c(3) = x(1) - y(2) + 1/(q+1)*(x0 - x(1)) - x(3);

%% Constraints
lip_constraints = -q*(q+1)/(2*p)     *   (p*(x(2) - x(3))^2 - (y(2) - y(3))^2);
mon_constraints = -q*(q+1)         *   (y(3) - y(1))*(x(3) - x(1));
constraints_3   = -q*(q+1)         *   (x(1) - y(1) - x(2)+ 1/(q+1)*(x0 - x(1)))*(x(2) - x(3));
constraints_4   = -q*(q+1)         *   c(3)*(x(3) - x(1));
constraints_5   = -q*(q+1)         *   c(1)*(x(1) - x(2));

%% LHS
LHS =        q*(q+1)/2    * (y(1) + c(1))^2 + q     * (y(1) + c(1))*(x(1) - x0);
LHS = LHS -(q+1)*(q+2)/2  * (y(3) + c(3))^2 - (q+1) * (y(3) + c(3))*(x(3) - x0);
LHS = LHS + lip_constraints;
LHS = LHS + mon_constraints;
LHS = LHS + constraints_3;
LHS = LHS + constraints_4;
LHS = LHS + constraints_5;

%% RHS
RHS = q*(q+1)/2*(x(2) - x(1) + y(1) + c(1) + 1/(q+1)*(x(1) - x0))^2;
RHS = RHS + (1-p)*q*(q+1)/(2*p)*(y(2) - y(3))^2;
RHS = RHS + (q+1)*(y(2) - y(3))*(y(3)+c(3)); 

%% identity 1
display(simplify(LHS - RHS)) % ans = 0 means LHS == RHS