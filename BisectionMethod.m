% Bisection Method 
% Matlab version R2018b
% Date: 27th October, 2018
clc
clear
%% Taking thefunction as input from user
sc = inputdlg('Type an expression that is a function of x ' );    % Taking the equation as input from the user
s = sc{:};                                                            % Function String
f = str2func(['@(x) ' s])
a = input ('Enter lower boundary point: ');
b = input ('Enter upper boundary point: : ');
% Compute f'(a) & f'(b)
a1 = a + .000001 * a;
f_dash_a = (feval(f,(a+a1))-(feval(f,(a-1))))/(2*a1);
b1 = b + .000001 * b;
f_dash_b = (feval(f,(b+b1))-(feval(f,(b-1))))/(2*b1);
for i = 1:10000
    if f_dash_a < 0 && f_dash_b > 0
        z = (a+b)/2;
        z1 = z + .000001 * z;
        f_dash_z = (feval(f,(z+z1))-(feval(f,(z-1))))/(2*z1);
        if f_dash_z < 0
            a=z;
        elseif f_dash_z > 0
            b = z;
        end
    end
end
c = a + (b-a)/2;
fprintf ('The minimum value lie between %f & %f & the mid-point is: %f \n',a,b,c)
        
