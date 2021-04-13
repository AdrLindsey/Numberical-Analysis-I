function y = f(x)

%     y = cos(x);
    term1 = asin(x).*asin(x);
    term2 = x.*x;
    term3 = 1 ./ sqrt(1-term2);
    
    y = term1 ./ term2 .* term3;

end