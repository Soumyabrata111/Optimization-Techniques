% Fibonacci Search Method
% Matlab version R2018b
% Date: 10th February, 2019 (started)
% Date: 2nd November, 2023 (updated)

clc
clear
a = 0.1; % Lower bound
b = 14; % Upper bound
n = 1000; % Number of times function is to be evaluated
b_p=b;
a_p=a;

% Function to be minimized
f = @(x) x.^2 + 54./x;

% Initialization
k = 2;
L = b - a; % Length of search space
L_ks = (F(n-k+1)/F(n+1)) * L;
x1 = a + L_ks;
x2 = b - L_ks;
f1 = f(x1);
f2 = f(x2);

while k <= n
    if f2 < f1
        a = x1;
    else
        b = x2;
    end
    L = b - a;
    L_ks = (F(n - k + 1) / F(n + 1)) * L; % Recalculate L_ks
    x1 = a + L_ks;
    x2 = b - L_ks;
    f1 = f(x1);
    f2 = f(x2);
    k = k + 1;
end

x_min = (x1 + x2) / 2;
f_min = f((x1 + x2) / 2);

fprintf('The approximate minimum point and the value respectively are: %f and %f\n', x_min, f_min);

% Plot the function
x_values = linspace(0, b_p, 1000); % Update here
y_values = f(x_values);
figure;
plot(x_values, y_values);
xlabel('x', 'fontweight', 'bold');
ylabel('f(x)', 'fontweight', 'bold');
grid on;
title('Fibonacci Search Method', 'fontweight', 'bold');
hold on;
scatter(x_min, f_min, 'red', 'filled');
legend(func2str(f), 'Approximate Minimum Point');

% Set x-axis ticks to be whole numbers
xticks(a_p:b_p);

% Adjust x-axis limits
ax = gca;
ax.XLim = [a_p b_p]; % Update here

saveas(gcf, 'Fibonacci_Search_Method.png', 'png');

% Function to generate n-th Fibonacci number
function result = F(n)
    fi = zeros(1, n+1);
    fi(1) = 0;
    fi(2) = 1;

    for i = 3:n+1
        fi(i) = fi(i-1) + fi(i-2);
    end

    result = fi(n+1);
end
