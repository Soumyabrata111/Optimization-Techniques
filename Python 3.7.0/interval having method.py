# -*- coding: utf-8 -*-
"""
Created on Tue Jan  8 14:38:30 2019
@author: soumy
Interval Halving Method as described in the book 
'OPTIMIZATION FOR ENGINEERING DESIGN' by KALYANMOY DEB
"""
# To clear all the variables from last run
from IPython import get_ipython;   
get_ipython().magic('reset -sf')

# To run current calculations
# Declaration of variables
a = 1 # The lower limit
b = 5 # The upper limit
L = b - a
xm = (a+b)/2 # Middle point of search space
eps = 1e-10 # A small number to terminate the calculation

# Function to hold the equation
def equation(x):
    return x**2 + 54/x # Change the equation as per your need

ym = equation(xm)
x1 = a + (L/4)
x2 = b - (L/4)
y1 = equation(x1)
y2 = equation(x2)

while (abs(L)>eps):
    if (y1<ym):
        b = xm
        xm = x1
        break
    elif (y2<ym):
        a = xm
        xm = x2
        break
    else:
        a = x1
        b = x2
    L = b - a
    ym = equation(xm)
    x1 = a + (L/4)
    x2 = b - (L/4)
    y1 = equation(x1)
    y2 = equation(x2)
print ('The minimum point lies between ',x1,' & ',x2)
