function y = ForwardEuler(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using forward Euler integration.
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute

  global epsilon;

  % create vector y
  rows = length(y0);
  y = zeros(rows, N);
  t = 0;

  y(:,1) = y0;
  for n = 1:(N-1)
    y(:,n+1) = y(:,n) + h*f(y(:,n), t);
    t = t+h;
  end

end
