# Successive Quadratic Estimation Method

import matplotlib.pyplot as plt
import numpy as np

a=0.1 #Lower bound
b=14 #Upper bound
dx=1e-5 # Step size
fcp=1e-8 # Convergence parameter for function evaluation

# Equation to be minimized
def f(x):
    # return 2*x**2+16/x
    return x**2+54/x

x=np.linspace(a,b,1000)

#Initialization

x1=a
x2=x1+dx
f1=f(x1)
f2=f(x2)

if f1>f2:
    x3=x1+2*dx    
elif f1<=f2:
    x3=x1-dx    
f3=f(x3)

# Detemine minimum function value for the initial step
f_min=min({f1,f2,f3})

# Determine x-value corresponding to minimum funtion value
if f_min==f1:
    x_min=x1
elif f_min==f2:
    x_min=x2
elif f_min==f3:
    x_min=x3

# Determine x_bar
a1=(f2-f1)/(x2-x1)

a2=(1/(x3-x2))*(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))
x_bar=0.5*((x1+x2)-(a1/a2))

f_bar=f(x_bar)

while abs(f_min-f_bar)>fcp:
    x2=(x_min+x_bar)/2
    x1=x2-dx
    x3=x1+2*dx
    f1=f(x1)
    f2=f(x2)
    f3=f(x3)
    f_min=min({f1,f2,f3})
    if f_min==f1:
        x_min=x1
    elif f_min==f2:
        x_min=x2
    elif f_min==f3:
        x_min=x3
        a1=(f2-f1)/(x2-x1)
        a2=(1/(x3-x2))*(((f3-f1)/(x3-x1))-((f2-f1)/(x2-x1)))
        x_bar=0.5*((x1+x2)-(a1/a2))
        f_bar=f(x_bar)

print(f'The approximate minimum function value is {f_min}, at {x_min}')

# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Exhaustive Search Method',fontweight='bold')
plt.scatter(x_min,f_min, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Successive Quadratic Estimation Method.png',dpi=300)
plt.show()
