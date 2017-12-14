function [ x, fx, n ] = parabola(fun, x1, x3, eps)
    X = [ x1 (x1+x3)/2 x3 ]';
    Y = [ [1 1 1]' X X.*X ];
    F = feval(fun, X);
    abc = Y \ F;
    a = abc(1);
    b = abc(2);
    c = abc(3);
    x = -b / 2 / c;
    fx = feval(fun, x);
    n = 0;
    while abs([1 x x^2] * abc - fx) > eps
        if (x > X(2)) && (x < X(3))
            if (fx < F(2)) & (fx < F(3))
                X = [X(2); x; X(3)];  F = [F(2); fx; F(3)];
            elseif (fx > F(2)) & (fx < F(3))
                X = [X(1); X(2); x];  F = [F(1); F(2); fx];
            else
                error('Greska')
            end
        elseif (x > X(1)) & (x < X(2))
            if (fx < F(1)) & (fx < F(2))
                X = [X(1); x; X(2)];  F = [F(1); fx; F(2)];
            elseif (fx > F(2)) & (fx < F(1))
                X = [x; X(2); X(3)];
                F = [fx; F(2); F(3)];
            else
                error('Greska')
            end
        else
            error('van granica')
        end
        Y = [ [1 1 1]' X X.*X ];
        abc = Y \ F;
        a = abc(1);
        b = abc(2);
        c = abc(3);
        x = -b / 2 / c;
        fx = feval(fun, x);
        n = n + 1;
    end
end