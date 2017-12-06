function [ x, fx ] = fibonacijeva_metoda(fun, a, b, eps)
    n = 1;
    while eps < (b - a) / fibonaci(n)
        n = n + 1;
    end
    x1 = a + fibonaci(n - 2) / fibonaci(n) * (b - a);
    x2 = a + b - x1;
    f1 = feval(fun, x1);
    f2 = feval(fun, x2);
    for k = 2:n
        if f1 <= f2
            b = x2;
            x2 = x1; f2 = f1;
            x1 = a + b - x1;
            f1 = feval(fun, x1);
        else
            a = x1;
            x1 = x2; f1 = f2;
            x2 = a + b - x2;
            f2 = feval(fun, x2);
        end
        if f1 < f2
            x = x1;
            fx = f1;
        else
            x = x2;
            fx = f2;
        end
    end
end