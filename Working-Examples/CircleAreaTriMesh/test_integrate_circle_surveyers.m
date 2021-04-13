function test_integrate_circle_surveyers()
  % Try circles of various diameters
    
  h0s = [.5, .2, .1, .05];  % This controls the triangle size
  ntol = 1e-2;
  radtol = 1e-2;
  
  
  % Put distmesh code in my path.  You should modify this to point
  % to distmesh installation on your system.
  path('./distmesh/', path);
  
  R = 1;           % Circle of radius R.
  Atrue = pi*R*R;   % True area.

  for cnt = 1:length(h0s);
    fprintf('----------------------------------------------------------\n')

    h0 = h0s(cnt);    % choose triangle size
    fprintf('Testing R = %f, h0 = %f ...\n', R, h0)

    % Create circular mesh using distmesh routine
    fd=@(p) sum(p.^2,2) - R*R;
    [P, T] = distmesh2d(fd, @huniform, h0, [-1,-1;1,1], []);
    % P is Npx2 matrix of points [x, y]
    % T is Ntx3 matrix of triangles.  Each row of T points to a
    %   row of P.

    % Correct the vertices laying on the circle's perimeter -- meshgrid doesn't place
    % them exactly on the perimeter.  It's a bug in meshgrid.
    Npts = size(P, 1);
    fprintf('h0 = %e, number of triangles = %d, number of vertices = %d\n', h0, size(T, 1), Npts)
    for i = 1:Npts
      x = P(i, 1); y = P(i, 2);
      rad = sqrt(x*x + y*y);
      if ( abs(rad-1.00) < radtol )
	% Perform correction on points close to perimeter of circle.
	fprintf('Found point on perimeter.  Before correction, point %d, rad = %f ... ', i, rad)
	% Perform correction depending upon in which quadrant the point lies
	theta = atan2(y, x);
	P(i,1) = R*cos(theta);
	P(i,2) = R*sin(theta);
	%x = P(i, 1); y = P(i, 2);      
	%rad = sqrt(x*x + y*y);      
	%fprintf('After correction, rad = %f\n', rad) 
      end
      
    end
%    fprintf('Hit any key to continue....\n')
%    pause
    close all
    simpplot(P,T)
    
    Asurveyers = integrate_circle_surveyers(P, T, h0);    
    nerr = abs((Atrue - Asurveyers));    
    fprintf('tri size param = %f, Atrue = %f, Asurveyers = %f, abs error = %e ...\n', h0, Atrue, Asurveyers, nerr)    

    if (abs(nerr) < ntol) 
      fprintf('          ... pass!\n')
    else
      fprintf('          ... fail!\n')
    end
    fprintf('\n')
    fprintf('Hit any key to continue....\n')
    pause

  end
  
end

