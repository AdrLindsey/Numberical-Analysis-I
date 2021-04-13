function outimage = interpolate_image_4x( inimage )
  %  This fcn performs bilinear interpolation on inimage.  It
  %  assumes a B&W image (i.e. matrix).  The output is an upsampled
  %  image of sides four times the input size.

  imsize = size(inimage);
  xidxmax = imsize(1);
  yidxmax = imsize(2);

  % We keep the coordinates of the interpolation rectangle
  % separate from the indexes into the image.  That's so we
  % can handle the case where the x and y spacing of the image
  % are not equal.
  
  % Assume original pixel spacing is 1 -- violate the above 
  % assumption.
  xd = 1;
  yd = 1;

  % Interpolation step between pixels
  ax = 0.25;
  ay = 0.25;

  % Preallocate output image matrix.  
  outimage = zeros(4*xidxmax-3, 4*yidxmax-3);

  %fprintf('Size(outimage) = \n')
  %size(outimage)
  
  % Loop over rectangles in input image.  The most difficult part of this is dealing with
  % the pointers.
  for xidx = 1:(xidxmax-1)
      x = xidx*xd;           % Pos in input image.  x is physical distance (not pointer)
      xidxout = 4*(xidx-1) + 1;      % Pos in output image of edge pixels

      for yidx = 1:(yidxmax-1)
          y = yidx*yd;
          yidxout = 4*(yidx-1) + 1;
        
          % Prepare 4x2 rectangle to interpolate
          rect = [x, y; x, y+1; x+1, y; x+1, y+1];
          f = [inimage(xidx, yidx), inimage(xidx, yidx+1), inimage(xidx+1, yidx), inimage(xidx+1, yidx+1)];

          % Now place interpolated values into outimage
	  for xo = 0:3
	    for yo = 0:3
	      outimage(xidxout+xo, yidxout+yo) = bilinear(f, rect, [x+xo*ax, y+yo*ay]);     % side of input cell
	      % fprintf('x+xo*ax = %d, y+yo*ay = %d\n', x+xo*ax, y+yo*ay)
	      
	    end
	  end
        
      end
  end

end

