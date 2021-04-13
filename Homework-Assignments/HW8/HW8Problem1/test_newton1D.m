function test_newton1D(theta0)
    % This fcn finds the roots of the equation defined in f.m
    % using Newton's method.  As input, it is passed the starting point
    % k0.

    % Create struct to hold all args which get passed to f and df.
    global params
    params.a = 3;
    params.b = 4;
    params.alpha = 15; 

    theta = theta0;% Initial guess
    tol = 1e-5;   % Convergence tol
    r = newton1D(@f, @df, theta, tol);
    fprintf('### ---- Root found at %.4f degrees with Ladder length of %.4f!\n', r, L(r))
  
    % plot ladder length and min angle and zero-line
    ptheta = linspace(5,70,100);
    figure(1)
    plot(ptheta,L(ptheta));
    hold on;
    plot(ptheta,f(ptheta));
    plot(ptheta,zeros(100,1),'--');
    hold off;
    
  
end
