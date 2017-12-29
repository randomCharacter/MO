function [ f ] = fun1(x)
    f = x(1).^2 + x(1)*x(2) + 0.5*x(2).^2 + x(1) + 10*x(2);
end