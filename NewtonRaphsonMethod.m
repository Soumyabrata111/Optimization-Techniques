% Newton-Raphson Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2018b
% Date: 16th October, 2018
clc
clear
%% Taking thefunction as input from user
str = input('Give an equation in x: ','s'); % the user types in, for instance 2*x^2-3*x+4
f = inline(str,'x');
epsilon = input ('Enter a small number based on which the algorithm would be terminated: ');
%% Taking input from user
x1 = input('What is the initital guess? ');
%% Inititalization
k = 1; %Iteration counter
%% The algorithm related calculations starts
% Compute f'(x1)
if abs(x1)>0.01
    delta_x1 = 0.01*abs(x1);
else
    delta_x1 = 0.0001;
end
f_dash_x1 = (feval(f,(x1+delta_x1))-(feval(f,(x1-delta_x1))))/(2*delta_x1);
% Compute f''(x1)
f_doubledash_x1 = (feval(f,(x1+delta_x1))-(2*feval(f,x1))+(feval(f,(x1-delta_x1))))/(delta_x1^2);
% Calculate next x i.e. x2
x2 = x1 - f_dash_x1/f_doubledash_x1;
% Compute f'(x2)
if abs(x2)>0.01
    delta_x2 = 0.01*abs(x2);
else
    delta_x2 = 0.0001;
end
f_dash_x2 = (feval(f,(x2+delta_x2))-(feval(f,(x2-delta_x2))))/(2*delta_x2);
while abs(f_dash_x2)>epsilon
    x1 = x2;
    % Compute f'(x1)
    if abs(x1)>0.01
        delta_x1 = 0.01*abs(x1);
    else
        delta_x1 = 0.0001;
    end
    f_dash_x1 = (feval(f,(x1+delta_x1))-(feval(f,(x1-delta_x1))))/(2*delta_x1);
    % Compute f''(x1)
    f_doubledash_x1 = (feval(f,(x1+delta_x1))-(2*feval(f,x1))+(feval(f,(x1-delta_x1))))/(delta_x1^2);
    % Calculate next x i.e. x2
    x2 = x1 - f_dash_x1/f_doubledash_x1;
    % Compute f'(x2)
    if abs(x2)>0.01
        delta_x2 = 0.01*abs(x2);
    else
        delta_x2 = 0.0001;
    end
    f_dash_x2 = (feval(f,(x2+delta_x2))-(feval(f,(x2-delta_x2))))/(2*delta_x2);
    k = k+1;
end
fprintf('The solution lies at %f & it has been obtained after %f iterations \n',x2,k);


