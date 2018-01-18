%% 1. Iscrtavanje funkcije
plot2D(@fun, -5:0.1:5, -5:0.1:5);
%% 2. Poziv za 5 dimenzija
[x, fval, exitflag, output] = pso(@fun, 5);
%% 3. Uz ogranicenje tipa jednakosti
[x, fval, exitflag, output] = pso(@fun_ogr1, 2);
%% 4. Uz ogranicenja tipa nejednakosti
[x, fval, exitflag, output] = pso(@fun_ogr2, 2);
