function plot_f_unif(N)

    % define domain
    a = 0;
    b = 5;

    %% --- Part 5: Let's just return y given x and plot the graph ---
    x = linspace(a,b,1e3);
    figure(2)
    plot(x,f(x));
    hold on;
    title('Original Function with N Equidistant nodes');
    % ---------------------------------------------------------------
    
    %% --- Part 6, 7: Get equidistant samples from f() and plot -----
%     N = 19;
    xk = linspace(a, b, N);
    yk = zeros(N,1);
    for i = 1:N
        yk(i) = f(xk(i));
    end
   
    knot_pairs = [xk',yk];
    scatter(knot_pairs(:,1), knot_pairs(:,2), 'o') 
    % ---------------------------------------------------------------
    
    %% --- Part 8: Interpolate using Lagrange Poly and plot ---------
    y = zeros(length(x),1);
    for idx = 1:length(x)
      y(idx) = lagrange_poly(xk, yk, x(idx));
    end
    plot(x, y, '--r');
    hold off;
    % ---------------------------------------------------------------

end