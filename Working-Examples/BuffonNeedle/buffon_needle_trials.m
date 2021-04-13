function cnt = buffon_needle_trials(N, L, T)
  % Inputs:
  % N = number of needles to throw
  % L = needle length
  % T = distance between lines on floor
  % 
  % Outputs:
  % P = number of needles crossing the line
    
  % We assume the floor has 10 lines in it at positions
  % 0, 1, 2, ... 9.
  % Create random vector of needle center positions
  % after N throws.
  x = 9*T*rand(N, 1);
  
  % Now create random vector of needle angles (between
  % 0 and 2*pi)
  theta = 2*pi*rand(N, 1);
  
  % Create vector which contains start and end x coords
  % of all needles.
  x1 = x - (L/2)*cos(theta);
  x2 = x + (L/2)*cos(theta);
  
  % Count number of needles whose ends cross a line in
  % the floor.
  hits = floor(x1) ~= floor(x2);
  cnt = sum(hits);
  
end
