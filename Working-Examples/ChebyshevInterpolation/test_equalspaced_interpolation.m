function test_equalspaced_interpolation()
  
  % close all;
  
  N = 9;  % Number of nodes.
  
  f = @(x) 1./(1 + 16*x.^2);
  x = linspace(-1, 1, 100);
  p1 = plot(x, f(x), 'b');
  hold on
  
  xi = linspace(-1, 1, N);
  fi = f(xi);
  p2 = plot(xi, fi, 'bx');
  y = lagrange(xi, fi, x);
  
  p3 = plot(x, y, 'r');
  legend([p1, p2, p3], 'Original function', 'Nodes', 'Interpolation')
  title(['Lagrange interpolation of order ', num2str(N)])
  
end

