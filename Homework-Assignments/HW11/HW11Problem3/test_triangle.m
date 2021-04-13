function test_triangle()

    S = stlread("sphere.stl");
    trisurf(S);
    C = stlread("cow.stl");
    trisurf(C);
   
 
    SA_calc = triangle_mesh(S);
    SA_true = 4*pi;
    tol = 0.01; % within 1% of true SA
    
    if abs(SA_calc/SA_true - 1) < tol
        fprintf('### ----- Success!! Calcd SA (%2.2f) is within 1%% of True SA (%2.2f)!\n', SA_calc, SA_true)
        fprintf('### ----- So, we can also calc SA of Cow (%2.2f) using same methodology!\n', triangle_mesh(C))
    else 
        print('No joy')
    end
    
    
    

end