# -*- coding: utf-8 -*-
"""
Created on Sat Jan  5 21:19:12 2019

@author: soumy
Exhaustive Search Method as described in the book 
'OPTIMIZATION FOR ENGINEERING DESIGN' by KALYANMOY DEB
"""
# To clear all the variables from last run
from IPython import get_ipython;   
get_ipython().magic('reset -sf')

# To run current calculations
# Declaration of variables
a = .001 # The lower limit
b = 5 # The upper limit
n = 10000 # The number of intermediate points in the range

# Step 1
x1 = a
dx = (b-a)/n # The increment in x
x2 = x1 + dx
x3 = x2 + dx

# Function to hold the equation
def equation(x):
    return x**2 + 54/x # Change the equation as per your need

# Step 2
while (x3 <= b):
    y1 = equation(x1)
    y2 = equation(x2)
    y3 = equation(x3)
    if y1>=y2 and y2<=y3:
         print ('The minimum point lies between ',x1,' & ',x3)
         break
    else:
        x1 = x2
        x2 = x3
        x3 = x2 + dx
