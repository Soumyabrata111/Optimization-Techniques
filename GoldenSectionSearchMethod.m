% Exhaustive Search Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2022b
% Date: 14th October, 2018
% Date: 27th October, 2023 (Updated)

clear all
clc
a = 0.1;  % Lower bound
b = 14 ;  % Upper bound
eps = 1e-8;  % Desired accuracy
gr = (1 + 5^0.5) / 2;  % Golden Ratio

f=@(x) x.^2+54./x;

x = linspace(a,b,1000);

% Initialization
x1 = a + (b - a) / gr;
x2 = b - (b - a) / gr;

while abs(b - a) > eps
    f1 = f(x1);
    f2 = f(x2);
    if f1 > f2
        b = x2;
        x2 = x1;
        x1 = a + (b - a) / gr;
    else
        a = x1;
        x1 = x2;
        x2 = b - (b - a) / gr;
    end
end
x_min = (a+b)/2;
f_min = f(x_min);
disp(['The approx minimum point is: ',num2str(x_min)])
disp(['The approx minimum function value is: ',num2str(f_min)])

% Plotting
plot(x,f(x),'LineWidth',2,'DisplayName',func2str(f));
xlabel('x',FontWeight='bold');
ylabel('f(x)','FontWeight','bold')
grid on;
title('Golden Section Search Method','FontWeight','bold');

hold on;

% Scatter plot for the minimum point
scatter(x_min, f_min, 100, 'red', 'filled', 'DisplayName', 'Minimum Point');

% Adding Legend
legend('Location','best')
legend('show')

% Save the figure as a PNG file
saveas(gcf, 'Golden Section Search Method.png');

% Display the plot
hold off;
