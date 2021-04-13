% ---- Adrian Lindsey ------------------------- %
% ---- HW 3 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Symmetry and Quadratic Forms ----------- %

function y = quad_forms(a, x, y)

    A = [1 a; a 1];
    u = [x, y]';
    y = u' * A * u;
    
    
    svd(A)
    
    
end


