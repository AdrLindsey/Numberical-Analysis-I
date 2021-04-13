function y = ForwardEuler(y0, N)
  % This function solves the differential equation
  % y' = f(y,t) using forward Euler integration.
  % It takes as inputs:
  % y0 = initial value of y
  % N = Number of points to compute

  global lambda;
  global alpha;
  global omega;
  global h;

  % create vector y
  y = zeros(1, N);
  t = 0;

  y(1) = y0;
  for n = 1:(N-1)
    y(n+1) = y(n) + h*f(y(n), t);
    t = t+h;
  end

end
