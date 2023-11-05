% Cubic Search Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2018b, R2022a
% Date: 3rd November, 2018
% Date: 5th November, 2023 (updated)

clc
clear
a = 0.1;  % Lower bound
b = 14;   % Upper bound

% Function to minimize
f = @(x) x.^2 + 54./x;

% Function to calculate first derivative of the function
fdx = @(x) (f(x + 1e-6) - f(x - 1e-6)) / (2e-6);

% Initialize
x0 = 1;
dx = 0.06;  % Step size
x_bar = 0;
x_k = x0;
k = 0;
x_p = linspace(a, b, 1000);

eps1 = 1e-3;
eps2 = 1e-3;

prev_f_bar = inf;

while true
    fdx0 = fdx(x_k);
    if fdx0 < 0
        dx = abs(dx);
    else
        dx = -abs(dx);
    end

    x_k1 = x_k + 2^k * dx;

    fdx_k = fdx(x_k);
    fdx_k1 = fdx(x_k1);

    if (fdx_k * fdx_k1) > 0
        x_k = x_k + 2^k * dx;
    else
        x1 = min(x_k, x_k1);
        x2 = max(x_k, x_k1);
        f1 = f(x1);
        f2 = f(x2);
        fd1 = fdx(x1);
        fd2 = fdx(x2);
        z = (3*(f1-f2)/(x2-x1)) + fd1 + fd2;

        if x1 < x2
            w = sqrt(z^2 - fd1*fd2);
        else
            w = -sqrt(z^2 - fd1*fd2);
        end

        mu = (fd2 + w - z) / (fd2 + fd1 + 2*w);

        if mu == 0
            x_bar = x2;
        elseif 0 < mu && mu <= 1
            x_bar = x2 - mu * (x2 - x1);
        else
            x_bar = x1;
        end

        f_bar = f(x_bar);
        f1 = f(x1);

        if f_bar > f1
            x_bar = x_bar - (x_bar - x1) / 2;
            x1 = x1 + 2^k * dx;
            k = k + 1;
            f_bar = f(x_bar);
            f1 = f(x1);
        else
            fdx_bar = fdx(x_bar);
            fdx1 = fdx(x1);

            if abs(fdx_bar) <= eps1 && abs((x_bar - x1) / x_bar) <= eps2
                if f_bar < prev_f_bar  % Check if it's an improvement
                    best_x_bar = x_bar;
                    best_f_bar = f_bar;
                end
                break;
            end

            if fdx_bar * fdx1 < 0
                x2 = x_bar;
                x1 = x_bar;
                f1 = f(x1);
                f2 = f(x2);
                fd1 = fdx(x1);
                fd2 = fdx(x2);
                z = (3*(f1-f2)/(x2-x1)) + fd1 + fd2;

                if x1 < x2
                    w = sqrt(z^2 - fd1*fd2);
                else
                    w = -sqrt(z^2 - fd1*fd2);
                end

                mu = (fd2 + w - z) / (fd2 + fd1 + 2*w);

                if mu == 0
                    x_bar = x2;
                elseif 0 < mu && mu <= 1
                    x_bar = x2 - mu * (x2 - x1);
                else
                    x_bar = x1;
                end
            end
        end

        if f_bar < prev_f_bar  % Check if it's an improvement
            best_x_bar = x_bar;
            best_f_bar = f_bar;
        end

        if f_bar > prev_f_bar  % If current f_bar is worse, stop
            break;
        end

        prev_f_bar = f_bar;
    end

    k = k + 1;
end

fprintf('The approximate minimum function value is %.6f, and it is located at %.6f\n', best_f_bar, best_x_bar);

% Plot the function
x_p = linspace(a, b, 1000);
figure;
plot(x_p, f(x_p), 'LineWidth', 1.5,'DisplayName',func2str (f));
hold on;
xlabel('x', 'FontWeight', 'bold');
ylabel('f(x)', 'FontWeight', 'bold');
grid on;
title('Cubic Search Method', 'FontWeight', 'bold');
scatter(best_x_bar, best_f_bar, 100, 'r', 'filled', 'DisplayName', 'Approximate Minimum Point');
legend('Location', 'Best');
saveas(gcf, 'Cubic_Search_Method.png', 'png');
