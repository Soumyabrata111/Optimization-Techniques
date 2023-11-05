% Bisection Method 
% Matlab version R2018b and R2022a
% Date: 27th October, 2018
% Date: 5th November, 2023
clc 
clear
% Bisection Method

a = 0.1;  % Lower bound
b = 15;   % Upper bound
eps = 1e-3;  % Small number 

x_p = linspace(a, b, 1000);  % points for plotting the function

% Function to minimize
f = @(x) x.^2 + 54./x;

% Function to determine the value of 'dx'
dx = @(x) abs(x) > 0.01 .* 0.01 .* abs(x) + (abs(x) <= 0.01) .* 0.0001;

% Function to calculate first derivative of the function
fdx = @(x) (f(x + dx(x)) - f(x - dx(x))) ./ (2 .* dx(x));

x1 = a;  % Beginning of search space
x2 = b;  % End of search space
z = 0.5 .* (x1 + x2);  % Mid-point of the search space

% Initialization
fx1 = f(x1);
fx2 = f(x2);
fz = f(z);
fdz = fdx(z);

while abs(fdz) > eps
    if fdz < 0
        x1 = z;
    elseif fdz > 0
        x2 = z;
    end
    z = 0.5 .* (x1 + x2);
    fx1 = f(x1);
    fx2 = f(x2);
    fz = f(z);
    fdz = fdx(z);
end

fprintf('The approximate minimum point and the value respectively are: %f and %f\n', z, fz);

% Plot the function
figure;
plot(x_p, f(x_p), 'b', 'LineWidth', 1.5,'DisplayName', func2str (f));
xlabel('x', 'FontWeight', 'bold');
ylabel('f(x)', 'FontWeight', 'bold');
grid on;
title('Bisection Method', 'FontWeight', 'bold');
hold on;
scatter(z, fz, 50, 'red', 'filled', 'DisplayName', 'Approximate Minimum Point');
legend('Location', 'Best');
saveas(gcf, 'Bisection_Method.png', 'png');
