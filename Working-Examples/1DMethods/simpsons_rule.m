function y = simpsons_rule(f, a, b, n)
  % This function implements Simpson's rule.  Integration
  % is performed over n points on the interval a <= x < b

  h = (b-a)/n;     % Step size

  % Compute sample points.
  x0 = a;
  x2j   = (a+2*h):2*h:(b-h);
  x2jm1 = (a+h):2*h:(b-h);
  xn = b;
  
  % Compute partial sums.
  s0 = f(x0);
  s2j = 2*sum(f(x2j));
  s2jm1 = 4*sum(f(x2jm1));
  sn = f(xn);

  % Compute full sum.
  y = h*(s0 + s2j + s2jm1 + sn)/3;
end
