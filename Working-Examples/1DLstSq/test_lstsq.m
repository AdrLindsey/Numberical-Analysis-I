function test_lstsq()
  % This fcn generates a set of noisy data, then calls lstsq
  % to fit a line to the data.

  Nvec = [5, 25, 125];
  for idx = 1:length(Nvec)

    fprintf('--------------------------------------------------\n')
    N = Nvec(idx);

    % Create clean line
    x = linspace(0, 2.5*N, N);
    yzero = 5*randn();
    beta = 2*randn();
    y = yzero + beta*x;

    % Now make noise on line
    err = sqrt(N);
    y = y+err*randn(size(y));

    close all
    plot(x,y, 'ro');
    hold on

    % Now do fit
    [y0, b] = lstsq(x, y);

    fprintf('Original yzero = %f, fitted y0 = %f\n', yzero, y0)
    fprintf('Original beta = %f, fitted b = %f\n', beta, b)

    yfit = y0 + b*x;
    plot(x, yfit)

    pause
  end

  % Now create dataset with an outlier
    fprintf('--------------------------------------------------\n')
    N = 12;

    % Create clean line
    x = linspace(0, 2.5*N, N);
    yzero = 5*randn();
    beta = 3*rand();
    y = yzero + beta*x;

    % Now make noise on line
    err = sqrt(N);
    y = y+err*randn(size(y));

    % Create outlier
    y(10) = 5*y(10);

    close all
    plot(x,y, 'ro');
    hold on

    % Now do fit
    [y0, b] = lstsq(x, y);

    fprintf('Original yzero = %f, fitted y0 = %f\n', yzero, y0)
    fprintf('Original beta = %f, fitted b = %f\n', beta, b)

    yfit = y0 + b*x;
    plot(x, yfit)

end