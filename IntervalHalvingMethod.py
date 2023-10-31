# Interval Halving Method
a = 0.1 # Lower bound
b = 14 # Upper bound
eps = 1e-5 # Desired accuracy

# Function to minimize
def f(x):
    return x**2+54/x

# Initialization
x_m=(a+b)/2 # Mid point
L=b-a # Length of search space
x1=a+L/4 # Left intermediary point 
x2=b-L/4 # Right intermediary point
