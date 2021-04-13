function result = fa(x)

    % -- Thinking outloud ----------------------------------
    % what is the result of the x being passed into the fcn
    % norm of resulting values should be less than tol
    % norm of set of values is max of set???
    % ------------------------------------------------------
    
    % laod global params
    global params
    a0 = params.a0;
    a1 = params.a1;
    a2 = params.a2;
    a3 = params.a3;
    a4 = params.a4;

    % set up f(a) fxns
    param0 = a0;
    param4 = x.*a1;
    param3 = x.*x.*a2;
    param2 = x.*x.*x.*a3;
    param1 = x.*x.*x.*x.*a4;
    result = param0+param1+param2+param3+param4;
  
end
