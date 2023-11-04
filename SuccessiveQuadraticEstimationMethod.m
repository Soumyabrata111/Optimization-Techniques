% Successive Quadratic Estimation Method

a = 0.1; % Lower bound
b = 14; % Upper bound
dx = 1e-5; % Step size
fcp = 1e-8; % Convergence parameter for function evaluation

% Equation to be minimized
f = @(x) x^2 + 54/x;

x = linspace(a, b, 1000);

% Initialization
x1 = a;
x2 = x1 + dx;
f1 = f(x1);
f2 = f(x2);

if f1 > f2
    x3 = x1 + 2*dx;
elseif f1 <= f2
    x3 = x1 - dx;
end
f3 = f(x3);

% Determine minimum function value for the initial step
f_min = min([f1, f2, f3]);

% Determine x-value corresponding to minimum function value
if f_min == f1
    x_min = x1;
elseif f_min == f2
    x_min = x2;
elseif f_min == f3
    x_min = x3;
end

% Determine x_bar
a1 = (f2 - f1) / (x2 - x1);
a2 = (1 / (x3 - x2)) * (((f3 - f1) / (x3 - x1)) - ((f2 - f1) / (x2 - x1)));
x_bar = 0.5 * ((x1 + x2) - (a1 / a2));
f_bar = f(x_bar);

while abs(f_min - f_bar) > fcp
    x2 = (x_min + x_bar) / 2;
    x1 = x2 - dx;
    x3 = x1 + 2*dx;
    f1 = f(x1);
    f2 = f(x2);
    f3 = f(x3);
    f_min = min([f1, f2, f3]);
    if f_min == f1
        x_min = x1;
    elseif f_min == f2
        x_min = x2;
    elseif f_min == f3
        x_min = x3;
    end
    a1 = (f2 - f1) / (x2 - x1);
    a2 = (1 / (x3 - x2)) * (((f3 - f1) / (x3 - x1)) - ((f2 - f1) / (x2 - x1)));
    x_bar = 0.5 * ((x1 + x2) - (a1 / a2));
    f_bar = f(x_bar);
end

fprintf('The approximate minimum function value is %.8f, at %.8f\n', f_min, x_min);

% Plot the function
x_values = linspace(a, b, 1000);
y_values = arrayfun(f, x_values);

figure;
plot(x_values, y_values,'DisplayName', func2str (f));
xlabel('x', 'FontWeight', 'bold');
ylabel('f(x)', 'FontWeight', 'bold');
grid on;
title('Successive Quadratic Estimation Method', 'FontWeight', 'bold');
hold on;
scatter(x_min, f_min, 'red', 'filled', 'DisplayName', 'Approximate Minimum Point');
legend('Location', 'Best');
saveas(gcf, 'Successive_Quadratic_Estimation_Method.png');
