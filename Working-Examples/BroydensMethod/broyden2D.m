function xret = broyden2D(F, J, x0, tol)
  % This fcn implements 2D root finding via Broyden's method.  It 
  % tries to follow the algorithm in my Broyden's method app note
  % on Blackboard.

  % Needed to pass any parameters to f and df
  global params

  % Initialize computation
  Bnm1 = eye(2); % J(x0);     % This is the "Jacobian-like thing
  xnm1 = x0;                    % Starting point
  Fnm1 = F(xnm1);
  fprintf('xnm1 = [%16.12f, %16.12f]\n', xnm1(1), xnm1(2));
  dn = -Bnm1\Fnm1;
  xn = xnm1 + dn;
  fprintf('dn = [%16.12f, %16.12f], xn = [%16.12f, %16.12f]\n', dn(1), dn(2), xn(1), xn(2));  

  
  % Do root finding in a loop to prevent infinite loops
  % from nonconvergence
  for i = 1:25
    Fn = F(xn);
    Deln = Fn - Fnm1;
    Bn = Bnm1 + (Deln - Bnm1*dn)*(dn'/(dn'*dn));  % Broyden update
    
    % Now take step to new point
    dnp1 = -Bn\Fn;
    xnp1 = xn + dnp1;
    fprintf('dnp1 = [%16.12f, %16.12f], xnp1 = [%16.12f, %16.12f]\n', dnp1(1), dnp1(2), xnp1(1), xnp1(2));
    % Check for convergence
    if (norm(dnp1) < tol)
      xret = xnp1;
      return
    end

    % Move values back
    xn = xnp1;
    dn = dnp1;
    Bnm1 = Bn;
    Fnm1 = Fn;

  end  % end of for loop

fprintf('Terminated without convergence!\n')
xret = [nan, nan];

end
