% ---- Adrian Lindsey ------------------------- %
% ---- HW 1 ----------------------------------- %
% ---- Problem 4 ------------------------------ %
% ---- Second Computation --------------------- %

function B = mybeta_gammaln(x,y)
    
    B = exp(gammaln(x) + gammaln(y) - gammaln(x + y));

end
