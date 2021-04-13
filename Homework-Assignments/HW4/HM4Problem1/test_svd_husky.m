% ---- Adrian Lindsey ------------------------- %
% ---- HW 4 ----------------------------------- %
% ---- Problem 1 ------------------------------ %
% ---- Test ----------------------------------- %

function test_svd_husky()

    %% --- Load and view side husky -----------------------
    %% ----------------------------------------------------
    husky_mat = readmatrix("side_husky.csv");
    figure(1)
    subplot(3,2,1);
    imshow(husky_mat, []);
    title('side husky')
    %% ----------------------------------------------------
    
    %% --- Load and view checkerboard ---------------------
    %% ----------------------------------------------------    
    checker_mat = readmatrix("checkerboard.csv");
    figure(2)
    subplot(3,2,2);
    imshow(checker_mat, []);
    title('checkerboard')
    %% ----------------------------------------------------    
    
    %% --- Build plots ------------------------------------
    %% ----------------------------------------------------
    svd_husky(husky_mat, checker_mat);
    %% ----------------------------------------------------

end