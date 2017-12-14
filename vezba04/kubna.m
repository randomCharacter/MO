function [ x, fx, n ] = kubna(fun, dfun, x1, x2, eps)
    X = [x1; x2];
    Y = [[1; 1] X X.^2 X.^3
    [0; 0] [1; 1] 2*X  3*X.^2];
    F = [feval(fun, X); feval(dfun,X)];
    abcd = Y \ F;
    b = abcd(2);
    c = abcd(3);
    d = abcd(4);
    D = sqrt(4*c*c - 12*b*d);
    xa = (-2*c - D)/6/d;
    xb = (-2*c + D)/6/d;
    if feval(fun, xa) < feval(fun,xb)
        x = xa;
    else
        x = xb;
    end
    fx = feval(fun,x);
    n = 0;
    while abs([1 x x^2 x^3] * abcd -fx) > eps
        if feval(fun,xa) < feval(fun,xb)
            X(2)=x;
        else
            X(1)=x;
        end
        Y = [[1; 1] X X.^2 X.^3  
            [0; 0] [1; 1] 2*X  3*X.^2];
        F = [feval(fun,X); feval(dfun,X)];
        abcd = Y \ F;
        b = abcd(2);
        c = abcd(3);
        d = abcd(4);
        D = sqrt(4*c*c - 12*b*d);
        xa = (-2*c - D)/6/d;
        xb = (-2*c + D)/6/d;
        if feval(fun, xa) < feval(fun, xb)
            x = xa;
        else
            x = xb;
        end
        n = n + 1;
        fx = feval(fun, x);
    end
end