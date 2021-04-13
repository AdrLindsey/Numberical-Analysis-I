function result=plot_vectors(N,A)

    % plot the equispaced vectors
    a_v = linspace(0, 2*pi, N);
    % y = soh, x = cah from 'soh cah toa'
    x_v = 1*cos(a_v); % to the unit circle r=1
    y_v = 1*sin(a_v); % to the unit circle r=1
    naught = zeros(size(a_v));
    figure(1);
    plot([naught' x_v']', [naught' y_v']');
    title('Equispaced Vectors');
    axis equal;

    % mess that up and plot again
    tol=1e-4;
    new_v=zeros(N,1);
    for i=1:N
        new_v=[x_v(i),y_v(i)]';
        for j=1:1e3
            temp=A*new_v;
            new_v1=temp/norm(temp);
            if abs(new_v-new_v1) < tol
                new_v=new_v1; % RESET var
                break; % IT tol is met THEN return to i-loop
            else 
                new_v=new_v1; % RESET var
            end
        end
        x_v(i)=new_v(1);
        y_v(i)=new_v(2);

        figure(2);
        plot([naught' x_v']', [naught' y_v']');
        title('Vectors After Iteration');
        axis equal;
    end

    result=[x_v(1),y_v(1)];

end