% ---- Adrian Lindsey ------------------------- %
% ---- HW 5 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Back Substitution ---------------------- %

% a is our alpha: Al = 6.4e-5 m2/sec & Fe = 2.3e-5 m2/sec
% N is our number of nodes
% idx is the specific node where our heat is applied
% q is the heat applied at n
function T = get_bar_temp(a, N, idx, q)

    % Create tridiagonal Laplacian
    N_n = N-2;
    v = ones(N_n,1);
    A = spdiags([v, -2*v, v], [-1, 0, 1], N_n, N_n);
    % add top, bottom
    B = [[zeros(N_n,1)']; full(A); [zeros(N_n,1)']];
    % add left, right
    A = [[ones(2,1); zeros(N_n,1)]'; B'; [zeros(N_n,1); ones(2,1)]']';
    
    % initialize eqtn components
    bar_length = 1.0;
    h = bar_length/N;
    Q = zeros(N,1);
    Q(idx) = q; % 0.05
    T = zeros(N,1);
    k1A = A/(h*h); % consider the float type
    k2Q = -Q/(a*h); % [0 0 0 0 0 (-0.05/a*h) 0 0 0 0 0]
    
    rows = 1:N;
    cols = rows;

    for i = 1:1.5e3
        % for_2 r = rows (A)        
        for r = rows
            T_temp = k2Q(r);%(r);
            % for_3 c = cols (A) -- subtract from each
            for c = cols
                if r==c 
                    continue;
                end
                T_temp = T_temp - k1A(r,c)*T(c);
            end
            T(r) = T_temp/k1A(r,r);
        end
    end 
    
    
end