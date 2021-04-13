function y = chebyshev_interpolation(f, x, N)
  % This fcn returns the value of the interpolation fcn fn
  % at x.  x may be a vector, it is assumed to lie in the 
  % domain -1 <= x <= 1.  The function performs an N order
  % Chebyshev interpolation.  Inputs:
  % f = function handle for fcn to interpolate.
  % x = vector of points at which to interpolate.
  % N = order of interpolation.
  %
  % Output:
  % y = value of interpolated fcn at each x.

  xi = chebyshev_nodes(N);
  fi = f(xi);

  plot(xi, fi, 'bx');
  legend('Sample points')
  hold on


  y = lagrange(xi, fi, x);
end
