function y = simpsons_13rule(f, a, b, N)
  % This function implements Simpson's 1/3 rule.  Integration
  % is performed over N points on the interval a <= x < b.
  % I use the composite rule which sums over sub-intervals.
  % Each sub-interval sum is (h/3)*(f(i-1) + 4*f(i) + f(i+1))

  % We require N to be odd.
  if (N/2 == round(N/2))
    error('Input number of pts must be odd!')
  end
 
  % Compute sample points.
  x = linspace(a, b, N);
  h = x(2) - x(1);

  % Compute full sum the naive way for clarity.  Note that
  % the interior odd notes are picked up twice in the loop
  % which gives the factor 2.
  s = 0;
  for i=2:2:N-1
      s = s + h*( f(x(i-1)) + 4*f(x(i)) + f(x(i+1)) )/3;
  end
  y = s;
  
end
