function test_trapezoid()
  % This tests the trapezoid integrator by integrating
  % x^2 from 0 -> 3 for different numbers of sample points.
  % The analytic result is (1/3)x^3, which should be 9.000.


  f = @(x) x.*x;

  a = 0;
  b = 3;

  true = b*b*b/3;

  N = 1;
  for idx = 1:20
    N = N*2;
    act = trapezoid(f, a, b, N);
    err = abs(true - act);
    fprintf('N = %d, true = %12.8f,  act = %12.8f,  err = %12.8f\n', N, true, act, err);
  end

end
