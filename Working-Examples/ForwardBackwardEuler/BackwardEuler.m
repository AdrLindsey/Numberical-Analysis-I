function y = BackwardEuler(y0, N)
  % This function solves the differential equation
  % y' = f(y,t) using backward Euler integration.
  % It takes as inputs:
  % y0 = initial value of y
  % N = Number of points to compute
  % Return is vector y, which is the solved ODE

  global lambda;
  global alpha;
  global omega;
  global h;

  % Tol for deciding when to stop iteration
  tol = 1e-6;

  % Preallocate vector y
  y = zeros(1, N);
  t = 0;

  y(1) = y0;
  for n = 1:(N-1)
    % We use secant method to solve for ynp1.  Use initial
    % guess from forward Euler.
    ynp1_guess = y(n) + h*f(y(n), t);   % First guess -- forward Euler
    t = t+h;                         % Increment t to next value
    g = @(u) y(n) + h*f(u, t) - u;   % Define fcn to solve
    ynp1 = secant(g, ynp1_guess, ynp1_guess+h, 1e-9);
    y(n+1) = y(n) + h*f(ynp1, t);    % Assign next value using y found via secant
  end

end
