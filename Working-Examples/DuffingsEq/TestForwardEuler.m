function TestForwardEuler()
  % This function calls ForwardEuler with the
  % variables needed to run it.


  global alpha
  global beta
  global delta
  global gamma
  global omega

  % Set up parameters in equation
  delta = .2;
  alpha = 1.1;
  beta = 1.5;
  gamma = 35;
  omega = 1;


  % Step size to use
  h = .002;  % Unstable for h =.1, stable for h = 0.01

  % Length of time to compute
  Tmax = 20;
  
  % Number of points to compute
  N = Tmax/h;

  % Initial condition
  y0 = [-1;-1];

  % Time vector -- used in plotting
  t = linspace(0, h*N, N);

  % Computed solution using forward Euler
  y = ForwardEuler(y0, N, h);

  figure(1)
  plot(t, y(1,:),'r')
  hold on
  plot(t, y(2,:),'b')
  title('Time evolution of Duffing eq for Forward Euler')

  figure(2)
  plot(y(1,:), y(2,:))
  title('Phase plot of Duffing eq for Forward Euler')

end
