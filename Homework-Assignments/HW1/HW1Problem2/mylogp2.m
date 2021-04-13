% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Computation ---------------------------- %

function yN = mylogp2(z)
    % Initialize computation
    y0 = z - 1;   % first term
    yN = 0;       % sum
    yold = yN;    % previous sum
    s = 1;        % sign
    t = z - 1;    % this term
    N = 1E4;      % max order of magnitude tried
    tol = 1E-9;   % tolerance

    % Now compute terms inside loop.
    for n = 1:N
        yN = yN + s * t / n;

        % check for convergence
        if abs(yN - yold) < tol
            return
        else
            % did not converge
            yold = yN;
            s = -s;
            t = t * y0;
        end
    end
    fprintf('---- Failed to Converge! ----\n');
end    