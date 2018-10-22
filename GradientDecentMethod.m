% Gradient (Steepest) DEcent Method as Explained in https://www.youtube.com/watch?v=x7YMV5xcMc8
% Matlab version R2018b
% Date: 22nd October, 2018
clc
clear
%% Taking thefunction as input from user
sc = inputdlg('Type an expression that is a function of x & y ' );    % Taking the equation as input from the user
s = sc{:};                                                            % Function String
f = str2func(['@(x,y) ' s])
x = input ('Enter the initial guess of x: ');
y = input ('Enter the initial guess of y: ');
a = input ('Enter the learning rate: ');
%% Starting the algorithm
for i=1:100000
    z = feval (f,x,y);
    x1 = x + .000001 * x;
    y1 = y + .000001 * y;
    zx = feval (f,x1,y);
    zy = feval(f,x,y1);
    del_fx = (zx-z)/(.000001*x); % The partial derivative w.r.t x at the chosen point of the user
    del_fy = (zy-z)/(.000001*y); % The partial derivative w.r.t y at the chosen point of the user
    x_new = x - a*del_fx;
    y_new = y - a*del_fy;
    x = x_new;
    y = y_new; 
end
fprintf('The minimum values of the variables x & y are respectively: %f & %f \n',x,y);
