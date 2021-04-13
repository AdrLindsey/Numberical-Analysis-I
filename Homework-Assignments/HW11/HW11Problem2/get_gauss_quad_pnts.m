function res = get_gauss_quad_pnts(i)

    w_vec = [...
        0.4179591836734694,...
        0.3818300505051189,...
        0.3818300505051189,...
        0.2797053914892766,...
        0.2797053914892766,...
        0.1294849661688697,...
        0.1294849661688697];
        
    x_vec = [...
        0.0000000000000000,...
        0.4058451513773972,...
        -0.4058451513773972,...
        -0.7415311855993945,...
        0.7415311855993945,...
        -0.9491079123427585,...
        0.9491079123427585];

    res = [w_vec(i), x_vec(i)];



end