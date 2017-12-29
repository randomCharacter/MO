% Powell
x0 = [-2 -2]';
xg = 0.197;
eps = 0.001;
[ x, fx, it ] = powell('fun', x0, xg, eps)