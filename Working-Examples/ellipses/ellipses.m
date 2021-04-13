function A = ellipses()
  % This fcn generates a random 2x2 matrix A, and then applies it
  % to the unit circle.  It then plots the result.  
  % The goal is to visualize a matrix via its transformation of a unit
  % circle (or ball in ND).

  % This fcn also prints out the cond, norm and svd of the matrix A
  % to demonstrate the relationship of these numbers to the matrix's
  % eccentricity and the max radius of the ellipse.

while(1)
  close all;

  % Create unit circle x (parameterized by theta)
  theta = linspace(0, 2*pi, 50);
  x = [cos(theta); sin(theta)];  % Column vector

  % Now create random 2x2 matrix, and apply it to x.
  A = randn(2);
  fprintf('A = \n')
  disp(A)
  y = A*x;

  % Now plot circles
  clf;
  largesty = max(max(y));
  largestx = max(max(x));
  largest = max(largestx, largesty);
  axis([-largest, largest, -largest, largest], 'square');

  hold on
  plot(x(1, :), x(2, :), 'r')  % Reference circle is red
  plot(y(1, :), y(2, :), 'b')  % Transformed circle is blue

  % Report condition number, norm, and svds of A
  sigma = svd(A);
  fprintf('cond(A) = %f, norm(A) = %f svd = [%f, %f]\n', cond(A), norm(A), sigma(1), sigma(2));
  fprintf('----------------------------------------------------------------\n')
  
  pause()
  
end


end

