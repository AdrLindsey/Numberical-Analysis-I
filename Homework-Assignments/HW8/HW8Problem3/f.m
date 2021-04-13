function f_out = f(s)

    % load global params
    global params
    x = params.x;
    y = params.y;
    z = params.z;
    t = params.t;
    c = params.c;

    % Build by setting eqns equal to each other
    term1 = s(1)-x;
    term2 = s(2)-y;
    term3 = s(3)-z;
    term4 = s(4)-t; % mutliply by c!!!
    f_out =  c*(term4) + sqrt((term1.*term1)+(term2.*term2)+(term3.*term3));

end


   