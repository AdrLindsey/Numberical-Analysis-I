function harmonic_oscillator_fwd_euler()
  % This uses forward Euler to compute the solution
  % to the harmonic oscillator problem

  global omega
  omega = 3;  % Oscillation freq
    
  % Set up time axis of problem
  Tend = 50;
  deltat = .01;
  N = Tend/deltat;
  t = linspace(0, Tend, N);

  % Allocate y as two row vectors stuck together.
  y = zeros(2, N);
  
  % Allocate energy vector
  e = zeros(1, N);
  
  % Initial cond
  y(:,1) = [0; 1];  % row 1 = pos, row 2 = veloc
  e(1) = (omega*omega*y(1,1)*y(1,1) + y(2,1)*y(2,1))/2;
  
  % Take steps.  Compute energy at each step
  for i=1:N-1
    y(:,i+1) = forward_euler_step(y(:,i), t(i), deltat);
    e(i+1) = (omega*omega*y(1,i+1)*y(1,i+1) + y(2,i+1)*y(2,i+1))/2;
  end

  % Make plot of pos vs. time
  figure(1)
  plot(t, y(1,:))
  xlabel('time')
  ylabel('position')
  title('Position vs. time -- Forward Euler')

  % Make plot of energy vs. time
  figure(2)
  plot(t, e)
  xlabel('time')
  ylabel('energy')
  title('Energy vs. time -- Forward Euler')
  axis([0, Tend, 0, 5])

end
