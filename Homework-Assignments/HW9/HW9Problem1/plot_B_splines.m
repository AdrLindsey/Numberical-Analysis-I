function plot_B_splines(a,b)

    %% --- Part 1: Let's create a plot of all khat's in given range ----
    % loop through positions (x) and nodes (k)
    krange = a:1:b;
    xrange = linspace(a,b,1e3);
    Bk = zeros(length(krange),1);

    % create gut-check plot
    for k = krange
        counter = 1;
        for x = xrange
            Bk(counter) = B(x,k);
            counter = counter +1;
        end 
        figure(1)
        plot(xrange,Bk)
        title('B Splines')
        hold on;
    end
    hold off;
    % -----------------------------------------------------------------
    
    %% --- Part 2: Given knot pairs and position x, implement sum() ---
    y = zeros(length(xrange),1);
    for idx = 1:length(xrange)
      y(idx) = sum_f(xrange, Bk, xrange(idx));
    end
    knot_pairs = [xrange', y];
    
    % gut-check plot
    figure(2)
    plot(knot_pairs(:,1), knot_pairs(:,2), '--r');
    title('Expansion Equation')
    % ------------------------------------------------------------------
 
end