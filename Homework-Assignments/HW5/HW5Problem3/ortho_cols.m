% ---- Adrian Lindsey ------------------------- %
% ---- HW 5 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Orthogonal Colummns -------------------- %

function D = ortho_cols(A)

  N = size(A,2);
  e = zeros(size(A));

  % Initialize D_1
  u1 = A(:, 1);
  D(:, 1) = u1;
  
  % Initialize D_2
  u2 = A(:, 2);
  D(:, 2) = u2 - ((u2'*A*D(:, 1)) ./ (D(:, 1)'*A*D(:, 1))) * D(:, 1);

  % Iterate over remaining columns of A
  for k = 3:N
    Ak = A(:, k);
    uk = Ak;
    % Iterate over previous e values and subtract off 
    % component parallel to each ei
    for i = k-1:-1:1
      uk = uk - ((Ak'*A*D(:, i)) ./ (D(:, i)'*A*D(:, i))) * D(:, i);
      Ak = A(:, i);
    end
    % Compute next col of e
    D(:, k) = uk;

  end
end


