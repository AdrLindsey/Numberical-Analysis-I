function df = df(theta)
    % load global params
    global params
    a = params.a;
    b = params.b;
    alpha = params.alpha;
    
    % derive dL
    tand_sq = tand(alpha+theta).*tand(alpha+theta);
    secd_sq = secd(alpha+theta).*secd(alpha+theta);
    cotd_sq = cotd(alpha+theta).*cotd(alpha+theta);
    cscd_sq = cscd(alpha+theta).*cscd(alpha+theta);
    
    h1_2 = a.*secd(alpha+theta).*(tand_sq + secd_sq);
    h2_2 = b.*cscd(theta).*(cotd_sq + cscd_sq);
    % put terms together
    df = h1_2 + h2_2;

end
