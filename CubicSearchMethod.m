% Cubic Search Method as Explained in the book 
%"Optimization of Engineering Design: Algorithms and Examples" by Prof. Kalyanmoy Deb
% Code developed by Sri. Soumyabrata Bhattacharjee
% Matlab version R2018b
% Date: 3rd November, 2018
clc
clear
%% Taking inputs from user
sc = inputdlg('Type an expression that is a function of x & y ' );    % Taking the equation as input from the user
s = sc{:};                                                            % Function String
f = str2func(['@(x,y) ' s])
x0 = input ('Enter the initial guess of x: ');
dlta = input ('Enter the initial step size: ');
eps_1 = input ('Enter the first termination parameter: ');
eps_2 = input ('Enter the second termination parameter: ');
%% Starting the different calculations related to the algorithm
% Compute f'(x0)
x10 = x0 + .000001 * x0;
f_dash_x0 = (feval(f,(x0+x10))-(feval(f,(x0-1))))/(2*x10);
if f_dash_x0 > 0
    dlta_f = -dlta; % Final value of delta
else
    dlta_f = dlta;
end
x_old = x0; % x_old would be updated to x_new as teh process progresses
k = 0; % k would be used for updating the value of x as the algorithm progresses
%% Putting the rest of the algorithm within nested for loop where i & j are counters
for j = 1:1000
    for i = 1:1000
        x_new = (x_old^k) + (2^k)*dlta_f;
        % Compute f'(x_old)
        x1_old = x_old + .000001 * x_old;
        f_dash_x_old = (feval(f,(x_old+x1_old))-(feval(f,(x_old-1))))/(2*x1_old);
        % Compute f'(x_new)
        x1_new = x_new + .000001 * x_new;
        f_dash_x_new = (feval(f,(x_new+x1_new))-(feval(f,(x_new-1))))/(2*x1_new);
        if (f_dash_x_new*f_dash_x_old) <= 0
            x1 = x_old;
            x2 = x_new;
            break
        else
            k = k + 1;
        end
    end
    %% Calculate x_bar
    f1 = feval (f,x1);
    f2 = feval (f,x2);
    % Compute f'(x1)
    x1_1 = x1 + .000001 * x1;
    f_dash_x1 = (feval(f,(x1+x1_1))-(feval(f,(x1-x1_1))))/(2*x1_1); 
    % Compute f'(x2)
    x1_2 = x2 + .000001 * x2;
    f_dash_x2 = (feval(f,(x2+x1_2))-(feval(f,(x2-x1_2))))/(2*x1_2);
    z = ((3*(f1-f2))/(x2-x1))+f_dash_x1+f_dash_x2;
    w = ((x2-x1)/(abs(x2-x1)))*(sqrt((z^2)-(f_dash_x1)*f_dash_x2));
    meu = (f_dash_x2+w-z)/(f_dash_x2-f_dash_x1+(2*w));
    if meu == 0
        x_bar = x2;
    elseif meu >= 0 && meu <= 1
        x_bar = x2 - meu * (x2 - x1);
    elseif meu > 1
        x_bar = x1;
    end
    f_x_bar = feval (f,x_bar);
    while (f_x_bar > f1)
        x_bar = x_bar - 0.5*(x_bar - x1);
        f_x_bar = feval (f,x_bar);
        f1 = feval (f,x1);
    end
    % Calculate f'(x_bar)  
    x1_bar = x_bar + .000001 * x_bar;
    f_dash_x_bar = (feval(f,(x_bar+x1_bar))-(feval(f,(x_bar-1))))/(2*x1_bar);
    % Compute f'(x1)
    x1_1 = x1 + .000001 * x1;
    f_dash_x1 = (feval(f,(x1+x1_1))-(feval(f,(x1-1))))/(2*x1_1);
    while (abs (f_dash_x_bar) > eps_1) && (abs((x_bar - x1)/(x_bar)) > eps_2)
        if (f_dash_x_bar*f_dash_x1) < 0
            x2 = x_bar;
        else
            x1 = x_bar;
        end
        f1 = feval (f,x1);
    f2 = feval (f,x2);
     % Compute f'(x1)
    x1_1 = x1 + .000001 * x1;
    f_dash_x1 = (feval(f,(x1+x1_1))-(feval(f,(x1-x1_1))))/(2*x1_1); 
    % Compute f'(x2)
    x1_2 = x2 + .000001 * x2;
    f_dash_x2 = (feval(f,(x2+x1_2))-(feval(f,(x2-x1_2))))/(2*x1_2);
    z = ((3*(f1-f2))/(x2-x1))+f_dash_x1+f_dash_x2;
    w = ((x2-x1)/(abs(x2-x1)))*(sqrt((z^2)-(f_dash_x1)*f_dash_x2));
    meu = (f_dash_x2+w-z)/(f_dash_x2-f_dash_x1+(2*w));
    if meu == 0
        x_bar = x2;
    elseif meu >= 0 && meu <= 1
        x_bar = x2 - meu * (x2 - x1);
    elseif meu > 1
        x_bar = x1;
    end
    f_x_bar = feval (f,x_bar);
    while (f_x_bar > f1)
        x_bar = x_bar - 0.5*(x_bar - x1);
        f_x_bar = feval (f,x_bar);
        f1 = feval (f,x1);
    end
    % Calculate f'(x_bar)
    x1_bar = x_bar + .000001 * x_bar;
    f_dash_x_bar = (feval(f,(x_bar+x1_bar))-(feval(f,(x_bar-1))))/(2*x1_bar);
    % Compute f'(x1)
    x1_1 = x1 + .000001 * x1;
    f_dash_x1 = (feval(f,(x1+x1_1))-(feval(f,(x1-1))))/(2*x1_1);
    end
    
end
xm = x1 + (x2 - x1)/2;
fprintf('The minimum value is approximately %f & it lies between %f & %f \n',xm,x1,x2);
    
    
    
    
    
    
    
    
    
