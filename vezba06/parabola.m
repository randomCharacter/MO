function [x, fx, n] = parabola(fun, v, Z, x0, eps)
    X = [ 0 x0/2 x0 ]';
    Y = [ [1 1 1]' X X.*X ];
    F = [feval(fun, v*X(1) + Z); feval(fun, v*X(2) + Z); feval(fun, v*X(3) + Z) ];
    abc = Y \ F;
    x = -abc(2) / 2 / abc(3);
    n = 1;
    while abs( [1 x x*x] * abc - feval(fun, v*x + Z)) > eps
        if x > X(2)
            X = sort( [ X(2); x; X(3) ] );
        else
            X = sort( [ X(1); x; X(2) ] );
        end
        Y = [ [1 1 1]' X X.*X ];  
        F = [feval(fun, v*X(1) + Z); feval(fun, v*X(2) + Z); feval(fun, v*X(3) + Z) ];
        abc = Y \ F;
        x = -abc(2) / 2 / abc(3);
        n = n + 1;
    end
    fx = feval(fun, v*x + Z);
end