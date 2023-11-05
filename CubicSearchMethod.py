# Cubic Search Method

import numpy as np
import matplotlib.pyplot as plt

a = 0.1  # Lower bound
b = 14  # Upper bound

# Function to minimize
def f(x):
    return x**2 + 54/x

# Function to calculate first derivative of the function
def fdx(x):
    dx = 1e-6  # Small value for differentiation
    return ((f(x+dx) - f(x-dx)) / (2*dx))

# Initialize
x0 = 1
dx = 0.06  # Step size
x_bar = 0
x_k = x0
k = 0
x_p=np.linspace(a,b,1000)

eps1 = 1e-3
eps2 = 1e-3

prev_f_bar = float('inf')

while True:
    fdx0 = fdx(x_k)
    if fdx0 < 0:
        dx = abs(dx)
    else:
        dx = -abs(dx)

    x_k1 = x_k + 2**k*dx

    fdx_k = fdx(x_k)
    fdx_k1 = fdx(x_k1)

    if (fdx_k * fdx_k1) > 0:
        x_k = x_k + 2**k*dx
    else:
        x1 = min(x_k, x_k1)
        x2 = max(x_k, x_k1)
        f1 = f(x1)
        f2 = f(x2)
        fd1 = fdx(x1)
        fd2 = fdx(x2)
        z = (3*(f1-f2)/(x2-x1)) + fd1 + fd2

        if x1 < x2:
            w = np.sqrt(z**2 - fd1*fd2)
        else:
            w = -np.sqrt(z**2 - fd1*fd2)

        mu = (fd2 + w - z) / (fd2 + fd1 + 2*w)

        if mu == 0:
            x_bar = x2
        elif 0 < mu <= 1:
            x_bar = x2 - mu * (x2 - x1)
        else:
            x_bar = x1

        f_bar = f(x_bar)
        f1 = f(x1)

        if f_bar > f1:
            x_bar = x_bar - (x_bar - x1) / 2
            x1 = x1 + 2**k*dx
            k = k + 1
            f_bar = f(x_bar)
            f1 = f(x1)
        else:
            fdx_bar = fdx(x_bar)
            fdx1 = fdx(x1)

            if abs(fdx_bar) <= eps1 and abs((x_bar - x1) / x_bar) <= eps2:
                if f_bar < prev_f_bar:  # Check if it's an improvement
                    best_x_bar = x_bar
                    best_f_bar = f_bar
                break

            if fdx_bar * fdx1 < 0:
                x2 = x_bar
                x1 = x_bar
                f1 = f(x1)
                f2 = f(x2)
                fd1 = fdx(x1)
                fd2 = fdx(x2)
                z = (3*(f1-f2)/(x2-x1)) + fd1 + fd2

                if x1 < x2:
                    w = np.sqrt(z**2 - fd1*fd2)
                else:
                    w = -np.sqrt(z**2 - fd1*fd2)

                mu = (fd2 + w - z) / (fd2 + fd1 + 2*w)

                if mu == 0:
                    x_bar = x2
                elif 0 < mu <= 1:
                    x_bar = x2 - mu * (x2 - x1)
                else:
                    x_bar = x1

        if f_bar < prev_f_bar:  # Check if it's an improvement
            best_x_bar = x_bar
            best_f_bar = f_bar

        if f_bar > prev_f_bar:  # If current f_bar is worse, stop
            break

        prev_f_bar = f_bar

    k += 1


print(f"The approximate minimum function value is {best_f_bar}, and it is located at {best_x_bar}")

# Plot the function
plt.plot(x_p,f(x_p))
plt.xlabel("x",fontweight='bold')
plt.ylabel("f(x)",fontweight='bold')
plt.grid(which='major',axis='both',linestyle='dashed')
plt.title('Cubic Search Method',fontweight='bold')
plt.scatter(x_bar,f_bar, color='red', label='Approximate Minimum Point')
plt.legend()
plt.savefig('Cubic Search Method.png',dpi=300)
plt.show()