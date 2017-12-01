function [ x, fx, n ] = secica(fun, dfun, a, b, eps)
    x = a;
    a = Inf;
    dfb = feval(dfun, b);
    n = 0;
    while abs(x - a) > eps
        a = x;
        dfa = feval(dfun, a);
        x = a - dfa*(a - b)/(dfa - dfb);
        dfb = dfa;
        b = a;
        n = n + 1;
    end
    fx = feval(fun, x);
end
