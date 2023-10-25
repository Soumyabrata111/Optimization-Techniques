% Exhaustive Search Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2018b
% Date: 14th October, 2018
% Date: 25th October, 2023 (Updated)


clear all
clc
a=0.1; %Lower bound
b=14; % Upper bound
n = 1000; %Number of divisions
dx=(b-a)/n; %Length of each division

% Equation to be minimized
f=@(x) x.^2+54./x;

% Initialization
x1=a;
x2=x1+dx;
x3=x2+dx;
x_min=x2;
f_min=f(x_min);

while x3<=b
    if f(x2)<=f(x1) && f(x2)<=f(x3)
        disp(['The minimum point lies between: [' num2str(x1) ',' num2str(x3) ']'])
        disp(['The approx minimum point is: ' num2str(x2)])
        disp(['The approx minimum function value is: ' num2str(f(x2))])
        x_min=x2;
        f_min=f(x_min);
    end
x1=x2;
x2=x1+dx;
x3=x2+dx;

end


% Plotting
x = linspace(a,b,n);
plot(x,f(x),'LineWidth',2,'DisplayName',func2str(f));
xlabel('x',FontWeight='bold');
ylabel('f(x)','FontWeight','bold')
grid on;
title('Exhaustive Search Method','FontWeight','bold');

hold on;

% Scatter plot for the minimum point
scatter(x_min, f_min, 100, 'red', 'filled', 'DisplayName', 'Minimum Point');

% Adding Legend
legend('Location','best')
legend('show')

% Save the figure as a PNG file
saveas(gcf, 'Exhaustive_Search_Method.png');

% Display the plot
hold off;
