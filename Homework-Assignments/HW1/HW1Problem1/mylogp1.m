% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 1 ------------------------------ %
% ---- Computation ---------------------------- %

function [output] = mylogp1(N,type)
    denom = 1;
    y = 0;
    output = zeros(1,N);

    for i = 1:N
        denom = 2*denom;
        y = y + 1/(i*denom); % remember Horner's Rule
        output(i) = y;
    end
    output;
end

