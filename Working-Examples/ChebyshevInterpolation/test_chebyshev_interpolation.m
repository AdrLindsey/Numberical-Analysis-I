function test_chebyshev_interpolation()
  
  % close all;
  
  N = 9;  % Number of Chebyshev nodes.
  
  f = @(x) 1./(1 + 16*x.^2);
  x = linspace(-1, 1, 100);
  p1 = plot(x, f(x), 'b');
  hold on
  
  y = chebyshev_interpolation(f, x, N);
  
  xi = chebyshev_nodes(N);
  fi = f(xi);
  p2 = plot(xi, fi, 'bx');
  
  p3 = plot(x, y, 'g');
  legend([p1, p2, p3], 'Original function', 'Nodes', 'Interpolation')
  title(['Chebyshev interpolation of order ', num2str(N)])
  
end

