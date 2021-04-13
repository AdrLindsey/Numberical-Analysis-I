import numpy
import Barycentric
import matplotlib.pyplot as plt

#------------------------------------------------------
# Try interpolating quadratic fcn

# Create x data and corresponding y data.
N = 6
xdat = numpy.array(range(1, N+1))
ydat = xdat*xdat

# Create interpolation object
int1 = Barycentric.LagrangeInterpolate(xdat, ydat)

# Now use interpolation object to create values of y
x = numpy.linspace(0, N+1, 25)
y = map(int1.Interpolate, x)

# Plot x vs. y
line = plt.plot(x, y)

# Plot original points
plt.plot(xdat, ydat, 'ro')
plt.show()

#------------------------------------------------------
# Try interpolating sin
xn = numpy.linspace(0, 2*numpy.pi, 10)
fn = numpy.sin(xn)

int2 = Barycentric.LagrangeInterpolate(xn, fn)

x = numpy.linspace(-2.0, 2*numpy.pi+2.0, 100)
y_comp = map(int2.Interpolate, x)
y_true = map(numpy.sin, x)

# Plot computed interpolating polynomial
line = plt.plot(x, y_comp)

# Plot actual sin wave
plt.plot(x, y_true)

# Plot original points
plt.plot(xn, fn, 'ro')
plt.show()
