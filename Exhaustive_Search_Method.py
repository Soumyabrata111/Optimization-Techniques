import matplotlib.pyplot as plt
import numpy as np

a=0.1 #Lower bound
b=14 #Upper bound
n = 1000 #Number of divisions
dx=(b-a)/n #Length of each division

# Equation to be minimized
def f(x):
    return x**2+54/x

# Initialization
x1=a
x2=x1+dx
x3=x2+dx
x_min=x2
f_min =f(x_min)

while x3<=b:
    if f(x2)<=f(x1) and f(x2)<=f(x3):
        print('The minimum point lies between: ['+str(x1)+','+str(x3)+']')
        print('The approx minimum point is: '+str(x2))
        print('The approx minimum function value is: '+str(f(x2)))
        x_min=x2
        f_min=f(x_min)
       
    x1=x2
    x2=x1+dx
    x3=x2+dx

# Store the points to where the function is to be evaluated
x = np.linspace(a,b,n)

# Plot the function
plt.plot(x,f(x))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Exhaustive Search Method',fontweight='bold')
plt.scatter(x_min,f_min, color='red', label='Minimum Point')
plt.legend()
plt.savefig('Exhaustive Search Method.png',dpi=300)
plt.show()