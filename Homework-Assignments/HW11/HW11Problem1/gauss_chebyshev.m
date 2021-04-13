function ret = gauss_chebyshev(a, b, N)
    % This fcn returns the integral of fcn f over the 
    % interval [a,b] using N estimation points.

    % Let's get the Chebyshev nodes for our domain [a,b]
    x = zeros(N,1);
    for i = 1:N
        x(i) = ( (a+b) + (b-a) * cos( (2*i-1)/(2*N)*pi ) )/2;
    end

    % get weights for our gauss-cheby quadrature
    w = repelem(pi/N,N);

    % Now sample function and apply weights
    y = f(x).*sqrt(1-x.*x)/2;
    ret = dot(w, y);

end
