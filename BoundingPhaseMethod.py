#NOT WORKING

# Bounding Phase Method
a = 0.1  # Lower Bound
b = 14  # Upper Bound
n = 1000  # Number of desired partitions in the interval
dx = (b - a) / n  # Length of each such partition
accur = 1e-5

# Initial value of x
x0 = a + 0.1 * dx

# Function to be minimized
def f(x):
    return x**2 + 54/x

# Fixing the sign of dx
if f(x0 - dx) >= f(x0) and f(x0 + dx) <= f(x0):
    dx = abs(dx)
elif f(x0) <= f(x0 - dx) and f(x0) <= f(x0 + dx):
    dx = -abs(dx)

print(f"dx = {dx}")

# Initialization
k = 0  # Number to calculate new value of x
x_new = x0 + 2**k * dx
f_lb = f(x_new - dx)
f0 = f(x_new)
f_up = f(x_new + dx)

x_min = None  # Initialize x_min

while x_new >= a and x_new <= b:
    if f0 <= f_lb and f0 <= f_up:
        x_min = x_new
        f_min = f(x_min)
        break  # You found the minimum, so break out of the loop
    else:
        k = k + 1
        x_new = x_new + 2**k * dx  # Update x_new using the correct value
        f_lb = f(x_new - dx)
        f0 = f(x_new)
        f_up = f(x_new + dx)
        print(f"New value of x is {x_new}")

if x_min is not None:
    print(f"The minimum value is at {x_min} and the minimum value is {f_min}")
else:
    print("No minimum found within the specified bounds.")
