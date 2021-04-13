function [lnp1, qn] = myeig_rayleigh(ln, A)
  % This fcn computes an eigenvalue and 
  % eigenvector pair from A using
  % Rayleigh quotient iteration.

  % Max number of iterations
  M = 25;

  % Convergence tolerance.
  tol = 1e-9;

  % Convenience matrix
  I = eye(size(A));
  
  % Choose random start vector
  qn = randn(size(A,1),1);
  % ln = (qn'*A*qn)/(qn'*qn);
  
  % Iterate
  for idx = 1:M
    zn = (A - ln*I)\qn;
    qn = zn/norm(zn);
    lnp1 = (qn'*A*qn)/(qn'*qn);
    fprintf('eigenvalue after iteration %d = %18.15e\n', idx, lnp1)

    % Check for convergence.
    diff = abs(lnp1 - ln);
    if (diff < tol)
      fprintf('---  We converged!  Returning eigenvalue & eigenvector.....\n')
      return
    end
    % Did not converge yet.  Do next iteration.
    ln = lnp1;
  end

  % If we get here it is because we didn't converge
  error('Error in myeig_rayleigh -- Did not converge in M iterations!')
end
