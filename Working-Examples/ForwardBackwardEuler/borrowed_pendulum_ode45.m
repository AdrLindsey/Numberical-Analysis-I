function borrowed_pendulum_ode45()

    %% --- Let's solve our ODEs --------------------------------------
    theta0 = [0.5, 0.0];
    tspan = [1 10];
    
    % ode45 syntax via https://www.mathworks.com/help/matlab/ref/ode45.html
    [t,theta] = ode45(odefun,tspan,theta0);
    plot(t, theta);
    legend({'$\theta$', '$\dot{\theta}$'}, ...
        'Location', 'best', ...
        'Interpreter', 'latex', ...
        'FontSize', 16)
    % ----------------------------------------------------------------
    
    function dtheta = odefun(t,theta)

        %% --- pendulum ode per wiki ------------------------
        g = 9.8;
        l = 1;

        dtheta = zeros(2, 1);
        dtheta(1) = theta(2);
        dtheta(2) = -g/l*theta(1);
        % ---------------------------------------------------
    
    end

    %% --- lifted from matlab answers --------------------------------
%     theta_ic = [0.5; 0]; % initial conditions: theta(t=0)=0.5; dtheta(t=0)=0.
%     tspan = [0 10];
%     [t, theta] = ode45(@odeFun, tspan, theta_ic);
%     plot(t, theta);
%     legend({'$\theta$', '$\dot{\theta}$'}, ...
%         'Location', 'best', ...
%         'Interpreter', 'latex', ...
%         'FontSize', 16)
%     function dtheta = odeFun(t, theta)
%         g = 9.8;
%         l = 1;
%         % theta(1) = theta, theta(2) = dtheta
% 
%         dtheta = zeros(2, 1);
%         dtheta(1) = theta(2);
%         dtheta(2) = -g/l*theta(1);
%     end
    % ----------------------------------------------------------------
end