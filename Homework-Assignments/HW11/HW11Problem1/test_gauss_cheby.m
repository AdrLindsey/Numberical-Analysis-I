function test_gauss_cheby(N)

    for i = 1:N
        tol = 1e-4;
        ytrue = pi*log(2);
        ycalc = gauss_chebyshev(-1,1,i);
        diff = abs(ytrue - ycalc);

        if diff < tol
            fprintf('### ----- Pass! Our Calculation was within %16.12f of our tolerance after %.0f estimation points!\n', diff, i)
            break
        else 
            continue
        end
    end


end