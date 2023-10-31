% Interval Halving Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2022a
% Date: 16th October, 2018
% Date: 31st October, 2023 (updated)
clc
clear
% Interval Halving Method

a = 0.1; % Lower bound
b = 14; % Upper bound
eps = 1e-5; % Desired accuracy

% Function to minimize
f = @(x) x.^2 + 54./x;

% Initialization
xm = (a + b) / 2; % Mid point
L = b - a; % Length of search space
x1 = a + L / 4; % Left intermediary point
x2 = b - L / 4; % Right intermediary point

f1 = f(x1);
f2 = f(x2);
fm = f(xm);
x_vals = linspace(a, b, 1000);
y_vals = f(x_vals);

while abs(L) > eps
    if f1 < fm
        b = xm;
        xm = x1;
    elseif f2 < fm
        a = xm;
        xm = x2;
    else
        a = x1;
        b = x2;
    end
    
    L = b - a;
    x1 = a + L / 4;
    x2 = b - L / 4;
    f1 = f(x1);
    f2 = f(x2);
    fm = f(xm);
end

fprintf('The minimum point lies between %.8f and %.8f\n', x1, x2);

% Plot the function
plot(x_vals, y_vals);
xlabel('x', 'FontWeight', 'bold');
ylabel('f(x)', 'FontWeight', 'bold');
grid on;
title('Interval Halving Method', 'FontWeight', 'bold');

hold on;
scatter(xm, fm, 100, 'red', 'filled', 'MarkerEdgeColor', 'black', 'LineWidth', 1.5, 'DisplayName', 'Approximate Minimum Point');
legend('show');
hold off;

saveas(gcf, 'Interval_Halving_Method.png', 'png');
