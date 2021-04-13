function L = lagrange_poly(xvec, yvec, x)
  
  L = 0;
  N = length(xvec);
  for j=1:N
    lj = 1;
    for m=1:N
      if (j ~= m)
	lj = lj*(x-xvec(m))/(xvec(j)-xvec(m));
      end
    end
    L = L+lj*yvec(j);
  end

end
