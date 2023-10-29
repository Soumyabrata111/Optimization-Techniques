# Bounding Phase Method
a=0.1 # Lower Bound
b=14 # Upper Bound
n=1000 # Number of desired partitions in the interval
dx = (b-a)/n # Length of each such partition
accur=1e-5

# Initial value of x
x0 = a+0.1*dx

# Function to be minimized
def f(x):
    return x**2+54/x


# Fixing the sign of dx

if f(x0-dx)>=f(x0) and f(x0+dx)<=f(x0):
    dx=abs(dx)

elif f(x0)<=f(x0-dx) and f(x0)<=f(x0+dx):
    dx=-abs(dx)

print(f"dx = {dx}")

# Initialization
k=0 # Number to calculate new value of x
x_new=x0+2**k*x0
f_lb=f(x_new-dx)
f0=f(x0)
f_up=f(x_new+dx) 

while x0>=a and x0<=b:
