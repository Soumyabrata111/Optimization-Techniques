# Fibonacci Search Method

import matplotlib.pyplot as plt
import numpy as np

a=0.1 #Lower bound
b=14 #Upper bound
n = 2000 #Number of times function is to be evaluated

# Function to calculate n-th Fibonacci number
def F(n):
    fi = []
    fi.append(0)
    fi.append(1)

    for i in range(2, n+1):
        fi.append(fi[i-1] + fi[i-2])
    return fi[n]

# Function to be minimized
def f(x):
    return x**2+54/x

# Initialization
k=2
L=b-a # Length of search space
L_ks=(F(n-k+1)/F(n+1))*L
x1=a+L_ks
x2=b-L_ks
f1=f(x1)
f2=f(x2)
x=np.linspace(a,b,1000)

while k<=n:
    if f2<f1:
        a=x1
    else:
        b=x2
    L=b-a
    L_ks=(F(n-k+1)/F(n+1))*L
    x1=a+L_ks
    x2=b-L_ks
    f1=f(x1)
    f2=f(x2)
    k=k+1

x_min=(x1+x2)/2
f_min=f((x1+x2)/2)

print (f"The approximate minimum point and the value respectively are: {x_min} and {f_min}")

# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Fibonacci Search Method',fontweight='bold')
plt.scatter(x_min,f_min, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Fibonacci Search Method.png',dpi=300)
plt.show()