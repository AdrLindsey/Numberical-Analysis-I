% ---- Adrian Lindsey ------------------------- %
% ---- HW 2 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Test ----------------------------------- %

function test_fourier_exp()

%     subplot(1,2,1);
    % plot the Comparison Curves
    test_vector = [1,5,10,25,50];
    for N = test_vector
        fourier_exp(N);
    end
    
    % create y_true vector
    t = linspace(-1, 1, 1e3); % CAREFUL with linspace!!!
    y_true = real(sqrt((1/4) - t .* t));
    
    % compare y_true v y_app using RMS Error
%     subplot(1,2,2);
    rms = zeros(length(test_vector),1);
    
    rms_0 = sqrt(mean((0.19635 - y_true) .^2));
    
    for i = 1:length(test_vector)
        y_app = fourier_exp(test_vector(i));
        rms(i) = sqrt(mean((y_app - y_true) .^2));
        figure(2);
%         plot(test_vector(i),rms(i),'o');
%         hold on;
    end
    fprintf(' RMS Error for 0 is: %d', rms_0)
    fprintf(' RMS Errors are: %d', rms)
    
    %%%% --- Prof notes ------------------------------------------ 
    %%%% ---------------------------------------------------------
    % In reverse order, the operations are
    % -- step one --
    % you take the difference between yapp and ytrue,  
    % -- step two --
    % square it, 
    % -- step three --
    % find its mean, 
    % -- step four --
    % then take the square root.
    % The idea is that this is a way to characterize the 
    % difference between the two functions which is insensitive 
    % to the sign of their difference. By squaring the difference, 
    % and then taking the square root later, you end up with a 
    % quantity which is analogous to (not the same as) taking 
    % the simple difference between yapp and ytrue.
    %%%% ---------------------------------------------------------
    
    
    
    
%     subplot(1,2,2);
    
    
    
    % plot RMS Error 

end