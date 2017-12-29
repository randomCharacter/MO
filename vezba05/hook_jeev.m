function [x, f, cnt] = hook_jeev(fun, x0, d, dmin)
    n = length(x0);
    e = eye(n) * d;
    x = x0;
    f = feval(fun, x);
    cnt = 1;
    while e(1, 1) > dmin
        t = x;
        for i=1:n
            z = t + e(:, i);
            y = feval(fun, z);
            cnt=cnt+1;
            if y < f
                t = z;
                f = y;
            else
                z = t - e(:, i);
                y = feval(fun, z);
                cnt=cnt+1;
                if y < f
                    t = z;
                    f = y;
                end
            end
        end
        if all(t==x)
            e = e * 0.5;
        else
            x1 = t + (t-x);
            y1 = feval(fun, x1);
            cnt=cnt+1;
            x = t;
            if y1 < f
                for i=1:n
                    z = x1 + e(:, i);
                    y = feval(fun, z);
                    cnt=cnt+1;
                    if y < y1
                        x = z;
                        f = y;
                        break;
                    end
                    z = x1 - e(:, i);
                    y = feval(fun, z);
                    cnt=cnt+1;
                    if y < y1
                        x = z;
                        f = y;
                        break;
                    end
                end
            end
        end
    end
end