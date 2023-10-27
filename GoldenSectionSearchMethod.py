# Golden Section Search Method

import matplotlib.pyplot as plt
import numpy as np
a = 0.1  # Lower bound
b = 14   # Upper bound
eps = 1e-8  # Desired accuracy
gr = (1 + 5 ** 0.5) / 2  # Golden Ratio

def f(x):
    return x ** 2 + 54 / x

x = np.linspace(a,b,1000)

# Initialization
x1 = a + (b - a) / gr
x2 = b - (b - a) / gr

while abs(b - a) > eps:
    f1 = f(x1)
    f2 = f(x2)
    if f1 > f2:
        b = x2
        x2 = x1
        x1 = a + (b - a) / gr
    else:
        a = x1
        x1 = x2
        x2 = b - (b - a) / gr
x_min = (a+b)/2
f_min = f(x_min)
print (f"The approximate minimum point and the value respectively are: {x_min} and {f_min}")


# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Golden Section Search Method',fontweight='bold')
plt.scatter(x_min,f_min, color='red', label='Minimum Point')
plt.legend()
plt.savefig('Golden Section Search Method.png',dpi=300)
plt.show()
