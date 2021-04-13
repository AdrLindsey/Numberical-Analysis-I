function SA = gauss_2d()

    %% -- Get xi, w from gauss lookup table ------
    x_w = zeros(7,2);
    for i = 1:7
        x_w(i,:) = get_gauss_quad_pnts(i);
    end
    w = x_w(:,1);
    xi = x_w(:,2);
    % --------------------------------------------

    %% -- Remap domains & perform integral -------
    SA = 0;
    for i = 1:7
        for j = 1:7
            theta = (pi/2) * (xi(i)+1);
            phi = xi(j)*pi;
            SA = SA + w(i) * w(j) * f(theta, phi);
        end
    end
    % --------------------------------------------

end