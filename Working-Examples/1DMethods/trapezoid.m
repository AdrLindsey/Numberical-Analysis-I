function y = trapezoid(f, a, b, n)
  % This function implements the trapezoidal rule.  Integration
  % is performed over n points on the interval a <= x < b

  h = (b-a)/n;     % Step size
  x = a:h:b;   % Sample x values
  s = f(x);
  y = h*( s(1) + 2*sum( s(2:(end-1)) ) + s(end) )/2;
end
