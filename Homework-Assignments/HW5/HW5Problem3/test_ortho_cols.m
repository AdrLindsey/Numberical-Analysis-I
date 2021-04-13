% ---- Adrian Lindsey ------------------------- %
% ---- HW 5 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Test ----------------------------------- %

function D = test_ortho_cols()
    
    % generate random A, SPD matrix
    n = randi([2 10],1,1);
    B = rand(n,n);
    A = B*B';
    D = ortho_cols(A);
    
    % test that each vector is A-orthogonal from the others;
    A_ortho_check = D(:, 1)' .* A .* D(:, 2);
%     for i = 1:size(A,2)
%         for j = 1:size(A,2)
%             if i==j
%                 continue
%             end
%             D(:, i)' .* A .* D(:, 2);
%         end
%     end

end


