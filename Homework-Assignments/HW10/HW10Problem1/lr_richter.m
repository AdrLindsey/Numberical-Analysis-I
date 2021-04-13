function s = lr_richter(t, A)

    % normal function implementation for richter scale (earthquakes)
    % s = output vector
    % A = given data matrix
    % t = vector to fit
    s = (A'*A)\(A'*t);

end