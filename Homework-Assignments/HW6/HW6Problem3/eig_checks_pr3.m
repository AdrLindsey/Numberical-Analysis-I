function eig_checks_pr3()

    % --- Choose tol and number of tests to run -----------
    % -----------------------------------------------------
    number_of_tests = 5;
    tol = 1e-8;
    % -----------------------------------------------------

    for test=1:number_of_tests
        n=randi([2,10],1);
        A=rand(n,n);
        fprintf('*********   Testing #%.0f [%.0f, %.0f] matrix   ************\n', test, n, n)

        % First get the eigs using Matlab
        % built-in fcn.
        [et_v, lt_v] = eig(A'*A); % vector,values
        lt_v = diag(lt_v);        % Change eigenvalue return into vector.
        s_v = svd(A);             % singular values as a vector

        pass=0;
        fail=0;
        for i=1:n
            diffs = sqrt(lt_v(i)) - s_v;
            idx = find(abs(diffs) < tol);
            if (~isempty(idx))
                % Found at least one.
                fprintf('Eig Val = %e, Sigma = %e ... ', ...
                lt_v(i), s_v(idx))
                fprintf('Pass!\n')
                pass = pass + 1;
            else
                fprintf('Square Root of Eig Val not close to Sigma... ')	
                fprintf('Fail!\n')
                fail = fail + 1;
            end
        end
    end
end

