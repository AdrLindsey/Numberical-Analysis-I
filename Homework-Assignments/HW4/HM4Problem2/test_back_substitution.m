% ---- Adrian Lindsey ------------------------- %
% ---- HW 4 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Test ----------------------------------- %

function test_back_substitution()

    %% --- Let's generaate some U's -------------
    %% ------------------------------------------
    
    for i = 1:25 % generate 25 randomly sized square matrices
        m = randi([2, 100],1);
        n = m;
        A = rand(m,n);
        [L,U] = lu(A);
        b = rand(m,1);
        x = back_substitution(U, b);
        
        rn = norm(b - (U * x)');
        tol = eps(1) * cond(U);
        
        if tol < rn
            fprintf('Success: tolerance level passed!\n');
        else fprintf('Fail: residual too largee!\n');
        end
        
    end
    
    %% ------------------------------------------

    

end