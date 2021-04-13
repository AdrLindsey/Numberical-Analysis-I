function run_compare_methods
  % This tests all the quadrature (integration) methods on the
  % fcns given in the SIAM Review article:
  % Improving the Accuracy of the Trapezoidal Rule,
  % Bengt Fornberg, SIAM Rev., 63(1), 167–180.
  %
  % This program computes the
  % integrals for increasing number of interpolation points N,
  % then makes a plot of the error vs. N for each of the methods.

  %------------------------------------------------------
  % First test fcn.
  f = @(x) cos(20*sqrt(x));
    
  % According to Wolfram Alpha, the exact integral is
  % integral_0^1 cos(20 sqrt(x)) dx 
  % = 1/200 (-1 + 20 sin(20) + cos(20))≈0.0883349353818297
  ytrue = 0.0883349353818297;
  
  M = 43;
  M2 = (M-1)/2;  % Actual number of pts in results vecs.
  err_gq = zeros(1,M2);
  err_cc = zeros(1,M2);
  err_s13 = zeros(1,M2);
  npts = zeros(1,M2);
  
  fprintf('---------------------------------------\n')
  fprintf('f(x) = cos(20*sqrt(x))\n')
  cnt = 1;
  for n = 3:2:M
    npts(cnt) = cnt;
    
    y = gauss_quadrature(f, 0, 1, n);
    diff = y - ytrue;
    %fprintf('N = %d, y = %18.16f, diff = %e\n ', n, y, diff)
    err_gq(cnt) = diff;
    
    y = clenshaw_curtis(f, 0, 1, n);
    diff = y - ytrue;
    %fprintf('N = %d, y = %18.16f, diff = %e\n ', n, y, diff)
    err_cc(cnt) = diff;
    
    y = simpsons_13rule(f, 0, 1, n);
    diff = y - ytrue;
    %fprintf('N = %d, y = %18.16f, diff = %e\n ', n, y, diff)
    err_s13(cnt) = diff;
    
    cnt = cnt+1;
    
  end
  
  figure(1)
  semilogy(npts, abs(err_gq), 'bo')
  hold on
  semilogy(npts, abs(err_cc), 'go')
  semilogy(npts, abs(err_s13), 'ro')
  title('Error computing integral of cos(20*sqrt(x))')
  legend('Gauss', 'Clenshaw-Curtis', 'Simpson''s 1/3 rule', 'Location', 'east')

  
  %------------------------------------------------------
  % Second test fcn.
  f = @(x) exp(-1000*(x-.5).*(x-.5));
    
  % According to the SIAM article, the exact integral is
  % (1/10)*sqrt(pi/10)*erf(5*sqrt(10))
  ytrue = (1/10)*sqrt(pi/10)*erf(5*sqrt(10));

  
  M = 163;
  M2 = (M-1)/2;  % Actual number of pts in results vecs.
  err_gq = zeros(1,M2);
  err_cc = zeros(1,M2);
  err_s13 = zeros(1,M2);
  npts = zeros(1,M2);
  
  fprintf('---------------------------------------\n')
  fprintf('f = exp(-1000*(x-.5.)^2)\n')
  cnt = 1;
  for n = 3:2:M
    npts(cnt) = cnt;
    
    y = gauss_quadrature(f, 0, 1, n);
    diff = y - ytrue;
    %fprintf('N = %d, y = %18.16f, diff = %e\n ', n, y, diff)
    err_gq(cnt) = diff;
    
    y = clenshaw_curtis(f, 0, 1, n);
    diff = y - ytrue;
    %fprintf('N = %d, y = %18.16f, diff = %e\n ', n, y, diff)
    err_cc(cnt) = diff;
    
    y = simpsons_13rule(f, 0, 1, n);
    diff = y - ytrue;
    %fprintf('N = %d, y = %18.16f, diff = %e\n ', n, y, diff)
    err_s13(cnt) = diff;
    
    cnt = cnt+1;
    
  end
  
  figure(2)
  semilogy(npts, abs(err_gq), 'bo')
  hold on
  semilogy(npts, abs(err_cc), 'go')
  semilogy(npts, abs(err_s13), 'ro')
  title('Error computing integral of exp(-1000*(x-.5)^2)')
  legend('Gauss', 'Clenshaw-Curtis', 'Simpson''s 1/3 rule', 'Location', 'NorthEast')

end
