function root = newton1D(f, df, x, tol)
  % This fcn implements root finding via Newton's method
  % Call like this

  % Do root finding in a loop to prevent infinite loops
  % from nonconvergence
  fprintf('x = %16.12f\n', x);
  for i = 1:1e3
    fx = f(x);
    dfx = df(x);
    delta = -fx/dfx;
    x = x+delta;
    fprintf('theta = %16.12f, delta = %16.12f\n', x, delta);

    % Check if we're close enough to quit yet -- Check if delta is less than tol
    if abs(delta) < tol    
      fprintf('### ---- Success! Terminating after %d iterations because abs(delta) < tol.\n', i)
      root = x;
      return
    end

  end  % end of for loop

  error('Terminated without convergence!\n')
end
