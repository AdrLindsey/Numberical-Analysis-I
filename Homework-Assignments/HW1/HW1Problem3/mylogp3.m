% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Computation ---------------------------- %

function yn = mylogp3(z)
    %                     2           2           2           2
    % ln(z) = (z-1)/(1 + 1 (z-1)/2 + 1 (z-1)/3 + 2 (z-1)/4 + 2 (z-1)/5 
    %       2           2           2           2
    %   +  3 (z-1)/6 + 3 (z-1)/7 + 4 (z-1)/8 + 4 (z-1)/9 + ... ))))
    
    N = 1E3;
    a = z-1;
    b = 1;

    coefs = [[1],floor(1:0.5:ceil(N/2))]; % vector of coefficients

    Ajm2 = 1; % A(-1)
    Bjm2 = 0; % B(-1)
    Ajm1 = 0; % A(0)
    Bjm1 = 1; % B(0)

    ynm1 = 0;
    tol = 1E-10;  % Stopping tolerance greater than "testing tolerance"

    % Computation done in for loop.
    for j = 1:N

        % --- Step 1: Compute new Aj, Bj, yn, diff ----------------
        % ---------------------------------------------------------
        Aj = b*Ajm1 + a*coefs(j)*coefs(j)*Ajm2;
        Bj = b*Bjm1 + a*coefs(j)*coefs(j)*Bjm2;
        yn = Aj/Bj;
        diff = yn - ynm1;
        % ---------------------------------------------------------


        % --- Step 2: Check for convergence using diff, tol -------
        % ---------------------------------------------------------
        if (abs(diff) < tol)
            fprintf('--- Converged! --- z = %.2f with %d iterations, result = %.5f\n', z, j, yn)        
            return
        end
        % ---------------------------------------------------------


        % --- Step 3: Reset vars for next loop --------------------
        % ---------------------------------------------------------
        ynm1 = yn;
        Ajm2 = Ajm1;
        Bjm2 = Bjm1;
        Ajm1 = Aj;
        Bjm1 = Bj;
        b = j+1;
        % ---------------------------------------------------------

    end
    error('mylog_contdfrac failed to converge for z = %d. yn = %f', z, yn)
end

