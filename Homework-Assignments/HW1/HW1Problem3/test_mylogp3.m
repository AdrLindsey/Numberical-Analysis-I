% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Test ----------------------------------- %

function test_mylogp3()

  tol = 1E-9;
  
  for z = 0.01:0.01:15.00
      y_comp = mylogp3(z);
      z_roundtrip = exp(y_comp);
      diff = abs(z_roundtrip - z);
      
      if (diff > tol)
          error('Error is too large!!!\n')
      end
      
  end    
  fprintf('----  Test passed! Success!  ----\n')
end