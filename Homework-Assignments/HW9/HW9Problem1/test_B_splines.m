function test_B_splines()

    % set domain boundaries a, b for B-spline setup and N for sin() 
    a = -3;
    b = 3;
    N = 7;
    
    %% --- Part 1, 2: Build B-spline and implement sum() ---------------
    plot_B_splines(a,b);
    % ------------------------------------------------------------------    

    %% --- Part 3: Interpolate a sine wave -----------------------------
    x = linspace(-3,3,1e3);
    figure(3)
    plot(x,sin(x), '-b');
    title('Interpolating sin(x) using linear B-spline')
    hold on;
    
    % add equidistant nodes (N = y puts one at each integer)
    xsin = linspace(a, b, N);
    ysin = sin(xsin);
    scatter(xsin, ysin, 'or') 
    
    % interpolate using sum()
    y = zeros(length(xsin),1);
    for idx = 1:length(xsin)
      y(idx) = sum_f(xsin, ysin, xsin(idx));
    end
    plot(xsin, y, '--');
    hold off;
    % ------------------------------------------------------------------
    
end