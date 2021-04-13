function L = L(theta)
    % load global params
    global params
    a = params.a;
    b = params.b;
    alpha = params.alpha;
    
    h1 = a./cosd(alpha+theta); % cosd(degree) = cos(rad)
    h2 = b./sind(theta);
    
    L = h1 + h2; 
end
