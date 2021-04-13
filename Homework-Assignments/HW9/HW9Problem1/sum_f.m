function sum = sum_f(xvec, yvec, x)
  
  sum = 0;
  N = length(xvec);
  for k = 1:N
      temp = yvec(k) * B(x,xvec(k));
      sum = sum + temp;
  end

end

% function L = lagrange_poly(xvec, yvec, x)
%   
%   L = 0;
%   N = length(xvec);
%   for j=1:N
%     lj = 1;
%     for m=1:N
%       if (j ~= m)
% 	lj = lj*(x-xvec(m))/(xvec(j)-xvec(m));
%       end
%     end
%     L = L+lj*yvec(j);
%   end
% 
% end
% 
