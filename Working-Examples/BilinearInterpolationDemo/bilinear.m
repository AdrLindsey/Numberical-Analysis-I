function fmm = bilinear( f, rect, point )
%  Bilinear -- Bilinear interpolation.
%  Inputs:
%    f = 4 element vector holding value of fcn at four corners
%        of rectangle to interpolate.  Order:
%        f(0,0)
%        f(0,1)
%        f(1,0)
%        f(1,1)
%    rect = 4x2 matrix giving coordinates of corners of rectange.
%         [x0, y0; x0, y1; x1, y0; x1, y1]
%    point = point at which to interpolate.  {xm, ym}
%  Output:
%    fxmym = Interpolated value of f at {xm, ym}

  % Split up input f into scalar components
  f00 = f(1);
  f01 = f(2);
  f10 = f(3);
  f11 = f(4);

  % Pull corner coordinates out of input matrix
  % This assumes rectangle, not trapezoid.
  x0 = rect(1, 1);
  x1 = rect(4, 1);
  y0 = rect(1, 2);
  y1 = rect(4, 2);

  % Now get point at whcih to interpolate
  xm = point(1);
  ym = point(2);
  
  % Now compute fraction of distance to move along x
  axm = (xm-x0)/(x1-x0);
  
  % Interpolate values of f at this point
  df0 = f10 - f00;
  fm0 = f00 + axm*df0;
  df1 = f11 - f01;
  fm1 = f01 + axm*df1;
  
  % Now compute fraction of distance to move along y
  aym = (ym-y0)/(y1-y0);
  
  % Interpolate value of f at this point
  dfm = fm1 - fm0;
  fmm = fm0 + aym*dfm;

end

