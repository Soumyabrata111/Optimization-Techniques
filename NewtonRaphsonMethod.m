% Newton-Raphson Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2022a
% Date: 16th October, 2018
% Date: 4th November, 2023
clc
clear
% Newton-Raphson Method

a = 0.1; % Lower bound
b = 15; % Upper bound

x_p = linspace(a, b, 1000); % points for plotting the function

% Function to minimize
f = @(x) x^2 + 54/x;

% Function to determine the value of 'dx'
dx = @(x) 0.01 * abs(x);
dx = @(x) max(dx(x), 0.0001);

% Function to calculate first derivative of the function
fdx = @(x) (f(x + dx(x)) - f(x - dx(x))) / (2 * dx(x));

% Function to calculate second derivative of the function
fddx = @(x) (f(x + dx(x)) - 2 * f(x) + f(x - dx(x))) / (dx(x)^2);

% Initialization
x = a; % Initial guess
eps = 1e-5; % Small number to check convergency
max_iterations = 1000; % Maximum number of iterations

xn = x - (fdx(x) / fddx(x));
fn = f(xn);

k = 1; % Counter

while fn > eps && k <= max_iterations
    k = k + 1;
    x = xn;
    xn = x - (fdx(x) / fddx(x));
    fn = f(xn);
end

fprintf('The approximate minimum point and the value respectively are: %.4f and %.4f\n', xn, fn);

% Plot the function
figure;
plot(x_p, arrayfun(f, x_p),'DisplayName', func2str (f));
xlabel('x', 'FontWeight', 'bold');
ylabel('f(x)', 'FontWeight', 'bold');
grid on;
title('Newton-Raphson Method', 'FontWeight', 'bold');
hold on;
scatter(xn, fn, 'r', 'filled', 'DisplayName', 'Approximate Minimum Point');
legend('Location', 'Best');
saveas(gcf, 'NewtonRaphsonMethod.png', 'png');
