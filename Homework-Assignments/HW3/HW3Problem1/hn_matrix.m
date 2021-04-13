% ---- Adrian Lindsey ------------------------- %
% ---- HW 3 ----------------------------------- %
% ---- Problem 1 ------------------------------ %
% ---- Hilber Matrix -------------------------- %

function [cn_vector, rn_vector, errest_vector] = hn_matrix(n_vector)

    % --- Initialize vectors
    cn_vector = [];
    rn_vector = [];
    errest_vector = [];
    n_idx = n_vector(1)-1; % in case we want to start loop with val >2

    % loop from n_min to n_max (2:1:21) to populate vectors
    for n = n_vector

        x0 = ones(n,1); % starting point
        Hn = hilb(n); % hilbert matrix
        cn = cond(Hn); % condition (known to be poorly conditioned >>1)
        cn_vector(n-n_idx) = cn;

        b = Hn * x0; % matrix vector product
        xc = Hn \ b; % linear solve
       
        rn = norm(x0 - xc); % norm to find difference btwn computed and starting point
        rn_vector(n-n_idx) = rn;

        errest = cond(Hn) .* eps(1); % error estimate given by Moler
        errest_vector(n-n_idx) = errest;

    end
    
end
