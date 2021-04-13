function unitttest_broyden2D()
  % This is a unit test for broyden.  It tests broydon by
  % creating a simple fcn (linear fcn with small parabolic term)
  % having known zero.  Then it turns broyden2D loose on the fcn
  % and checks that it can find the zero.

  startpt = [0; 0];
  tol = 1e-5;
  passed = 0;
  failed = 0;
  
  for cnt = 1:5
    % This sets zero point of fcn to test
    x0 = 10*rand();  
    y0 = 10*rand();

    % This sets curvature of parabolic term
    % Can't make it too large, or the root finder will wander
    % away and find a different root.
    cx = 5e-2*rand();
    cy = 5e-2*rand();

    % Create function to find zero of
    parab = @(x, y) x*x + y*y;
    fx = @(x, y) (x-x0) + cx*parab(x-x0, y-y0);
    fy = @(x, y) (y-y0) + cy*parab(x-x0, y-y0);
    F = @(p) [fx(p(1), p(2)); fy(p(1), p(2))];
    J = @(p) [1, .2; -.2, 1];  % Use trial fixed Jacobian

    % Use broydon to find zero
    s = broyden2D(F, J, startpt, tol);

    % Print result and see if we passed or failed.
    fprintf('[x0, y0] = [%f, %f], s = [%f, %f]... ', x0, y0, s(1), s(2))
    if (norm([x0; y0] - s) < tol)
      passed = passed + 1;
      fprintf(' Passed!\n')
    else
      failed = failed + 1;
      fprintf(' Failed!\n')
    end
  end

  fprintf('*** At end, passed = %d, failed = %d\n', passed, failed)

end

