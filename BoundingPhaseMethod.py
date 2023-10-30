# Bounding Phase Method

import matplotlib.pyplot as plt
import numpy as np
a = 0.1  # Lower bound
b = 14   # Upper bound
dx=1e-5 # Step-size parameter

# Function to be minimized
def f(x):
    return x ** 2 + 54 / x

# Initialization
x_mid=a+dx*(b-a) # Initial guess
x_lb=x_mid-dx # Current lower bound
x_ub=x_mid+dx # Current upper bound
f_mid = f(x_mid)
f_lb=f(x_lb)
f_ub=f(x_ub)
k=0 # Value will be iterated
x = np.linspace(a,b,1000)

# Check whether the function is unimodal

while x_ub<=b and x_lb >=a:
    if f_mid>=f_lb and f_mid>=f_ub:
        print(f_lb,f_mid,f_ub)
        print("The function is not unimodal")
    elif f_lb>=f_mid and f_mid>=f_ub:
        dx=abs(dx)
        print(f"dx: {dx}")
    else:
        dx=-abs(dx)
        print(f"dx: {dx}")
    k=k+1
    x_mid_new = x_mid + 2**k*dx
    f_mid_new = f(x_mid_new)
    if f_mid_new > f_mid:
        break
    x_mid = x_mid_new
    x_lb=x_mid-dx
    x_ub=x_mid+dx
    f_mid = f_mid_new
    f_lb=f(x_lb)
    f_ub=f(x_ub)
    print(f"k={k},x_mid={x_mid},x_lb={x_lb},x_ub={x_ub}")
    print (f"The approximate minimum point and the value respectively are: {x_mid} and {f_mid}")

# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Bounding Phase Method',fontweight='bold')
plt.scatter(x_mid,f_mid, color='red', label='Minimum Point')
plt.legend()
plt.savefig('Bounding Phase Method.png',dpi=300)
plt.show()
