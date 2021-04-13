function [y0, b] = normaleqs(x, y)
  % This fcn uses the normal equations to 
  % compute a linear fit to the data [x, y].  The approach
  % solves the normal equations using s = (A'*A)\(A'*t)

  N = length(x);

  % Create A matrix
  e = ones(N, 1);
  A = [x, e];
  
  % Create t vector
  t = y;

  % Solve normal equations
  s = (A'*A)\(A'*t);
  b = s(1);
  y0 = s(2);
end

