function test_newtonND()
    
    % set global params
    global params
    params.a0 = -1.5;
    params.a1 = 1.2;
    params.a2 = -0.5;
    params.a3 = 0.4;
    params.a4 = 1.0;

    % note from prof: guess imaginary valus
    my_guess = [0; 1-1i; -1; 1+1i];
    theta = newtonND(@f, @J, my_guess, 1e-8);
    fprintf('### ----- theta = [%.4f, %.4f, %.4f, %.4f]!!\n', theta(1), theta(2), theta(3), theta(4));    

end

