function mypi = test_buffon_needle()
  % Test fcn which calls buffon_needle_trials with increasing
  % N, computes the value of pi implied by the returns, and
  % prints out the results.

  Ns = floor(power(10, 1:.5:7))';
  errs = zeros(length(Ns), 1);
  
  for i = 1:length(Ns)
    N = Ns(i);    % Number of trials
    L = 0.8;       % Length of needle
    T = 1;         % Distance between floor cracks
    
    p = buffon_needle_trials(N, L, T)/N;
    
    mypi = (2*L)/(T*p);
    
    fprintf('For N = %d, computed value of pi = %f\n', N, mypi)
    errs(i) = abs(mypi - pi);
  end
    
  figure(1)
  loglog(Ns, errs, 'bo')
  xlabel('Number of trials')
  ylabel('Error')
  title('Buffon needle Monte Carlo simulation')
  
  % Do linear regression to fit line to data
  logNs = log(Ns);
  logErrs = log(errs);
  PP = polyfit(logNs, logErrs, 1);
  
  fprintf('This trial set converges to pi as N^%f\n', PP(1))
  
end
