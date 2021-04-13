% ---- Adrian Lindsey ------------------------- %
% ---- HW 3 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Bridge Solver -------------------------- %

function fi = truss_bridge(wt)

    % --- Let's construct our truss bridge ----------------------
    % -----------------------------------------------------------
    
    % vector of internal forces
    rows = [1 2 3 4 1 5 4 6 3 7 5 6 7 8 5 9 8 10 7 8 11 12 9 11 1 2 12];
    cols = [1 1 1 1 2 2 3 3 4 4 5 5 5 5 6 6 7 7 8 8 8 8 9 9 10 11 12];
    vals = [-cos(45) -sin(45) cos(45) sin(45) -1 1 1 -1 -1 1 -cos(45) -sin(45) cos(45) sin(45) -1 1 1 -1 -cos(45) sin(45) cos(45) -sin(45) -1 1 1 1 1];
    A = sparse(rows, cols, vals, 12, 12);
    
    % vector of external forces
    Tc = -wt/2;
    Te = Tc;
    fe = [0 0 0 0 0 Tc 0 0 0 Te 0 0];
    % -----------------------------------------------------------
    
    % --- Solve Ax = b for x
    fi = full(A) \ fe';


end
