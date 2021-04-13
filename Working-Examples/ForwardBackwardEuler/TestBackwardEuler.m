function TestBackwardEuler()
  % This function calls BackwardEuler with the
  % variables needed to run it.

  % The test involves solving the system defined in f.m

  global lambda;
  global alpha;
  global omega;
  global h;

  % Set up parameters in equation
  lambda = 1.03;
  alpha = .6;
  omega = .07;

  % Step size to use
  h = 2;

  % Length of time to compute
  Tmax = 200;

  % Number of points to compute
  N = Tmax/h;

  % Initial condition
  y0 = -1;

  % Time vector -- used in plotting
  t = linspace(0, h*N, N);

  % Computed solution using backward Euler
  y = BackwardEuler(y0, N);

  diff = y - y_exact(y0, N);

  % Compute exact solution at higher point density
  h = h/10;
  N = Tmax/h;
  t1 = linspace(0, h*N, N);
  y_true = y_exact(y0, N);

  figure
  plot(t, y, 'r+')
  hold on
  plot(t1, y_true)
  % plot(t, diff, 'go')

end
