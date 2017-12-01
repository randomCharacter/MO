%% 1. Njutnova metoda
[x, fx, n] = newton('fun', 'dfun', 'd2fun', 2, 0.001);
%% 2. Metoda secice
[x, fx, n] = secica('fun', 'dfun', 3, 4, 0.001);
