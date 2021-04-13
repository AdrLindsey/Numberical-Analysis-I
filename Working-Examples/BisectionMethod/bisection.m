function x0 = bisection(f, a, b, tol)
  % This fcn implements simple bisection method root finding.
  % Call like this:
  % f = @(x) x^3 - 2*x + 5*x -7
  % bisection(f, 1, 3, 1e-5)


  % Get signs of fcn at end points
  sa = sign(f(a));
  sb = sign(f(b));

  % Validate input -- check that a < b
  if (a >= b)
    error('Invalid input -- a >= b')
  end

  % Validate input -- check that signs are different
  if (sa == sb)
    error('Invalid input -- sign(f(a)) == sign(f(b))')
  end

  fprintf('a = %f,   b = %f,  diff = %f\n', a, b, b-a);
      
  % Do root finding in a loop to prevent infinite loops
  for i = 1:100

    % Compute midpoint and sign of fcn at midpoint
    xm = (a+b)/2;       % midpoint
    sm = sign(f(xm));   % sign at midpoint

    % Now adjust end point depending upon sign(s)
    if (sa == sm)
      % sign(left) == sign(mid) => root on right side.
      a = xm;
      sa = sm;
    else
      % sign(right) == sign(mid) => root on left side.
      b = xm;
      sb = sm;
    end

    fprintf('a = %f,   b = %f,  diff = %f\n', a, b, b-a);

    % Check if we're close enough to quit yet
    if (b-a) < tol
      fprintf('Terminating after %d iterations\n', i)
      x0 = (a+b)/2;  % Return midpoint between a & b for good measure.
      return
    end
  end  % end of for loop

  error('Terminated without convergence!\n')
end
