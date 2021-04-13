function plot_f_cheb(N)

    % define domain
    a = 0;
    b = 5;

    %% --- Part 1: Let's just return y given x and plot the graph ---
    x = linspace(a,b,1e3);
    figure(1)
    plot(x,f(x));
    hold on;
    title('Original Function with N Chebyshev nodes');
    % ---------------------------------------------------------------
    
    %% --- Part 2, 3: Get Chebyshev Roots and plot onto f() ---------
%     N = 19;
    xk = zeros(N,1);
    yk = zeros(N,1);
    for i = 1:N
        xk(i) = ( (a+b) + (b-a) * cos( (2*i-1)/(2*N)*pi ) )/2;
        yk(i) = f(xk(i));
    end
    knot_pairs = [xk,yk];
    scatter(knot_pairs(:,1), knot_pairs(:,2), 'o') 
    % ---------------------------------------------------------------
    
    %% --- Part 4: Interpolate using Lagrange Poly and plot ---------
    y = zeros(length(x),1);
    for idx = 1:length(x)
      y(idx) = lagrange_poly(xk, yk, x(idx));
    end
    plot(x, y, '--r');
    hold off;
    % ---------------------------------------------------------------

end