function [y0, b] = lstsq(x, y)
  % this fcn uses the least squares error approach to
  % compute a linear fit to the data [x, y].  The approach
  % forms the linear system Au = f and then solves it.

  N = length(x);

  % Create A matrix
  A = zeros(2,2);
  A(1,1) = N;
  A(2,1) = sum(x);
  A(1,2) = A(2,1);
  A(2,2) = sum(x.*x);

  % Create f vector
  f = zeros(2, 1);
  f(1,1) = sum(y);
  f(2,1) = sum(y.*x);

  u = A\f;
  y0 = u(1);
  b = u(2);
end

