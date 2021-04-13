% ---- Adrian Lindsey ------------------------- %
% ---- HW 2 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Gaussian Filter ------------------------ %

function test_gauss_filter_freq()

    % set the stage
    M = 301;
    Tmax = 1;
    dt = Tmax/(M-1);   
    fs = 1/dt;
    t = linspace(0, (M-1)*dt, M); 

    % frequency in Hz
    w1 = 2;
    
    % noisy signla
    y = sin(2*pi*w1*t) + rand(1, length(t)) * 0.31432;

    % cut-off frequency
    B = 10;
    
    % call gauss filter function
    gauss_filter_freq(t, y, B);

end
