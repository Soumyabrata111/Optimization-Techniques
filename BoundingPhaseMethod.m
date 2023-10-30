% Bounding Phase Method as Explained in the book 
%"ENGINEERING OPTIMIZATION Methods and Applications" SECOND EDITION by A. Ravindran, K. M. Ragsdell and G. V. Reklaitis
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2022a
% Date: 15th October, 2018
% Date: 30th October, 2023 (updated)

clc
clear all
% Bounding Phase Method

a = 0.1;  % Lower bound
b = 14;   % Upper bound
dx = 1e-5; % Step-size parameter

% Function to be minimized
f = @(x) x.^2 + 54./x;

% Initialization
x_mid = a + dx*(b-a); % Initial guess
x_lb = x_mid - dx; % Current lower bound
x_ub = x_mid + dx; % Current upper bound
f_mid = f(x_mid);
f_lb = f(x_lb);
f_ub = f(x_ub);
k = 0; % Value will be iterated
x = linspace(a, b, 1000);

% Check whether the function is unimodal
while x_ub <= b && x_lb >= a
    if f_mid >= f_lb && f_mid >= f_ub
        disp([f_lb, f_mid, f_ub]);
        disp('The function is not unimodal');
    elseif f_lb >= f_mid && f_mid >= f_ub
        dx = abs(dx);
        disp(['dx: ', num2str(dx)]);
    else
        dx = -abs(dx);
        disp(['dx: ', num2str(dx)]);
    end
    k = k + 1;
    x_mid_new = x_mid + 2^k*dx;
    f_mid_new = f(x_mid_new);
    if f_mid_new > f_mid
        break;
    end
    x_mid = x_mid_new;
    x_lb = x_mid - dx;
    x_ub = x_mid + dx;
    f_mid = f_mid_new;
    f_lb = f(x_lb);
    f_ub = f(x_ub);
    disp(['k=', num2str(k), ',x_mid=', num2str(x_mid), ',x_lb=', num2str(x_lb), ',x_ub=', num2str(x_ub)]);
    disp(['The approximate minimum point and the value respectively are: ', num2str(x_mid), ' and ', num2str(f_mid)]);
end

% Plot the function
x_values = linspace(a, b, 1000);
f_values = f(x_values);

figure;
plot(x_values, f_values,'DisplayName', func2str(f));
xlabel('x', 'FontWeight', 'bold');
ylabel('f(x)', 'FontWeight', 'bold');
grid on;
title('Bounding Phase Method', 'FontWeight', 'bold');
hold on;
scatter(x_mid, f_mid, 100, 'red', 'filled', 'DisplayName', 'Minimum Point');
legend('show');
saveas(gcf, 'Bounding_Phase_Method.png');
