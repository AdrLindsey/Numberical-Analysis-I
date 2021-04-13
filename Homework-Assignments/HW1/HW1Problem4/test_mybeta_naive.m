% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 4 ------------------------------ %
% ---- Test ----------------------------------- %

function test_mybeta_naive()
    
    x = [0.1,1,10,100];
    y = x;
    tol = 1E-9;
    
    for xi = x
        for yi = y
            b_naive = mybeta_naive(xi,yi); 
            b_matlab = beta(xi,yi); 
            b_gammaln = mybeta_gammaln(xi,yi); 
            diff1 = abs(b_naive - b_matlab);
            diff2 = abs(b_naive - b_gammaln);
            diff3 = abs(b_gammaln - b_matlab);
            
            % --- Look for NaNs in naive --------------------------------
            if isnan(b_naive) == 1
                fprintf('ATTN: mybeta_naive() returns NaN for x = %d, y = %d.\n', xi, yi);
            end
            % -----------------------------------------------------------
            
            % --- Look for NaNs in gammaln ------------------------------
            if isnan(b_gammaln) ==1
                fprintf('ATTN: mybeta_gammaln() returns NaN for x = %d, y = %d.\n', xi, yi);
            end
            % -----------------------------------------------------------

            % --- Compare gammaln() against matlab() --------------------
            if (diff3 > tol)
                error('Error is too large!!!\n');
            end
            % -----------------------------------------------------------
        end
    end
    fprintf('ATTN: mybeta_gammaln() is within tol of beta() for all x,y inputs [0.1,1,10,100].\n', tol)
    
end

