function y = endpoint(f, a, b, n)
  % This function implements the simple endpoint rule.  Integration
  % is performed over n points on the interval a <= x < b

  h = (b-a)/n;         % Step size
  x = a:h:(b-h);       % Sample x values -- must drop point at end
  s = f(x);            % f(x) values
  y = h*sum(s);        % Perform integration
end
