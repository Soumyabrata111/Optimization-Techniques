# Quadratic Estimation Method

import matplotlib.pyplot as plt
import numpy as np

a=1 #Lower bound
b=5 #Upper bound
c=(a+b)/2 # Mid point of the search space

# Equation to be minimized
def f(x):
    return 2*x**2+16/x

x=np.linspace(a,b,1000)

a0=f(a)
a1=(f(b)-f(a))/(b-a)
a2=(1/(c-b))*(((f(c)-f(a))/(c-a))-((f(b)-f(a))/(b-a)))

# Approximate point for minimum function value
x_bar=(a+b)/2-(a1/(2*a2))

# Approximate minimum function value
f_bar=f(x_bar)

print(f"The approximate minimum function value is {f_bar}, and it is located at {x_bar}")

# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Exhaustive Search Method',fontweight='bold')
plt.scatter(x_bar,f_bar, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Quadratic Estimation Method.png',dpi=300)
plt.show()