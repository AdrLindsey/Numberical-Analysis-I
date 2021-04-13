function ret = gauss_quadrature(f, a, b, N)
  % This fcn returns the integral of fcn f over the 
  % interval [a, b].  The order of integration is N.
    
  % First compute nodes and weights assuming [-1, 1]
  % interval.  xi and omega are both vectors.
  [xi, omega]=lgwt(N, -1, 1);
  
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
  
  % Now sample fcn at Gauss points
  y = f(x);   % f(x) must be constructed to return a vector
  
  % Do sum to compute integral
  ret = dot(w,y);
  
end
