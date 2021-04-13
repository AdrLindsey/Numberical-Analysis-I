function test_gauss_quadrature()
  % This is a simple test for Gaussian quadrature
    
  %----------------------------------------------------
  % This should pass with flying colors.
  f = @(x) x.^2;
    
  a = 0;
  b = 4;
  ytrue = (4^3)/3;
  Ns = [3, 7, 13];
  tol = 1e-13;
  
  fprintf('---------------------------------------\n')  
  fprintf('Testing integral of x^2 ... \n')
  for idx=1:length(Ns)
    N = Ns(idx);
    y = gauss_quadrature(f, a, b, N);
    diff = y - ytrue;
    fprintf('N = %d, y = %18.16f, diff = %e ... ', N, y, diff)
    if (diff < tol)
      fprintf('Passed!\n')
    else
      fprintf('Failed!\n')
    end
  end
  
  %----------------------------------------------------
  % This will do better than Simpson's rule.
  f = @(x) cos(x);
    
  a = 0;
  b = pi/2;
  ytrue = 1;
  Ns = [7, 13, 21, 35, 67, 99];
  tol = 1e-9;
  
  fprintf('---------------------------------------\n')  
  fprintf('Testing integral of cos(x) ... \n')
  for idx=1:length(Ns)
    N = Ns(idx);
    y = gauss_quadrature(f, a, b, N);
    diff = y - ytrue;
    fprintf('N = %d, y = %18.16f, diff = %e ... ', N, y, diff)
    if (diff < tol)
      fprintf('Passed!\n')
    else
      fprintf('Failed!\n')
    end
  end
  

  
end
