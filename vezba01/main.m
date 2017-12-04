%% 1. Simplex metoda
f = [5 4 3];
A = [2 3 1
     4 1 2
     3 4 2];
b = [5; 11; 8];
LB = [0 0 0];

[x, fx] = linprog(-f, A, b, [], [], LB, []);
fx = -fx;
%% 2. Transportni problem
f = [2 3 2 4 4 3 2 3];
A = [];
b = [];
Aeq = [ 1  1 -1  0  0  0  0  0
       -1  0  0  1  1  0  0  0
        0 -1  0 -1  0  1  1  0
        0  0  1  0 -1 -1  0  1
        0  0  0  0  0  0 -1 -1];
beq = [12; 10; 8; -5; -25];
LB = [0 0 0 0 0 0 0 0];
UB = [11 10 25 11 16 12 18 13];

[x, fx] = linprog(f, A, b, Aeq, beq, LB, UB);
