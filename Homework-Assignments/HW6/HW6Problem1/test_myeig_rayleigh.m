function test_myeig_rayleigh()

  % --- Request the number of vectors and tests you want --------------
  % -------------------------------------------------------------------
  number_of_tests=5;
  number_of_vectors=30;
  % -------------------------------------------------------------------
    
  % This fcn exercises myeig_rayleigh.  It calls the fcn
  % with a random symmetric matrix, and gets the 
  % returned eigenvalue.  It compares this eigenvalue against
  % ones created using Matlab's eig fcn.

  pass = 0;
  fail = 0;
  noconverge = 0;
  % Testing tol -- must be larger than convergence tol
  % used to compute eigenvalues.
  tol = 1e-8;

  % Do several trials for different sized matrices
  for test=1:number_of_tests
    fprintf('*********   Testing #%.0f [2, 2] matrix   ************\n', test)
    B = rand(2,2);
    A = B*B';
    result=plot_vectors(number_of_vectors,A);

    % First get the eigs using Matlab
    % built-in fcn.
    [et_v, lt_v] = eig(A);
    lt_v = diag(lt_v);     % Change eigenvalue return into vector.
    
    % Now compute an eigenvector/value pair using my program.  
    % Use try/catch in case method doesn't converge and throws an
    % error
    try
      % We need to find the eigenvalue that's resulting from plot_vectors()
      [lc, ec] = myeig_rayleigh(result, A);

      % My result should be close to one of Matlab's.  Which one?
      % First check eigenvector
      diffs = lc - lt_v;
      idx = find(abs(diffs) < tol);
      if (~isempty(idx))
	% Found at least one.
	fprintf('my eigenvalue = %e, Matlab eigenvalue = %e ... ', ...
		lc, lt_v(idx))
        fprintf('Pass!\n')
	pass = pass + 1;
      else
	fprintf('Found no eigenvalues close to Matlab.. ')	
        fprintf('Fail!\n')
	fail = fail + 1;
      end
      
      % Now check corresponding eigenvector
      et = et_v(:,idx);   % This pulls out corresponding eigenvector
      
      % Note that the eigenvectors can differ by a sign -- i.e. 
      % point in opposite directions.  This
      % is OK since the sign of the eigenvector can differ between
      % different decompositions.  Therefore, we check for both cases.
      diff1 = norm(ec - et);
      diff2 = norm(ec + et);
      diff = min(diff1, diff2);
      fprintf('Checking eigenvector, norm(diff) = %e ...', diff)
      if (diff < tol)
        fprintf('Pass!\n')
	pass = pass + 1;	
      else
        fprintf('Fail!\n')
	fail = fail + 1;	
      end

    catch
      % If my_eig_power throws an error, we go here.
      fprintf('myeig_rayleith failed to converge!\n')
      noconverge = noconverge+1;
    end
  end

  fprintf('**********************************************\n')
  fprintf('At end of test, pass = %d, fail = %d, non-convergence = %d\n', pass, fail, noconverge)

end
