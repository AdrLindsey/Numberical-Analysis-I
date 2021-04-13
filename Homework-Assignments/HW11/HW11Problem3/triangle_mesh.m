function SA = triangle_mesh(img)
    
    trisurf(img);
    
    pts = img.Points;
    tris = img.ConnectivityList;
    
    t_rows = size(tris,1);
    SA = 0;
	for t = 1:t_rows
        P1 = pts(tris(t,1,1),:);
        P2 = pts(tris(t,2,1),:);
        P3 = pts(tris(t,3,1),:);
        
        SA = SA + calc_area(P1,P2,P3);
    end

end