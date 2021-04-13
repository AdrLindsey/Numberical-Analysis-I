function harmonic_oscillator()
  % This uses forward Euler to compute the solution
  % to the harmonic oscillator problem

  % Set up time axis of problem
  Tend = 30;
  deltat = .001;
  N = Tend/deltat;
  omega = 3;
  t = linspace(0, Tend, N);

  % Use u vector to store computed values of y(1, :)
  u = zeros(1, N);

  % Initial cond
  y = [0; 1];

  % Propagation matrix
  A = [1, deltat; -omega*omega*deltat, 1];

  for ctr = 1:N
    y = A*y;
    u(ctr) = y(1);
  end

  plot(t, u)
end
