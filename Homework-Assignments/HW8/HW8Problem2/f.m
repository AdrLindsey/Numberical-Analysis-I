function z = f(x)

    % laod global params
    global params
    a0 = params.a0;
    a1 = params.a1;
    a2 = params.a2;
    a3 = params.a3;

    % set up original fxns -- WATCH FOR SIGN ERRORS!!!
    z = zeros(4,1); % Create return as column vector
    z(4) = -a0 + x(1)*x(2)*x(3)*x(4);
    z(3) = +a1 + x(1)*x(2)*x(3)+x(1)*x(2)*x(4)+ x(2)*x(3)*x(4)+x(1)*x(3)*x(4);
    z(2) = -a2 + x(1)*x(2)+x(1)*x(3)+x(1)*x(4)+x(2)*x(3)+x(2)*x(4)+x(3)*x(4);
    z(1) = +a3 + x(1)+x(2)+x(3)+x(4);

end

