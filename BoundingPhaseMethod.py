#NOT WORKING

# Bounding Phase Method
a = 0.1  # Lower Bound
b = 14  # Upper Bound
n = 1000  # Number of desired partitions in the interval
dx = (b - a) / n  # Length of each such partition

# Initial value of x
x0 = a + 0.1 * (b - a)

# Function to be minimized
def f(x):
    return x**2 + 54/x

print(f"a {a},b {b}, x0 {x0}")

# Decide the value of dx
if f(x0-dx) >= f(x0) and f(x0) >= f(x0+dx):
    dx = abs(dx)
else:
    dx = -abs(dx)

k = 0
x_n = x0 + 2**k * dx
x_lb = x_n - dx
x_ub = x_n + dx

f_n = f(x_n)
f_lb = f(x_lb)
f_ub = f(x_ub)

while x_n >= a and x_n <= b:
    if f_n <= f_lb and f_n <= f_ub:
        x_min = x_n
        f_min = f_n
        break  # You found the minimum, so break out of the loop
    else:
        k = k + 1
        x_n = x0 + 2**k * dx
        x_lb = x_n - dx
        x_ub = x_n + dx
        f_n = f(x_n)
        f_lb = f(x_lb)
        f_ub = f(x_ub)
        print(f"x_n: {x_n}")

if 'x_min' in locals():
    print(f"The minimum value is at {x_min} and the minimum value is {f_min}")
else:
    print("No minimum found within the specified bounds.")
