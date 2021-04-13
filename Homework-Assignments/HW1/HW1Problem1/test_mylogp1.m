% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 1 ------------------------------ %
% ---- Test ----------------------------------- %

function test_my_function()
    
    % --- ATTN: TESTER -----------------
    % Please select your N
    N = 1E4;
    % ----------------------------------
    
    
    % --- Solution for Part 1 ----------
    my_vector = mylogp1(N);
    fprintf('My function returns an approximation for ln(2) of %.5f.\n', my_vector(end))

    % --- Solution for Part 2 ----------
    error_vector = abs(log(2) - my_vector);
    scatter(log10(1:N),log10(error_vector))
    xlabel('Number of terms in sum in log10')
    ylabel('Error in log10')
    title('Error of log(2) series computation')
    
end

