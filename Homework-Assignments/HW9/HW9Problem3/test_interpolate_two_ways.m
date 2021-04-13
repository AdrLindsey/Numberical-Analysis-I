function test_interpolate_two_ways()
        
    % choose N nodes
    N = 19;
    
    %% --- Parts 1-4: Interpolate using Chebyshev roots -------
    plot_f_cheb(N);
    % ---------------------------------------------------------
    
    %% --- Parts 5-8: Interpolate using Chebyshev roots -------
    plot_f_unif(N);
    % ---------------------------------------------------------    

end