% ---- Adrian Lindsey ------------------------- %
% ---- HW 3 ----------------------------------- %
% ---- Problem 3 ------------------------------ %
% ---- Test ----------------------------------- %

function test_truss_bridge()
    
    % --- Set weight for test ---------------------------
    % ---------------------------------------------------
    for wt = 1:1:35
        fe = truss_bridge(wt);
    
        if max(fe(1:9)) >= 11
            fprintf('A %d ton truck causes tension failure!\n', wt);
        elseif min(fe(1:9)) <= -14
            fprintf('A %d ton truck causes compression failure!\n', wt);
        else fprintf('Bridge sustains a %d ton truck!\n', wt);
        end
    end
    % ---------------------------------------------------
        
    % --- Examine test cases: 15 tons & 20 tons
    % ---------------------------------------------------
    fe_15 = truss_bridge(15)'
    fe_20 = truss_bridge(20)'
    fe_25 = truss_bridge(22)'
    % ---------------------------------------------------
 
end
