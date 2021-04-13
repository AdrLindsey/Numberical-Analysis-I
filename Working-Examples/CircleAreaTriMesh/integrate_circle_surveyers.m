function s = integrate_circle_surveyers(P, T, h0)
  % Integrate area of meshed circle.  Inputs:
  % P, T = point, triangle representation of mesh.
  % h0 = measure of size of triangles.  Smaller h0 -> smaller
  %      triangles.
  
  % Perform integration by summing over triangles T
  s = 0;
  for idx = 1:size(T, 1)
    % For each triangle, get the three vertices
    p1 = P(T(idx, 1), :)';
    p2 = P(T(idx, 2), :)';
    p3 = P(T(idx, 3), :)';
    % Compute area using Surveyer's Area Formula
    A = tri_area_surveyers(p1, p2, p3);
    s = s + A;
    fprintf('idx = %d, A = %f, s = %f\n', idx, A, s)
  end
  
  % fprintf('Area = %f \n', s)
end
