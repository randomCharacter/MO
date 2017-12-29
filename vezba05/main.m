%% 1. Hook-Jeeves
x0 = [0 0]';
d = 0.5;
dmin = 0.001;
[ x, f, cnt ] = hook_jeev( 'fun1', x0, d, dmin);
%% 2. Nelder-Mead
x0 = [-2 -2];
xtol = 0.001;
ftol = 0.001;
maxit = 100;
[ x, f, cnt ] = neld_mead('fun2', x0, xtol, ftol, maxit);