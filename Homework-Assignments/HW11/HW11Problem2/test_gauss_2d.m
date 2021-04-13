function test_gauss_2d()
    
    %% -- Compare results to analytic SA ---------    
    SA_calc = gauss_2d();
    SA_true = 2*pi;
    tol = 0.01;
    diff = abs(SA_calc/SA_true -1);
    
    if diff < tol
        fprintf('### ----- Success! Our SA: %.4f is within 1%% of our analytic SA: %.4f!\n', SA_calc, SA_true)
    else
        fprintf('!!! ----- Fail! Our SA: %.4f is NOT within 1%% of our analytic SA: %.4f!\n', SA_calc, SA_true)
    end
    % --------------------------------------------    

end
