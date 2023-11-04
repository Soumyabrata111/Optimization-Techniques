# Newton-Raphson Method

import numpy as np
import matplotlib.pyplot as plt

a = 0.1 # Lower bound
b = 15 # Upper bound

x_p = np.linspace(a,b,1000) # points for plotting the function

# Function to minimize
def f(x):
    return x**2+54/x

# Function to determine the value of 'dx'
def dx(x):
    if abs(x)>0.01:
        return 0.01*abs(x)
    else:
        return 0.0001
    
# Function to calculate first derivative of the function
def fdx(x):
    return ((f(x+dx(x))-f(x-dx(x)))/(2*dx(x)))

# Function to calculate second derivative of the function
def fddx(x):
    return ((f(x+dx(x))-2*f(x)+f(x-dx(x)))/((dx(x))**2))

# Initialization
x=a # Initial guess
eps=1e-5 # Small number to check convergency
k=1 # Counter
max_iterations = 1000  # Maximum number of iterations

xn = x-(fdx(x)/fddx(x))
fn = f(xn)

while fn>eps  and k <= max_iterations:
    k=k+1
    x = xn
    xn = x-(fdx(x)/fddx(x))
    fn = f(xn)
print (f"The approximate minimum point and the value respectively are: {xn} and {fn}")

# Plot the function
plt.plot(x_p,f(x_p))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Newton-Raphson Method',fontweight='bold')
plt.scatter(xn,fn, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Newton-Raphson Method.png',dpi=300)
plt.show()