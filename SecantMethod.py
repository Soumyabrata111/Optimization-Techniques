# Secant Method

import numpy as np
import matplotlib.pyplot as plt

a = 0.1 # Lower bound
b = 15 # Upper bound
eps=1e-3 # Small number 

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

x1=a # Beginning of search space
x2=b # End of search space
z=x2-(fdx(x2))/((fdx(x2)-fdx(x1))/(x2-x1)) # Mid-point of the search space

# Initialization
fx1=f(x1)
fx2=f(x2)
fz=f(z)
fdz=fdx(z)

while abs(fdz)>eps:
    if fdz<0:
        x1=z
    elif fdz>0:
        x2=z
    z=z=x2-(fdx(x2))/((fdx(x2)-fdx(x1))/(x2-x1)) 
    fx1=f(x1)
    fx2=f(x2)
    fz=f(z)
    fdz=fdx(z)

print (f"The approximate minimum point and the value respectively are: {z} and {fz}")

# Plot the function
plt.plot(x_p,f(x_p))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Secant Method',fontweight='bold')
plt.scatter(z,fz, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Secant Method.png',dpi=300)
plt.show()