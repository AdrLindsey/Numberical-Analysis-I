import numpy

class LagrangeInterpolate:
    """
    This defines the interpolation object.  It contains two things:
    1.  A constructor which createst the barycentric weights vector
    2.  A function which returns an interpolated value when passed
        an x value at which to interpolate.  X is a scalar in this
        implementation.
    """

    # Constructor
    def __init__(self, xn, fn):
        """
        Constructor takes data points xn and fn, and
        creates weights vector.
        """
        self.N = len(xn)
        self.fn = fn
        self.xn = xn
        self.w = numpy.zeros(self.N)
        for j in range(self.N):
            tmp = 1.0
            for k in range(self.N):
                if (j != k):
                    tmp = tmp*(xn[j] - xn[k])
            self.w[j] = 1.0/tmp
        return

    # Interpolator
    def Interpolate(self, x):
        """
        This uses interpolation formula in Trefethen paper, eq. 4.2.
        """
        # If input lies exactly on an xn, return stored fn since if we 
        # try to do computation, it will return nan.
        idx = numpy.where(x == self.xn)[0]
        if (idx):
            return self.fn[idx]

        # Compute interpolated value 
        num = 0.0
        denom = 0.0
        for j in range(self.N):
            tmp = self.w[j]/(x - self.xn[j])
            num = num + tmp*self.fn[j]
            denom = denom + tmp
        return num/denom

