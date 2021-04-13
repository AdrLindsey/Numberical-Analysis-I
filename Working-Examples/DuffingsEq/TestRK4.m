function TestRK4()
  % This function calls RK4 with the
  % variables needed to run it.

%  close all

  global alpha
  global beta
  global delta
  global gamma
  global omega

  % Set up parameters in equation
  delta = .2;
  alpha = 1.1;
  beta = 1.5;
  % Set to 3 for regular motion, set to 35 for chaos.
  gamma = 35; % 35;  
  omega = 1;

  % Step size to use
  h = .002;

  % Length of time to compute
  Tmax = 20;

  % Number of points to compute
  N = Tmax/h;

  % Initial condition
  y0 = [-1;-1];

  % Time vector -- used in plotting
  t = linspace(0, h*N, N);

  % Computed solution using 4th order Runge-Kutta
  y = RK4(y0, N, h);

  figure(3)
  plot(t, y(1,:),'r')
  hold on
  plot(t, y(2,:),'b')
  title('Time evolution of Duffing eq for RK4')

  figure(4)
  plot(y(1,:), y(2,:))
  title('Phase plot of Duffing eq for RK4')
  
  
%  % This sets the range of points to plot in phase plot
%  tstart = 40;
%  nstart = floor(tstart/h);
%  trange = nstart:N;
  
%  figure(3)
%  plot(t(1:nstart), y(1,1:nstart),'r')
%  hold on
%  plot(t(1:nstart), y(2,1:nstart),'b')
%  plot(t(nstart:end), y(1,nstart:end),'r', 'LineWidth',2)
%  plot(t(nstart:end), y(2,nstart:end),'b', 'LineWidth',2)
%  title('Time evolution of Duffing eq for RK4')
  
  
%  figure(4)
%  plot(y(1,trange), y(2,trange))
%  title('Phase plot of Duffing eq for RK4')

end
