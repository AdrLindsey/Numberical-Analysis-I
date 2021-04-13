% ---- Adrian Lindsey ------------------------- %
% ---- HW 4 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Back Substitution ---------------------- %

function x = back_substitution(U, b)

    [m,N] = size(U); % let's get our N
    x = ones(m,1);

    for j = N:-1:1 % j is our Working Row
        s = b(j); % start with our sum then decrement
        for i = j+1 : N
            s = s - U(j,i) * x(i);
        end
        x(j) = s / U(j,j); % populate our x vector
    end

end
