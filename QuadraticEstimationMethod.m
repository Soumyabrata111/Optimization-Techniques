% Quadratic Estimation Method

clear all
clc

a = 1; % Lower bound
b = 5; % Upper bound
c=(a+b)/2; % Mid point of the search space

% Function to be minimized
f = @(x) 2*x.^2 + 16./x;

x_values=linspace(a,b,1000);
y_values=f(x_values);

a0=f(a);
a1=(f(b)-f(a))/(b-a);
a2=(1/(c-b))*(((f(c)-f(a))/(c-a))-((f(b)-f(a))/(b-a)));

% Approximate point for minimum function value
x_bar=(a+b)/2-(a1/(2*a2));

% Approximate minimum function value
f_bar=f(x_bar);

fprintf("The approximate minimum function value is %f, and it is located at %f",f_bar,x_bar)

% Plot the function
figure;
plot(x_values, y_values);
xlabel('x', 'fontweight', 'bold');
ylabel('f(x)', 'fontweight', 'bold');
grid on;
title('Quadratic Estimation Method', 'fontweight', 'bold');
hold on;
scatter(x_bar, f_bar, 'red', 'filled');
legend(func2str(f), 'Approximate Minimum Point');

% Set x-axis ticks to be whole numbers
xticks(a:b);

% Adjust x-axis limits
ax = gca;
ax.XLim = [a b]; % Update here

saveas(gcf, 'Quadratic_Estimation_Method.png', 'png');
