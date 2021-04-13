function ret = clenshaw_curtis(f, a, b, M)
  % This fcn returns the integral of fcn f over the 
  % interval [a, b].  The number of points is M.
  % It uses the Clenshaw-Curtis method.
    
  % Note this impl only works for M odd.  Therefore I will
  % error out in case input M is even.
  if (M/2 == round(M/2))
    error('Input number of pts must be odd!')
  end
    
  % Since the Clenshaw-Curtis method is defined on 
  % a 0-indexed grid, I need to do some gymnastics to work
  % with 1-based Matlab.  I want to index k = 0 ... M-1 
  % in order to work with M points.
  N = M-1;  % End index.  N is even.
  
  % The Clenshaw-Curtis points are found via:
  k = 0:N;  % Note I have M elements in this vector.
  xi = -cos(pi*k/N);  % Row vector
  
  % Initialize weight vector
  omega = zeros(1,M);  % Row vector of M elements

  % Insert values at end of vector.
  omega(1) = 1/(N*N-1);  % Handle ends first
  omega(M) = 1/(N*N-1);  

  % The middle weights are given by a complicated formula.
  for l=2:N
    s = 0;
    for j=0:N/2
      if (j==0 || j==(N/2))
	gamma = 2;
      else
	gamma = 1;
      end
      % l-1 factor is due to 1-based Matlab indexing.
      numer = cos(2*pi*j*(l-1)/N);
      denom = gamma*(1-4*j*j);
      s = s + numer/denom;
    end
    omega(l) = 4*s/N;
  end
    
  % Next, my fcn is defined on the interval [a, b] so
  % I need to map my nodes to the [a, b] interval.  To get
  % the map realize x = s*xi+t, then substitute x=a, xi=-1 to
  % get one equation, and substitute x=b, xi=1 to get another one
  % and solve for s, t.  The result is:
  x = ((b-a)/2).*xi + (b+a)/2;  % x is a vector.
  
  % How to map omega onto w?  We just need to multiply
  % by (b-a)/2 to scale the weights. See (for example)
  % https://math.okstate.edu/people/yqwang/teaching/math4513_fall14/Notes/gaussian.pdf
  w = ((b-a)/2)*omega;   % w is a vector.
  
  % Now sample fcn at interpolation points
  y = f(x);   % f(x) must be constructed to return a vector
   
  % Do sum to compute integral
  ret = dot(w,y);
  
end