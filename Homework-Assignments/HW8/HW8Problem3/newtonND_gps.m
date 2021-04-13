function x = newtonND_gps(f, J, x0, tol)
    % This fcn implements ND root finding via Newton's method
    % fn is a function handle, fn takes a vector input and returns a vector output
    % Jn is a function handle to the Jacobian.  Jn takes a vector input (x1, x2)
    % and returns the Jacobian matrix.
    % x0 is the initial guess
    % tol is the desired tolerance.

    % Do root finding in a loop to prevent infinite loops
    % from nonconvergence
    x = x0;
    for i = 1:1000
        fnp1 = f(x);
        Jnp1 = J(x);
        delta = -Jnp1\fnp1;
        x = x+delta;
        fprintf('delta = [%.4f, %.4f,%.4f, %.4f]  x = [%.4f, %.4f, %.4f, %.4f]\n', delta(1), delta(2), delta(3), delta(4), x(1), x(2), x(3), x(4));

        % Check if we're close enough to quit yet
        % Check if delta is less than tol
        if norm(delta) < tol    
            fprintf('### ---- Success! Terminating after %.0f iterations because norm(delta) < tol!\n', i)
            return
        end
    end  % end of for loop

    fprintf('### ---- Terminated without convergence!\n')
    x = [nan, nan, nan, nan];
end
