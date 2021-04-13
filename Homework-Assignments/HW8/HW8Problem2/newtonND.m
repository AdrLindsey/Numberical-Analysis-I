function theta = newtonND(f, jacobian, theta0, tol)
  % This fcn implements ND root finding via Newton's method
  % fn is a function handle, fn takes a vector input and returns a vector output
  % Jn is a function handle to the Jacobian.  Jn takes a vector input (x1, x2)
  % and returns the Jacobian matrix.
  % x0 is the initial guess
  % tol is the desired tolerance.

  % Do root finding in a loop to prevent infinite loops
  % from nonconvergence
  theta = theta0;
  for i = 1:1000
    fnp1 = f(theta);
    Jnp1 = J(theta);
    delta = -Jnp1\fnp1;
    theta = theta+delta;
    fprintf('delta = [%16.12f, %16.12f,%16.12f, %16.12f]  x = [%16.12f, %16.12f, %16.12f, %16.12f]\n', ...
        delta(1), delta(2), delta(3), delta(4), theta(1), theta(2), theta(3), theta(4));

    % Check if we're close enough to quit yet
    % Check if delta is less than tol
    if norm(delta) < tol    
      fprintf('Terminating after %d iterations because norm(delta) < tol.\n', i)
      norm_diff = norm(fa(theta));
      if norm_diff <= tol
          fprintf('### ---- Success! Norm of roots: %.16f!\n',norm_diff)
      else
          fprintf('### ---- Fail! Norm of roots: %.16f!\n',norm_diff)
      end
      return
    end
  end  % end of for loop

fprintf('Terminated without convergence!\n')
theta = [nan, nan, nan, nan];

end
