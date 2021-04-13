function j = J(x)
    
    % -- Thinking outloud ---------------------------
    % Jacobian is partial of each across each fxn 
    % populate matrix one element at a time
    % -----------------------------------------------

    %%% write out Jacobian from original fxn
    
    % partial of first fxn w.r.t. each x_n
    j = ones(4,4);  % Create return as 4x4 matrix 
    
    % partial of second fxn w.r.t each x_n
    j(2,1) = x(2)+x(3)+x(4);
    j(2,2) = x(1)+x(3)+x(4);
    j(2,3) = x(1)+x(2)+x(4);
    j(2,4) = x(1)+x(2)+x(3);
    
    % partial of third fxn w.r.t each x_n
    j(3,1) = x(2)*x(3)+x(2)*x(4)+x(3)*x(4);
    j(3,2) = x(1)*x(3)+x(1)*x(4)+x(3)*x(4);
    j(3,3) = x(1)*x(2)+x(1)*x(4)+x(2)*x(4);
    j(3,4) = x(1)*x(2)+x(1)*x(3)+x(2)*x(3);
    
    % partial of fourth fxn w.r.t each x_n
    j(4,1) = x(2)*x(3)*x(4);
    j(4,2) = x(1)*x(3)*x(4);
    j(4,3) = x(1)*x(2)*x(4);
    j(4,4) = x(1)*x(2)*x(3);

end
