function eig_checks_pr2()

    % --- Choose tols and number of tests to run ----------
    % -----------------------------------------------------
    number_of_tests = 5;
    tol = 1e-8;
    cond_tol = 1e3;
    % -----------------------------------------------------

    for test=1:number_of_tests
        n=randi([2,10],1);
        A=rand(n,n);
        fprintf('*********   Testing #%.0f [%.0f, %.0f] matrix   ************\n', test, n, n)

        % First get the eigs using Matlab
        % built-in fcn.
        [et_v, lt_v] = eig(A); % vector,values
        lt_v = diag(lt_v);     % Change eigenvalue return into vector.


        for i=1:n
            % FIRST CHECK
            if norm(A*et_v(:,i) - lt_v(i)*et_v(:,i)) < tol
                fprintf('**  First Check Passed for Eig Val #%.0f!  **\n',i)
            else
                fprintf('**  OOPS! First Check Failed for Eig Val #%.0f!  **\n',i)
            end

            % SECOND CHECK
            if A-lt_v(i) * eye(n) < cond_tol
                fprintf('**  Second Check Passed for Eig Val #%.0f!  **\n',i)
            else
                fprintf('**  OOPS! Second Check Failed for Eig Val #%.0f!  **\n',i)
            end

            % THIRD CHECK
            if lt_v(i) - (et_v(:,i)'*A*et_v(:,i)) / (et_v(:,i)'*et_v(:,i)) < tol
                fprintf('**  Third Check Passed for Eig Val #%.0f!  **\n',i)
            else
                fprintf('**  OOPS! Third Check Failed for Eig Val #%.0f!  **\n',i)
            end

        end

    end
end

