function harmonic_oscillator_ode45()
  % This uses ode45
  % to solve the harmonic oscillator problem

  global omega
  omega = 3;  % Oscillation freq
    
  % Set up time axis of problem
  Tend = 50;
  deltat = .01;

  % Initial cond
  y0 = [0, 1];  % col 1 = pos, col 2 = veloc
  
  % Solve system using ode45
  [t, y] = ode45(@f, [0, Tend], y0);

  % Allocate energy vector
  N = length(t);
  e = zeros(N, 1);
  
  % Compute energy at each step
  for i=1:N
    e(i) = (omega*omega*y(i,1)*y(i,1) + y(i,2)*y(i,2))/2;
  end

  % Make plot of pos vs. time
  figure(1)
  plot(t, y(:,1))
  xlabel('time')
  ylabel('position')
  title('Position vs. time -- ode45')

  % Make plot of energy vs. time
  figure(2)
  plot(t, e)
  xlabel('time')
  ylabel('energy')
  title('Energy vs. time -- ode45')
  axis([0, Tend, 0, 5])

end
