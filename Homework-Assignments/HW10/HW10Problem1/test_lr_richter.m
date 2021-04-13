function test_lr_richter()

    % In this fcn we're going to
    % 1: load and prep our earthquake data
    % 2: plot that data to get a look at it
    % 3: run the lr to get the b-coef
    % 4: test out lr() via synthesized data with known coefs
    
    format shortE
    
    % load and clean data
    raw = readtable('RawData.csv');
    mag = [2,3,4,5,6,7,8,9,10]';
    freq = zeros(9,1);
    for m = 1:length(mag)
        if mag(m)==2
            freq(m) = 3e5;
        elseif mag(m)==3
            freq(m) = 49000;
        elseif mag(m)==4
            freq(m) = 6200;
        elseif mag(m)==5
            freq(m) = 800;
        elseif mag(m)==6
            freq(m) = 108;
        elseif mag(m)==7
            freq(m) = 18;
        elseif mag(m)==8
            freq(m) = 1;
        else
            freq(m) = 0;
        end
    end
    A = [ones(length(mag),1) mag];
    t = freq;
    
    % let's plot and compare to hw pdf
    figure(1)
    plot(mag, freq, 'ok')
    set(gca, 'YScale', 'log')
    ylabel('Frequency')
    xlabel('Magnitude')
    
    % let's run the lr() and see what we get
    s = lr_richter(t, A);
    fprintf('### ----- Our beta is: %.0f! ----- ###\n', s(2))
    
    % let's run our fcn with some synthetic data
    alpha = 30;
    beta = 2.667;
    
    % fake dataset
    N = 100;
    x = linspace(0,N);
    y = zeros(N,1);
    for idx = 1:N
        y(idx) = beta*idx + alpha + randi(50,1) - 25;
    end
    % plot synthetic data
    figure(2)
    plot(x,y,'ok')
    % run lr() on synthetic data
    Asyn = [ones(N,1) x'];
    tsyn = y;
    s2 = lr_richter(tsyn,Asyn);
    fprintf('### ----- Given params for synthetic test were alpha = %0.f & beta = %.4f! ----- ###\n', alpha, beta)
    fprintf('### ----- Our function found alpha = %0.f & beta = %.4f which is pretty good! ----- ###\n', s2(1), s2(2))
   
end