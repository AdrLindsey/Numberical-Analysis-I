function dL = f(theta)
    % load global params
    global params
    a = params.a;
    b = params.b;
    alpha = params.alpha;
    
    h1_ = a.*tand(alpha+theta).*secd(alpha+theta); % TAKE DERIVATIVE to get df()
    h2_ = -b.*cotd(theta).*cscd(theta);
    dL = h1_ + h2_;
    
end
