% Interval Halving Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2018b
% Date: 16th October, 2018
clc
clear
%% Taking input from user
a = input('What is the lower limit? ');
b = input('What is the upper limit? ');
epsilon = input('Please enter a small number: ');% A very small number to check whether the loop would be executed or not
c = max(a,b); % To set the axex limit
L = b-a; % Length of the interval
%% Taking thefunction as input from user
str = input('Give an equation in x: ','s'); % the user types in, for instance 2*x^2-3*x+4
f = inline(str,'x');
%% Loop 
while (abs (L) > epsilon)
    xm = (a+b)/2; %middle point of the interval
    ym = feval(f,xm);
    x1 = a+(L/4);
    x2 = b-(L/4);
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    if y1<ym
        b = xm;
        xm = x1;
        break
    elseif y2<ym
        a = xm;
        xm = x2;
        break
    else
        a = x1;
        b = x2;
    end
    L = b-a;
end
fprintf('The solution lies betwee %f & %f \n',a,b);
fplot (f,[a b], 'r')% Plotting the function
grid on
