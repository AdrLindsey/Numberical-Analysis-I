function test_lr_spect()

    % this fcn is going to 
    % 1: load the data
    % 2: plot the reference and raw data
    % 3: run the mutli-linear regression and plot the scaled ref spectra
    
    % let's load the data and take a look at it
    ref = readmatrix('ref_spectra.csv');
    R = ref(:,2:4);
    sgtitle('Compare Reference to Unknown');
    subplot(3,1,1);
    plot(ref(:,1),R)
    title('Reference Spectra')
    
    dat = readmatrix('unknown_mixture_spectrum.csv');
    S = dat(:,2);
    subplot(3,1,2);
    plot(dat(:,1),S, '-k')
    title('Unknown Mixture Spectrum')
    
    % let's run our regression and take a look at the output
    c = lr_spect(S,R);
    fprintf('### ----- Our concentrations are: %.4f, %.4f, %.4f! ----- ###\n', c(1),c(2),c(3))
    
    nR = R * diag(c); 
    subplot(3,1,3);
    plot(dat(:,1),S, '-k')
    hold on;
    plot(dat(:,1),nR)
    hold off;
    title('Fit Refence to Unknown via LR')

end