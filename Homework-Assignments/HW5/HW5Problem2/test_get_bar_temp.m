% ---- Adrian Lindsey ------------------------- %
% ---- HW 5 ----------------------------------- %
% ---- Problem 2 ------------------------------ %
% ---- Test ----------------------------------- %

function test_get_bar_temp()
    % a is our alpha: Al = 6.4e-5 m2/sec & Fe = 2.3e-5 m2/sec
    a = 6.4e-5;
    % N is our number of nodes
    N = 47;
    % n is the specific node where our heat is applied    
    idx = 14;
    % q is the heat applied at n
    q = 0.05;
    T = get_bar_temp(a,N,idx,q);
    
    subplot(2,1,1);
    scatter(1:N, T','x','b')
    title(strcat('Max Al Rod Temp: ',num2str(round(max(T),2))))
    xlabel('Node on Rod')
    ylabel('Temperature')
    legend('Gauss')
    
    T2 = get_bar_temp(2.3e-5,N,idx,q); % for Fe 
    subplot(2,1,2);
    scatter(1:N, T2','o','r')
    title(strcat('Max Fe Rod Temp: ',num2str(round(max(T),2))))
    xlabel('Node on Rod')
    ylabel('Temperature')
    legend('Gauss')
    
end