function khat = B(x,k)

    %% --- First let's load the triangle function -----------------
    xkm1 = k-1;
    xkp1 = k+1;
    xk = k;

    if x <= xkm1 || xkp1 < x
        khat = 0;
    elseif x <= xk
        khat = (x - xkm1)/(xk - xkm1);
    else
        khat = (xkp1 - x)/(xkp1 - xk);
    end   
    % -------------------------------------------------------------
    
end