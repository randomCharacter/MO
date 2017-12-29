function [ x, fx, cnt ] = neld_mead(fun, x, xtol, ftol, maxit)
    n = prod(size(x));
    maxit = maxit*n;
    xin = x(:);
    v = xin; fv = feval(fun, v);
    for j = 1:n
        y = xin;
        if y(j) ~= 0
            y(j) = 1.05*y(j);
        else
            y(j) = 0.00025;
        end
        v = [v y];
        fv = [fv feval(fun, y)];
    end
    [fv, j] = sort(fv);
    v = v(:, j);
    cnt = n+1;
    alpha = 1;
    beta = 1/2;
    gamma = 2;
    onesn = ones(1, n);
    ot = 2:n+1;
    on = 1:n;
    while cnt < maxit
        if max(max(abs(v(:, ot)-v(:, onesn)))) <= xtol & max(abs(fv(1)-fv(ot))) <= ftol
            break
        end
        vbar = (sum(v(:, on)')/n)';
        vr = (1+alpha)*vbar - alpha*v(:, n+1);
        fr = feval(fun, vr); cnt = cnt+1;
        vk = vr;
        fk = fr;
        if fr < fv(n)
            if fr < fv(1)
                ve = gamma*vr + (1-gamma)*vbar;
                fe = feval(fun, ve); cnt = cnt+1;
                if fe < fv(1)
                    vk = ve; fk = fe;
                end
            end
        else
            vt = v(:, n+1);
            ft = fv(n+1);
            if fr < ft
                vt = vr;
                ft = fr;
            end
            vc = beta*vt + (1-beta)*vbar;
            fc = feval(fun, vc);
            cnt = cnt+1;
            if fc < fv(n)
                vk = vc;
                fk = fc;
            else
                for j = 2:n
                    v(:, j) = (v(:, 1) + v(:, j))/2;
                    fv(j) = feval(fun, v(:, j));
                end
                vk = (v(:, 1) + v(:, n+1))/2;
                fk = feval(fun, vk); cnt = cnt+n;
            end
        end
        v(:, n+1) = vk;
        fv(n+1) = fk;
        [fv, j] = sort(fv);
        v = v(:, j);
    end
    x(:) = v(:, 1);
    fx = fv(1);
    if cnt == maxit
        disp('Broj iteracija je premasen');
    end
end