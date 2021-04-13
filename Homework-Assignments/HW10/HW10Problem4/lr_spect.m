function c = lr_spect(S, R)

    % normal function implementation for spectroscopy
    % c = concentration vector
    % R = reference spectra matrix
    % S = spectra to fit
    c = (R'*R)\(R'*S);

end