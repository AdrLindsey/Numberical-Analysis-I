function test_newtonND_gps()

    % Set global params
    global params % params lifted from hw set table (and paragraph)
    params.x = [1.2; -0.5; -1.7; 1.7];
    params.y = [2.3; 1.5; 0.8; 1.4];
    params.z = [0.2; 1.8; 1.3; -.5];
    params.t = [9.9999; 13.0681; 2.0251; 10.5317];
    params.c = -0.047; 

    % set reasonable tolerance
    tol = 1e-8; % 1e-5;

    % -- Make initial guesses and run newtonND_gps()
    my_guess = [1; 1; 1; 0]; % [0; 0; 0; 0];
    dist = newtonND_gps(@f, @J, my_guess, tol);
    fprintf('### ---- Our Positions is [x = %.4f,  y = %.4f, z = %.4f, t = %.4f]!\n', dist(1), dist(2), dist(3), dist(4));

end


