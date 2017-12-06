%% 1. Fibonacijeva metoda
[x, fx] = fibonacijeva_metoda(@fun, 0, 3, 0.0001);
%% 2. Metoda zlatnog preseka
[x, fx] = zlatni_presek(@f, 1, 3, 0.0001);