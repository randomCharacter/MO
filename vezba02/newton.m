function [ x, fx, n ]=newton(fun, dfun, d2fun, a, eps)
    x = Inf;
    n = 0;
    while abs(x - a) > eps
        x = a;
        a = x - feval(dfun, x)/feval(d2fun, x);
        n = n + 1;
    end
    x = a;
    fx = feval(fun, x);
end
