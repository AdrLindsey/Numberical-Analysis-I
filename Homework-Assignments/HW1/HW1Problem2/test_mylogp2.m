% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Test ----------------------------------- %

function test_mylogp2()
    tol = 1E-8;
    
    for z = 0.01:0.01:1.99

        y_comp = mylogp2(z);
        z_roundtrip = exp(y_comp);
        diff = abs(z_roundtrip - z);

        fprintf(['z = %15.10e, z_roundtrip = %15.10e, diff = %15.10e\n'], z, z_roundtrip, diff)
        
        if (diff > tol)
          error('Error is too large!!!\N')
        end
        
    end
    fprintf('----  Test passed! Success!  ----\n')
end