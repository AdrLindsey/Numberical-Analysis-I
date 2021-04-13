function DuffingSweep()
  % This function calls RK4 with the
  % variables needed to run it.

  % d2y/dt2 + delta*dy/dt + alpha*y + beta*y^3 = gamma*cos(omega*t)

  global alpha
  global beta
  global delta
  global gamma
  global omega

  % Set up parameters in equation
  delta = .2;
  alpha = 1;
  beta = 1;
%  gamma = 20;   % Sweep this parameter
  gammas = linspace(15, 25, 10);
  omega = 1.4;

  % Step size to use
  h = .05;

  % Length of time to compute
  Tmax = 200;

  % Number of points to compute
  N = Tmax/h;

  % Initial condition
  y0 = [-1;-1];

  % Time vector -- used in plotting
  t = linspace(0, h*N, N);

  % Loop over drive values
  for gidx = 1:length(gammas)
    gamma = gammas(gidx);

    % Computed solution using 4th order Runge-Kutta for
    % this value of gamma
    y = RK4(y0, N, h);

    %figure(3)
    %plot(t, y(1,:),'r')
    %hold on
    %plot(t, y(2,:),'b')
    %title('Time evolution of Duffing eq for RK4')

    %figure(4)
    %plot(y(1,:), y(2,:))
    %title('Phase plot of Duffing eq for RK4')

    % Keep last 3N/4 points
    ts = t(floor(N/4):N);
    ys = y(1, floor(N/4):N);

    %figure(5)
    %plot(ts, ys, 'r')
    %hold on
    %plot(ts, cos(omega*ts), 'b')
    %title('Time evolution of Duffing eq for RK4 -- sampled points')

    % Sample these points.
    idx = find( abs(mod(ts, 2*pi) - 1) < 2.5e-2)
    ysamp = ys(idx);

    % Gather these hits into histogram
    

end
