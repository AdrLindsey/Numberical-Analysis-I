function y = lagrange( xn, fn, x )
  % This fcn performs interpolation using the Lagrange
  % interpolation polynomial
  % Inputs:
  %   xn = Nodes 
  %   fn = funciton value at nodes
  %   x = vector of x values at which to interpolate

  y = 0;
  N = length(xn);
  for j = 1:N
    l_j = 1;  % Lagrange basis polynomial
    for m = 1:N
      if j ~= m
	l_j = l_j .* (x - xn(m))./(xn(j) - xn(m));
      end
    end
    y = y + l_j.*fn(j);
  end

end
  
