# Interval Halving Method

import matplotlib.pyplot as plt
import numpy as np
a = 0.1 # Lower bound
b = 14 # Upper bound
eps = 1e-5 # Desired accuracy

# Function to minimize
def f(x):
    return x**2+54/x

# Initialization
xm = (a+b)/2 # Mid point
L = b - a # Length of search space
x1 = a + L/4 # Left intermediary point 
x2 = b - L/4 # Right intermediary point

f1 = f(x1)
f2 = f(x2)
fm = f(xm)
x = np.linspace(a,b,1000)


while abs(L)>eps:
    if f1<fm:
        b=xm
        xm=x1
    elif f2<fm:
        a=xm
        xm=x2
    else:
        a=x1
        b=x2
    L=b-a
    x1=a+L/4
    x2=b-L/4
    f1 = f(x1)
    f2 = f(x2)
    fm = f(xm)

print (f"The minimum point lies between {x1} and {x2}")

# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Interval Halving Method',fontweight='bold')
plt.scatter(xm,fm, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Interval Halving Method.png',dpi=300)
plt.show()