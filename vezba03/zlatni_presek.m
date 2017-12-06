function [ x , fx ] = zlatni_presek(fun, a, b, eps)
    c = (3 - sqrt(5)) / 2;

    x1 = a + c * (b - a);
    x2 = a + b - x1;

    f1 = feval(fun, x1);
    f2 = feval(fun, x2);

    while (b - a) > eps
        if f1 <= f2
            b = x2;
            x2 = x1;
            f2 = f1;
            x1 = a + c * (b-a); f1 = feval(fun, x1);
        else
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = b - c * (b-a); f2 = feval(fun, x1);
        end

        if f1 < f2
            x = x1; fx = feval(fun, x1);
        else
            x = x2; fx = feval(fun, x2);
        end
    end
end

