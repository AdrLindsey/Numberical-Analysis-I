% ---- Adrian Lindsey ------------------------- %
% ---- HW 4 ----------------------------------- %
% ---- Problem 1 ------------------------------ %
% ---- Husky and Chess board ------------------ %

function svd_husky(im, im1)

    %% --- Run SVDs ---------------------------------------
    %% ----------------------------------------------------  
    [U, S, VT] = svd(im);
    [U1, S1, VT1] = svd(im1);
    %% ---------------------------------------------------- 
    
    %% --- Create plots -----------------------------------
    %% ----------------------------------------------------     
    figure(3)
    subplot(3,2,3);
    plot(1:1:length(diag(S)), diag(S))
    xlabel('Index of Singular Value')
    ylabel('Singular Value')
    title('Side Husky Singular Values')
    set(gcf,'Position',[100 100 600 600])
    
    subplot(3,2,5)
    plot(1:1:length(diag(S)), log(diag(S)))
    xlabel('Index of Singular Value')
    ylabel('Singular Value')
    title('Side Husky Singular Values (log-scale)')  
    set(gcf,'Position',[100 100 600 600])
    
    subplot(3,2,4)
    plot(1:1:length(diag(S1)), diag(S1))
    xlabel('Index of Singular Value')
    ylabel('Singular Value')
    title('Checkerboard Singular Values')
    set(gcf,'Position',[100 100 600 600])
    
    subplot(3,2,6)
    plot(1:1:length(diag(S1)), log(diag(S1)))
    xlabel('Index of Singular Value')
    ylabel('Singular Value')
    title('Checkerboard Singular Values (log-scale)')  
    set(gcf,'Position',[100 100 600 600])
    %% ----------------------------------------------------     

end