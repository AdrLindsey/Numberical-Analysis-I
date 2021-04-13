function j_out = J(s)

    % -- Load global params
    global params
    x = params.x;
    y = params.y;
    z = params.z;
    c = params.c;

    % -- Let's set up the Jacobian for our distance function
    j_out = zeros(4, 4);  % Create return as 4x4 matrx

    % Partials derivatives of first fxn w.r.t. each s
    j_out(1,1) = (((s(1)-x(1))^2 + (s(2)-y(1))^2 + (s(3)-z(1))^2)^(-1/2))*(s(1)-x(1));
    j_out(1,2) = (((s(1)-x(1))^2 + (s(2)-y(1))^2 + (s(3)-z(1))^2)^(-1/2))*(s(2)-y(1));
    j_out(1,3) = (((s(1)-x(1))^2 + (s(2)-y(1))^2 + (s(3)-z(1))^2)^(-1/2))*(s(3)-z(1));
    j_out(1,4) = c;
    
    % Partials derivatives of second fxn w.r.t. each s
    j_out(2,1) = (((s(1)-x(2))^2 + (s(2)-y(2))^2 + (s(3)-z(2))^2)^(-1/2))*(s(1)-x(2));
    j_out(2,2) = (((s(1)-x(2))^2 + (s(2)-y(2))^2 + (s(3)-z(2))^2)^(-1/2))*(s(2)-y(2));
    j_out(2,3) = (((s(1)-x(2))^2 + (s(2)-y(2))^2 + (s(3)-z(2))^2)^(-1/2))*(s(3)-z(2));
    j_out(2,4) =  c;
    
    % Partials derivatives of third fxn w.r.t. each s
    j_out(3,1) = (((s(1)-x(3))^2 + (s(2)-y(3))^2 + (s(3)-z(3))^2)^(-1/2))*(s(1)-x(3));
    j_out(3,2) = (((s(1)-x(3))^2 + (s(2)-y(3))^2 + (s(3)-z(3))^2)^(-1/2))*(s(2)-y(3));
    j_out(3,3) = (((s(1)-x(3))^2 + (s(2)-y(3))^2 + (s(3)-z(3))^2)^(-1/2))*(s(3)-z(3));
    j_out(3,4) = c;
    
    % Partials derivatives of fourth fxn w.r.t. each s
    j_out(4,1) = (((s(1)-x(4))^2 + (s(2)-y(4))^2 + (s(3)-z(4))^2)^(-1/2))*(s(1)-x(4));
    j_out(4,2) = (((s(1)-x(4))^2 + (s(2)-y(4))^2 + (s(3)-z(4))^2)^(-1/2))*(s(2)-y(4));
    j_out(4,3) = (((s(1)-x(4))^2 + (s(2)-y(4))^2 + (s(3)-z(4))^2)^(-1/2))*(s(3)-z(4));
    j_out(4,4) = c;

end
