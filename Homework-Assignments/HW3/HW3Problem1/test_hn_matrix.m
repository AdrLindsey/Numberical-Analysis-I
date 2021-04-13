
% ---- Adrian Lindsey ------------------------- %
% ---- HW 3 ----------------------------------- %
% ---- Problem 1 ------------------------------ %
% ---- Test ----------------------------------- %

function test_hn_matrix()

    % --- Create vector of Ns and call hn_matrix() -------------
    % ----------------------------------------------------------
    n_vector = 2:1:21;
    [cn_vector, rn_vector, errest_vector] = hn_matrix(n_vector);
    % ----------------------------------------------------------

    % --- Create plot of cond, residual, err, v Ns -------------
    % ----------------------------------------------------------    
    scatter(n_vector,cn_vector,50,'red','o');
    hold on;
    scatter(n_vector,errest_vector,50,'green','+');
    scatter(n_vector,rn_vector,50,'blue','*');
    set(gca, 'YScale', 'log')
    xlabel('Matrix dimensions N');
    ylabel('Values');
    hold off;
    % ----------------------------------------------------------
    
end
