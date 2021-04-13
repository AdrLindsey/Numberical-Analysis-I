function my_pca()

    % --- PCA Algorithm ---------------------------------------
    % ---------------------------------------------------------
    % 1.Put time series data into rows
    % 2.Subtract off mean from each row (zero-center data)
    % 3.Form covariance matrix (S=M*M')
    % 4.Do eigenvalue decomposition of S (S=Q'EIGQ)
    % 5.Sort eigenvalues and eigenvectors from high to low.
    % 6.Eigenvectors point along principal directions variance.
    % ---------------------------------------------------------

    % Step 1: Done for us
    dat = readmatrix('Datafile.csv');

    % Step 2: Subtract of row-wise mean
    dat = dat - repmat(mean(dat,2), 1, size(dat, 2));

    % Step 3: Creat covariance matrix
    % Step 4: Calculate the Eig Vals
    [W, EvalueMatrix] = eig(cov(dat'));
    Evalues = diag(EvalueMatrix);

    % Step 5: Sort the Eig Vals
    Evalues = Evalues(end:-1:1);
    W = W(:,end:-1:1); W=W';  

    % Step 6: Plot the 2 principal dimensions
    pc = W * dat;
    plot(pc(1,:),pc(2,:),'*')  

end