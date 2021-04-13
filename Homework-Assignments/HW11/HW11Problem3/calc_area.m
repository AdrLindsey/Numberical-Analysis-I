function SA = calc_area(P1,P2,P3)

    SA = norm(cross(P2-P1,P3-P1))/2;

end