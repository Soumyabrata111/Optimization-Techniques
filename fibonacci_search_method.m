% Fibonacci Search Method
% Matlab version R2018b
% Date: 10th February, 2019 (started)
clc
clear
%% Taking thefunction as input from user
sc = inputdlg('Type an expression that is a function of x ' );    % Taking the equation as input from the user
s = sc{:};                                                            % Function String
f = str2func(['@(x) ' s])
a = input ('Enter lower boundary point: ');
b = input ('Enter upper boundary point: ');
n = input ('Enter the desired number of function evaluation (greater than 2): ');

%% Initiating required variables
k = 2;
L = b - a;
y1 = feval(f,(a));
y2 = feval(f,(b));
% %% Starting the algorithm
while k <= n
    x_1 = n-k+1;
    f_x_1 = fibonn(n-k+1);
    f_x_2 = fibonn(n+1);
    Lk_star = (f_x_1/f_x_2)* L
    x1 = a + Lk_star;
    x2 = b - Lk_star;
    if mod (k,2) == 0
        y1 = feval(f,(x1));
    else
        y2 = feval(f,(x2));
    end
    if y1 > y2
        a = x1;
    else
        b = x2;
    end
    c = 0.5*(a+b);
    k = k + 1;
end
a
b
fprintf ('The minimum value is: %f \n',c)

%% Fibonacci number function
function f_x = fibonn(x)
if x == 0
    f_x = 1;
elseif x == 1
    f_x = 1;
else
    a = 1;
    b = 1;
    for i = 2:x
        f_x = a + b;
        a = b;
        b = f_x;
    end
end
end


