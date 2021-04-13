function xi = chebyshev_nodes(M)
  % This fcn returns a vector xn of Chebyshev
  % nodes used for interpolation.  The number
  % of nodes to use is N = M-1 because we include
  % i = 0.
    
  N = M-1;
  i = 0:N;
  t = pi*(2*i+1)/(2*N+2);
  xi = cos(t);

end
