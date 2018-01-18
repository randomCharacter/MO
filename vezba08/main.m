%% 1. Iscrtavanje funkcije
plot2D(@fun, -5:0.1:5, -5:0.1:5);
%% 2. Poziv za 5 dimenzija
options = pso('options');
options.npart = 100;
options.tol = 1e-8;
[x, f] = pso(@fun, 5, options);
%% 3. Uz ogranicenje tipa jednakosti
[x, f] = pso(@fun_ogr1, 2);
%% 4. Uz ogranicenja tipa nejednakosti
options = pso('options');
options.niter = 1000;
[x1, f1] = pso(@fun_ogr2, 2);
[x2, f2] = pso(@fun_ogr2, 2, options);
