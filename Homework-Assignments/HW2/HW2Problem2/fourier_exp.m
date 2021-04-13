% ---- Adrian Lindsey ------------------------- %
% ---- HW 2 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Fourier Series Expansion --------------- %

function ft = fourier_exp(N)

    % --- Declare variables ------------------------------------
    % ----------------------------------------------------------
    % N is our highest order term
    t = linspace(-1, 1, 1e3); % CAREFUL with linspace!!!
    a0 = 0.19635; % a0 from wolframalpha
    ft = a0;   
    % ----------------------------------------------------------  
    
    % --- Create f(t) in for loop ------------------------------
    % ----------------------------------------------------------    
    if N == 0
        ft = zeros(length(t),1) + a0;
    else
        subtotal = 0;
        for n = 1:1:N
            subtotal = subtotal + ((besselj(1,n*(pi/2)))/(2*n)) * cos(n*pi*t);
        end
        ft = ft + subtotal;        
    end
    % ----------------------------------------------------------

    % --- Plot f(t) along with N=0 case ------------------------
    % ---------------------------------------------------------- 
    figure(1);
    yline(a0);
    hold on;
    
    plot(t,ft);
    hold off;
    title('Fourier Seriess for Different N');
    % ----------------------------------------------------------
    
    
    

end