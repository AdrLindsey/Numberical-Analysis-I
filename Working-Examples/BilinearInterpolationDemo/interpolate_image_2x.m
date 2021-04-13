function outimage = interpolate_image_2x( inimage )
  %  This fcn performs bilinear interpolation on inimage.  It
  %  assumes a B&W image (i.e. matrix).  The output is an upsampled
  %  image of sides twice the input size.

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

  % Interpolate exactly between pixels -- this doubles
  % image sides (quadruples number of pixels)
  ax = 0.5;
  ay = 0.5;

  % Preallocate output image matrix.  
  outimage = zeros(2*xidxmax-1, 2*yidxmax-1);

  % Loop over rectangles in input image.
  for xidx = 1:(xidxmax-1)
      %fprintf('========================================\n')
      x = xidx*xd;           % Pos in input image.  x is physical distance (not pointer)
      xm = x+ax;             % Pos in input image of intermediate pixel (physical distance)
      xidxout = 2*(xidx-1) + 1;      % Pos in output image of edge pixels
      for yidx = 1:(yidxmax-1)
	  %fprintf('------------------------------------\n')	
          y = yidx*yd;
          ym = y + ay;
          yidxout = 2*(yidx-1) + 1;

	  %fprintf('x = %d, y = %d, xidxout = %d, yidxout = %d\n', x, y, xidxout, yidxout)
	  
          % Prepare 4x2 rectangle to interpolate
          rect = [x, y; x, y+1; x+1, y; x+1, y+1];
          f = [inimage(xidx, yidx), inimage(xidx, yidx+1), inimage(xidx+1, yidx), inimage(xidx+1, yidx+1)];

          % Now place four values into outimage
          for xo = 0:1
            for yo = 0:1
	      c = bilinear(f, rect, [x+xo*ax, y+yo*ay]);     % side of input cell
              outimage(xidxout+xo, yidxout+yo) = c;
	      %fprintf('Rect = [%d, %d; %d, %d; %d, %d; %d, %d] ... ', x, y, x, y+1, x+1, y, x+1, y+1);
	      % fprintf('In: x+xo = %d, y+yo = %d ... ', x+xo, y+yo)
              %fprintf('Pt to interpolate: x+xo*ax = %f, y+yo*ay = %f ... ', x+xo*ax, y+yo*ay)
	      %fprintf('Out: xidxout+xo = %d,  yidxout+yo = %d ...', xidxout+xo,  yidxout+yo)
              %fprintf('Color: %f\n', c)
            end
          end
      
      end
  end


end

